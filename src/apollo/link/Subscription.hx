package apollo.link;

import haxe.extern.EitherType;

typedef SubscriptionObserver<T> = {
	var closed:Bool;
	var next:T->Void;
	var error:Any->Void;
	var complete:Void->Void;
}

interface Subscription {
	var closed:Bool;
	function unsubscribe():Void;
}

typedef Subscriber<T> = EitherType<SubscriptionObserver<T>->Void, EitherType<Void->Void, Subscription>>;

