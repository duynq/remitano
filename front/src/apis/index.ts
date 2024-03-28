import axiosApi from '@/utils/axios'

import UserRegistrationApis from './user/registration'

let apiList = {
  user: {
    registration: new UserRegistrationApis(axiosApi)
  }
}

export const $api = { ...apiList }
