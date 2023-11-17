# 基となるJavaイメージを指定
FROM openjdk:11-jdk-slim as build

# ワークディレクトリを指定
WORKDIR /workspace/app

# ビルドに必要なファイルをコンテナにコピー
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .
COPY src src

# アプリケーションをビルド
RUN ./mvnw install -DskipTests

# 実行用のイメージを指定
FROM openjdk:11-jdk-slim
VOLUME /tmp
COPY --from=build /workspace/app/target/*.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]