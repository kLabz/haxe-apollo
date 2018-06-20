package apollo.client.data;

import apollo.client.data.QueryStore;
import apollo.client.core.MutationQueryReducer;

typedef QueryWithUpdater = {
	var updater:MutationQueryReducer<{}>;
	var query:QueryStoreValue;
}
