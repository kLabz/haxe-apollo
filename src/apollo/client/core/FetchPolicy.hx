package apollo.client.core;

@:enum abstract FetchPolicy(String) to String {
	var CacheFirst = 'cache-first';
	var CacheAndNetwork = 'cache-and-network';
	var NetworkOnly = 'network-only';
	var CacheOnly = 'cache-only';
	var NoCache = 'no-cache';
	var Standby = 'standby';
}
