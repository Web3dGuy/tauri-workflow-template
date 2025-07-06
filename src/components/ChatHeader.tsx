import React from 'react';
import { 
  Button, 
  Icon, 
  Text, 
  Popover, 
  Menu, 
  MenuItem, 
  Tooltip,
  Position
} from '@blueprintjs/core';
import { Conversation, User } from '../types/chat';
import { UserAvatar } from './UserAvatar';
import './ChatHeader.scss';

interface ChatHeaderProps {
  conversation: Conversation;
  currentUser: User;
  onVideoCall?: () => void;
  onVoiceCall?: () => void;
  onSearch?: () => void;
  onViewProfile?: () => void;
  onMuteConversation?: () => void;
  onDeleteConversation?: () => void;
  onArchiveConversation?: () => void;
  onBlockUser?: () => void;
  className?: string;
}

export const ChatHeader: React.FC<ChatHeaderProps> = ({
  conversation,
  currentUser,
  onVideoCall,
  onVoiceCall,
  onSearch,
  onViewProfile,
  onMuteConversation,
  onDeleteConversation,
  onArchiveConversation,
  onBlockUser,
  className = ''
}) => {
  const isGroupChat = conversation.type === 'group' || conversation.type === 'channel';
  
  // For direct chats, get the other participant
  const otherParticipant = isGroupChat 
    ? null 
    : conversation.participants.find(p => p.id !== currentUser.id);

  const getConversationTitle = (): string => {
    if (isGroupChat) {
      return conversation.name || 'Group Chat';
    }
    return otherParticipant?.displayName || 'Unknown User';
  };

  const getConversationSubtitle = (): string => {
    if (isGroupChat) {
      const participantCount = conversation.participants.length;
      return `${participantCount} members`;
    }
    
    if (otherParticipant) {
      if (otherParticipant.isTyping) {
        return 'typing...';
      }
      
      if (otherParticipant.status.isOnline) {
        return otherParticipant.status.customMessage || 'Online';
      }
      
      if (otherParticipant.lastSeen) {
        const lastSeenTime = new Date(otherParticipant.lastSeen);
        const now = new Date();
        const diffInMinutes = Math.floor((now.getTime() - lastSeenTime.getTime()) / (1000 * 60));
        
        if (diffInMinutes < 1) {
          return 'Last seen just now';
        } else if (diffInMinutes < 60) {
          return `Last seen ${diffInMinutes}m ago`;
        } else if (diffInMinutes < 1440) {
          const hours = Math.floor(diffInMinutes / 60);
          return `Last seen ${hours}h ago`;
        } else {
          return `Last seen ${Math.floor(diffInMinutes / 1440)}d ago`;
        }
      }
      
      return 'Offline';
    }
    
    return '';
  };

  const renderMoreActions = () => (
    <Menu>
      <MenuItem icon="user" text="View Profile" onClick={onViewProfile} />
      <MenuItem 
        icon={conversation.isMuted ? "volume-up" : "volume-off"} 
        text={conversation.isMuted ? "Unmute" : "Mute"} 
        onClick={onMuteConversation} 
      />
      <MenuItem icon="archive" text="Archive Chat" onClick={onArchiveConversation} />
      {!isGroupChat && (
        <MenuItem icon="blocked-person" text="Block User" intent="danger" onClick={onBlockUser} />
      )}
      <MenuItem icon="trash" text="Delete Chat" intent="danger" onClick={onDeleteConversation} />
    </Menu>
  );

  return (
    <div className={`chat-header ${className}`}>
      <div className="chat-header__info" onClick={onViewProfile}>
        <div className="chat-header__avatar">
          {isGroupChat ? (
            <div className="chat-header__group-avatar">
              <Icon icon="people" size={24} />
            </div>
          ) : otherParticipant ? (
            <UserAvatar 
              user={otherParticipant} 
              size="medium" 
              showStatus={true}
              showStatusText={false}
            />
          ) : null}
        </div>
        
        <div className="chat-header__details">
          <div className="chat-header__title">
            {getConversationTitle()}
            {conversation.isPinned && (
              <Icon icon="pin" size={12} className="chat-header__pin-icon" />
            )}
          </div>
          <div className={`chat-header__subtitle ${
            otherParticipant?.isTyping ? 'chat-header__subtitle--typing' : ''
          }`}>
            {getConversationSubtitle()}
          </div>
        </div>
      </div>

      <div className="chat-header__actions">
        {!isGroupChat && (
          <>
            <Tooltip content="Video call" position={Position.BOTTOM}>
              <Button
                icon="video"
                minimal
                onClick={onVideoCall}
                className="chat-header__action-button"
              />
            </Tooltip>

            <Tooltip content="Voice call" position={Position.BOTTOM}>
              <Button
                icon="phone"
                minimal
                onClick={onVoiceCall}
                className="chat-header__action-button"
              />
            </Tooltip>
          </>
        )}

        <Tooltip content="Search in chat" position={Position.BOTTOM}>
          <Button
            icon="search"
            minimal
            onClick={onSearch}
            className="chat-header__action-button"
          />
        </Tooltip>

        <Popover
          content={renderMoreActions()}
          position={Position.BOTTOM_RIGHT}
          minimal
        >
          <Tooltip content="More options" position={Position.BOTTOM}>
            <Button
              icon="more"
              minimal
              className="chat-header__action-button"
            />
          </Tooltip>
        </Popover>
      </div>
    </div>
  );
}; 