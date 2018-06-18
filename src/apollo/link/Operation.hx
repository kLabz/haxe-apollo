package apollo.link;

import graphql.ASTDefs.DocumentNode;

typedef Operation = {
	var query:DocumentNode;
	var variables:Dynamic<Any>;
	var operationName:String;
	var extensions:Dynamic<Any>;
	var setContext:Dynamic<Any>->Dynamic<Any>;
	var getContext:Void->Dynamic<Any>;
	var toKey:Void->String;
}

