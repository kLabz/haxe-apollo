package apollo.link.error;

import haxe.extern.EitherType;

import apollo.link.FetchResult;
import apollo.link.Observable;

typedef ErrorHandler = EitherType<ErrorResponse -> Observable<FetchResult>, ErrorResponse -> Void>;

