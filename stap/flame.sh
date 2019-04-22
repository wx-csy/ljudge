sudo stap -d /usr/local/bin/judge -d /usr/local/bin/lrun -s 32 -D MAXBACKTRACE=100 -D MAXSTRINGLEN=4096 -D MAXMAPENTRIES=10240 \
    -D MAXACTION=10000 -D STP_OVERLOAD_THRESHOLD=5000000000 --all-modules \
    -v flame.stp -c "runuser -l yakumo -c \"/usr/local/bin/ljudge -i `pwd`/1.in -o `pwd`/1.out -u `pwd`/a.c\""


