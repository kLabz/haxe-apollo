package apollo.client.core;

@:enum abstract FetchType(Int) to Int {
	var Normal = 1;
	var Refetch = 2;
	var Poll = 3;
}

