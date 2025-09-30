
# command structure - commandName -options inputs
```bash
cal 12 2025 - command=cal inputs= 12, 2025 
```
# cal command use to show calender 
```bash 
cal 12 2025 - command=cal inputs= 12, 2025 
date -u - command=date options= -u
use for short options and -- use for longForm
```
# Short-form Options
 
Short-form options are where a letter defines an option. Each option is prepended by a dash 
```bash 
commandName –a –b –c args 
```
To save typing, you could join together the options:
```bash 
commandName –abc args 
```
Both of these formats are equivalent.

# Command Line Arguments
  
Command line arguments are a type of input that commands operate on.Some commands can take an unlimited amount of inputs, some take a specific amount, and some take none at all. Consult the manual page for the specific command for more information.
```bash 
cal 12 2017 
```
Here the cal command has 2 command line arguments. The number 12 and the number 2017.

#  Using the Manual
```bash
man –k <search term> Search the manual for pages 
matching <search term>.
man 5 <page name> Open the man page called <page 
name> in section 5 of the manual. 
(replace <page name> and 5 as 
required)
man <page name> Open the man page called <page 
name> in section 1 of the manual 
```
# redirection 
```bash 
Standard input is stream number o
Standard output is stream number 1
Standard error is stream number 2
cat 1>> output.txt = use to append the content to the file (>>)
cat 1> output.txt = where > will overwrite a file
cat 0>input.txt 1>output.txt - redirect  Standard input to Standard output
```

# Piping
 is the connection of the standard output of one command to the standard input ofanother command. Piping using the pipe character (|)
```bash
commandOne –options arguments | commandTwo –options arguments
``` 
#  tee
The tee command allows us to take a “snapshot” of the data in the pipeline without breaking the pipeline.
```bash
commandOne –options arguments | tee snapshot.txt |commandTwo –options arguments
```
# xargs

xargs is use to convert standard input to the commnad line argumnet , Piping connects the standard output of one command to the standard input of another command. But what if the second command doesn’t accept standard input? e.g. the echo command.The key is to transform the data coming in, into command line arguments. This is possible using the xargs command
```bash
commandOne –options arguments | xargs echo

 date | xargs echo "hello"
 hello Tue Aug 19 06:31:33 UTC 2025

 date | cut --delimiter=" " --fields=1 | xargs echo
 Tue

 cat filestodelete.txt | rm
 rm: missing operand
 Try 'rm --help' for more information.

 cat filestodelete.txt | xargs rm
```
# Aliases

Aliases allow you to save your pipelines and commands with easy to remember nicknames so that they can be used later much easier

You define aliases in your .bash_aliases file in your home directory
```bash
cat .bash_aliases
alias getdates='date | tee /home/ubuntu/fulldate.txt | cut --delimiter=" " --fields=1 | tee /home/ubuntu/shortdate.txt | xargs echo hello'

getdates
hello Tue

cat shortdate.txt
Tue

 cat fulldate.txt
Tue Aug 19 07:54:58 UTC 2025

cat .bash_aliases
alias getdates='date | tee /home/ubuntu/fulldate.txt | cut --delimiter=" " --fields=1 | tee /home/ubuntu/shortdate.txt | xargs echo hello'
alias getcal="xargs cal -A 1 -B 1 > /home/ubuntu/calen.txt"
ubuntu@ip-172-31-44-69:~$ alias getcal="xargs cal -A 1 -B 1 > /home/ubuntu/calen.txt"

echo "08 2025" | getcal

 cat calen.txt
                            2025
        July                 August              September
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
       1  2  3  4  5                  1  2      1  2  3  4  5  6
 6  7  8  9 10 11 12   3  4  5  6  7  8  9   7  8  9 10 11 12 13
13 14 15 16 17 18 19  10 11 12 13 14 15 16  14 15 16 17 18 19 20
20 21 22 23 24 25 26  17 18 19 20 21 22 23  21 22 23 24 25 26 27
27 28 29 30 31        24 25 26 27 28 29 30  28 29 30
                      31
```

# Linux File System
 ### File System Navigation
 The Linux File System follows a tree-like structure starting at a base (or root) directory, indicated by the slash (/). 
 Paths that start at the base directory (/) are known as absolute paths.
  ~ its means path of current users home directory

 find full path of current working directory
```bash 
pwd
/home/ubuntu
```

find files and directories and with use of -F differentiate  of the file and directories 

```bash
ls -F
calen.txt  date.txtx  file1.txt          fulldate.txt   input.txt   shortdate.txt  today.txtx
date.txt   error.txt  filestodelete.txt  fulldate.txtx  output.txt  today.txt      training_plan/

 ls
calen.txt  date.txtx  file1.txt          fulldate.txt   input.txt   shortdate.txt  today.txtx
date.txt   error.txt  filestodelete.txt  fulldate.txtx  output.txt  today.txt      training_plan

```

 list file and directories in long format

 ```bash
 ls -l
total 48
-rw-rw-r-- 1 ubuntu ubuntu  569 Aug 19 08:02 calen.txt
-rw-rw-r-- 1 ubuntu ubuntu   29 Aug 19 04:31 date.txt
-rw-rw-r-- 1 ubuntu ubuntu   29 Aug 19 04:29 date.txtx
-rw-rw-r-- 1 ubuntu ubuntu  264 Aug 18 16:49 error.txt
-rw-rw-r-- 1 ubuntu ubuntu  164 Aug 19 09:24 file1.txt
-rw-rw-r-- 1 ubuntu ubuntu    0 Aug 19 07:04 filestodelete.txt
-rw-rw-r-- 1 ubuntu ubuntu   29 Aug 19 07:54 fulldate.txt
-rw-rw-r-- 1 ubuntu ubuntu   29 Aug 19 05:12 fulldate.txtx
-rw-rw-r-- 1 ubuntu ubuntu    7 Aug 18 16:57 input.txt
-rw-rw-r-- 1 ubuntu ubuntu    7 Aug 18 16:57 output.txt
-rw-rw-r-- 1 ubuntu ubuntu    4 Aug 19 07:54 shortdate.txt
-rw-rw-r-- 1 ubuntu ubuntu    4 Aug 19 05:14 today.txt
-rw-rw-r-- 1 ubuntu ubuntu    0 Aug 19 04:57 today.txtx
drwxrwxr-x 4 ubuntu ubuntu 4096 Aug 18 15:09 training_plan
```

 list file and directories in long format with human readable

```bash
 ls -lh
total 48K
-rw-rw-r-- 1 ubuntu ubuntu  569 Aug 19 08:02 calen.txt
-rw-rw-r-- 1 ubuntu ubuntu   29 Aug 19 04:31 date.txt
-rw-rw-r-- 1 ubuntu ubuntu   29 Aug 19 04:29 date.txtx
-rw-rw-r-- 1 ubuntu ubuntu  264 Aug 18 16:49 error.txt
-rw-rw-r-- 1 ubuntu ubuntu  164 Aug 19 09:24 file1.txt
-rw-rw-r-- 1 ubuntu ubuntu    0 Aug 19 07:04 filestodelete.txt
-rw-rw-r-- 1 ubuntu ubuntu   29 Aug 19 07:54 fulldate.txt
-rw-rw-r-- 1 ubuntu ubuntu   29 Aug 19 05:12 fulldate.txtx
-rw-rw-r-- 1 ubuntu ubuntu    7 Aug 18 16:57 input.txt
-rw-rw-r-- 1 ubuntu ubuntu    7 Aug 18 16:57 output.txt
-rw-rw-r-- 1 ubuntu ubuntu    4 Aug 19 07:54 shortdate.txt
-rw-rw-r-- 1 ubuntu ubuntu    4 Aug 19 05:14 today.txt
-rw-rw-r-- 1 ubuntu ubuntu    0 Aug 19 04:57 today.txtx
drwxrwxr-x 4 ubuntu ubuntu 4.0K Aug 18 15:09 training_plan
 ```

 cd (change directorie) 
  ~ = The current user’s home directory
.  = The current folder.
.. = The parent directory of the current 
folder

```bash
cd training_plan/
```
change back to home directory


```bash
~/training_plan$ cd
# go to the base directory
 cd /
```
list out hidden files and directores  

 ```bash
ls -a
.              .bash_history  .cache    .ssh                       calen.txt  error.txt          fulldate.txt   output.txt     today.txtx
..             .bash_logout   .lesshst  .sudo_as_admin_successful  date.txt   file1.txt          fulldate.txtx  shortdate.txt  training_plan
.bash_aliases  .bashrc        .profile  .viminfo                   date.txtx  filestodelete.txt  input.txt      today.txt
 ```



  ### File Extensions

  get file type
```bash
file shortdate.txt
shortdate.txt: ASCII text
```

 ### Wildcard
 Regular expressions are patterns that can be used to match text.

 In Linux, they are used to 
allow a user to make rather generic expressions about what files they want a command to 
operate on. 

Creating regular expressions to match filenames is known as globbing.

The regular expression patterns can be made using special building blocks known as wildcards. 
Wildcards are symbols with specific meanings to the shell.

wildcard and regular expressions are case sensitve.

* = Matches anything, regardless of 
length. 

? =  Matches anything, but for one place 
only.

[options] = Matches any of the options inside 
for 1 place only

```bash
ls *
calen.txt  date.txtx  file1.txt          fulldate.txt   input.txt   shortdate.txt  today.txtx
date.txt   error.txt  filestodelete.txt  fulldate.txtx  output.txt  today.txt

training_plan:
practice

ls f*
file1.txt  filestodelete.txt  fulldate.txt  fulldate.txtx


ls file[123456].txt
file1.txt

ls file[0-9][A-Z][a-z].txt
```

### Creating Files and Directories

creat a new empty file
```bash
touch fileA.txt
```
creat a directory 
```bash
 mkdir folder
```

creat a directory  with path
```bash
  mkdir -p new/folder
```

creat a  multiple directory using single line command with using braces
```bash
mkdir {jan,feb,mar,apr,may}_{20,21,22,23,24}
```

### Deleting Files and Directories
 delete file
 ```bash
  rm fileA.txt
  rm date.txt shortdate.txt
```

delte file using wild card
```bash
 rm file*
 rm *.txt
 rm *2*
 rm *.jpg
 rm *[2,3]*
```

delete directory
```bash
rm -r feb_21/
```
delete directory --interactive(-i) 
```bash
rm -ri defolder/
```
delete empty directory
```bash
 rmdir defolder/*
rmdir: failed to remove 'defolder/folder1': Directory not empty
rmdir: failed to remove 'defolder/folder2': Directory not empty
```

### Copying Files and Directories

copy file

```bash
cp file1.txt file2.txt
```

copy file in to another directory 

```bash
cp file1.txt file2.txt training_plan/
```

copy directory
```bash
cp -r training_plan/practice/  /home/ubuntu/
```

### moving and renaming files and directories

rename the file name 
```bash
mv file1.txt fileA.txt
```
rename the directory name 
```bash
mv new/ new1
```
move file one folder to another folder 
```bash
mv new1/* /home/ubuntu
```

move folder to another folder 
```bash
mv new1/ /home/ubuntu
```

move folder to another folder with chnage of new folder name 
```bash
mv training_plan/new1/ /home/ubuntu/new2
```

### Editing files with Nano

nano configuring file is /etc/nanorc


```bash
nano file1.txt

save file with ctr+o

insert another filr content to current file ctr+r

search word ctr+w

replace using ctr+\
```

# Locate Command

The locate command searches a database on your file system for the files that match the text
(or regular expression) that you provide it as a command line argument.

If results are found, the locate command will return the absolute path to all matching files


find file end with .conf
```bash
 locate *.conf
 ```

 find first 3 result 
 ```bash
  locate -i --limit 3 *.conf
  ```

Print information about the database
file. 
```bash
locate -S
```

Update the database. As the updatedb
command is an administrator command, 
the sudo command is used to run 
updatedb as the root user (the 
administrator)
```bash
sudo updatedb
```

# Find Command
The find command can be used for more sophisticated search tasks than the locate command.
This is made possible due to the many powerful options that the find command has

find Will list all files and directories below the current working directory
```dash
find
```

Will list all files and directories below the base directory (/); thereby listing everything on the 
entire file system!
```bash
 find /
```


Will list everything on the file system below the base directory, provided that it is within 1 
levels of the base directory.
```bash
find / -maxdepth 1
```

Only list items of a certain type.
–type f restricts the search to file and –type d 
restricts the search to directories. 
```bash
find . -type f
find . -type d
find . -maxdepth 2 -type f
find . -maxdepth 2 -type d
```

Search for items matching a certain name. This 
name may contain a regular expression and 
should be enclosed in double quotes as shown. 
In this example, the find command will return all 
items with names ending in .txt
```bash
find . -name "*.txt"
find . -iname "*.Txt" # Same as –name but uppercase and lowercase do not matter
```
Find files based on their size. 
e.g –size +100k finds files over 100 KiB in size
–size -5M finds files less than 5MiB in size.
Other units include G for GiB and c for bytes*
```bash
find / -type f -size +100k # more than 100K
find / -type f -size -100k # less than 100k
```

will copy every item below the /etc folder on the file system to the directory. 

Commands are executed on each item using the –exec option. 
The argument to the –exec option is the command you want to execute on each item found by 
the find command. 

Commands should be written as they would normally, with {} used as a placeholder for the 
results of the find command.

```bash
find / -type f -size +100k -size -5M -exec cp {} /home/ubuntu/training_plan \;
find / -type f -size +100k -size -5M -ok cp {} /home/ubuntu/training_plan \;
#The –ok option can also be used, to prompt the user for permission before each action. 
```

# Viewing files
This will print out the contents of file
```bash
cat file.txt
tac file.txt # displays files from the end to the beginning (bottom-to-top)
rev file.txt # reverse a file horizontally
less file.txt #The less command is known as a “pager” program and excels at allowing a user to page through large amounts of output in a more user-friendly manner than just using the terminal
cat file.txt  | head # display first 10 line
cat file.txt  | head -n 2  # display first 2 line
cat file.txt  | tail -n 2  # display last 2 line
```


# Sorting Data
A useful ability when working with file data is to be able to sort it either alphabetically or 
numerically. This behaviour is handled using the sort command.
```bash
sort file.txt  #(A-Z)
sort -r file.txt # (Z-A)
sort -n file.txt #(small number to bigger)
sort -nr file.txt # (bigger to small number)
sort -u file.txt # (Sort data an only return unique entries)

```
# File Archiving and Compression

The –c option: “create”. This allows us to create a tarball. [required]

The –v option: “verbose”. This makes tar give us feedback on its progress. [optional]

The –f option: Tells tar that the next argument is the name of the tarball. [required]

```bash
 tar -cvf  first.tar file.txt file2.txt # create tar file

 tar -tf first.tar #  (Checking the contents of a file)
file.txt
file2.txt

tar -xvf first.tar #(Extracting a Tar file Contents)

tar -cvzf first.tar.gz file.txt file1.txt #(Creating a tarball and compressing via gzip)

tar -cvjf first.tar.bz2 file.txt file1.txt #(Creating a tarball and compressing via  bzip2)

gzip first.tar #(Compressing with gzi)

gunzip first.tar.gz #(Decompressing with gzip )

 bzip2 first.tar.gz #(Compressing with bzip2 )

 bunzip2 first.tar.gz.bz2 # (Decompressing with bzip2)
```



# Automation and Scheduling

### Automation
create a script

```bash
 nano first_script.sh
#! /bin/bash

mkdir /home/ubuntu/script
cd /home/ubuntu/script
touch file{1..100}
ls -lh /home/ubuntu/script > /home/ubuntu/script.log


 bash first_script.sh

```

### Automation Scheduled

 m  h  dom  mon  dow    command = syntex of cron


 ```bash
crontab -e
 * * * * * echo "hello from cron" >> /home/ubuntu/cron.txt
 ```

 # Open Source Sofware

 

```bash
   uname -o #(print os) 
   GNU/Linux

```

### Software Repositories
The Ubuntu Repositories are:

Main -  Free and Open Source Software maintained by 
Canonical

Universe -  Free and Open Source Software maintained by the 
Ubuntu Community.

Restricted -  Proprietary software and drivers for company specific devices such as wireless cards etc.

Multiverse  - Software that is restricted either by copyright or legal issue


### Searching for packages using apt
Ubuntu’s package manager (apt) uses the /var/lib/apt/lists as a cache.

To search the apt-cache for packages match certain search term use:

```bash
apt-cache search docx
```

To find more information about a specific package
```bash
apt-cache show docx2txt
```

### Updationg the cache and upgrading software

This command downloads the latest package information from the repositories configured on your system.
```bash
sudo apt-get update
```
This command installs the newer versions of all packages currently installed on your system. 

```bash
sudo apt-get upgrade
```

### installing new Software

install packages
```bash
sudo apt-get install x11-apps
```

### Downloading Source code

The sources.list file in the /etc/apt folder contains lines telling the package manager what 
package lists it should download.

To download source code
```bash
sudo apt-get source <package name>
```

### uninstalling packages
To remove a package completely
```bash
sudo apt-get purge <package name>
```

remove any dangling dependency packages that are no longer required on your system

```bash
sudo apt-get autoremove

```