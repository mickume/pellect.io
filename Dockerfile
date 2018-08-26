FROM majordomusio/rails-container

ENV SUMMARY="Base image for all majordomus.io RAILS containers"	\
    DESCRIPTION="Base image for all majordomus.io RAILS containers."

LABEL summary="$SUMMARY" \
      description="$DESCRIPTION" \
      io.k8s.description="$DESCRIPTION" \
      io.k8s.display-name="Ratchet Labs pellectio" \
      name="ratchetcc/pellectio" \
      version="1" \
      release="1" \
      maintainer="majordomus.io <hello@ratchet.cc>"

# Runtime settings
EXPOSE 8080

# Copy configuration files etc. to the image. 
# By default we only need an updated requirements.txt file.
COPY ./deployments/root/ /

# Copy the app to the image
COPY ./ /opt/app-root/src

# Assemble all things RAILS etc
RUN assemble-rails

# - In order to drop the root user, we have to make some directories world
#   writable as OpenShift default security model is to run the container
#   under random UID.
RUN chown -R 1001:0 ${APP_ROOT} && \
    fix-permissions ${APP_ROOT} -P && \
    rpm-file-permissions

# Drop the root user
USER 1001

# Start here ...
CMD ["start-rails"]
