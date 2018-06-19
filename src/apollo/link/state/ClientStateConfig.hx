package apollo.link.state;

import haxe.extern.EitherType;

import apollo.cache.ApolloCache;

// From graphql-anywhere
typedef FragmentMatcher = Any -> String -> Any -> Bool;

typedef ClientStateConfig = {
	@:optional var cache:ApolloCache<Any>;
	var resolvers:Any;
	@:optional var defaults:Any;
	@:optional var typeDefs:EitherType<String, Array<String>>;
	@:optional var fragmentMatcher:FragmentMatcher;
}

