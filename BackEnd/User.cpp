/*
 * user.cpp
 *
 *  Created on: Nov 13, 2017
 *      Author: Owner
 */

#include "User.h"

#include <iostream>
#include <string>

#include "Transaction.h"
int main(){
	return 0;
}
User::User(){
	Tab = 0;
	LockFunds = true;
	Age = 0;
	TransactionHistory = "Transaction History:";
}

User::User(string name,string email,string address,int age,string gender,float tab){
	Name = name;
	Email = email;
	Address = address;
	Age = age;
	Gender = gender;
	Tab = tab;
	LockFunds = false;
	TransactionHistory = "Transaction History:";
}

void User::addCreditCard(int CCnum){
	this->CC.insert(CCnum);
}

void User::setName(string name){
	Name = name;
}

void User::setMailingInfo(string email, string address){
	Email = email;
	Address= address;
}

void User::setPersonalInfo(string gender,int age){
	Gender = gender;
	Age = age;
}

void User::addToTab(float tab){
	if(tab>0){
		Tab = Tab + tab;
	}
}

string User::getName(){
	return Name;
}

string User::getPersonalInfo(){
	string buffer = Name + ": \n" + "Age : ";
	buffer = buffer + std::to_string(Age) + "\n Gender: ";
	buffer = buffer + Gender;
	return buffer;
}

string User::getMailingInfo(){
	return "Hello";
}

string User::getTransactionHistory(){
	return TransactionHistory;
}

bool User::accessFunds(){
	return LockFunds;
}

bool User::addTransactionPayer(Business payee, float amount ){
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

bool User::addTransactionPayerC(User payee, float amount){
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

bool User::addTransactionPayee(User payer, float amount){
	bool check = payer.addTransactionPayerC(*this,amount);
	return check;
}

void User::lockFunds(bool set){
	LockFunds = set;
}

//IDK WHAT THIS IS
void User::addTransactionString(Transaction t){
	TransactionHistory = TransactionHistory + "\n" + t.TtoString();
}



