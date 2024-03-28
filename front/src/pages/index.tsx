import Header from '@/components/layouts/header'
import { userInfo } from '@/store'
import { useRecoilValue } from 'recoil'

const Home = () => {
  const user = useRecoilValue(userInfo)
  return <>
    <div className='container mx-auto mt-6'>
      <Header title="Home" />
    </div>
  </>
}

export default Home
