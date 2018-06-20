package apollo.client.core;

typedef QueryPromise = {
	var resolve:ApolloQueryResult<Any>->Void;
	var reject:Error->Void;
}
