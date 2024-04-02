import { ReactNode } from 'react'
import DefaultLayout from '@/components/layouts/default_layout'

const Error401 = () => {
  return <div>You are not authorized! 🔐</div>
}

Error401.getLayout = (page: ReactNode) => <><DefaultLayout>{page}</DefaultLayout></>

export default Error401
