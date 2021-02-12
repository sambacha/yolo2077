## YOLO 2077

The TL:DR is

```bash
git clone git@github.com:sambacha/yolo2077.git
cd yolo2077
./scripts/configure.sh
cd development
docker-compose up -d
```

## References

## container flags

CMD java -XX:+PrintFlagsFinal $JAVA_OPTIONS -jar java-container.jar
-e JAVA_OPTIONS='-Xmx300m'
-XX:+UnlockExperimentalVMOptions 
-XX:+UseCGroupMemoryLimitForHeap
