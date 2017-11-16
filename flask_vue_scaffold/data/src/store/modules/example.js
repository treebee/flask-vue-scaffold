import axios from 'axios';

const GET = 'GET';

const state = {
  number: null,
};

const mutations = {
  [GET](state) {
    axios.get('/api')
    .then((response) => {
      state.number = response.data.result;
    })
    .catch(error => error);
  },
};

const actions = {
  get({ commit }) {
    commit(GET);
  },
};

const getters = {
  number: state => state.number,
};

export default {
  state,
  actions,
  getters,
  mutations,
};
