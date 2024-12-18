import { create } from 'zustand';
import { Agent } from '../types';
import { mockAgents } from '../lib/mockData';

interface AgentSearchState {
  searchTerm: string;
  specialization: string;
  location: string;
  filteredAgents: Agent[];
  setSearchTerm: (term: string) => void;
  setSpecialization: (specialization: string) => void;
  setLocation: (location: string) => void;
  searchAgents: () => void;
  resetFilters: () => void;
}

export const useAgentSearch = create<AgentSearchState>((set, get) => ({
  searchTerm: '',
  specialization: '',
  location: '',
  filteredAgents: mockAgents,
  setSearchTerm: (searchTerm) => set({ searchTerm }),
  setSpecialization: (specialization) => set({ specialization }),
  setLocation: (location) => set({ location }),
  searchAgents: () => {
    const { searchTerm, specialization, location } = get();
    
    const filtered = mockAgents.filter(agent => {
      const matchesSearch = !searchTerm || 
        agent.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
        agent.bio.toLowerCase().includes(searchTerm.toLowerCase());

      const matchesSpecialization = !specialization ||
        agent.specialization.toLowerCase().includes(specialization.toLowerCase());

      const matchesLocation = !location ||
        agent.location.toLowerCase().includes(location.toLowerCase());

      return matchesSearch && matchesSpecialization && matchesLocation;
    });

    set({ filteredAgents: filtered });
  },
  resetFilters: () => {
    set({
      searchTerm: '',
      specialization: '',
      location: '',
      filteredAgents: mockAgents,
    });
  },
}));