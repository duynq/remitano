import { render, act } from '@testing-library/react'
import { RecoilRoot } from 'recoil'
import Header from '@/components/layouts/header'
import { userInfo } from '@/store'

jest.mock('next/router', () => ({
  useRouter() {
    return {
      push: jest.fn(),
    }
  },
}))

jest.mock('@/store', () => ({
  userInfo: { key: 'userInfo', default: { email: 'test@example.com' } },
}))

describe('Header', () => {
  it('renders correctly', () => {
    const { getByText } = render(
      <RecoilRoot>
        <Header title="Test Title" />
      </RecoilRoot>
    )

    expect(getByText('Test Title')).toBeInTheDocument()
  })

  it('sets email state correctly when userInfo changes', async () => {
    const { getByText } = render(
      <RecoilRoot initializeState={(snap) => snap.set(userInfo, { email: 'new@example.com' })}>
        <Header title="Test Title" />
      </RecoilRoot>
    )

    await act(async () => {})

    expect(getByText('new@example.com')).toBeInTheDocument()
  })
})
