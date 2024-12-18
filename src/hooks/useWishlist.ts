import { create } from 'zustand';
import { persist } from 'zustand/middleware';
import { Property } from '../types';

interface WishlistState {
  wishlist: Property[];
  addToWishlist: (property: Property) => void;
  removeFromWishlist: (propertyId: string) => void;
  isInWishlist: (propertyId: string) => boolean;
}

export const useWishlist = create<WishlistState>()(
  persist(
    (set, get) => ({
      wishlist: [],
      addToWishlist: (property) => {
        const { wishlist } = get();
        if (!wishlist.find(p => p.id === property.id)) {
          set({ wishlist: [...wishlist, property] });
        }
      },
      removeFromWishlist: (propertyId) => {
        const { wishlist } = get();
        set({ wishlist: wishlist.filter(p => p.id !== propertyId) });
      },
      isInWishlist: (propertyId) => {
        const { wishlist } = get();
        return wishlist.some(p => p.id === propertyId);
      },
    }),
    {
      name: 'wishlist-storage',
    }
  )
);