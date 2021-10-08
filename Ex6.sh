#Usage: bash Ex6.sh

#Question 1:
cat wages.csv | cut -d , -f 1,2 |sort -k 1,1d -k 2,2n -t ,|uniq|tr ',' ' ' | grep -v -w "gender" > gender-yearsExperience.txt

#Question 2:
#To get highest earner information:
echo "Highest earner information: $(cat wages.csv | sort -k 4,4n -t ,| cut -d , -f 1,2,4 | tail -n 1)"

#To get lowest earner information:
echo "Lowest earner information: $(cat wages.csv | sort -k 4,4n -t ,| cut -d , -f 1,2,4 | head -n 2 | tail -n 1)"

#To get the number of females in the top 10 earners:
echo "Number of females in the top 10 earners: $(cat wages.csv | sort -k 4,4n -t , | tail -n 10 | grep -w "female" | wc -l | tr -s " ")"

#Question 3:
min12=$(cat wages.csv | cut -d , -f 3,4 | grep -w "12" | sort -k 2,2n -t ,| head -n 1 | cut -d , -f 2)
echo "12 years of school minimum wage: $min12"
min16=$(cat wages.csv | cut -d , -f 3,4 | grep -w "16" | sort -k 2,2n -t ,| head -n 1 | cut -d , -f 2)
echo "16 years of school minimum wage: $min16"
Echo "Difference in minimum wage: "$(echo "$min16 - $min12" | bc)
