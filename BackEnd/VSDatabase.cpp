// text03.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"


#include <bson.h>
#include <mongoc.h>
#include <stdio.h>
#include <iostream>
#include <vector>
#include <String>
using namespace std;



string storeDrink(string name, float cost, bool availability) {
	mongoc_client_t *client;
	mongoc_collection_t *collection;
	bson_error_t error;
	bson_oid_t oid;
	bson_t *document;
	char cid[25];

	mongoc_init();
	client = mongoc_client_new("mongodb://DavidGarven:database123@ds113636.mlab.com:13636/fomodb");
	collection = mongoc_client_get_collection(client, "fomodb", "drinks");
	document = bson_new();
	bson_oid_init(&oid, NULL);
	BSON_APPEND_OID(document, "_id", &oid);
	BSON_APPEND_UTF8(document, "name", name.c_str());
	BSON_APPEND_DOUBLE(document, "cost", cost);
	BSON_APPEND_BOOL(document, "availability", availability);
	bson_oid_to_string(&oid, cid);
	string id = cid;

	if(!mongoc_collection_insert(collection, MONGOC_INSERT_NONE, document, NULL, &error)) {
		fprintf(stderr, "%s\n", error.message);
	}

	bson_destroy(document);
	mongoc_collection_destroy(collection);
	mongoc_client_destroy(client);
	mongoc_cleanup();

	return id;
}

string storeTransaction(string payer, string payee, float amount) {
	mongoc_client_t *client;
	mongoc_collection_t *collection;
	bson_error_t error;
	bson_oid_t oid;
	bson_t *document;
	string id;
	char cid[25];

	mongoc_init();

	client = mongoc_client_new("mongodb://DavidGarven:database123@ds113636.mlab.com:13636/fomodb");
	collection = mongoc_client_get_collection(client, "fomodb", "transactions");


	document = bson_new();
	bson_oid_init(&oid, NULL);
	BSON_APPEND_OID(document, "_id", &oid);
	BSON_APPEND_UTF8(document, "payer", payer.c_str());
	BSON_APPEND_UTF8(document, "payee", payee.c_str());
	BSON_APPEND_DOUBLE(document, "amount", amount);
	bson_oid_to_string(&oid, cid);
	id = cid;

	if (!mongoc_collection_insert(collection, MONGOC_INSERT_NONE, document, NULL, &error)) {
		fprintf(stderr, "%s\n", error.message);
	}

	bson_destroy(document);
	mongoc_collection_destroy(collection);
	mongoc_client_destroy(client);
	mongoc_cleanup();

	return id;
}

string storeUser(string name, string email, string address, int age, float tab) {
	mongoc_client_t *client;
	mongoc_collection_t *collection;
	bson_error_t error;
	bson_oid_t oid;
	bson_t *document;
	string id;
	char cid[25];

	mongoc_init();

	client = mongoc_client_new("mongodb://DavidGarven:database123@ds113636.mlab.com:13636/fomodb");
	collection = mongoc_client_get_collection(client, "fomodb", "users");


	document = bson_new();
	bson_oid_init(&oid, NULL);
	BSON_APPEND_OID(document, "_id", &oid);
	BSON_APPEND_UTF8(document, "name", name.c_str());
	BSON_APPEND_UTF8(document, "email", email.c_str());
	BSON_APPEND_UTF8(document, "address", address.c_str());
	BSON_APPEND_INT32(document, "age", age);
	BSON_APPEND_DOUBLE(document, "tab", tab);
	bson_oid_to_string(&oid, cid);
	id = cid;

	if (!mongoc_collection_insert(collection, MONGOC_INSERT_NONE, document, NULL, &error)) {
		fprintf(stderr, "%s\n", error.message);
	}

	bson_destroy(document);
	mongoc_collection_destroy(collection);
	mongoc_client_destroy(client);
	mongoc_cleanup();

	return id;
}

string storeOwner(string name, string email, string location, vector<string> drinks, string transactions) {
	mongoc_client_t *client;
	mongoc_collection_t *collection;
	bson_error_t error;
	bson_oid_t oid;
	bson_t *document;
	bson_t child;
	string id;
	char cid[25];

	mongoc_init();

	client = mongoc_client_new("mongodb://DavidGarven:database123@ds113636.mlab.com:13636/fomodb");
	collection = mongoc_client_get_collection(client, "fomodb", "owners");


	document = bson_new();
	bson_oid_init(&oid, NULL);
	BSON_APPEND_OID(document, "_id", &oid);
	BSON_APPEND_UTF8(document, "name", name.c_str());
	BSON_APPEND_UTF8(document, "email", email.c_str());
	BSON_APPEND_UTF8(document, "location", location.c_str());
	BSON_APPEND_ARRAY_BEGIN(document, "drinks", &child);
	for (int i = 0; i<drinks.size(); i++) {
		string title = "drink" + i;
		string out = drinks[i];
		BSON_APPEND_UTF8(&child, title.c_str(), out.c_str());
	}
	bson_append_array_end(document, &child);
	BSON_APPEND_UTF8(document, "transactions", transactions.c_str());
	bson_oid_to_string(&oid, cid);
	id = cid;

	if (!mongoc_collection_insert(collection, MONGOC_INSERT_NONE, document, NULL, &error)) {
		fprintf(stderr, "%s\n", error.message);
	}

	bson_destroy(document);
	mongoc_collection_destroy(collection);
	mongoc_client_destroy(client);
	mongoc_cleanup();

	return id;
}


string getDrink(string id) {
	mongoc_client_t *client;
	mongoc_collection_t *collection;
	mongoc_cursor_t *cursor;
	const bson_t *doc;
	bson_t *query;
	bson_oid_t oid;
	char *str;
	string drink;
	bson_oid_init_from_string(&oid, id.c_str());
	mongoc_init();

	client = mongoc_client_new("mongodb://DavidGarven:database123@ds113636.mlab.com:13636/fomodb");
	collection = mongoc_client_get_collection(client, "fomodb", "drinks");
	query = bson_new();
	BSON_APPEND_OID(query, "_id", &oid);
	cursor = mongoc_collection_find(collection, MONGOC_QUERY_NONE, 0, 0, 0, query, NULL, NULL);
	mongoc_cursor_next(cursor, &doc);
	str = bson_as_json(doc, NULL);
	printf("%s\n", str);
	bson_free(str);
	bson_destroy(query);
	mongoc_cursor_destroy(cursor);
	mongoc_collection_destroy(collection);
	mongoc_client_destroy(client);
	drink = str;
	return "hello";
}

string getTransaction(string id) {
	mongoc_client_t *client;
	mongoc_collection_t *collection;
	mongoc_cursor_t *cursor;
	const bson_t *doc;
	bson_t *query;
	bson_oid_t oid;
	char *str;
	string drink;
	bson_oid_init_from_string(&oid, id.c_str());
	mongoc_init();

	client = mongoc_client_new("mongodb://DavidGarven:database123@ds113636.mlab.com:13636/fomodb");
	collection = mongoc_client_get_collection(client, "fomodb", "transactions");
	query = bson_new();
	BSON_APPEND_OID(query, "_id", &oid);
	cursor = mongoc_collection_find(collection, MONGOC_QUERY_NONE, 0, 0, 0, query, NULL, NULL);
	mongoc_cursor_next(cursor, &doc);
	str = bson_as_json(doc, NULL);
	printf("%s\n", str);
	bson_free(str);
	bson_destroy(query);
	mongoc_cursor_destroy(cursor);
	mongoc_collection_destroy(collection);
	mongoc_client_destroy(client);
	drink = str;
	return "hello";
}

string getUser(string id) {
	mongoc_client_t *client;
	mongoc_collection_t *collection;
	mongoc_cursor_t *cursor;
	const bson_t *doc;
	bson_t *query;
	bson_oid_t oid;
	char *str;
	string drink;
	bson_oid_init_from_string(&oid, id.c_str());
	mongoc_init();

	client = mongoc_client_new("mongodb://DavidGarven:database123@ds113636.mlab.com:13636/fomodb");
	collection = mongoc_client_get_collection(client, "fomodb", "users");
	query = bson_new();
	BSON_APPEND_OID(query, "_id", &oid);
	cursor = mongoc_collection_find(collection, MONGOC_QUERY_NONE, 0, 0, 0, query, NULL, NULL);
	mongoc_cursor_next(cursor, &doc);
	str = bson_as_json(doc, NULL);
	printf("%s\n", str);
	bson_free(str);
	bson_destroy(query);
	mongoc_cursor_destroy(cursor);
	mongoc_collection_destroy(collection);
	mongoc_client_destroy(client);
	drink = str;
	return "hello";
}

string getUOwner(string id) {
	mongoc_client_t *client;
	mongoc_collection_t *collection;
	mongoc_cursor_t *cursor;
	const bson_t *doc;
	bson_t *query;
	bson_oid_t oid;
	char *str;
	string drink;
	bson_oid_init_from_string(&oid, id.c_str());
	mongoc_init();

	client = mongoc_client_new("mongodb://DavidGarven:database123@ds113636.mlab.com:13636/fomodb");
	collection = mongoc_client_get_collection(client, "fomodb", "owners");
	query = bson_new();
	BSON_APPEND_OID(query, "_id", &oid);
	cursor = mongoc_collection_find(collection, MONGOC_QUERY_NONE, 0, 0, 0, query, NULL, NULL);
	mongoc_cursor_next(cursor, &doc);
	str = bson_as_json(doc, NULL);
	printf("%s\n", str);
	bson_free(str);
	bson_destroy(query);
	mongoc_cursor_destroy(cursor);
	mongoc_collection_destroy(collection);
	mongoc_client_destroy(client);
	drink = str;
	return "hello";
}


int main() {
	vector<string> vectr(2);
	vectr = { "value1", "value2" };
	string id = storeOwner("david", "email", "kingston", vectr, "string");
	cout << id << endl;
	return 0;
}




