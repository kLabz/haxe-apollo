package apollo.cache.inmemory;

typedef IdGetter = Any->Null<String>;
typedef IdValue = Dynamic; // TODO
typedef NormalizedCache = Dynamic; // TODO
typedef CacheResolverMap = Dynamic; // TODO

@:coreType @:enum abstract HeuristicBool from Bool {
	var Heuristic = untyped 'heuristic';
}

typedef FragmentMatcherInterface = {
	var match:IdValue->String->ReadStoreContext->HeuristicBool;
}

typedef ReadStoreContext = {
	final store:NormalizedCache;
	final cacheRedirects:CacheResolverMap;
	@:optional final dataIdFromObject:IdGetter;
}

typedef ApolloReducerConfig = {
	@:optional var dataIdFromObject:IdGetter;
	@:optional var fragmentMatcher:FragmentMatcherInterface;
	@:optional var addTypename:Bool;
	@:optional var cacheRedirects:CacheResolverMap;
}

// TODO: proper extern
typedef InMemoryCacheConfig = {
	> ApolloReducerConfig,

	@:optional var resultCaching:Bool;
	@:optional var freezeResults:Bool;
}

// TODO: proper extern
@:jsRequire('apollo-cache-inmemory', 'InMemoryCache')
extern class InMemoryCache extends ApolloCache<Any> {
	public function new(?config:InMemoryCacheConfig);
}
