package graphql;

import js.Error;

extern class GraphQLError extends Error {
	public var path:String;
	public var locations:Array<String>;
}

