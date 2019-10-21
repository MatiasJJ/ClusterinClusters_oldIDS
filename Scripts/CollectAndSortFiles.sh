# This script collects the .log and .xyz files from inside the xtb folder and sorts them into subdirectories logs/ and coords/ in a folder named by the user
# Input 1: Is the name of the directory where the data will end up
# Input 2: Is the full path to the XTB subdirectories, typically /path/XTB/

name_dir=$1
path_xtb=$2
echo `pwd`
mkdir ../$name_dir
mkdir ../$name_dir/logs
mkdir ../$name_dir/coords
mkdir ../$name_dir/outputs

echo "You created $name_dir to put your data into"
echo "I will proceed to collect the files ... (this may take a few minute)"

a=0
b=0
xtb_count=0
cd ..
wrk_dir=`pwd`

cd $path_xtb
for i in `ls -d XTB*`
        do echo $i
        let xtb_count=xtb_count+1
        cd $i/calc-LM
         for j in `ls *.log`; 
           do #echo $a
           name_log="$a"".log"   
           name_xyz_it="$a"".xyz"   
           name_bet=${j%%.*}
           name_xyz="$name_bet"".xyz"
           cp $j $wrk_dir/$1/logs/$name_log
           cp $name_xyz $wrk_dir/$1/coords/$name_xyz_it
            let a=a+1
        done

        cd ../..
    done

cd $wrk_dir

echo "Dealt with"
echo $xtb_count
echo "XTB sub directories, please hand this number to the statistical program."
echo "... Done"
