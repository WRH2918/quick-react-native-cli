---
to: <%= h.inflection.dasherize(name)%>/src/routers/index.tsx
---
import {createNativeStackNavigator} from '@react-navigation/native-stack';
import {RootNavigatorParamList} from './NavigatorParamList';

const Stack = createNativeStackNavigator<RootNavigatorParamList>();
const StackRouteConfig = () => {
  return (
    <Stack.Navigator>
    #   <Stack.Screen name={'Login'} component={LoginPage} />
    </Stack.Navigator>
  );
};

export default StackRouteConfig;