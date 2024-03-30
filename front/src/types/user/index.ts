export interface User {
  id: number
  email: string
  name: string
  createdAt: string
}

export type AccountLoginResponse = {
  token: string
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
