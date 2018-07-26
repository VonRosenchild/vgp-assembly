#!/bin/bash


if [ -z $1 ]; then
	echo "Usage: ./_submit_hybrid_scaffold_dle1_bsssi.sh <name>"
	echo -e "\t<name>: job name and output dir name"
	exit -1
fi

pipeline=/data/Phillippy/tools/vgp-assembly/git/vgp-assembly/pipeline

cpus=54
mem=240g
partition=norm
name=$1
script=$pipeline/bionano/hybrid_scaffold_two.sh
args="$1 DLE1 BSSSI $pipeline/bionano/hybridScaffold_two_enzymes_DLE1.xml"
walltime=4-0

mkdir -p logs
log=$PWD/logs/$name.%A_%a.log

echo "\
sbatch --partition=$partition --cpus-per-task=$cpus --job-name=$name --mem=$mem --time=$walltime --error=$log --output=$log $script $args"
sbatch --partition=$partition --cpus-per-task=$cpus --job-name=$name --mem=$mem --time=$walltime --error=$log --output=$log $script $args
