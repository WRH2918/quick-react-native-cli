---
prompt:
  - type: input
    name: name
    message: What is the component name?
---
output:
  - to: <%= h.inflection.dasherize(name)%>/src/routers/NavigatorParamList.ts
    template: routers/new/hello.ejs.t