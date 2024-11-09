#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"
# PSQL="psql --username=marct --dbname=salon --tuples-only -c "

echo -e "\n~~~~~ MY SALON ~~~~~"

echo -e "\nWelcome to My Salon, how can I help you?\n"

SERVICE_MENU() {
  # get available services
  AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  # display services
  echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done
  # ask for service
  read SERVICE_ID_SELECTED
  # if not a valid selection, error and retry
  SERVICE_TYPE=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  echo $SERVICE_TYPE
  if [[ -z $SERVICE_TYPE ]]
  then
    echo -e "I could not find that service. What would you like today?"
    SERVICE_MENU
  else
    # get customer info
    echo -e "What's your phone number?"
    read CUSTOMER_PHONE
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")

    # if customer doesn't exist
    if [[ -z $CUSTOMER_NAME ]]
    then
      # get customer name
      echo -e "I don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME

      # insert new customer
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    fi
    SERVICE_FORMATTED=$(echo $SERVICE_TYPE | sed -r 's/^ *| *$//g')
    NAME_FORMATTED=$(echo $CUSTOMER_NAME| sed -r 's/^ *| *$//g')
    # get appointment time
    echo -e "\nWhat time would you like your $SERVICE_FORMATTED, $NAME_FORMATTED?"
    read SERVICE_TIME

    # get customer id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

    # insert appointment
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
    echo -e "\nI have put you down for a $SERVICE_FORMATTED at $SERVICE_TIME, $NAME_FORMATTED."
  fi
}

SERVICE_MENU