---
to: <%= h.inflection.dasherize(name)%>/src/routers/NavigatorParamList.ts
---
import {NativeStackNavigationProp} from '@react-navigation/native-stack';

export type TabNavigatorParamList = {
};

export type RootNavigatorParamList = {
} & TabNavigatorParamList;

export type ScreenNavigationProp<T extends keyof RootNavigatorParamList> =
  NativeStackNavigationProp<RootNavigatorParamList, T>;



