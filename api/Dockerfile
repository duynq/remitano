FROM ruby:3.1.2
ARG RAILS_ENV
ARG RAILS_MASTER_KEY
ARG WEB_API_ENDPOINT
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

RUN apt-get update
RUN apt-get install -y graphviz

WORKDIR /opt/videosharing/api

COPY Gemfile Gemfile.lock /opt/videosharing/api/

RUN bundle install

COPY . /opt/videosharing/api

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
