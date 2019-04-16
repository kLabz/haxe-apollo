package apollo.link.http;

import apollo.link.ApolloLink;
import apollo.link.RequestHandler;

typedef HttpLinkOptions = {
	> HttpOptions,
	@:optional var useGETForQueries:Bool;
}

@:jsRequire('apollo-link-http', 'createHttpLink')
extern class HttpLink extends ApolloLink {
	@:selfCall
	public function new(?options:HttpLinkOptions);

	@:selfCall
	public static function createHttpLink(?options:HttpLinkOptions):HttpLink;
}
