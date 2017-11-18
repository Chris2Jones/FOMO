/*
 * Business.h
 *
 *  Created on: Nov 13, 2017
 *      Author: Owner
 */

#ifndef BUSINESS_H_
#define BUSINESS_H_

#include <string>
#include <vector>
#include <set>
#include "Drinks.h"
#include "Transaction.h"
using namespace std;

class Business{
private:
	string Name;
	string Email;
	string Location;
	std::vector<Drink> Drinks;
	string TransactionHistory;

	float Tab;

public:
	Business(string);
	//~Business();
	string getTransactionHistory();
	void addTransactionPayee(float, Transaction);
	void addInfo(string, string, string);
	void addTransactionString(Transaction);
	void addDrink(const Drink);
	vector<Drink> getDrinkList();
	string getName();
};



#endif /* BUSINESS_H_ */
