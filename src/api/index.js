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

export async function openChat(payload){
    const {data} = await axios.post('/chats/open-chat', payload);
    return data;
}

export async function postMessage(payload){
    const {data} = await axios.post('/message/post-message', payload)
    return data;
}