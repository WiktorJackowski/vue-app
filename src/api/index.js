import axios from 'axios';

export async function getUsers() {
    const {data} = await axios.get(`/users`);
    return data;
}

export async function login(payload) {
    const {data} = await axios.post(`/users/login`, payload);
    return data;
}

export async function register(payload) {
    const {data} = await axios.post(`/users/register`, payload);
    return data;
}