 PROJECT_ROOT = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
 SRC_PATH = $(PROJECT_ROOT)src/com/example/jni
 JNI_PATH = $(PROJECT_ROOT)jni
 JAVA_HOME = C:/Users/ravornyo/eclipse/java-2024-06/plugins/org.eclipse.justj.openjdk.hotspot.jre.full.win32.x86_64_21.0.4.v20240802-1551/jre

all: $(JNI_PATH)/HelloJNI.o
	g++ -shared -o $(JNI_PATH)/hello.dll $(JNI_PATH)/HelloJNI.o
	
$(JNI_PATH)/HelloJNI.o: $(JNI_PATH)/HelloJNI.cpp $(JNI_PATH)/com_example_jni_HelloJNI.h
	g++ -I$(JAVA_HOME)/include -I$(JAVA_HOME)/include/win32 -c $(JNI_PATH)/HelloJNI.cpp -o $(JNI_PATH)/HelloJNI.o

$(JNI_PATH)/com_example_jni_HelloJNI.h: $(SRC_PATH)/HelloJNI.java
	javac -h $(JNI_PATH) $(SRC_PATH)/HelloJNI.java
	
clean:
	rm -fr $(JNI_PATH)/com_example_jni_HelloJNI.h $(JNI_PATH)/HelloJNI.o $(JNI_PATH)/hello.dll