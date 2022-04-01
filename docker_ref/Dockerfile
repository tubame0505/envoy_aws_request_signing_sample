FROM envoyproxy/envoy:v1.21-latest

COPY agent.sh /
RUN chmod go+x /agent.sh
RUN chmod go+w /etc/envoy/envoy.yaml
EXPOSE 9901
EXPOSE 10000
EXPOSE 10001
ENTRYPOINT ["/agent.sh"]
CMD ["envoy", "-c", "/etc/envoy/envoy.yaml"]

COPY envoy.tmpl /etc/envoy/envoy.tmpl
RUN chmod go+r /etc/envoy/envoy.tmpl
