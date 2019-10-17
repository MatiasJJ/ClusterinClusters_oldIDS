# Call this script from the folder with the configuration XTB folders


name_dir=$1
path_xtb=$2
wrk_dir=`pwd`

mkdir ../$name_dir
mkdir ../$name_dir/logs
mkdir ../$name_dir/coords

a=0
b=0

cd $path_xtb

for i in `ls -d XTB*`
        do echo $i
        cd $i
        cd calc-LM
         for j in `ls *.log`; 
           do #echo $a
           name_log="$a"".log"   
           name_xyz_it="$a"".xyz"   
           name_bet=${j%%.*}
           name_xyz="$name_bet"".xyz"
           cp $j $wrk_dir/$1/logs/$name
           cp $name_xyz $wrk_dir/$1/coords/$name_xyz_it
            let a=a+1
        done

        cd ../..
    done

cd $wrk_dir
