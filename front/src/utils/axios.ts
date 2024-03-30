import {
  USER_AUTH_KEY,
  UNAUTHORIZED_STATUS_CODE,
  INTERNAL_SERVER_ERROR_CODE
} from '@/constants/index'

import axios, {
  AxiosError,
  AxiosInstance /*, AxiosRequestConfig, AxiosResponse*/,
} from 'axios'

const axiosApi = axios.create({
  baseURL: process.env.NEXT_PUBLIC_API_URL,
})

function getAuthentication() {
  return JSON.parse(localStorage.getItem(USER_AUTH_KEY) || '{}')
}

function setDefaultProperties(axiosInstace: AxiosInstance) {
  axiosInstace.defaults.timeout = 30000

  axiosInstace.interceptors.request.use(
    (config) => {
      try {
        const auth: any = getAuthentication()

        if (auth && config.headers) {
          config.headers['Authorization'] = `Bearer ${auth['token']}`
        }
      } catch (error) {}

      return config
    },
    undefined,
    { synchronous: true },
  )

  axiosInstace.interceptors.response.use(
    (response: any) => response,
    (error: AxiosError) => {
      console.log('error.response', error)

      const status = (error.response && error.response!.status) || 0
      if (status === UNAUTHORIZED_STATUS_CODE) {
        localStorage.removeItem(USER_AUTH_KEY)
        location.href = '/'
      } else if (status >= INTERNAL_SERVER_ERROR_CODE) {
        location.href = '/500'
      }

      return Promise.reject(error)
    },
  )
}

setDefaultProperties(axiosApi)

export { axiosApi }
export default axiosApi
