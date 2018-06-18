package apollo.link;

import graphql.ASTDefs.DocumentNode;

typedef GraphQLRequest = {
	var query:DocumentNode;
	@:optional var variables:Dynamic<Any>;
	@:optional var operationName:String;
	@:optional var context:Dynamic<Any>;
	@:optional var extensions:Dynamic<Any>;
}

