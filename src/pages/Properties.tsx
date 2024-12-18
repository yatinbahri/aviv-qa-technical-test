import { PropertySearch } from '../components/search/PropertySearch';
import { PropertyGrid } from '../components/property/PropertyGrid';
import { mockProperties } from '../lib/mockData';

export const Properties = () => {
  return (
    <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
      <h1 className="text-3xl font-bold text-gray-900 mb-8">All Properties</h1>
      
      <PropertySearch />

      <div className="mt-8">
        <div className="flex justify-between items-center mb-6">
          <h2 className="text-xl font-semibold">Available Properties</h2>
          <span className="text-gray-600">{mockProperties.length} properties found</span>
        </div>
        <PropertyGrid properties={mockProperties} />
      </div>
    </div>
  );
}