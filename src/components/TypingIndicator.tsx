import React from 'react';
import { User } from '../types/chat';
import { UserAvatar } from './UserAvatar';
import './TypingIndicator.scss';

interface TypingIndicatorProps {
  users: User[];
  className?: string;
}

export const TypingIndicator: React.FC<TypingIndicatorProps> = ({
  users,
  className = ''
}) => {
  if (users.length === 0) return null;

  const getTypingText = (): string => {
    if (users.length === 1) {
      return `${users[0].displayName} is typing...`;
    } else if (users.length === 2) {
      return `${users[0].displayName} and ${users[1].displayName} are typing...`;
    } else {
      return `${users[0].displayName} and ${users.length - 1} others are typing...`;
    }
  };

  return (
    <div className={`typing-indicator ${className}`}>
      <div className="typing-indicator__avatar">
        <UserAvatar user={users[0]} size="small" showStatus={false} />
      </div>
      
      <div className="typing-indicator__bubble">
        <div className="typing-indicator__dots">
          <div className="typing-indicator__dot" />
          <div className="typing-indicator__dot" />
          <div className="typing-indicator__dot" />
        </div>
      </div>
      
      <div className="typing-indicator__text">
        {getTypingText()}
      </div>
    </div>
  );
}; 