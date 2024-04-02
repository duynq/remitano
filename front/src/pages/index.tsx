import { useState, useEffect } from 'react'
import Header from '@/components/layouts/header'
import useMovie from '@/hooks/movie/userMovie'
import BasePagination from '@/components/ui_parts/pagination/base_pagination'

export interface MovieParams {
  page?: number | string
}

const Home = () => {
  const [params, setParams] = useState<MovieParams>({})
  const { movies, meta } = useMovie({ params })

  const handlePageChange = (page: number) => {
    setParams({
      ...params,
      page
    })
  }

  return <>
    <Header title='Funny Movies' />
    <div className='mt-10 flex flex-col items-center justify-items-center pb-32'>
    {
      movies.map((movie) => (
        <div className='flex mb-5 w-2/3' key={movie.id}>
          <div className='mr-5'>
            <iframe
              width='auto'
              height='255'
              src={`https://www.youtube.com/embed/${movie.youtube_id}`}
            />
          </div>
          <div className=''>
            <p className='font-bold text-red-700 text-[18px]'>{movie.title}</p>
            <p className='text-[16px]'>Shared by: {movie.user.email}</p>
            <p className='text-[16px]'>Description:</p>
            <p className='italic font-bold text-[12px]'>{movie.description}</p>
          </div>
        </div>
      ))
    }
    {meta && (
            <BasePagination
              className="!mt-[50px]"
              totalCount={meta.total_count}
              per={meta.per}
              currentPage={meta.page}
              onChange={(page) => handlePageChange(page)}
            />
          )}
    </div>
  </>
}

export default Home
