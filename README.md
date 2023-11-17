# education-web-server

### 目的
Webサーバを構築してJavaのアプリケーションサーバへ通信を転送し、Apache経由でJavaで構築されたサイトへアクセス出来る事。  
http://localhost:8080 でアクセス可能なページへ http://localhost でアクセス可能にする。

#### 環境構築
1. [ここをクリックして](https://www.docker.com/products/docker-desktop/)Docker Desktopをインストールする。
2. Docker Desktopが起動していること。
   ![image](https://user-images.githubusercontent.com/12059233/282468381-72904bb3-211b-489c-91dc-00aafc663fbd.png)
3. [ここをクリックして](https://www.sourcetreeapp.com/)SourceTreeをインストールする。
4. SourceTreeのインストールが完了したらSourceTreeから `git-bash.exe` を開く。
   Windowsのデフォルトでは以下の場所に配置されている。  
   ```
   C:\Users\{UserName}\AppData\Local\Atlassian\SourceTree\git_local
   ```
5. 任意のディレクトリへ移動し、以下のコマンドを実行して研修用の設定ファイルをダウンロードする。  
   ダウンロード用コマンド
   ```
   $ git clone https://github.com/NaokiKojima4994/education-web-server.git
   ```
   ダウンロード完了
   ```
   {UserName}@202103-001L MINGW32 ~/workspace
   $ git clone https://github.com/NaokiKojima4994/education-web-server.git
   Cloning into 'education-web-server'...
   remote: Enumerating objects: 35, done.
   remote: Counting objects: 100% (35/35), done.
   remote: Compressing objects: 100% (23/23), done.
   remote: Total 35 (delta 0), reused 35 (delta 0), pack-reused 0
   Receiving objects: 100% (35/35), 10.13 KiB | 2.03 MiB/s, done.

   {UserName}@202103-001L MINGW32 ~/workspace
   ```
6. ダウンロードが完了したら `PowerShell` を起動して `education-web-server` 直下へ移動する。
7. 下記のコマンドを実行してDockerImageのビルドを行う。  
   ビルド用コマンド
   ```
   PS C:\Users\{UserName}\workspace\education-web-server> docker-compose build
   ```
   ビルド完了
   ```
   time="2023-11-13T22:39:39+09:00" level=warning msg="buildx: git was not found in the system. Current commit information was not captured by the build"
   ```
8. Dockerの起動をする。
   ```
   PS C:\Users\{UserName}\workspace\education-web-server> docker-compose up -d
   ```
9. エラーが出ていないか確認をする。
    ```
    PS C:\Users\{UserName}\workspace\education-web-server> docker-compose logs -f
    ```
    以下のようになっていれば問題なし
    ```
    [+] Building 0.0s (0/0)                                                                                                                                                                                                      docker:default
    [+] Running 3/3
    ✔ Network education-web-server_default              Created                                                                                                                                                                           0.0s
    ✔ Container education-web-server-spring-boot-app-1  Created                                                                                                                                                                           0.1s
    ✔ Container education-web-server-apache-1           Created                                                                                                                                                                           0.1s
    Attaching to education-web-server-apache-1, education-web-server-spring-boot-app-1
    education-web-server-spring-boot-app-1  |
    education-web-server-spring-boot-app-1  |   .   ____          _            __ _ _
    education-web-server-spring-boot-app-1  |  /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
    education-web-server-spring-boot-app-1  | ( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
    education-web-server-spring-boot-app-1  |  \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
    education-web-server-spring-boot-app-1  |   '  |____| .__|_| |_|_| |_\__, | / / / /
    education-web-server-spring-boot-app-1  |  =========|_|==============|___/=/_/_/_/
    education-web-server-spring-boot-app-1  |  :: Spring Boot ::      (v2.7.18-SNAPSHOT)
    education-web-server-spring-boot-app-1  |
    education-web-server-spring-boot-app-1  | 2023-11-13 13:46:10.950  INFO 1 --- [           main] com.example.demo.DemoApplication         : Starting DemoApplication v0.0.1-SNAPSHOT using Java 11.0.16 on spring-boot-app with PID 1 (/app.jar started by root in /)
    education-web-server-spring-boot-app-1  | 2023-11-13 13:46:10.953  INFO 1 --- [           main] com.example.demo.DemoApplication         : No active profile set, falling back to 1 default profile: "default"
    education-web-server-spring-boot-app-1  | 2023-11-13 13:46:11.912  INFO 1 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat initialized with port(s): 8080 (http)
    education-web-server-spring-boot-app-1  | 2023-11-13 13:46:11.924  INFO 1 --- [           main] o.apache.catalina.core.StandardService   : Starting service [Tomcat]
    education-web-server-spring-boot-app-1  | 2023-11-13 13:46:11.924  INFO 1 --- [           main] org.apache.catalina.core.StandardEngine  : Starting Servlet engine: [Apache Tomcat/9.0.82]
    education-web-server-spring-boot-app-1  | 2023-11-13 13:46:12.015  INFO 1 --- [           main] o.a.c.c.C.[Tomcat].[localhost].[/]       : Initializing Spring embedded WebApplicationContext
    education-web-server-spring-boot-app-1  | 2023-11-13 13:46:12.015  INFO 1 --- [           main] w.s.c.ServletWebServerApplicationContext : Root WebApplicationContext: initialization completed in 998 ms
    education-web-server-spring-boot-app-1  | 2023-11-13 13:46:12.242  INFO 1 --- [           main] o.s.b.a.w.s.WelcomePageHandlerMapping    : Adding welcome page template: index
    education-web-server-spring-boot-app-1  | 2023-11-13 13:46:12.419  INFO 1 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat started on port(s): 8080 (http) with context path ''
    education-web-server-spring-boot-app-1  | 2023-11-13 13:46:12.433  INFO 1 --- [           main] com.example.demo.DemoApplication         : Started DemoApplication in 1.954 seconds (JVM running for 2.394)
    ```
10. 下記コマンドを実行してApacheのコンテナにログインし、Apacheの設定を行う。  
    (この時点では、 http://localhost:8080 のみにアクセス可能 Apacheは起動していないので http://localhost はアクセス不可)
    ```
    PS C:\Users\{UserName}\workspace\education-web-server> docker ps
    CONTAINER ID   IMAGE                                  COMMAND                CREATED         STATUS         PORTS                    NAMES
    d2992696f559   education-web-server-apache            "/bin/bash"            9 minutes ago   Up 9 minutes   0.0.0.0:80->80/tcp       education-web-server-apache-1
    11a94de9895e   education-web-server-spring-boot-app   "java -jar /app.jar"   9 minutes ago   Up 9 minutes   0.0.0.0:8080->8080/tcp   education-web-server-spring-boot-app-1

    // education-web-server-apacheのCONTAINER IDに置き換えて実行
    PS C:\Users\{UserName}\workspace\education-web-server> docker exec -it d2992696f559 /bin/bash
    root@d2992696f559:/#
    ```