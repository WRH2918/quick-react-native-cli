---
to: <%= h.inflection.dasherize(name)%>/src/libs/store/storesMiddleware.tsx
---
import {create, StateCreator} from 'zustand';
import {devtools} from 'zustand/middleware';

const createCustomStore = <T,>(createState: StateCreator<T, [], []>) =>
  create(devtools(createState));

export default createCustomStore;