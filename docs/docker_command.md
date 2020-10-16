Build and tag the Docker image from the repo root directory.

```
$ docker build -t ssvm-0.6.9 .
```

Confirm that our image is created and tagged.

```
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
ssvm-0.6.9          latest              9e7ab8a800d5        34 seconds ago      2.04GB
ubuntu              20.04               9140108b62dc        2 weeks ago         72.9MB
```

Start Docker with local mapping

```
$ docker run --rm -it -v $(pwd):/app ssvm-0.6.9
```

Compile

```
root@fed06e527d57:/# ./ssvmc app/cloud/hello_bg.wasm hello.so
2020-10-16 09:38:20,780 INFO [default] compile start
2020-10-16 09:38:20,800 INFO [default] verify start
2020-10-16 09:38:20,817 INFO [default] optimize start
2020-10-16 09:38:25,747 INFO [default] codegen start
2020-10-16 09:38:28,057 INFO [default] compile done
```

Run

```
root@fed06e527d57:/# echo '{"key1":"123","key2":"abc"}' | ./ssvmr hello.so
Hello! 123, abc
```

