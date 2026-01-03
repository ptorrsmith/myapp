# base main image
FROM ruby:2.6

LABEL maintainer="ptorrsmith@kindlyventures.com" \
      description="Dockerfile for Rails 5.2 app with Ruby 2.6"

# update apt-get package reference (Debian Stretch) and in tall nodejs 
# update package references with 'yes' in quiet mode
# RUN apt-get update -yqq
# not to install other recommended but non-essential packages
# RUN apt-get install -yqq --no-install-recommends nodejs

# but it’s recommended to always combine the apt-get update and apt-get install commands into a single RUN instruction like so so they always use the latest package references:
RUN apt-get update -yqq && \
    apt-get install -yqq --no-install-recommends nodejs

# NOTE
# why we’re not running the commands as root with sudo. That’s because, by default, commands inside a container are run by the root user

# avoid code file changes don't bust gem install cache by copying only the Gemfile and Gemfile.lock first
COPY Gemfile* /usr/src/app/
WORKDIR /usr/src/app
RUN bundle install

# now we can avoid re-installing gems unless Gemfile or Gemfile.lock changes, saving build time.
# copy everything from our local PWD (where we are doing our code dev) to our image working directory.  Need to do this each time we update the code?
# Copy our Rails app into the container at /usr/src/app (create this dir if it doesn't exist)
COPY . /usr/src/app 

# set working directory - though now done earlier when using cache of gem install files
# WORKDIR /usr/src/app
# install gems listed in Gemfile so they are part of the image - also now no longer needed as using cached layer
# RUN bundle install

# set default commend to run when starting the container. Can be overridden
# This uses the 'exec' form (an array: treats all elements in single command => PID 1) so that it doesn't invoke a shell, allowing signals to be properly received by the Rails process
# This ensures our server can accept requests from any IP address (not just localhost)
CMD ["bin/rails", "s", "-b", "0.0.0.0"]
