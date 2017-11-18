/*
 * userCustomer.h
 *
 *  Created on: Nov 13, 2017
 *      Author: Owner
 */

#ifndef USERCUSTOMER_H_
#define USERCUSTOMER_H_
/*
 * user.h
 *
 *  Created on: Nov 13, 2017
 *      Author: Owner
 */
#include <string>
#include "Transaction.h"
#include "Business.h"

using namespace std;

class customer{
private:
	//Mailing Info
	string Name;
	string Email;
	string Address;

	//Personal info + Name
	int Age;
	string Gender;

	//Transaction related attributes
	bool LockFunds;
	//int CC;
	string TransactionHistory;
	float Tab;

public:
	//Setters
	customer();
	customer(string name,string email,string address,int age,string gender,float tab);
	void setName(string name);
	void setMailingInfo(string email, string address);
	void setPersonalInfo(string gender, int age);
	void addToTab(float tab);

	//Getters
	string getName();
	string getPersonalInfo();
	string getMailingInfo();

	//Transaction class users
	string getTransactionHistory();
	void lockFunds(bool); //Stops you from performing a transaction
	bool accessFunds(); //Can you access the funds.

	bool addTransactionPayer(Business, float); //Paying a business
	bool addTransactionPayerC(customer, float); //Overloaded for a customer
	bool addTransactionPayee(customer, float); //between two customers
	void addTransactionString(Transaction t); //Record the transaction that just occured
	//

	//Create destructor??
};


#endif /* USERCUSTOMER_H_ */
