
#!/bin/bash
#
#PBS -N xueHW1Q5
#PBS -l select=1:ncpus=8:mem=125gb
#PBS -l walltime=72:00:00
#PBS -m abe
#PBS -M tsquire@g.clemson.edu
#PBS -j oe
#PBS -o errors

module add matlab/2017a

cd /home/tsquire/CompMath/8610\ Homeworks

taskset -c 0-$(($OMP_NUM_THREADS-1)) matlab -nodisplay -nodesktop -nosplash -r xueHW1Q5
