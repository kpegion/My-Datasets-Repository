#!/bin/bash


function foo() {

  fname=generate_catalog.py
  python3.6 $execdir/$fname $1 $2 $3 $4
  if [ $? -eq 0 ]
	then
	  echo "$2 Success"
	else
	  echo "$2 Failed !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
	fi
}



filename='data_backup.txt'
execdir=$PWD
conda activate aoes

while IFS=$'\t' read -r -a line ; do
theFile=${line[0]}
theDataset=${line[1]}
theParent=${line[2]}
theTags=${line[3]}


temp_dir=${line[1]}
mkdir ${temp_dir}_temporary
pushd ${temp_dir}_temporary



foo $theFile $theDataset $theParent $theTags
echo "---------------------------------------------------------------------------------------"
popd
done < $filename

