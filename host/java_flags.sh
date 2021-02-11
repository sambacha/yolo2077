export LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'
sudo swapoff -a
 
ENV="-XX:+UnlockExperimentalVMOptions", "-XX:+UseZGC", "-XX:+UseSerialGC","--enable-preview","-Xshare:on", \
"-cp","-XX:+UseCompressedOops","-Dsun.io.useCanonPrefixCache=false","-XX:+UseConcMarkSweepGC", \
"-Xmx2048m","-Xms128m","-XX:ReservedCodeCacheSize=240m","-XX:-OmitStackTraceInFastThrow", \
"-XX:CICompilerCount=2","-XX:HeapDumpPath=$USER_HOME/java_error_in_idea.hprof", \
"-XX:ErrorFile=$USER_HOME/java_error_in_idea_%p.log"
