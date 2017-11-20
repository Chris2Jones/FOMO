/*
 * Business.cpp
 *
 *  Created on: Nov 13, 2017
 *      Author: Owner
 */

#include "Business.h"
#include "Transaction.h"
#include "Drinks.h"
#include "User.h"

Business::Business(string name){
	Name = name;
	Tab = 0;
}

Business::Business(string name, string email, string location){
	Name = name;
	Email = email;
	Location = location;
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

void Business::addDrink(const Drink d){
	Drinks.push_back(d);
}

string Business::getTransactionHistory(){
	return TransactionHistory;
}

string Business::getName(){
	return Name;
}

string Business::BtoString(){
	string buffer = "Business: " + Name + "\n";
	buffer = buffer + "Email: " + Email + "\n";
	buffer = buffer + "Location: " + Location;
	return buffer;
}

vector<Drink> Business::getDrinkList(){
	return Drinks;
}

float Business::getTab(){
	return Tab;
}

void Business::addTransactionPayee(float amount, Transaction t){
	Tab = Tab + amount;
	TransactionHistory = TransactionHistory + t.TtoString();
}
