
## Full bash script
```bash
#! /bin/bash

# [TASK 1]
targetDirectory=$1
destinationDirectory=$2


# [TASK 2]
echo "targetDirectory: $1"
echo "destinationDirectory: $2"



# [TASK 3]
currentTS=$(date +%s)
echo "currentTS: $currentTS"



# [TASK 4]
backupFileName="backup-$currentTS.tar.gz"
echo "backupFileName: $backupFileName"



# [TASK 5]
origAbsPath=`pwd`
echo "origAbsPath: $origAbsPath"



# [TASK 6]
targetDirAbsPath="$targetDirectory"
destDirAbsPath="$destinationDirectory"

echo "targetDirAbsPath: $targetDirAbsPath"
echo "destDirAbsPath: $destDirAbsPath"



# [TASK 8]
yesterdayTS=$((currentTS - 24*60*60))
echo "yesterdayTS: $yesterdayTS"

declare -a toBackup


cd $targetDirAbsPath

for file in $(ls)
do
  file_last_modified_date=$(date -r $file +%s)
  if (($file_last_modified_date > $yesterdayTS))
  then
    toBackup+=($file)
  fi
done

echo "toBackup: ${toBackup[@]}"



# [TASK 12]
tar -czvf $backupFileName ${toBackup[@]}
mv $backupFileName $destDirAbsPath
```

<br/>
<br/>

## Test run
```bash
[dyab@localhost linux-final-lab]$ ls target_dir/
test1  test2  test3
```

```bash
[dyab@localhost linux-final-lab]$ ./backup2.sh target_dir dest_dir
targetDirectory: target_dir
destinationDirectory: dest_dir

currentTS: 1724779643
backupFileName: backup-1724779643.tar.gz

origAbsPath: /home/dyab/Documents/Projects/ibm-data-eng/linux-final-lab
targetDirAbsPath: /home/dyab/Documents/Projects/ibm-data-eng/linux-final-lab/target_dir
destDirAbsPath: /home/dyab/Documents/Projects/ibm-data-eng/linux-final-lab/dest_dir

yesterdayTS: 1724693243
toBackup: test1 test2 test3
```

```bash
[dyab@localhost linux-final-lab]$ ls dest_dir/
backup-1724779643.tar.gz
```


<br/>
<br/>

## Schedule your bash script `backup.sh` to run every 24 hours

```bash
# ┌───────────── minute (0 - 59)
# │ ┌───────────── hour (0 - 23)
# │ │ ┌───────────── day of month (1 - 31)
# │ │ │ ┌───────────── month (1 - 12)
# │ │ │ │ ┌───────────── day of week (0 - 6) (Sunday to Saturday;
# │ │ │ │ │                                       7 is also Sunday on some systems)
# │ │ │ │ │
# │ │ │ │ │
# * * * * *  command_to_execute

0 0 * * * /home/dyab/Documents/Projects/ibm-data-eng/linux-final-lab/backup.sh /home/dyab/Documents/Projects/ibm-data-eng/linux-final-lab/target_dir/  /home/dyab/Documents/Projects/ibm-data-eng/linux-final-lab/dest_dir/

```

