FROM openjdk:17
WORKDIR /app

# 소스 코드와 manifest.txt 복사
COPY . .

# 컴파일: out 폴더 생성하고 src 아래 자바 파일 컴파일
RUN mkdir -p out && javac -d out src/httpServerMain/*.java

# jar 파일 생성 (manifest.txt 참고, out 폴더 안 클래스 포함)
RUN jar cfm MyServer.jar manifest.txt -C out .

# 서버 포트 열기
EXPOSE 8000

# 컨테이너 실행 명령 (jar 파일 이름 맞춰야 함)
CMD ["java", "-jar", "MyServer.jar"]
