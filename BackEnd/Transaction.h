/*
 * Transaction.h
 *
 *  Created on: Nov 6, 2017
 *      Author: Owner
 */

#ifndef TRANSACTION_H_
#define TRANSACTION_H_
#include <iostream>

class Transaction {
private:
	std::string Payer;
	std::string Payee;
	double money;
public:
	//Create a transaction between Payer, and Payee, without specifying money
	Transaction(std::string Payer, std::string Payee);

	//Create a transaction, full constructor
	Transaction(std::string payer, std::string payee, float amount);

	std::string TtoString() const;
	std::string toString();
};

#endif /* TRANSACTION_H_ */
