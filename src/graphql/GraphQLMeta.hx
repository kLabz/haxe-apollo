package graphql;

#if macro
import haxe.io.Path;
import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.MacroStringTools;
import haxe.macro.PositionTools;
import haxe.macro.Type;
import sys.FileSystem;
import sys.io.File;

import apollo.util.MacroUtils;

/**
	This tools helps managing simple GraphQL queries, mostly for usage with
	apollo.

	For easier usage, add something similar to your hxml file, targetting the
	root package of classes that use GraphQL queries:

	```hxml
	--macro "addGlobalMetadata('my.pack', '@:build(graphql.GraphQLMeta.build())')"
	```

	Then you can do that:

	```haxe
	@:graphql(query, 'my-query.gql')
	@:graphql(otherQuery, 'my-other-query.gql')
	class MyClass {
		// Fields created by macro:
		// var query:Document => my-query.gql parsed as graphql.ASTDefs.Document
		// var otherQuery:Document => my-other-query.gql parsed as graphql.ASTDefs.Document
	}
	```

	You can also omit the first argument, in which case the field will be named
	`query` (but your class won't be able to handle multiple `@:graphql` meta.
*/
class GraphQLMeta {
	static inline var GRAPHQL_META = ':graphql';
	static inline var PROCESSED_META = ':graphql_processed';
	static inline var DEFAULT_FIELD_NAME = 'query';

	static function build():Array<Field> {
		var cls = Context.getLocalClass();
		if (cls == null) return null;
		var inClass = cls.get();

		if (inClass.meta.has(PROCESSED_META)) return null;

		if (inClass.meta.has(GRAPHQL_META)) {
			var fields = Context.getBuildFields();
			var queries = inClass.meta.extract(GRAPHQL_META);
			for (query in queries) buildQuery(inClass, fields, query);

			inClass.meta.add(PROCESSED_META, [], inClass.pos);
			return fields;
		}

		return null;
	}

	static function buildQuery(
		inClass:ClassType,
		fields:Array<Field>,
		query:MetadataEntry
	):Void {
		var nbParams = query.params.length;
		if (nbParams == 0) throw 'TODO: error about missing params';
		if (nbParams > 2) throw 'TODO: error about unneeded params';

		var queryName = DEFAULT_FIELD_NAME;
		var queryExpr = query.params[0];

		if (nbParams == 2) {
			queryName = MacroUtils.exprToString(query.params[0]);
			queryExpr = query.params[1];
		}

		if (MacroUtils.hasField(fields, queryName)) {
			throw 'TODO: error about query field already present';
		}

		// We don't need to parse documentation during completion
		var queryString = (Context.defined('display'))
			? ""
			: extractQuery(inClass, queryExpr);

		var parsedQuery = try {
			if (Context.defined('display')) null;
			else parseQuery(queryString);
		} catch (e:Dynamic) {
			trace(e);
			throw 'TODO: graphql parse error';
		};

		fields.push({
			access: [AStatic],
			name: queryName,
			kind: FVar(
				// TODO: improve ASTDefs from haxe-graphql ast
				macro :graphql.ASTDefs.DocumentNode,
				macro untyped $v{parsedQuery}
			),
			meta: null,
			doc: null,
			pos: query.pos
		});
	}

	static function extractQuery(
		inClass:ClassType,
		queryExpr:Expr
	):String {
		return switch (queryExpr.expr) {
			case EConst(CString(str)):
				if (StringTools.endsWith(str, '.gql')) {
					extractQueryFromFile(inClass, str, queryExpr.pos);
				} else {
					StringTools.trim(str);
				}

			default:
				throw 'Invalid graphql query';
		};
	}

	static function extractQueryFromFile(
		inClass:ClassType,
		path:String,
		pos:Position
	):String {
		var clsFilename = PositionTools.getInfos(inClass.pos).file;
		var cwd = Path.directory(clsFilename);

		try {
			var file = FileSystem.fullPath(Path.join([cwd, path]));

			try {
				// Can fail for subtypes
				// TODO: detect subtypes and bind to module instead
				MacroUtils.registerClassTypeDependency(inClass, file);
			} catch (_:Dynamic) {}

			return File.getContent(file);
		} catch (e:Dynamic) {
			Context.error(
				'Cannot find GraphQL query file ${path}',
				pos
			);

			return null;
		}
	}

	static function parseQuery(query:String) {
		// trace('parseQuery');
		var parser = new graphql.parser.Parser(
			query,
			{noLocation: true}
		);

		return parser.document;
	}
}
#end
