---
to: <%= h.inflection.dasherize(path) %>/src/store/<%= Name %>Store.ts
---
import createCustomStore from '../libs/store/storesMiddleware';

interface <%= Name%>State {}

const use<%= Name%>Store = createCustomStore<<%= Name%>State>(set => ({
}));

export default use<%= Name%>Store;

