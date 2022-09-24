FROM ghcr.io/phusion/baseimage:jammy-1.0.1
ADD https://www.google.com/search?q=random+number+generator+from+10+to+1000000000000&sxsrf=ALiCzsaHA-gvKMSGRAuDWJ_FyRHij-1ElA%3A1663299695476&ei=b_AjY6XbHOOI3LUPjcGg8Ao&ved=0ahUKEwjlzoOcspj6AhVjBLcAHY0gCK4Q4dUDCA4&uact=5&oq=random+number+generator+from+10+to+1000000000000&gs_lcp=Cgdnd3Mtd2l6EAMyBggAEB4QFjIFCAAQhgMyBQgAEIYDMgUIABCGAzoKCAAQRxDWBBCwAzoHCAAQsAMQQzoNCAAQ5AIQ1gQQsAMYAToPCC4Q1AIQyAMQsAMQQxgCOgUIABCABDoICAAQHhAPEBY6CAghEB4QFhAdOgUIABCiBEoECEEYAEoECEYYAVDHBFioPmCgQGgBcAF4AIAB7AGIAbwUkgEGMTcuNy4xmAEAoAEByAERwAEB2gEGCAEQARgJ2gEGCAIQARgI&sclient=gws-wiz random.txt
COPY . /app
WORKDIR /app
RUN ls
RUN  apt update
RUN  apt install -y wget
RUN wget https://github.com/playit-cloud/playit-agent/releases/download/v0.9.3/playit-0.9.3
RUN mkdir /etc/service/playit
RUN chmod +x playit.sh
ADD ./playit.sh /etc/service/playit/run
ADD ./playit.toml /etc/service/playit/playit.toml
RUN chmod +x /etc/service/playit/run
RUN chmod +x /app/playit-0.9.3
CMD ["/sbin/my_init"]