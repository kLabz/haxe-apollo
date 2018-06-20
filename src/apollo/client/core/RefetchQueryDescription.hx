package apollo.client.core;

import haxe.extern.EitherType;

typedef RefetchQueryDescription = Array<EitherType<String, PureQueryOptions>>;
