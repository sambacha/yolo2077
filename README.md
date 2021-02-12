## YOLO 2077

****************************************************************
YOLO 2077 TESTNET
IP: 161.35.188.253
DNS: YCABAL.com
****************************************************************
JSON-RPC HTTP service endpoint      : http://161.35.188.253:8545
JSON-RPC WebSocket service endpoint : ws://161.35.188.253:8546
GraphQL HTTP service endpoint       : http://161.35.188.253:8547
Web block explorer address          : http://161.35.188.253:25000/
Prometheus address                  : http://161.35.188.253:9090/graph
Grafana address                     : http://161.35.188.253:3000/d/XE4V0WGZz/besu-overview?orgId=1&refresh=10s&from=now-30m&to=now&var-system=All
Kibana logs address                 : http://161.35.188.253:5601/app/kibana#/discover
****************************************************************


## References

## container flags

CMD java -XX:+PrintFlagsFinal $JAVA_OPTIONS -jar java-container.jar
-e JAVA_OPTIONS='-Xmx300m'
-XX:+UnlockExperimentalVMOptions 
-XX:+UseCGroupMemoryLimitForHeap
