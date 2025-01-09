---
to: <%= h.inflection.dasherize(name)%>/src/App.tsx
---
import {NavigationContainer} from '@react-navigation/native';
import React from 'react';
import StackRouteConfig from './routers';
import {I18nProvider} from '@lingui/react';
import {i18n} from '@lingui/core';
import {RootSiblingParent} from 'react-native-root-siblings';
const App = () => {
  return (
    <I18nProvider i18n={i18n}>
      <RootSiblingParent>
        <NavigationContainer>
          <StackRouteConfig />
        </NavigationContainer>
      </RootSiblingParent>
    </I18nProvider>
  );
};

export default App;



