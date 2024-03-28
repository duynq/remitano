export interface User {
  id: number
  email: string
  name: string
  createdAt: string
}

export type AccountLoginResponse = {
  data: User
  message: string
  success: boolean
}

export type AccountUserRequest = Partial<
  Pick<
    User,
    | 'email'
  > & {
    password?: string
  }
>
