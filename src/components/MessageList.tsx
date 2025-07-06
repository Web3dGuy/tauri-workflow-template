import React, { useEffect, useRef, useMemo } from 'react';
import { Message, User, TypingIndicator as TypingIndicatorType } from '../types/chat';
import { MessageItem } from './MessageItem';
import { TypingIndicator } from './TypingIndicator';
import { ScrollableContent } from './ScrollableContent';
import './MessageList.scss';

interface MessageListProps {
  messages: Message[];
  users: { [userId: string]: User };
  currentUser: User;
  typingIndicators: TypingIndicatorType[];
  isLoading?: boolean;
  onReply?: (message: Message) => void;
  onReact?: (messageId: string, emoji: string) => void;
  onEdit?: (messageId: string) => void;
  onDelete?: (messageId: string) => void;
  onForward?: (message: Message) => void;
  onLoadMore?: () => void;
  className?: string;
}

export const MessageList: React.FC<MessageListProps> = ({
  messages,
  users,
  currentUser,
  typingIndicators,
  isLoading = false,
  onReply,
  onReact,
  onEdit,
  onDelete,
  onForward,
  onLoadMore,
  className = ''
}) => {
  const messagesEndRef = useRef<HTMLDivElement>(null);
  const containerRef = useRef<HTMLDivElement>(null);

  // Auto-scroll to bottom when new messages arrive
  useEffect(() => {
    if (messagesEndRef.current) {
      messagesEndRef.current.scrollIntoView({ behavior: 'smooth' });
    }
  }, [messages.length, typingIndicators.length]);

  // Group messages by sender and time proximity
  const groupedMessages = useMemo(() => {
    const groups: Array<{
      messages: Message[];
      sender: User;
      isGrouped: boolean[];
    }> = [];

    messages.forEach((message, index) => {
      const sender = users[message.senderId];
      if (!sender) return;

      const prevMessage = messages[index - 1];
      const shouldGroup = 
        prevMessage &&
        prevMessage.senderId === message.senderId &&
        (message.timestamp.getTime() - prevMessage.timestamp.getTime()) < 5 * 60 * 1000 && // 5 minutes
        !message.replyTo; // Don't group reply messages

      if (shouldGroup && groups.length > 0 && groups[groups.length - 1].sender.id === sender.id) {
        // Add to existing group
        const lastGroup = groups[groups.length - 1];
        lastGroup.messages.push(message);
        lastGroup.isGrouped.push(true);
      } else {
        // Create new group
        groups.push({
          messages: [message],
          sender,
          isGrouped: [false]
        });
      }
    });

    return groups;
  }, [messages, users]);

  // Get typing users
  const typingUsers = useMemo(() => {
    return typingIndicators
      .map(indicator => users[indicator.userId])
      .filter(user => user && user.id !== currentUser.id);
  }, [typingIndicators, users, currentUser.id]);

  const renderDateSeparator = (date: Date) => (
    <div className="message-list__date-separator">
      <span className="message-list__date-text">
        {new Intl.DateTimeFormat('en-US', {
          weekday: 'long',
          year: 'numeric',
          month: 'long',
          day: 'numeric'
        }).format(date)}
      </span>
    </div>
  );

  const renderLoadingIndicator = () => (
    <div className="message-list__loading">
      <div className="message-list__loading-spinner">
        <div className="message-list__loading-dot" />
        <div className="message-list__loading-dot" />
        <div className="message-list__loading-dot" />
      </div>
      <span>Loading messages...</span>
    </div>
  );

  return (
    <div className={`message-list ${className}`} ref={containerRef}>
      <ScrollableContent className="message-list__scroll-container">
        {isLoading && renderLoadingIndicator()}
        
        <div className="message-list__messages">
          {groupedMessages.map((group, groupIndex) => (
            <React.Fragment key={`group-${groupIndex}`}>
              {/* Date separator */}
              {groupIndex === 0 || 
               new Date(group.messages[0].timestamp).toDateString() !== 
               new Date(groupedMessages[groupIndex - 1].messages[0].timestamp).toDateString() ? (
                renderDateSeparator(group.messages[0].timestamp)
              ) : null}

              {/* Messages in group */}
              {group.messages.map((message, messageIndex) => (
                <MessageItem
                  key={message.id}
                  message={message}
                  sender={group.sender}
                  currentUser={currentUser}
                  showAvatar={messageIndex === 0} // Only show avatar for first message in group
                  isGrouped={group.isGrouped[messageIndex]}
                  onReply={onReply}
                  onReact={onReact}
                  onEdit={onEdit}
                  onDelete={onDelete}
                  onForward={onForward}
                />
              ))}
            </React.Fragment>
          ))}

          {/* Typing indicator */}
          {typingUsers.length > 0 && (
            <TypingIndicator users={typingUsers} />
          )}

          {/* Scroll anchor */}
          <div ref={messagesEndRef} />
        </div>
      </ScrollableContent>
    </div>
  );
}; 