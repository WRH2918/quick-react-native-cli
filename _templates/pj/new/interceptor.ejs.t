---
to: <%= h.inflection.dasherize(name)%>/src/libs/http/interceptors.ts
---
import {AxiosInstance, AxiosResponse, InternalAxiosRequestConfig} from 'axios';

type ConstomInterceptorsType = {
  request: (
    config: InternalAxiosRequestConfig<any>,
  ) => InternalAxiosRequestConfig<any>;
  response: (config: AxiosResponse<any, any>) => AxiosResponse<any, any>;
};

// 添加拦截器
const addInterceptor = (
  http: AxiosInstance,
  interceptors: ConstomInterceptorsType,
) => {
  http.interceptors.request.use(interceptors.request);
  http.interceptors.response.use(interceptors.response);
};

// 测试拦截器
const testInterceptor = {
  request: (config: InternalAxiosRequestConfig<any>) => {
    console.log('testInterceptor request');
    return config;
  },
  response: (config: AxiosResponse<any, any>) => {
    console.log('testInterceptor response');
    return config;
  },
};

export {addInterceptor, testInterceptor};



