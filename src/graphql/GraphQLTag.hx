package graphql;

import graphql.ASTDefs.DocumentNode;

@:jsRequire('graphql-tag')
extern class GraphQLTag {
	@:selfCall
	public static function parse(query:String):DocumentNode;
}
