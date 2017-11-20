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
	//Generic Info
	string Name;
	string Email;
	string Location;

	//A list of drinks they have
	std::vector<Drink> Drinks;

	//Their Transaction History
	string TransactionHistory;

	//Total money the Business has
	float Tab;

public:

	//constructor
	Business(string);
	Business(string,string,string);
	//~Business();

	//Various setters
	void addInfo(string, string, string);
	void addTransactionString(Transaction);
	void addDrink(const Drink);

	//Transaction interaction, used by the payer class.
	void addTransactionPayee(float, Transaction);

	//Various getters
	string BtoString();
	string getTransactionHistory();
	vector<Drink> getDrinkList();
	string getName();
	float getTab();
};



#endif /* BUSINESS_H_ */
