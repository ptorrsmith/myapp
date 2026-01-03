# base main image
FROM ruby:2.6

# update apt-get package reference (Debian Stretch) and install nodejs 
# update package references with 'yes' in quiet mode
RUN apt-get update -yqq
# not to install other recommended but non-essential packages
RUN apt-get install -yqq --no-install-recommends nodejs

# NOTE
# why we’re not running the commands as root with sudo. That’s because, by default, commands inside a container are run by the root user

# copy everything from our local PWD (where we are doing our code dev) to our image working directory.  Need to do this each time we update the code?
# Copy our Rails app into the container at /usr/src/app (create this dir if it doesn't exist)
COPY . /usr/src/app 

# set working directory
WORKDIR /usr/src/app
# install gems listed in Gemfile so they are part of the image
RUN bundle install

CMD ["bin/rails", "s", "-b", "0.0.0.0"]

