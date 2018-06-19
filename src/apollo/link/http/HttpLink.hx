package apollo.link.http;

import apollo.link.ApolloLink;
import apollo.link.RequestHandler;

typedef HttpLinkOptions = {
	> HttpOptions,
	@:optional var useGETForQueries:Bool;
}

extern class HttpLink extends ApolloLink {
	public var requester:RequestHandler;

	public function new(?options:HttpLinkOptions);
}
