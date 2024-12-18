import { create } from 'zustand';
import { mockUsers, mockAgents, mockProperties } from '../lib/mockData';
import { User, Agent, Property } from '../types';

interface AdminState {
  users: User[];
  agents: Agent[];
  properties: Property[];
  deleteUser: (id: string) => void;
  deleteAgent: (id: string) => void;
  deleteProperty: (id: string) => void;
  updateUser: (id: string, data: Partial<User>) => void;
  updateAgent: (id: string, data: Partial<Agent>) => void;
  updateProperty: (id: string, data: Partial<Property>) => void;
}

export const useAdmin = create<AdminState>((set) => ({
  users: mockUsers,
  agents: mockAgents,
  properties: mockProperties,
  
  deleteUser: (id) => set((state) => ({
    users: state.users.filter(user => user.id !== id)
  })),
  
  deleteAgent: (id) => set((state) => ({
    agents: state.agents.filter(agent => agent.id !== id)
  })),
  
  deleteProperty: (id) => set((state) => ({
    properties: state.properties.filter(property => property.id !== id)
  })),
  
  updateUser: (id, data) => set((state) => ({
    users: state.users.map(user => 
      user.id === id ? { ...user, ...data } : user
    )
  })),
  
  updateAgent: (id, data) => set((state) => ({
    agents: state.agents.map(agent => 
      agent.id === id ? { ...agent, ...data } : agent
    )
  })),
  
  updateProperty: (id, data) => set((state) => ({
    properties: state.properties.map(property => 
      property.id === id ? { ...property, ...data } : property
    )
  })),
}));