FROM envoyproxy/envoy:v1.21-latest

COPY agent.sh /
COPY fullchain.pem /etc/ssl/certs/fullchain.pem
COPY privkey.pem /etc/ssl/private/privkey.pem
COPY testCA.crt /etc/ssl/certs/myca.crt
COPY testCAcrl.pem /etc/ssl/certs/mycacrl.pem
RUN chmod go+r /etc/ssl/certs/fullchain.pem
RUN chmod go+r /etc/ssl/certs/myca.crt
RUN chmod go+r /etc/ssl/certs/mycacrl.pem
RUN chmod go+rx /etc/ssl/private
RUN chmod go+r /etc/ssl/private/privkey.pem
RUN chmod go+x /agent.sh
RUN chmod go+w /etc/envoy/envoy.yaml
EXPOSE 9901
EXPOSE 10000
EXPOSE 10001
ENTRYPOINT ["/agent.sh"]
CMD ["envoy", "-c", "/etc/envoy/envoy.yaml"]

COPY envoy.tmpl /etc/envoy/envoy.tmpl
RUN chmod go+r /etc/envoy/envoy.tmpl
