import { ReactNode } from 'react'

const Error500 = () => {
  return <div>internal server errror</div>
}

Error500.getLayout = (page: ReactNode) => <>{page}</>

export default Error500
