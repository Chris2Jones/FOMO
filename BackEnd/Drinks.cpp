/*
 * Drink.cpp
 *
 *  Created on: Nov 6, 2017
 *      Author: Rastiq
 */

using namespace std;
#include "Drinks.h"
#include <stdio.h>
#include <string>

Drink::Drink() {
	cost = 0;
	availability = false;
	name = "not defined";
}

Drink::Drink(std::string n) {
	name = n;
	availability = false;
	cost = 0;
}

Drink::Drink(std::string n, float a) {
	name = n;
	availability = true;
	cost = a;
}

string Drink::toString(){
	string buffer = name + "\t";
	buffer = buffer + to_string(cost) + "\t";
	buffer = buffer + to_string(availability) + "\t";
	return buffer;
}

std::string Drink::getName() const { return name; }
float Drink::getCost() const { return cost; }
bool Drink::isAvailable() const { return availability; }
void Drink::setName(std::string n) {name = n;};      //Mutator
void Drink::setCost(float c) {cost = c;};          //Mutator
void Drink::setAvailability(bool a) {availability = a;};   //Mutator

/*
 * Drinks.cpp
 *
 *  Created on: Nov 15, 2017
 *      Author: Owner
 */




