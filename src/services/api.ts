import axios from 'axios';
import { Property, User } from '../types';

const api = axios.create({
  baseURL: '/api',
  headers: {
    'Content-Type': 'application/json',
  },
});

// Auth interceptor
api.interceptors.request.use((config) => {
  const token = localStorage.getItem('token');
  if (token) {
    config.headers.Authorization = `Bearer ${token}`;
  }
  return config;
});

export const authApi = {
  login: async (email: string, password: string) => {
    const response = await api.post<{ user: User; token: string }>('/auth/login', {
      email,
      password,
    });
    return response.data;
  },
  register: async (userData: Partial<User> & { password: string }) => {
    const response = await api.post<{ user: User; token: string }>('/auth/register', userData);
    return response.data;
  },
};

export const propertyApi = {
  getProperties: async (params?: Record<string, string>) => {
    const response = await api.get<Property[]>('/properties', { params });
    return response.data;
  },
  getProperty: async (id: string) => {
    const response = await api.get<Property>(`/properties/${id}`);
    return response.data;
  },
  createProperty: async (data: Partial<Property>) => {
    const response = await api.post<Property>('/properties', data);
    return response.data;
  },
  updateProperty: async (id: string, data: Partial<Property>) => {
    const response = await api.put<Property>(`/properties/${id}`, data);
    return response.data;
  },
  deleteProperty: async (id: string) => {
    await api.delete(`/properties/${id}`);
  },
};