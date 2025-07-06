import React from 'react';
import { Icon, IconName } from '@blueprintjs/core';

interface CustomButtonProps {
  children?: React.ReactNode;
  onClick?: (event: React.MouseEvent) => void;
  variant?: 'primary' | 'success' | 'warning' | 'danger' | 'minimal';
  size?: 'small' | 'normal' | 'large';
  icon?: IconName;
  disabled?: boolean;
  active?: boolean;
  className?: string;
  style?: React.CSSProperties;
}

export const CustomButton: React.FC<CustomButtonProps> = ({
  children,
  onClick,
  variant = 'primary',
  size = 'normal',
  icon,
  disabled = false,
  active = false,
  className = '',
  style = {}
}) => {
  const handleClick = (event: React.MouseEvent) => {
    if (!disabled && onClick) {
      onClick(event);
    }
  };

  const buttonClass = [
    'custom-button',
    `variant-${variant}`,
    `size-${size}`,
    active ? 'active' : '',
    disabled ? 'disabled' : '',
    className
  ].filter(Boolean).join(' ');

  const iconSize = size === 'small' ? 12 : size === 'large' ? 18 : 14;

  return (
    <button
      className={buttonClass}
      style={style}
      onClick={handleClick}
      disabled={disabled}
    >
      {icon && <Icon icon={icon} size={iconSize} />}
      {children}
    </button>
  );
};