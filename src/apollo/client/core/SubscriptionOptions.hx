package apollo.client.core;

import graphql.ASTDefs.DocumentNode;

typedef SubscriptionOptions = {
	var query:DocumentNode;
	@:optional var variables:Dynamic<Any>;
}

