import React, { useState } from 'react';
import { useForm } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';
import { useNavigate } from 'react-router-dom';
import { registerSchema } from '../../utils/validation';
import { Input } from '../ui/Input';
import { Select } from '../ui/Select';
import { Button } from '../ui/Button';
import { useAuth } from '../../hooks/useAuth';

type RegisterFormData = {
  name: string;
  email: string;
  password: string;
  confirmPassword: string;
  phone: string;
  role: 'user' | 'agent';
};

export const RegisterForm = () => {
  const navigate = useNavigate();
  const { login } = useAuth();
  const [error, setError] = useState<string | null>(null);
  
  const { register, handleSubmit, formState: { errors, isSubmitting } } = useForm<RegisterFormData>({
    resolver: zodResolver(registerSchema),
    defaultValues: {
      role: 'user'
    }
  });

  const onSubmit = async (data: RegisterFormData) => {
    try {
      // Simulate API call
      await new Promise(resolve => setTimeout(resolve, 1000));
      
      // Create new user object
      const newUser = {
        id: `u${Date.now()}`,
        email: data.email,
        name: data.name,
        role: data.role,
        phone: data.phone,
        avatar: `https://ui-avatars.com/api/?name=${encodeURIComponent(data.name)}&background=random`
      };

      login(newUser);
      navigate('/dashboard');
    } catch (error) {
      setError('Registration failed. Please try again.');
    }
  };

  return (
    <form onSubmit={handleSubmit(onSubmit)} className="space-y-6">
      {error && (
        <div className="p-3 bg-red-50 text-red-700 rounded-md text-sm">
          {error}
        </div>
      )}

      <Input
        label="Full Name"
        error={errors.name?.message}
        {...register('name')}
      />

      <Input
        label="Email address"
        type="email"
        error={errors.email?.message}
        {...register('email')}
      />

      <Input
        label="Phone Number"
        type="tel"
        error={errors.phone?.message}
        {...register('phone')}
      />

      <Select
        label="Account Type"
        options={[
          { value: 'user', label: 'Home Buyer/Seller' },
          { value: 'agent', label: 'Real Estate Agent' }
        ]}
        error={errors.role?.message}
        {...register('role')}
      />

      <Input
        label="Password"
        type="password"
        error={errors.password?.message}
        {...register('password')}
      />

      <Input
        label="Confirm Password"
        type="password"
        error={errors.confirmPassword?.message}
        {...register('confirmPassword')}
      />

      <Button
        type="submit"
        className="w-full"
        isLoading={isSubmitting}
      >
        Create Account
      </Button>

      <p className="text-sm text-gray-500 text-center mt-4">
        Already have an account?{' '}
        <a href="/login" className="text-blue-600 hover:text-blue-700">
          Sign in
        </a>
      </p>
    </form>
  );
};