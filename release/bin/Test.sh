# This script is used to create Code Coverage report

LLVMGCOVPATH="/usr/local/Cellar/llvm/9.0.0_1/bin"
GCOVRPATH="/usr/local/bin"

chmod 755 ../../third_party/local/bin/env.sh

cp -rf ../lib/*.so ../../third_party/local/lib/.

. ../../third_party/local/bin/env.sh

cd ../../objs/


dirlist="$(find . -iname "*.gcno" -exec dirname {} \; | sort | uniq)"

for dirname in $dirlist

do

        if [ -d "$dirname" ];

        then

                echo $dirname
                cd $dirname
                $LLVMGCOVPATH/llvm-cov gcov -f -b *.gcno
                cd -

        fi;

done

if [ -d "src" ]; then
echo "cleaning up src directory."
#sudo rm -rf src 
fi

mkdir src
cp -rf debug/* src/
$GCOVRPATH/gcovr -r src --gcov-executable="$LLVMGCOVPATH/llvm-cov gcov" --xml-pretty > SACodeCoverage.xml
cp SACodeCoverage.xml SACodeCoverage-org.xml
#sed -i -e 's/\<line branch=\"true\" condition-coverage=/line branch=\"false\" condition-coverage=/g' SACodeCoverage.xml

if [ ! -f "SACodeCoverage.xml" ]; then
        echo "File SACodeCoverage.xml does not exists. Please check the logs "
        exit 1
fi

echo "--------------------------------------------------------------------"
echo "GCOV Code Coverage data written Successfully"
echo "--------------------------------------------------------------------"

mv SACodeCoverage.xml ..

echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!@@@@@@@@@@@@@@@@@@@@@@@!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
