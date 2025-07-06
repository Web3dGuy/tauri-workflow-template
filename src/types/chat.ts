export interface User {
  id: string;
  username: string;
  displayName: string;
  email?: string;
  avatar?: string;
  status: UserStatus;
  lastSeen?: Date;
  isTyping?: boolean;
}

export interface UserStatus {
  isOnline: boolean;
  status: 'online' | 'away' | 'busy' | 'invisible';
  customMessage?: string;
}

export interface Message {
  id: string;
  conversationId: string;
  senderId: string;
  content: string;
  timestamp: Date;
  type: MessageType;
  status: MessageStatus;
  replyTo?: string; // Message ID being replied to
  reactions?: MessageReaction[];
  attachments?: MessageAttachment[];
  editedAt?: Date;
  deletedAt?: Date;
}

export type MessageType = 'text' | 'image' | 'file' | 'audio' | 'video' | 'system';

export type MessageStatus = 'sending' | 'sent' | 'delivered' | 'read' | 'failed';

export interface MessageReaction {
  emoji: string;
  userId: string;
  timestamp: Date;
}

export interface MessageAttachment {
  id: string;
  name: string;
  size: number;
  type: string;
  url: string;
  thumbnailUrl?: string;
}

export interface Conversation {
  id: string;
  type: ConversationType;
  name?: string; // For group chats
  participants: User[];
  lastMessage?: Message;
  unreadCount: number;
  isPinned: boolean;
  isMuted: boolean;
  createdAt: Date;
  updatedAt: Date;
  avatar?: string; // For group chats
}

export type ConversationType = 'direct' | 'group' | 'channel';

export interface TypingIndicator {
  conversationId: string;
  userId: string;
  timestamp: Date;
}

export interface ChatSettings {
  theme: 'light' | 'dark' | 'auto';
  notifications: {
    desktop: boolean;
    sound: boolean;
    preview: boolean;
  };
  privacy: {
    readReceipts: boolean;
    lastSeen: boolean;
    onlineStatus: boolean;
  };
  appearance: {
    fontSize: 'small' | 'medium' | 'large';
    compactMode: boolean;
    showAvatars: boolean;
  };
}

export interface ChatState {
  currentUser: User;
  conversations: Conversation[];
  activeConversationId?: string;
  messages: { [conversationId: string]: Message[] };
  typingIndicators: TypingIndicator[];
  settings: ChatSettings;
  searchQuery: string;
  isLoading: boolean;
} 