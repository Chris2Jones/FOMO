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

User::User(){
	Tab = 0;
	LockFunds = true;
	Age = 0;
	TransactionHistory = "Transaction History:";
}

User::User(string name,string email,string address,int age,float tab, string password){
	Name = name;
	Password = password;
	Email = email;
	Address = address;
	Age = age;
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

void User::setPersonalInfo(int age){
	Age = age;
}

void User::addToTab(float tab){
	Tab = Tab + tab;
}

string User::getName(){
	return Name;
}

string User::getPersonalInfo(){
	string buffer = "Name: " + Name + "\n" + "Age : ";
	buffer = buffer + std::to_string(Age);
	return buffer;
}

string User::getMailingInfo(){
	string buffer = "Email: " + Email + "\n";
	buffer = buffer + "Address: " + Address + "\n";
	return buffer;
}

string User::getTransactionHistory(){
	return TransactionHistory;
}

string User::toString(){
	string buffer = Name + "\t";
	buffer = buffer + Email + "\t";
	buffer = buffer + Address + "\t";
	buffer = buffer + Password + "\t";
	buffer = buffer + to_string(Age);
	return buffer;
}

float User::getTab(){
	return Tab;
}
bool User::accessFunds(){
	return LockFunds;
}

bool User::addTransactionPayer(Business& payee, float amount ){
	Transaction t = Transaction(this->Name, payee.getName(), amount);
	if(LockFunds){
		cout << "Funds are locked" << endl;
		return false;
	}
	if(this->Tab > amount){
		this->Tab = this->Tab - amount;
		TransactionHistory = TransactionHistory + "\n" + t.TtoString();
		payee.addTransactionPayee(amount,t);
		return true;
	}
	cout << "Not enough funds! Transaction Unsuccessful!" << endl;
	return false;
}

bool User::addTransactionPayerC(User& payee, float amount){
	Transaction t = Transaction(this->Name, payee.getName(), amount);
	if(LockFunds){
		cout << "Funds are locked! Transaction Unsuccessful!" << endl;
		return false;
	}
	if(this->Tab > amount){
		this->Tab = this->Tab - amount;
		TransactionHistory = TransactionHistory + "\n" + t.TtoString();
		payee.addToTab(amount);
		payee.addTransactionString(t);
		cout<<"Transaction Successful"<<endl;
		return true;
	}
	cout << "Not enough funds! Transaction Unsuccessful!" << endl;
	return false;
}

bool User::addTransactionPayee(User& payer, float amount){
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



