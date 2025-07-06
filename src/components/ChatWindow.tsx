import React, { useState, useMemo } from 'react';
import { Conversation, Message, User, TypingIndicator } from '../types/chat';
import { ChatHeader } from './ChatHeader';
import { MessageList } from './MessageList';
import { MessageInput } from './MessageInput';
import './ChatWindow.scss';

interface ChatWindowProps {
  conversation?: Conversation;
  messages: Message[];
  users: { [userId: string]: User };
  currentUser: User;
  typingIndicators: TypingIndicator[];
  isLoading?: boolean;
  onSendMessage: (content: string, attachments?: File[]) => void;
  onReplyToMessage?: (message: Message) => void;
  onReactToMessage?: (messageId: string, emoji: string) => void;
  onEditMessage?: (messageId: string) => void;
  onDeleteMessage?: (messageId: string) => void;
  onForwardMessage?: (message: Message) => void;
  onTypingStart?: () => void;
  onTypingStop?: () => void;
  onVideoCall?: () => void;
  onVoiceCall?: () => void;
  onSearchInChat?: () => void;
  onViewProfile?: () => void;
  onMuteConversation?: () => void;
  onDeleteConversation?: () => void;
  onArchiveConversation?: () => void;
  onBlockUser?: () => void;
  onLoadMoreMessages?: () => void;
  className?: string;
}

export const ChatWindow: React.FC<ChatWindowProps> = ({
  conversation,
  messages,
  users,
  currentUser,
  typingIndicators,
  isLoading = false,
  onSendMessage,
  onReplyToMessage,
  onReactToMessage,
  onEditMessage,
  onDeleteMessage,
  onForwardMessage,
  onTypingStart,
  onTypingStop,
  onVideoCall,
  onVoiceCall,
  onSearchInChat,
  onViewProfile,
  onMuteConversation,
  onDeleteConversation,
  onArchiveConversation,
  onBlockUser,
  onLoadMoreMessages,
  className = ''
}) => {
  const [replyingTo, setReplyingTo] = useState<Message | undefined>();

  // Filter messages for this conversation
  const conversationMessages = useMemo(() => {
    if (!conversation) return [];
    return messages.filter(message => message.conversationId === conversation.id);
  }, [messages, conversation]);

  // Filter typing indicators for this conversation
  const conversationTypingIndicators = useMemo(() => {
    if (!conversation) return [];
    return typingIndicators.filter(indicator => indicator.conversationId === conversation.id);
  }, [typingIndicators, conversation]);

  const handleReply = (message: Message) => {
    setReplyingTo(message);
    onReplyToMessage?.(message);
  };

  const handleCancelReply = () => {
    setReplyingTo(undefined);
  };

  const handleSendMessage = (content: string, attachments?: File[]) => {
    // If replying to a message, we'd include that in the message data
    // For now, we'll just call the parent's send handler
    onSendMessage(content, attachments);
    
    // Clear reply state after sending
    if (replyingTo) {
      setReplyingTo(undefined);
    }
  };

  // If no conversation is selected
  if (!conversation) {
    return (
      <div className={`chat-window chat-window--empty ${className}`}>
        <div className="chat-window__empty-state">
          <div className="chat-window__empty-icon">💬</div>
          <h3 className="chat-window__empty-title">Select a conversation</h3>
          <p className="chat-window__empty-subtitle">
            Choose a conversation from the sidebar to start chatting
          </p>
        </div>
      </div>
    );
  }

  return (
    <div className={`chat-window ${className}`}>
      <ChatHeader
        conversation={conversation}
        currentUser={currentUser}
        onVideoCall={onVideoCall}
        onVoiceCall={onVoiceCall}
        onSearch={onSearchInChat}
        onViewProfile={onViewProfile}
        onMuteConversation={onMuteConversation}
        onDeleteConversation={onDeleteConversation}
        onArchiveConversation={onArchiveConversation}
        onBlockUser={onBlockUser}
        className="chat-window__header"
      />

      <div className="chat-window__messages">
        <MessageList
          messages={conversationMessages}
          users={users}
          currentUser={currentUser}
          typingIndicators={conversationTypingIndicators}
          isLoading={isLoading}
          onReply={handleReply}
          onReact={onReactToMessage}
          onEdit={onEditMessage}
          onDelete={onDeleteMessage}
          onForward={onForwardMessage}
          onLoadMore={onLoadMoreMessages}
          className="chat-window__message-list"
        />
      </div>

      <div className="chat-window__input">
        <MessageInput
          onSendMessage={handleSendMessage}
          onTypingStart={onTypingStart}
          onTypingStop={onTypingStop}
          replyingTo={replyingTo}
          onCancelReply={handleCancelReply}
          placeholder={`Message ${conversation.type === 'group' ? conversation.name : 'user'}...`}
          className="chat-window__message-input"
        />
      </div>
    </div>
  );
}; 