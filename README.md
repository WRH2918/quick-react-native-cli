<!-- hygen 新建action -->

npx hygen generator new store

<!-- 生成模版 -->

npx hygen store new


react-navigation 路由
zustand 状态管理
lingui 多语言
<!-- alova 接口请求 根据 swagger 自动生成 typescript response  react-native 不能使用抛弃-->
react-native-reanimated 动画库
swagger-typescript-api 根据 swagger 自动生成 typescript response
react-native-mmkv 加密储存库

<!-- 生成多语言 -->
npx lingui extract 
<!-- 生成api -->
npx swagger-typescript-api -p https://petstore3.swagger.io/api/v3/openapi.json -o ./src -n myApi.ts