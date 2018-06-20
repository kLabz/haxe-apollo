package react.apollo;

import apollo.client.ApolloClient;
import react.ReactComponent.ReactElement;

typedef ApolloConsumerProps = {
	var children:ApolloClient<Any>->Null<ReactElement>;
}

@:jsRequire('react-apollo', 'ApolloConsumer')
extern class ApolloConsumer {
	@:selfCall
	public static function render(props:ApolloConsumerProps):ReactElement;
}

