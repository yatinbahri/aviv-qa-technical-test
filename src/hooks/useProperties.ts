import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { propertyApi } from '../services/api';
import { Property } from '../types';
import { mockProperties } from '../lib/mockData';

interface UsePropertiesOptions {
  type?: Property['type'];
  status?: Property['status'];
  minPrice?: number;
  maxPrice?: number;
}

export const useProperties = (options?: UsePropertiesOptions) => {
  return useQuery({
    queryKey: ['properties', options],
    queryFn: () => mockProperties,
  });
};

export const useAddProperty = () => {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: async (propertyData: Partial<Property>) => {
      // In a real app, this would be an API call
      const newProperty = {
        id: `p${Date.now()}`,
        ...propertyData,
        createdAt: new Date().toISOString(),
        updatedAt: new Date().toISOString(),
      } as Property;

      // Update the mock data
      mockProperties.unshift(newProperty);
      return newProperty;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['properties'] });
    },
  });
};

export const useProperty = (id: string) => {
  return useQuery({
    queryKey: ['property', id],
    queryFn: () => mockProperties.find(p => p.id === id),
    enabled: !!id,
  });
};