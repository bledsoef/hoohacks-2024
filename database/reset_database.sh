echo "-----MAKE SURE YOU ARE IN THE ROOT DIRECTORY AND RUNNING THIS SCRIPT WITH ./database/reset_database.sh \n"

echo "Dropping databases"
mysql -u root -proot --execute="DROP DATABASE \`hoohacks_2024\`;"

echo "Recreating databases and users"
mysql -u root -proot --execute="CREATE DATABASE IF NOT EXISTS \`hoohacks_2024\`;"

python3 ./database/reset_database.py