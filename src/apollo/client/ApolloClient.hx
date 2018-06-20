package apollo.client;

import haxe.Constraints.Function;
import js.Promise;

import apollo.cache.ApolloCache;
import apollo.cache.DataProxy;
import apollo.client.core.ApolloQueryResult;
import apollo.client.core.ObservableQuery;
import apollo.client.core.QueryManager;
import apollo.client.core.QueryOptions;
import apollo.client.core.MutationOptions;
import apollo.client.core.SubscriptionOptions;
import apollo.client.core.WatchQueryOptions;
import apollo.client.data.DataStore;
import apollo.link.ApolloLink;
import apollo.link.FetchResult;
import apollo.link.GraphQLRequest;
import apollo.util.Observable;
import graphql.ExecutionResult;
import graphql.GraphQLError;

@:jsRequire('apollo-client', 'ApolloClient')
extern class ApolloClient<TCacheShape> implements DataProxy {
	public var link:ApolloLink;
	public var store:DataStore<TCacheShape>;
	public var cache:ApolloCache<TCacheShape>;
	public var queryManager:QueryManager<TCacheShape>;
	public var disableNetworkFetches:Bool;
	public var version:String;
	public var queryDeduplication:Bool;
	public var defaultOptions:DefaultOptions;

	private var devToolsHookCb:Function;
	private var proxy:Null<ApolloCache<TCacheShape>>;
	private var ssrMode:Bool;
	private var resetStoreCallbacks:Array<Void->Promise<Any>>;

	public function new(options:ApolloClientOptions<TCacheShape>);

	/**
	* This watches the results of the query according to the options specified
	* and returns an {@link ObservableQuery}. We can subscribe to this {@link
	* ObservableQuery} and receive updated results through a GraphQL observer.
	*
	* Note that this method is not an implementation of GraphQL subscriptions.
	* Rather, it uses Apollo's store in order to reactively deliver updates to
	* your query results.
	*
	* For example, suppose you call watchQuery on a GraphQL query that fetches
	* an person's first name and last name and this person has a particular
	* object identifer, provided by dataIdFromObject. Later, a different query
	* fetches that same person's first and last name and his/her first name has
	* now changed. Then, any observers associated with the results of the first
	* query will be updated with a new result object.
	*
	* See https://medium.com/apollo-stack/the-concepts-of-graphql-bc68bd819be3
	* for a description of store reactivity.
	**/
	public function watchQuery<T>(options:WatchQueryOptions):ObservableQuery_1<T>;

	/**
	* This resolves a single query according to the options specified and
	* returns a {@link Promise} which is either resolved with the resulting
	* data or rejected with an error.
	*
	* @param options An object of type {@link QueryOptions} that allows us to
	* describe how this query should be treated e.g. whether it should hit the
	* server at all or just resolve from the cache, etc.
	**/
	public function query<T>(options:QueryOptions):Promise<ApolloQueryResult<T>>;

	/**
	* This resolves a single mutation according to the options specified and
	* returns a {@link Promise} which is either resolved with the resulting
	* data or rejected with an error.
	*
	* It takes options as an object with the following keys and values:
	**/
	public function mutate<T>(options:MutationOptions_1<T>):Promise<FetchResult_1<T>>;

	/**
	* This subscribes to a graphql subscription according to the options
	* specified and returns an {@link Observable} which either emits received
	* data or an error.
	**/
	public function subscribe<T>(options:SubscriptionOptions):Observable<T>;

	/**
	* Tries to read some data from the store in the shape of the provided
	* GraphQL query without making a network request. This method will start at
	* the root query. To start at a specific id returned by `dataIdFromObject`
	* use `readFragment`.
	**/
	public function readQuery<T, TVariables>(options:Query<TVariables>):Null<T>;

	/**
	* Tries to read some data from the store in the shape of the provided
	* GraphQL fragment without making a network request. This method will read
	* a GraphQL fragment from any arbitrary id that is currently cached, unlike
	* `readQuery` which will only read from the root query.
	*
	* You must pass in a GraphQL document with a single fragment or a document
	* with multiple fragments that represent what you are reading. If you pass
	* in a document with multiple fragments then you must also specify a
	* `fragmentName`.
	**/
	public function readFragment<T, TVariables>(options:Fragment<TVariables>):Null<T>;

	/**
	* Writes some data in the shape of the provided GraphQL query directly to
	* the store. This method will start at the root query. To start at a a
	* specific id returned by `dataIdFromObject` then use `writeFragment`.
	**/
	public function writeQuery<TData, TVariables>(options:WriteQueryOptions<TData, TVariables>):Void;

	/**
	* Writes some data in the shape of the provided GraphQL fragment directly
	* to the store. This method will write to a GraphQL fragment from any
	* arbitrary id that is currently cached, unlike `writeQuery` which will
	* only write from the root query.
	*
	* You must pass in a GraphQL document with a single fragment or a document
	* with multiple fragments that represent what you are writing. If you pass
	* in a document with multiple fragments then you must also specify a
	* `fragmentName`.
	**/
	public function writeFragment<TData, TVariables>(options:WriteFragmentOptions<TData, TVariables>):Void;

	/**
	* Sugar for writeQuery & writeFragment
	*
	* This method will construct a query from the data object passed in.
	* If no id is supplied, writeData will write the data to the root.
	* If an id is supplied, writeData will write a fragment to the object
	* specified by the id in the store.
	*
	* Since you aren't passing in a query to check the shape of the data, you
	* must pass in an object that conforms to the shape of valid GraphQL data.
	**/
	public function writeData<TData>(options:WriteDataOptions<TData>):Void;

	public function __actionHookForDevTools(cb:Void->Any):Void;
	public function __requestRaw(payload:GraphQLRequest):Observable<ExecutionResult>;

	/**
	* This initializes the query manager that tracks queries and the cache.
	**/
	public function initQueryManager():Void;

	/**
	* Resets your entire store by clearing out your cache and then re-executing
	* all of your active queries. This makes it so that you may guarantee that
	* there is no data left in your store from a time before you called this
	* method.
	*
	* `resetStore()` is useful when your user just logged out. You’ve removed
	* the user session, and you now want to make sure that any references to
	* data you might have fetched while the user session was active is gone.
	*
	* It is important to remember that `resetStore()` *will* refetch any active
	* queries. This means that any components that might be mounted will
	* execute their queries again using your network interface. If you do not
	* want to re-execute any queries then you should make sure to stop watching
	* any active queries.
	**/
	public function resetStore():Promise<Null<ApolloQueryResult<Any>>>;

	/**
	* Allows callbacks to be registered that are executed with the store is
	* reset.
	* `onResetStore` returns an unsubscribe function for removing your
	* registered callbacks.
	**/
	public function onResetStore(cb:Void->Promise<Any>):Void->Void;

	/**
	* Refetches all of your active queries.
	*
	* `reFetchObservableQueries()` is useful if you want to bring the client
	* back to proper state in case of a network outage
	*
	* It is important to remember that `reFetchObservableQueries()` *will*
	* refetch any active queries. This means that any components that might be
	* mounted will execute their queries again using your network interface. If
	* you do not want to re-execute any queries then you should make sure to
	* stop watching any active queries.
	*
	* Takes optional parameter `includeStandby` which will include queries in
	* standby-mode when refetching.
	**/
	public function reFetchObservableQueries(?includeStandby:Bool):Promise<Null<ApolloQueryResult<Any>>>;

	/**
	* Exposes the cache's complete state, in a serializable format for later
	* restoration.
	*/
	public function extract(?optimistic:Bool):TCacheShape;

	/**
	* Replaces existing state in the cache (if any) with the values expressed
	* by `serializedState`.
	*
	* Called when hydrating a cache (server side rendering, or offline
	* storage), and also (potentially) during hot reloads.
	*/
	public function restore(serializedState:TCacheShape):ApolloCache<TCacheShape>;

	/**
	* Initializes a data proxy for this client instance if one does not already
	* exist and returns either a previously initialized proxy instance or the
	* newly initialized instance.
	*/
	private function initProxy():ApolloCache<TCacheShape>;
}

