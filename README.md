




## container flags

CMD java -XX:+PrintFlagsFinal $JAVA_OPTIONS -jar java-container.jar
-e JAVA_OPTIONS='-Xmx300m'
-XX:+UnlockExperimentalVMOptions 
-XX:+UseCGroupMemoryLimitForHeap
