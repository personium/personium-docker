FROM tomcat:9-jdk8-adoptopenjdk-hotspot

ENV CORE_VER=1.7.21
ENV ENGINE_VER=1.5.27
ENV PERSONIUM_REPO=https://personium.io/mvnrepo/

ENV CORE_URL=${PERSONIUM_REPO}io/personium/personium-core/${CORE_VER}/personium-core-${CORE_VER}.war
ENV ENGINE_URL=${PERSONIUM_REPO}io/personium/personium-engine/${ENGINE_VER}/personium-engine-${ENGINE_VER}.war

RUN apt-get update && apt-get install -y \
  vim \
  jq \
  unzip

WORKDIR /usr/local/tomcat/webapps/

RUN curl -o personium-core.war ${CORE_URL} \
  && unzip personium-core.war -d personium-core \
  && curl -o personium-engine.war ${ENGINE_URL} \
  && unzip personium-engine.war -d personium-engine

COPY personium-unit-config.properties personium-core/WEB-INF/classes
COPY personium-unit-config.properties personium-engine/WEB-INF/classes

WORKDIR /usr/local/tomcat/bin
COPY entrypoint.sh ./

EXPOSE 8080

ENTRYPOINT [ "entrypoint.sh" ]
