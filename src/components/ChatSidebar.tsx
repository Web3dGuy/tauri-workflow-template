import React, { useState, useMemo } from 'react';
import { 
  InputGroup, 
  Button, 
  Icon, 
  Menu, 
  MenuItem, 
  Popover, 
  Position,
  Tooltip,
  Text,
  Divider
} from '@blueprintjs/core';
import { Conversation, User } from '../types/chat';
import { UserAvatar } from './UserAvatar';
import { ScrollableContent } from './ScrollableContent';
import './ChatSidebar.scss';

interface ChatSidebarProps {
  conversations: Conversation[];
  currentUser: User;
  activeConversationId?: string;
  searchQuery: string;
  onSearchChange: (query: string) => void;
  onConversationSelect: (conversationId: string) => void;
  onNewChat?: () => void;
  onNewGroup?: () => void;
  onUserStatusChange?: (status: User['status']) => void;
  onSettingsOpen?: () => void;
  onSignOut?: () => void;
  className?: string;
}

interface ConversationItemProps {
  conversation: Conversation;
  currentUser: User;
  isActive: boolean;
  onClick: () => void;
}

const ConversationItem: React.FC<ConversationItemProps> = ({
  conversation,
  currentUser,
  isActive,
  onClick
}) => {
  const isGroupChat = conversation.type === 'group' || conversation.type === 'channel';
  const otherParticipant = isGroupChat 
    ? null 
    : conversation.participants.find(p => p.id !== currentUser.id);

  const getConversationName = (): string => {
    if (isGroupChat) {
      return conversation.name || 'Group Chat';
    }
    return otherParticipant?.displayName || 'Unknown User';
  };

  const getLastMessagePreview = (): string => {
    if (!conversation.lastMessage) return 'No messages yet';
    
    const { content, senderId, type } = conversation.lastMessage;
    const sender = conversation.participants.find(p => p.id === senderId);
    const senderName = senderId === currentUser.id ? 'You' : sender?.displayName || 'Unknown';
    
    if (type === 'image') return `${senderName}: 📷 Photo`;
    if (type === 'file') return `${senderName}: 📁 File`;
    if (type === 'audio') return `${senderName}: 🎵 Audio`;
    if (type === 'video') return `${senderName}: 🎥 Video`;
    
    const preview = content.length > 50 ? content.substring(0, 50) + '...' : content;
    return isGroupChat ? `${senderName}: ${preview}` : preview;
  };

  const getLastMessageTime = (): string => {
    if (!conversation.lastMessage) return '';
    
    const now = new Date();
    const messageTime = new Date(conversation.lastMessage.timestamp);
    const diffInMinutes = Math.floor((now.getTime() - messageTime.getTime()) / (1000 * 60));
    
    if (diffInMinutes < 1) return 'now';
    if (diffInMinutes < 60) return `${diffInMinutes}m`;
    if (diffInMinutes < 1440) return `${Math.floor(diffInMinutes / 60)}h`;
    if (diffInMinutes < 10080) return `${Math.floor(diffInMinutes / 1440)}d`;
    
    return messageTime.toLocaleDateString();
  };

  return (
    <div 
      className={`conversation-item ${isActive ? 'conversation-item--active' : ''}`}
      onClick={onClick}
    >
      <div className="conversation-item__avatar">
        {isGroupChat ? (
          <div className="conversation-item__group-avatar">
            <Icon icon="people" size={20} />
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

      <div className="conversation-item__content">
        <div className="conversation-item__header">
          <div className="conversation-item__name">
            {getConversationName()}
            {conversation.isPinned && (
              <Icon icon="pin" size={10} className="conversation-item__pin-icon" />
            )}
          </div>
          <div className="conversation-item__time">
            {getLastMessageTime()}
          </div>
        </div>

        <div className="conversation-item__footer">
          <div className="conversation-item__preview">
            {getLastMessagePreview()}
          </div>
          <div className="conversation-item__indicators">
            {conversation.isMuted && (
              <Icon icon="volume-off" size={14} className="conversation-item__muted-icon" />
            )}
            {conversation.unreadCount > 0 && (
              <div className="conversation-item__unread-badge">
                {conversation.unreadCount > 99 ? '99+' : conversation.unreadCount}
              </div>
            )}
          </div>
        </div>
      </div>
    </div>
  );
};

export const ChatSidebar: React.FC<ChatSidebarProps> = ({
  conversations,
  currentUser,
  activeConversationId,
  searchQuery,
  onSearchChange,
  onConversationSelect,
  onNewChat,
  onNewGroup,
  onUserStatusChange,
  onSettingsOpen,
  onSignOut,
  className = ''
}) => {
  const [showUserMenu, setShowUserMenu] = useState(false);

  // Filter and sort conversations based on search query
  const filteredConversations = useMemo(() => {
    let filtered = conversations;

    // Filter by search query
    if (searchQuery.trim()) {
      filtered = conversations.filter(conversation => {
        const isGroupChat = conversation.type === 'group' || conversation.type === 'channel';
        
        if (isGroupChat) {
          return (conversation.name || '').toLowerCase().includes(searchQuery.toLowerCase());
        } else {
          const otherParticipant = conversation.participants.find(p => p.id !== currentUser.id);
          return otherParticipant?.displayName.toLowerCase().includes(searchQuery.toLowerCase()) || false;
        }
      });
    }

    // Sort conversations (pinned first, then by last message time)
    return filtered.sort((a, b) => {
      // Pinned conversations first
      if (a.isPinned && !b.isPinned) return -1;
      if (!a.isPinned && b.isPinned) return 1;
      
      // Then by last message time
      const aTime = a.lastMessage?.timestamp.getTime() || 0;
      const bTime = b.lastMessage?.timestamp.getTime() || 0;
      return bTime - aTime;
    });
  }, [conversations, searchQuery, currentUser.id]);

  const renderUserMenu = () => (
    <Menu>
             <MenuItem 
         icon="symbol-circle" 
         text="Online"
         onClick={() => onUserStatusChange?.({ ...currentUser.status, status: 'online', isOnline: true })}
       />
      <MenuItem 
        icon="time" 
        text="Away"
        onClick={() => onUserStatusChange?.({ ...currentUser.status, status: 'away', isOnline: true })}
      />
      <MenuItem 
        icon="disable" 
        text="Busy"
        onClick={() => onUserStatusChange?.({ ...currentUser.status, status: 'busy', isOnline: true })}
      />
      <MenuItem 
        icon="eye-off" 
        text="Invisible"
        onClick={() => onUserStatusChange?.({ ...currentUser.status, status: 'invisible', isOnline: false })}
      />
      <Divider />
      <MenuItem icon="cog" text="Settings" onClick={onSettingsOpen} />
      <MenuItem icon="log-out" text="Sign Out" intent="danger" onClick={onSignOut} />
    </Menu>
  );

  const renderNewChatMenu = () => (
    <Menu>
      <MenuItem icon="chat" text="New Chat" onClick={onNewChat} />
      <MenuItem icon="people" text="New Group" onClick={onNewGroup} />
    </Menu>
  );

  return (
    <div className={`chat-sidebar ${className}`}>
      {/* Header with user profile */}
      <div className="chat-sidebar__header">
        <Popover
          content={renderUserMenu()}
          isOpen={showUserMenu}
          onInteraction={setShowUserMenu}
          position={Position.BOTTOM_LEFT}
          minimal
        >
          <div className="chat-sidebar__user-profile">
            <UserAvatar 
              user={currentUser} 
              size="medium" 
              showStatus={true}
              showStatusText={false}
            />
            <div className="chat-sidebar__user-info">
              <div className="chat-sidebar__user-name">{currentUser.displayName}</div>
              <div className="chat-sidebar__user-status">
                {currentUser.status.customMessage || 
                 (currentUser.status.isOnline ? 'Online' : 'Offline')}
              </div>
            </div>
            <Icon icon="chevron-down" size={12} className="chat-sidebar__dropdown-icon" />
          </div>
        </Popover>

        <Popover
          content={renderNewChatMenu()}
          position={Position.BOTTOM_RIGHT}
          minimal
        >
          <Tooltip content="New chat" position={Position.BOTTOM}>
            <Button
              icon="plus"
              minimal
              className="chat-sidebar__new-chat-button"
            />
          </Tooltip>
        </Popover>
      </div>

      {/* Search */}
      <div className="chat-sidebar__search">
        <InputGroup
          leftIcon="search"
          placeholder="Search conversations..."
          value={searchQuery}
          onChange={(e) => onSearchChange(e.target.value)}
          fill
          round
        />
      </div>

      {/* Conversations list */}
      <div className="chat-sidebar__conversations">
        <ScrollableContent className="chat-sidebar__scroll-container">
          {filteredConversations.length > 0 ? (
            <div className="chat-sidebar__conversation-list">
              {filteredConversations.map(conversation => (
                <ConversationItem
                  key={conversation.id}
                  conversation={conversation}
                  currentUser={currentUser}
                  isActive={conversation.id === activeConversationId}
                  onClick={() => onConversationSelect(conversation.id)}
                />
              ))}
            </div>
          ) : (
            <div className="chat-sidebar__empty-state">
              {searchQuery ? (
                <>
                  <Icon icon="search" size={32} className="chat-sidebar__empty-icon" />
                  <Text className="chat-sidebar__empty-text">
                    No conversations found for "{searchQuery}"
                  </Text>
                </>
              ) : (
                <>
                  <Icon icon="chat" size={32} className="chat-sidebar__empty-icon" />
                  <Text className="chat-sidebar__empty-text">
                    No conversations yet
                  </Text>
                  <Button 
                    icon="plus" 
                    text="Start a chat" 
                    onClick={onNewChat}
                    className="chat-sidebar__empty-action"
                  />
                </>
              )}
            </div>
          )}
        </ScrollableContent>
      </div>
    </div>
  );
}; 