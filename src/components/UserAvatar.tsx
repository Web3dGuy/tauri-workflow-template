import React from 'react';
import { User, UserStatus } from '../types/chat';
import './UserAvatar.scss';

interface UserAvatarProps {
  user: User;
  size?: 'small' | 'medium' | 'large' | 'xlarge';
  showStatus?: boolean;
  showStatusText?: boolean;
  className?: string;
  onClick?: () => void;
}

export const UserAvatar: React.FC<UserAvatarProps> = ({
  user,
  size = 'medium',
  showStatus = true,
  showStatusText = false,
  className = '',
  onClick
}) => {
  const getInitials = (displayName: string): string => {
    return displayName
      .split(' ')
      .map(name => name.charAt(0))
      .join('')
      .toUpperCase()
      .slice(0, 2);
  };

  const getStatusColor = (status: UserStatus): string => {
    if (!status.isOnline) return 'offline';
    
    switch (status.status) {
      case 'online': return 'online';
      case 'away': return 'away';
      case 'busy': return 'busy';
      case 'invisible': return 'offline';
      default: return 'offline';
    }
  };

  const getStatusText = (status: UserStatus): string => {
    if (!status.isOnline) return 'Offline';
    
    switch (status.status) {
      case 'online': return 'Online';
      case 'away': return 'Away';
      case 'busy': return 'Busy';
      case 'invisible': return 'Offline';
      default: return 'Offline';
    }
  };

  const avatarClasses = [
    'user-avatar',
    `user-avatar--${size}`,
    onClick ? 'user-avatar--clickable' : '',
    className
  ].filter(Boolean).join(' ');

  const statusColor = getStatusColor(user.status);
  const statusText = getStatusText(user.status);

  return (
    <div className={avatarClasses} onClick={onClick}>
      <div className="user-avatar__image-container">
        {user.avatar ? (
          <img 
            src={user.avatar} 
            alt={user.displayName}
            className="user-avatar__image"
          />
        ) : (
          <div className="user-avatar__initials">
            {getInitials(user.displayName)}
          </div>
        )}
        
        {showStatus && (
          <div className={`user-avatar__status user-avatar__status--${statusColor}`}>
            <div className="user-avatar__status-dot" />
          </div>
        )}
      </div>
      
      {showStatusText && (
        <div className="user-avatar__status-text">
          <div className="user-avatar__name">{user.displayName}</div>
          <div className={`user-avatar__status-label user-avatar__status-label--${statusColor}`}>
            {user.status.customMessage || statusText}
          </div>
        </div>
      )}
    </div>
  );
}; 