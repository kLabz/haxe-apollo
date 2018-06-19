package apollo.link.http;

import haxe.extern.EitherType;

import apollo.link.Operation;

typedef UriFunction = Operation -> String;

typedef HttpOptions = {
	@:optional var uri:EitherType<String, UriFunction>;
	@:optional var includeExtensions:Bool;
	// @:optional var fetch:GlobalFetch['fetch']; // TODO: ???
	@:optional var headers:Any;
	@:optional var credentials:String;
	@:optional var fetchOptions:Any;
}

