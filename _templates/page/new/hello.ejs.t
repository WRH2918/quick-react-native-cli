---
to: <%= h.inflection.dasherize(path) %>/src/pages/<%= h.inflection.dasherize(name) %>/index.tsx
---
import {ScreenNavigationProp} from '../../routers/NavigatorParamList';
import {useNavigation} from '@react-navigation/native';
import {StyleSheet, View} from 'react-native';

const <%= Name%>Page = () => {
  const navigation = useNavigation<ScreenNavigationProp<'<%= Name%>'>>();
  return <View style={styles.container}></View>;
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
});

export default <%= Name%>Page;
