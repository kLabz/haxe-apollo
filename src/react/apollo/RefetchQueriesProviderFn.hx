package react.apollo;

import haxe.extern.EitherType;
import haxe.extern.Rest;

import apollo.client.core.PureQueryOptions;

typedef RefetchQueriesProviderFn = Rest<Any>->EitherType<Array<String>, Array<PureQueryOptions>>;

