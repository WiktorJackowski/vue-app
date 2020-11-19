import axios from 'axios';

export async function getUsers() {
    const {data} = await axios.get(`/users`);
    return data;
}