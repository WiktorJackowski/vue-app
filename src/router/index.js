import Vue from 'vue';
import Router from 'vue-router';
import EmptyLayout from '../layouts/Empty.vue';

Vue.use(Router);

export default new Router({
  mode: 'history',
  scrollBehavior: (to, from, savedPosition) => {
    if (savedPosition) {
      return savedPosition;
    }
    return { x: 0, y: 0 };
  },
  routes: [
    {
      path: '',
      component: EmptyLayout,
      meta: {auth: false},
      children: [
        {
          path: '/register',
          name: 'register',
          meta: {auth: false},
          component: () =>
              import(/* webpackChunkName: "register" */ '@/pages/user/Register'),
        },
        {
          path: '/login',
          name: 'login',
          meta: {auth: false},
          component: () =>
              import(/* webpackChunkName: "login" */ '@/pages/user/Login'),
        },
        {
          path: '/dashboard',
          name: 'dashboard',
          meta: {auth: false},
          component: () =>
              import(/* webpackChunkName: "login" */ '@/pages/dashboard/Index'),
        },
      ],
    }
    ]
});
