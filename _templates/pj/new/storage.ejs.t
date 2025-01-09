---
to: <%= h.inflection.dasherize(name)%>/src/libs/storage/index.ts
---
import {MMKV, Mode} from 'react-native-mmkv';

export const storage = new MMKV({
  id: 'user',
  encryptionKey: 'dddd',
  mode: Mode.MULTI_PROCESS,
  readOnly: true,
});

