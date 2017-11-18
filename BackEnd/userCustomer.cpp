/*
 * user.cpp
 *
 *  Created on: Nov 13, 2017
 *      Author: Owner
 */

#include <iostream>
#include <string>

#include "userCustomer.h"
#include "Transaction.h"
int main(){
	return 0;
}
customer::customer(){
	Tab = 0;
	LockFunds = true;
	Age = 0;
	TransactionHistory = "Transaction History:";
}

customer::customer(string name,string email,string address,int age,string gender,float tab){
	Name = name;
	Email = email;
	Address = address;
	Age = age;
	Gender = gender;
	Tab = tab;
	LockFunds = false;
	TransactionHistory = "Transaction History:";
}

void customer::setName(string name){
	Name = name;
}

void customer::setMailingInfo(string email, string address){
	Email = email;
	Address= address;
}

void customer::setPersonalInfo(string gender,int age){
	Gender = gender;
	Age = age;
}

void customer::addToTab(float tab){
	if(tab>0){
		Tab = Tab + tab;
	}
}

string customer::getName(){
	return Name;
}

string customer::getPersonalInfo(){
	string buffer = Name + ": \n" + "Age : ";
	buffer = buffer + std::to_string(Age) + "\n Gender: ";
	buffer = buffer + Gender;
	return buffer;
}

string customer::getMailingInfo(){
	return "Hello";
}

string customer::getTransactionHistory(){
	return TransactionHistory;
}

bool customer::accessFunds(){
	return LockFunds;
}

bool customer::addTransactionPayer(Business payee, float amount ){
	Transaction t = Transaction(this->Name, payee.getName(), amount);
	if(!LockFunds){
		return false;
	}
	if(this->Tab > amount){
		this->Tab = this->Tab - amount;
		TransactionHistory = TransactionHistory + "\n" + t.TtoString();
		payee.addTransactionPayee(amount,t);
		return true;
	}
	return false;
}

bool customer::addTransactionPayerC(customer payee, float amount){
	Transaction t = Transaction(this->Name, payee.getName(), amount);
	if(!LockFunds){
		return false;
	}
	if(this->Tab > amount){
		this->Tab = this->Tab - amount;
		TransactionHistory = TransactionHistory + "\n" + t.TtoString();
		payee.addToTab(amount);
		payee.addTransactionString(t);
		return true;
	}
	return false;
}

bool customer::addTransactionPayee(customer payer, float amount){
	bool check = payer.addTransactionPayerC(*this,amount);
	return check;
}
void customer::lockFunds(bool set){
	LockFunds = set;
}

//IDK WHAT THIS IS
void customer::addTransactionString(Transaction t){
	TransactionHistory = TransactionHistory + "\n" + t.TtoString();
}



