FROM openjdk:17
ADD jarstaging/com/er09ani/demo-workshop/2.1.4/demo-workshop-2.1.4.jar ttrend.jar 
ENTRYPOINT [ "java", "-jar", "ttrend.jar" ]