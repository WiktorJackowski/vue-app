const initialState = {
    user: null,
};

const actions = {
    async saveUserDetails({ commit }, user) {
        commit('SET_USER', user);
    },
}

const mutations = {
    SET_USER(state, user) {
        state.user = user;
    },
}

export default {
    namespaced: true,
    state: () => initialState,
    actions,
    mutations,
};