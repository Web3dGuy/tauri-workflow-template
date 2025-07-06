import React, { useState } from 'react';
import { Icon, Popover, Menu, MenuItem, Text, Tag } from '@blueprintjs/core';
import { Message, User, MessageReaction } from '../types/chat';
import { UserAvatar } from './UserAvatar';
import './MessageItem.scss';

interface MessageItemProps {
  message: Message;
  sender: User;
  currentUser: User;
  showAvatar?: boolean;
  isGrouped?: boolean; // True if this message is grouped with the previous one from same sender
  onReply?: (message: Message) => void;
  onReact?: (messageId: string, emoji: string) => void;
  onEdit?: (messageId: string) => void;
  onDelete?: (messageId: string) => void;
  onForward?: (message: Message) => void;
}

export const MessageItem: React.FC<MessageItemProps> = ({
  message,
  sender,
  currentUser,
  showAvatar = true,
  isGrouped = false,
  onReply,
  onReact,
  onEdit,
  onDelete,
  onForward
}) => {
  const [showActions, setShowActions] = useState(false);
  const isOwnMessage = message.senderId === currentUser.id;
  const isDeleted = !!message.deletedAt;
  const isEdited = !!message.editedAt;

  const formatTime = (timestamp: Date): string => {
    return new Intl.DateTimeFormat('en-US', {
      hour: 'numeric',
      minute: '2-digit',
      hour12: true
    }).format(timestamp);
  };

  const formatFileSize = (bytes: number): string => {
    const sizes = ['Bytes', 'KB', 'MB', 'GB'];
    if (bytes === 0) return '0 Bytes';
    const i = Math.floor(Math.log(bytes) / Math.log(1024));
    return Math.round(bytes / Math.pow(1024, i) * 100) / 100 + ' ' + sizes[i];
  };

  const getStatusIcon = () => {
    if (!isOwnMessage) return null;
    
    switch (message.status) {
      case 'sending':
        return <Icon icon="time" size={12} className="message-item__status message-item__status--sending" />;
      case 'sent':
        return <Icon icon="tick" size={12} className="message-item__status message-item__status--sent" />;
      case 'delivered':
        return <Icon icon="double-chevron-right" size={12} className="message-item__status message-item__status--delivered" />;
      case 'read':
        return <Icon icon="double-chevron-right" size={12} className="message-item__status message-item__status--read" />;
      case 'failed':
        return <Icon icon="warning-sign" size={12} className="message-item__status message-item__status--failed" />;
      default:
        return null;
    }
  };

  const renderReactions = () => {
    if (!message.reactions || message.reactions.length === 0) return null;

    const reactionGroups = message.reactions.reduce((groups, reaction) => {
      const key = reaction.emoji;
      if (!groups[key]) {
        groups[key] = [];
      }
      groups[key].push(reaction);
      return groups;
    }, {} as { [emoji: string]: MessageReaction[] });

    return (
      <div className="message-item__reactions">
        {Object.entries(reactionGroups).map(([emoji, reactions]) => (
          <Tag
            key={emoji}
            minimal
            interactive
            className={`message-item__reaction ${
              reactions.some(r => r.userId === currentUser.id) ? 'message-item__reaction--own' : ''
            }`}
            onClick={() => onReact?.(message.id, emoji)}
          >
            <span className="message-item__reaction-emoji">{emoji}</span>
            <span className="message-item__reaction-count">{reactions.length}</span>
          </Tag>
        ))}
      </div>
    );
  };

  const renderAttachments = () => {
    if (!message.attachments || message.attachments.length === 0) return null;

    return (
      <div className="message-item__attachments">
        {message.attachments.map(attachment => (
          <div key={attachment.id} className="message-item__attachment">
            {attachment.type.startsWith('image/') ? (
              <div className="message-item__image-attachment">
                <img 
                  src={attachment.url} 
                  alt={attachment.name}
                  className="message-item__image"
                />
              </div>
            ) : (
              <div className="message-item__file-attachment">
                <Icon icon="document" size={24} />
                <div className="message-item__file-info">
                  <div className="message-item__file-name">{attachment.name}</div>
                  <div className="message-item__file-size">{formatFileSize(attachment.size)}</div>
                </div>
                <Icon icon="download" size={16} className="message-item__download-icon" />
              </div>
            )}
          </div>
        ))}
      </div>
    );
  };

  const renderMessageActions = () => (
    <Menu>
      <MenuItem icon="chat" text="Reply" onClick={() => onReply?.(message)} />
      <MenuItem icon="heart" text="React" disabled />
      <MenuItem icon="share" text="Forward" onClick={() => onForward?.(message)} />
      {isOwnMessage && (
        <>
          <MenuItem icon="edit" text="Edit" onClick={() => onEdit?.(message.id)} />
          <MenuItem icon="trash" text="Delete" intent="danger" onClick={() => onDelete?.(message.id)} />
        </>
      )}
    </Menu>
  );

  if (isDeleted) {
    return (
      <div className="message-item message-item--deleted">
        <div className="message-item__content">
          <Text className="message-item__deleted-text">
            <Icon icon="trash" size={12} />
            This message was deleted
          </Text>
        </div>
      </div>
    );
  }

  return (
    <div
      className={`message-item ${isOwnMessage ? 'message-item--own' : 'message-item--other'} ${
        isGrouped ? 'message-item--grouped' : ''
      }`}
      onMouseEnter={() => setShowActions(true)}
      onMouseLeave={() => setShowActions(false)}
    >
      {showAvatar && !isGrouped && !isOwnMessage && (
        <div className="message-item__avatar">
          <UserAvatar user={sender} size="small" showStatus={false} />
        </div>
      )}

      <div className="message-item__content">
        {!isGrouped && !isOwnMessage && (
          <div className="message-item__header">
            <span className="message-item__sender-name">{sender.displayName}</span>
            <span className="message-item__timestamp">{formatTime(message.timestamp)}</span>
          </div>
        )}

        <div className="message-item__bubble">
          {message.replyTo && (
            <div className="message-item__reply-reference">
              <Icon icon="arrow-top-right" size={12} />
              <span>Replying to message</span>
            </div>
          )}

          {message.content && (
            <div className="message-item__text">
              {message.content}
              {isEdited && <span className="message-item__edited">(edited)</span>}
            </div>
          )}

          {renderAttachments()}
          {renderReactions()}

          <div className="message-item__meta">
            {isOwnMessage && <span className="message-item__timestamp">{formatTime(message.timestamp)}</span>}
            {getStatusIcon()}
          </div>
        </div>

        {showActions && (
          <div className="message-item__actions">
            <Popover content={renderMessageActions()} placement="top">
              <Icon icon="more" size={16} className="message-item__actions-trigger" />
            </Popover>
          </div>
        )}
      </div>
    </div>
  );
}; 