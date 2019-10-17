# Call this script from the folder with the configuration XTB folders

a=0
b=0
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
#           echo $name_log " " $name_xyz_it " " $name_bet " " $name_xyz
           cp $j ../../../logs/$name
           cp $name_xyz ../../../coords/$name_xyz_it
#           echo $name_log 
#           echo $name_xyz
            let a=a+1
        done
#       for k in `ls *.xyz`; 
#           do echo $k
#           name2="$b"".xyz"
#           cp $k ../../../coords/$name2
#           echo $name2
#           let b=b+1
#       done
        cd ../..
    done
