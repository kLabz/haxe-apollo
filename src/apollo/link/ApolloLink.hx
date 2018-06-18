package apollo.link;

import haxe.extern.EitherType;

@:jsRequire('apollo-link', 'ApolloLink')
extern class ApolloLink {
	public static function empty():ApolloLink;

	public static function from(links:Array<ApolloLink>):ApolloLink;

	public static function split(
		test:Operation->Bool,
		left:EitherType<ApolloLink, RequestHandler>,
		?right:EitherType<ApolloLink, RequestHandler>
	):ApolloLink;

	public static function execute(
		link:ApolloLink,
		operation:GraphQLRequest
	):Observable<FetchResult>;

	public function new(?request:RequestHandler);

	public function split(
		test:Operation->Bool,
		left:EitherType<ApolloLink, RequestHandler>,
		?right:EitherType<ApolloLink, RequestHandler>
	):ApolloLink;

	public function concat(
		next:EitherType<ApolloLink, RequestHandler>
	):ApolloLink;

	public function request(
		operation:Operation,
		?forward:NextLink
	):Null<Observable<FetchResult>>;
}

