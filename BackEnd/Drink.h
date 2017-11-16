/*
 * Drink.h
 *
 *  Created on: Nov 6, 2017
 *      Author: Rastiq
 */

//#ifndef DRINK_H_
//#define DRINK_H_

using namespace std;
#include <iostream>
#include <exception>
#include <stdio.h>

class Drink {
public:
	Drink();
	Drink(std::string);
	Drink(std::string, float a);
	~Drink();                       // Destructor
	string getName() const;		    // Accessor
	float getCost() const;          // Accessor
	bool isAvailable() const;       // Accessor
	void setName(std::string);      //Mutator
	void setCost(float c);          //Mutator
	void setAvailability(bool a);   //Mutator

private:
	std::string name;
	float cost;
	bool availability;
};

//#endif /* DRINK_H_ */
