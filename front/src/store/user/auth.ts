import { atom } from 'recoil'
import { USER_AUTH_KEY } from '@/constants'
import { User } from '@/types/user'

const localStorage = typeof window !== `undefined` ? window.localStorage : null

const userAuthData = localStorage?.getItem(USER_AUTH_KEY)
  ? JSON.parse(localStorage.getItem(USER_AUTH_KEY) as string)
  : null

const userAuth = atom({
  key: USER_AUTH_KEY,
  default: userAuthData,
})

const userInfo = atom<User | null>({
  key: 'userAuth',
  default: null,
})

export { userAuth, userInfo }
