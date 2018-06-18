package apollo.client.core;

import graphql.ASTDefs.DocumentNode;

typedef PureQueryOptions = {
	var query:DocumentNode;
	@:optional var variables:Dynamic<Any>;
}

