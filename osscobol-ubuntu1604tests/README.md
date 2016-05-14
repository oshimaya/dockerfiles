#What is this?
Build opensoruce-cobol-1.5.0J and run tetsts/run script on Ubuntu 16.04 with GCC 5.3
#How to build?
 ``docker build -t osscobol-test .``
#How to run?
`` docker run -it osscobol-test build``

This will run configure; make and test 'tests/run' script only.
After run, it still remain in that container.

Please check log or source and debug it!
#Costomize?
**experimental**
 - Shared volume: /files : place for opensource-cobol*.tar.gz for another version.
 - Shared volume, /work : work dir 
