/*
 * userCustomer.h
 *
 *  Created on: Nov 13, 2017
 *      Author: Owner
 */

#ifndef USER_H_
#define USER_H_
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

class User{
private:
	//Mailing Info
	string Name;
	string Email;
	string Address;
	string Password;
	//Personal info + Name
	int Age;

	//Transaction related attributes
	bool LockFunds;
	set<int> CC;
	string TransactionHistory;
	float Tab;

public:
	//Setters
	User();
	User(string name,string email,string address,int age,float tab, string password);
	void addCreditCard(int);
	void setName(string name);
	void setMailingInfo(string email, string address);
	void setPersonalInfo(int age);
	void addToTab(float tab);

	//Getters
	string getName();
	string getPersonalInfo();
	string getMailingInfo();
	float getTab();

	//Transaction class users
	string getTransactionHistory();
	void lockFunds(bool); //Stops you from performing a transaction
	bool accessFunds(); //Can you access the funds.

	bool addTransactionPayer(Business&, float); //Paying a business
	bool addTransactionPayerC(User&, float); //Overloaded for a customer
	bool addTransactionPayee(User&, float); //between two customers
	void addTransactionString(Transaction t); //Record the transaction that just occured
	//

	string toString();
	//Create destructor??
};


#endif /* USERCUSTOMER_H_ */
