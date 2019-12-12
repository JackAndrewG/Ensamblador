if [ $# -eq 1 ]
then
            echo "Compilando y ejecutando..."
            nasm -f elf64 -o $1.o $1.asm; ld $1.o -o $1
            ./$1
else
            echo "***"
            echo "Error"
fi