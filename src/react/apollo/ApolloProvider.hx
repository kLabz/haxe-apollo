package react.apollo;

import apollo.client.ApolloClient;
import react.ReactComponent;

typedef ApolloProviderProps<TCache> = {
	var client:ApolloClient<TCache>;
}

@:jsRequire('react-apollo', 'ApolloProvider')
extern class ApolloProvider<TCache>
	extends ReactComponentOfProps<ApolloProviderProps<TCache>> {}
