#What is this?
Build opensoruce-cobol-1.5.0J and run tetsts/run script on Ubuntu 16.04 with GCC 5.3
#How to build?
 ``docker build -t osscobol-test .``
#How to run?
-Build distribution only
`` docker run -it osscobol-test build``
-Apply patches only
`` docker run -it osscobol-test patch``
-Build distribution and apply patch
`` docker run -it osscobol-test patchbuild``
-Build distribution and test
`` docker run -it osscobol-test test``
-Build distribution and apply patches, test
`` docker run -it osscobol-test patchtest``

After run, it still remain in that container when specify -it.

Please check log or source and debug it!
#Costomize?
- Shared volume: /files : For using local distribution file and local patches. 
for example, from hostdir:
`` docker run -it -v /path/to/localfiles:/files osscobol-test test``
-- /files/opensource-cobol-*.tar.gz : distfibution file
-- /files/patches/${distribution-name}/*.patch : 
- Shared volume, /work : work dir for building. When specify any host-dir, this remains after execution container.
