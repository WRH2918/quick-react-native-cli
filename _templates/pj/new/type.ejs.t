---
to: <%= h.inflection.dasherize(name)%>/src/libs/types/po-types.d.ts
---
declare module '*.po' {
  import type {Messages} from '@lingui/core';
  export const messages: Messages;
}

