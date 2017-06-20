FROM ubuntu:latest

COPY ./bin/ sbin/

CMD ["sbin/testcpp"]
