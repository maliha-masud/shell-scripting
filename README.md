# Shell scripting in Unix

Output patterns and perform tasks using shell scripting in Unix

**Patterns**
* The script that takes two parametric variables: pattern option and number.
* Run as follows: **./script pattern_option number**
> pattern_option = {left, right, full}, number = any positive integer
* Pattern is output depending on the input parameters.

<img width="492" alt="image" src="https://github.com/maliha-masud/shell-scripting/assets/121713404/ca050c44-8b42-461d-b75e-1c9e07cfaf13">

* Error messages generated for invalid input parameters.

**Tasks**
* The script displays a main menu and performs tasks based on the input value.
* Valid input values = {1, 2, 3, 4, exit}.
* 1- Input a filename from user and display permissions of that file. Then invert the permissions
> e.g. If permissions were r-x change them to -w-.
* 2- Input a filename and a string, and search for the string in the file. Output the lines of file where that string is found.
* 3- Create a file dummy.txt and add the content of all the files in the current directory to dummy.
* 4- Input a filename from user and check the modified date of that file. If modified date is greater than 24 hours than the current time, update the modified date to current date.
* A log file is also maintained. It contains the information of the script.
