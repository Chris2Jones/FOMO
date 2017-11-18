/*
 * Business.cpp
 *
 *  Created on: Nov 13, 2017
 *      Author: Owner
 */

#include "Business.h"
#include "Transaction.h"
#include "userCustomer.h"
#include "Drinks.h"

Business::Business(string name){
	Name = name;
	Tab = 0;
}

void Business::addInfo(string name, string email, string location){
	Name = name;
	Email = email;
	Location = location;
}

void Business::addTransactionString(Transaction t){
	TransactionHistory = TransactionHistory + "\n" + t.TtoString();
}

string Business::getTransactionHistory(){
	return TransactionHistory;
}

string Business::getName(){
	return Name;
}

void Business::addDrink(const Drink d){
	Drinks.push_back(d);
}

vector<Drink> Business::getDrinkList(){
	return Drinks;
}

void Business::addTransactionPayee(float amount, Transaction t){
	Tab = Tab + amount;
	TransactionHistory = TransactionHistory + t.TtoString();
}
