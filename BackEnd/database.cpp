#include <cstdint>
#include <iostream>
#include <vector>
#include <string>
#include <bsoncxx/json.hpp>
#include <mongocxx/client.hpp>
#include <mongocxx/stdx.hpp>
#include <mongocxx/uri.hpp>

using bsoncxx::builder::stream::close_array;
using bsoncxx::builder::stream::close_document;
using bsoncxx::builder::stream::document;
using bsoncxx::builder::stream::finalize;
using bsoncxx::builder::stream::open_array;
using bsoncxx::builder::stream::open_document;

using namespace std;

int main() {

}
/*
Initializes database named mongodb
creates 3 collections in database
named drinks userss owners and transactions
*/
void dbinit(){
	mongocxx::instance instance{};
	mongocxx::client client{mongocxx::uri{}};
	mongocxx::database db = client["fomodb"];
	mongocxx::collection coll = db["drinks"];
	mongocxx::collection coll = db["users"];
	mongocxx::collection coll = db["owners"];
	mongocxx::collection coll = db["transactions"];
}

//Stores drink into database returns the id for the db
string storeDrink(string name, float cost, bool availability){
	auto builder = bsoncxx::builder::stream::document{};
	bsoncxx::document::value doc_value = builder
	<< "name" << name
	<< "cost" << cost
	<< "availability" << availability
	<< bsoncxx::builder::stream::close_document
    << bsoncxx::builder::stream::finalize;
	bsoncxx::document::view view = doc_value.view();
	bsoncxx::stdx::optional<mongocxx::result::insert_one> result = drinks.insert_one(doc_value);
	string id = mongocxx::result::inser_one.inserted_id();
	return id;
}

//Returns the BSON object for the drink class found by id
mongo::BSONObj getDrink(string id){
	mongo::BSONObj obj = c.findOne(drinks, mongo::QUERY("_id" << mongo::OID(id)));
	return obj;
}

//Stores user into database returns the id for the db
string storeUser(string userName, string pswd, string name, cardNo, tab){
	auto builder = bsoncxx::builder::stream::document{};
	bsoncxx::document::value doc_value = builder
	<< "user_name" << userName
	<< "password" << pswd
	<< "name" << name
	<< "card_number" << cardNo
	<< "tab" << tab
	<< bsoncxx::builder::stream::close_document
    << bsoncxx::builder::stream::finalize;
	bsoncxx::document::view view = doc_value.view();
	string id = bsoncxx::stdx::optional<mongocxx::result::insert_one> result = users.insert_one(doc_value);
	return id;
}

//Returns the BSON object for the user class found by id
mongo::BSONObj getUser(string id){
	mongo::BSONObj obj = c.findOne(users, mongo::QUERY("_id" << mongo::OID(id)));
	return obj;	
}

//Stores owner into database returns the id for the db
string storeOwner(string eMail, int location[], accountNo, vector<string> &drinks, vector<string> &transactions){
	auto builder = bsoncxx::builder::stream::document{};
	bsoncxx::document::value doc_value = builder
	<< "e_mail" << eMail
	<< "location" << bsoncxx::builder::stream::open_array
	for(i = 0; i<2; i++){
		<< location[i]
	}
	<< close_array
	<< "account_number" << accountNo
	<< "drinks" << bsoncxx::builder::stream::open_array
	for(i = 0; i<drinks.size(); i++){
		<<drinks[i]
	}
	<< close_array
	<< "transactions" << bsoncxx::builder::stream::open_array
	for(i = 0; i<transactions.size(); i++){
		<<transactions[i]
	}
	<< close_array
	<< bsoncxx::builder::stream::close_document
	<< bsoncxx::builder::stream::finalize;
	bsoncxx::document::view view = doc_value.view();
	string id = bsoncxx::stdx::optional<mongocxx::result::insert_one> result = owners.insert_one(doc_value);
	return id;
}

//Returns the BSON object for the drink class found by id
mongo::BSONObj getOwner(string id){
	mongo::BSONObj obj = c.findOne(owners, mongo::QUERY("_id" << mongo::OID(id)));
	return obj;	
}

//Stores transaction into database returns the id for the db
string transaction(string payer, string payee, float amount, transactionNo){
	auto builder = bsoncxx::builder::stream::document{};
	bsoncxx::document::value doc_value = builder
	<< "payer" << payer
	<< "payee" << payee
	<< "amount" << amount
	<< "transaction_number" << transactionNo
	<< bsoncxx::builder::stream::close_document
	<< bsoncxx::builder::stream::finalize;
	bsoncxx::document::view view = doc_value.view();
	string id = bsoncxx::stdx::optional<mongocxx::result::insert_one> result = transactions.insert_one(doc_value);
	return id;
}

//Returns the BSON object for the transaction class found by id
mongo::BSONObj getTransaction(string id){
	mongo::BSONObj obj = c.findOne(transactions, mongo::QUERY("_id" << mongo::OID(id)));
	return obj;	
}