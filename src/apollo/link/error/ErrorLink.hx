package apollo.link.error;

import apollo.link.ApolloLink;
import apollo.link.FetchResult;
import apollo.link.NextLink;
import apollo.link.Observable;
import apollo.link.Operation;

extern class ErrorLink extends ApolloLink {
	public function new(errorHandler:ErrorHandler);

	public function request(operation:Operation, forward:NextLink):Null<Observable<FetchResult>>;
}
