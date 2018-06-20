package apollo.client.core;

@:enum abstract ErrorPolicy(String) to String {
	var None = 'none';
	var Ignore = 'ignore';
	var All = 'all';
}

