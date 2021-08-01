nasm -f macho64 $1.asm && \

ld -L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib \
  -lSystem \
  -macosx_version_min 10.12 \
  -no_pie \
  $1.o && \

./a.out
