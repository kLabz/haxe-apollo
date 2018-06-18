package apollo.client.core;

@:enum abstract NetworkStatus(Int) to Int {
	var Loading = 1;
	var SetVariables = 2;
	var FetchMore = 3;
	var Refetch = 4;
	var Poll = 6;
	var Ready = 7;
	var Error = 8;
}

