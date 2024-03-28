import { ReactNode } from 'react'

const Error404 = () => {
  return <div>Page not found</div>
}

Error404.getLayout = (page: ReactNode) => <>{page}</>

export default Error404
