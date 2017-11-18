/*
 * Transaction.cpp
 *
 *  Created on: Nov 6, 2017
 *      Author: Owner
 */

#include <iostream>
#include "Transaction.h"
#include <math.h>

using namespace std;

Transaction::Transaction(string payer, string payee, float amount){
	this->Payee = payee;
	this->Payer = payer;
	this->money = amount;
}

Transaction::Transaction(string payer, string payee): Payer(payer),Payee(payee), money(0) { }

string Transaction::TtoString() const{
	string transaction = "";
	transaction = this->Payer + " sent " + this->Payee + " " + to_string(this->money) + "$.";
	return transaction;
}



