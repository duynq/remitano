import { ReactNode } from 'react'

const Error401 = () => {
  return <div>You are not authorized! 🔐</div>
}

Error401.getLayout = (page: ReactNode) => <>{page}</>

export default Error401
