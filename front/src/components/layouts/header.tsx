import { useRouter } from 'next/router'
import React, { useState } from 'react'
import { $api } from '@/apis'
import { userRequestEmptyValue } from '@/constants/user'
import { AccountUserRequest } from '@/types/user'

interface HeaderProps {
  title: string
}

const Header = ({ title }: HeaderProps) => {
  const router = useRouter()
  const [userRequest, setUserRequest] = useState<AccountUserRequest>(
    userRequestEmptyValue
  )

  const handleSetUserRequest = <T extends keyof AccountUserRequest>(
    key: T,
    value: AccountUserRequest[T],
  ) => {
    setUserRequest({
      ...userRequest,
      [key]: value,
    })
  }

  const register = async (data: AccountUserRequest) => {

    try {
      const res = await $api.user.registration.register(data)
      if (res.success) {
        router.push('/')
      }
    } catch (error) {
      console.log('error', error)
    }
  }

  const handleSignUp = () => {
    userRequest && register(userRequest)
  }

  console.log(userRequest)

  return (
    <div className="flex justify-between">
      <h1>{title}</h1>
      
      <div className="flex justify-between">
        <div>
          <input
            type="email"
            placeholder="Email"
            value={userRequest?.email}
            className='form-control'
            onChange={(e) => handleSetUserRequest('email', e.target.value)}
          />
          <input
            type="password"
            placeholder="Password"
            value={userRequest?.password}
            onChange={(e) => handleSetUserRequest('password', e.target.value)}
          />
          <button onClick={() => {} } >Login</button>
          <button className='ml-3' onClick={ handleSignUp }>Register</button>
        </div>
      </div>
    </div>
  );
}

export default Header;
