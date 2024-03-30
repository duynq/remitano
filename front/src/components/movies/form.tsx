import { useRouter } from 'next/router'
import React, { useEffect, useState } from 'react'
import { $api } from '@/apis'

const Form = () => {
  const router = useRouter()
  const [youtubeUrl, setYoutubeUrl] = useState('')

  return (
    <form>
      <h1>Share your favorite Youtube video</h1>
      <input
        type="text"
        placeholder="Youtube URL"
        value={youtubeUrl}
        className='form-control'
        onChange={(e) => setYoutubeUrl(e.target.value)}
      />
      <button onSubmit={() => {}}>Share</button>
    </form>
  )
}
