FROM centos:7

LABEL name="LessPass Database" 
LABEL maintainer="LessPass <contact@lesspass.com>"

ENV LANG en_US.UTF-8

RUN yum -y install epel-release && \
    yum -y install python34 python34-pip && \
    yum clean all

RUN mkdir /database
WORKDIR /database
COPY requirements.txt /database/
COPY test-requirements.txt /database/
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install -r test-requirements.txt
RUN python3 -m pip install -r requirements.txt

ADD . /database/

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 8000

CMD ["gunicorn", "--bind", "0.0.0.0:8000" , "server.wsgi"]