/*
 * TestingFomo.cpp
 *
 *  Created on: Nov 19, 2017
 *      Author: Owner
 */

#include "User.h"
#include "Business.h"
#include "Transaction.h"

int main(){

	cout << "MAKE NOTE!!! \nFor proper testing make sure to input the correct type, be it int, string or float" <<endl;
	cout << "------------------------------------------" <<endl;
	cout << "******\t******\t**  **\t******" <<endl;
	cout << "*     \t*    *\t* ** *\t*    *" <<endl;
	cout << "****  \t*    *\t* ** *\t*    *" <<endl;
	cout << "*     \t*    *\t*    *\t*    *" <<endl;
	cout << "*     \t******\t*    *\t******" <<endl;
	cout << "------------------------------------------" <<endl;
	//Creating two users
	User Chris("Chris","chris@queensu.ca","99 Princess Street",20,17.00,"password");
	User Alistair("Alistair","ali@queensu.ca","20 Bagot Street",20,12.00,"password");

	//Testing if they were properly loaded
	cout << "Initializing our Users:" << endl;

	cout << Chris.getPersonalInfo() <<endl;
	cout << Chris.getMailingInfo() <<endl;

	cout << Alistair.getPersonalInfo() <<endl;
	cout << Alistair.getMailingInfo()<<endl;

	//Creating Business
	Business Stages("Staj Mahal","stages@nightlife.queensu.ca","393 Princess Street");

	//Testing if the business was properly loaded
	cout << "Initializing the Business:" << endl;
	cout << Stages.BtoString() << endl;

	//Creating a new User
	//BEGIN TESTING NEW USER

	string newName;
	string newEmail;
	string newAddress;
	string password;
	string buffer;
	int newAge;
	cout << "\nCreating a new user" << endl;
	cout << "Enter your name: ";
	getline(cin,newName);
	cout << "Enter your email: ";
	getline(cin,newEmail);
	cout << "Enter your Address: ";
	getline(cin,newAddress);
	cout << "Enter your Age (As an Integer): ";
	cin >> newAge;
	cout << "Enter a password: ";
	cin >> password;
	User newUser(newName,newEmail,newAddress,newAge,0,password);

	//Testing if new user initialized properly
	cout << "\nTesting if new user initialized properly: \n";
	cout << newUser.getPersonalInfo() << endl;
	cout << newUser.getMailingInfo() << endl;

	cout << "Your tab currently is: " << newUser.getTab() <<endl;
	cout << "Add money to tab (float): ";
	float tab;
	cin >> tab;
	getline(cin,buffer);
	newUser.addToTab(tab);
	cout << "New Tab is: " << newUser.getTab() <<endl;

	//END USER TESTING

	//BEGIN TESTING TRANSACTIONS BETWEEN USERS
	//Now testing Transactions
	cout << "\nTesting Transactions with our preloaded Users" <<endl;
	Chris.addTransactionPayerC(Alistair,11.25);
	cout << "Alistair's new Tab is: $" << Alistair.getTab() << "\nChris's new Tab is: $" << Chris.getTab() <<endl;
	Chris.addTransactionPayee(Alistair, 5.60);
	cout << "Alistair's new Tab is: $" << Alistair.getTab() << "\nChris's new Tab is: $" << Chris.getTab() <<endl;

	//Testing bad transactions
	cout <<"\nTesting when a transaction does not go through: " <<endl;
	Alistair.addTransactionPayerC(Chris,100);
	Alistair.lockFunds(true);
	Alistair.addTransactionPayerC(Chris,5);
	cout << "Alistair's new Tab is: $" << Alistair.getTab() << "\nChris's new Tab is: $" << Chris.getTab() << "\n" <<endl;
	cout << Alistair.getTransactionHistory() <<endl;

	//BEGIN TESTING DRINKS CLASS
	//Creating new drinks and testing the drinks class
	cout << "\nTesting the drinks class!" << endl;
	Drink Marguerita("Marguerita", 5.75);
	Drink Beer("Beer",2.00);
	Drink Manhattan("Manhattan",4.00);
	Drink WhiskeySour("Whiskey Sour",4.50);

	//Adding the drinks to the business Stages
	Stages.addDrink(Marguerita);
	Stages.addDrink(Beer);
	Stages.addDrink(Manhattan);
	Stages.addDrink(WhiskeySour);

	//Creating our own Drink
	string nameDrink;
	float priceDrink;
	cout << "\nHow about you add your own Drink!!" <<endl;
	cout << "Give it a name: ";
	getline(cin,nameDrink);
	cout << "How much does " + nameDrink + " cost:";
	cin >> priceDrink;
	getline(cin,buffer);

	Drink newDrink(nameDrink,priceDrink);

	Stages.addDrink(newDrink);

	vector<Drink> StagesDrinks = Stages.getDrinkList();
	int size = StagesDrinks.size();
	Drink placeholder;
	cout << "\nThe drinks available at Stages are:" << endl;
	for (int i = 0; i < size; i++){
		placeholder = StagesDrinks[i];
		cout << placeholder.getName() << "\t costs: $" << placeholder.getCost() << endl;
	}

	string drink;
	cout << "\nOf the above drinks which would you like to buy: ";
	Drink selection;
	bool checkD = true;
	int drinkNum;
	while(checkD){
		getline(cin,drink);
		for (int i=0; i <size; i++){
			placeholder = StagesDrinks[i];
			if(drink == placeholder.getName()){
				drinkNum = i;
				cout << "Correct Drink Input" <<endl;
				checkD = false;
			}
		}
		if(checkD){
			cout << "Input a real selection! : " ;
		}
	}
	selection = StagesDrinks[drinkNum];

	cout << "Now it's time to pay the bartender!" <<endl;
	newUser.addTransactionPayer(Stages,selection.getCost());
	cout << newUser.getTransactionHistory() <<endl;
}

