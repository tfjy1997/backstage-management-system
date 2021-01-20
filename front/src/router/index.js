import { createRouter, createWebHistory } from 'vue-router'

const Login = () => import('@/views/login/Login.vue')
const Home = () => import('@/views/home/Home.vue')
const Register = () => import('@/views/home/Register.vue')

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/login',
    name: 'Login',
    component: Login,
  },
  {
    path: '/register',
    name: 'Register',
    component: Register
  },
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
