package apollo.link;

typedef RequestHandler = Operation->?NextLink->Null<Observable<FetchResult>>;

