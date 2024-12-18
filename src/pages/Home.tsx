import { PropertySearch } from '../components/search/PropertySearch';
import { PropertyGrid } from '../components/property/PropertyGrid';
import { FeaturedProperties } from '../components/property/FeaturedProperties';
import { mockProperties } from '../lib/mockData';

export const Home = () => {
  return (
    <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
      {/* Hero Section */}
      <div className="text-center mb-12">
        <h1 className="text-4xl font-bold text-gray-900 mb-4">
          Find Your Dream Property
        </h1>
        <p className="text-xl text-gray-600">
          Discover the perfect home from our extensive collection of properties
        </p>
      </div>

      <PropertySearch />
      
      {/* Featured Properties */}
      <div className="my-12">
        <h2 className="text-2xl font-bold text-gray-900 mb-6">Featured Properties</h2>
        <FeaturedProperties properties={mockProperties.slice(0, 3)} />
      </div>

      {/* Main Content */}
      <div className="mt-8">
        <div className="flex justify-between items-center mb-6">
          <h2 className="text-xl font-semibold">All Properties</h2>
          <span className="text-gray-600">{mockProperties.length} properties found</span>
        </div>
        <PropertyGrid properties={mockProperties} />
      </div>
    </div>
  );
}