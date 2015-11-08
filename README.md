# Italy-Restaurant-Project
This project was carried out during the database course. 
The aim of this project was to create a database for a restaurant serving Italian cuisine.

This database had a main GUI, where the employee had to insert a username and a password. Depending on the employee's position, i.e. waiter, chef, etc, he/she was trasferred to the relevant GUI for each position. 

The interface of this project implement with Java Application. 
GUI Chef: The chef can see the orders and can select one of them. Then the dishes of the specific order are displyed. Upon choosing the specific dish and pressing "SHOW INGREDIENTS" button, the chef is able to see the ingredients of the selected dish. The ingredients displayed are the standard ingredients, as well as some extras ingredients that the customer might have chosen. When the chef has prepared the dish, he/she presses the "READY" button. If all the dishes of the specific order are ready, then the waiter is notified with a message.  

GUI cashier: The cashier can see all the orders which have not been yet payed. If press the "BILL" button and insert the number of table then printing the bill. If cashier press "PAY" button then the order has been payed and refresh the bonus of the customer (if customer has bonus card).  

GUI waiter: When the waiter inserted to the application, can see three choices: "NEW CUSTOMER", "CREATE ORDER", "ADD DISHES IN CURRENT ORDER".  If selected "NEW CUSTOMER", then registered the customer and gives bonus card. If selected "CREATE ORDER" insert the number of table, bonus card (if the customer have) and number of people. Then in a new GUI the waiter select dish, ingriendients and drinks about that table. When order complete, refresh automatic the database. If selected "ADD DISHES IN CURRENT ORDER", then insert the number of table and can add more dishes or anything else about that order.  

First of all, is must to create the database, using the CREATE_INSERT file. Then the database created and insert many of registers. 

ADD LIBRARIES FOR JAVA APPLICATION:

1) MySQL jdbc dRIVER - mysql-connector-java-5.1.23-bin.jar

2) Absolute Layout - AbsoluteLayout.jar 

3) JDK 1.7(Default)
