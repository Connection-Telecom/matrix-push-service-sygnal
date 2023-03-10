###
### Stage 0: builder
###
FROM python:3.7-slim as builder

# Install git; Sygnal uses it to obtain the package version from the state of the
# git repository.
RUN apt-get update && apt-get install -y git

# install sygnal and all of the python deps to /install.

COPY . /sygnal/

RUN pip install --prefix="/install" --no-warn-script-location /sygnal

###
### Stage 1: runtime
###

FROM python:3.7-slim
COPY --from=builder /install /usr/local
# DBo: mount this from configmap...
#COPY --from=builder /sygnal/sygnal.yaml /usr/local/sygnal.yaml

EXPOSE 6100/tcp

ENTRYPOINT ["python", "-m", "sygnal.sygnal"]