package apollo.link.error;

import apollo.link.ApolloLink;
import apollo.link.FetchResult;
import apollo.link.NextLink;
import apollo.link.Observable;
import apollo.link.Operation;

@:jsRequire('apollo-link-error', 'onError')
extern class ErrorLink extends ApolloLink {
	@:selfCall
	public function new(errorHandler:ErrorHandler);

	@:selfCall
	public static function onError(errorHandler:ErrorHandler):ErrorLink;
}
