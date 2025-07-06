import { User, Conversation, Message, MessageType } from '../types/chat';

// Extended mock users with more variety
export const createMockUsers = (): { [userId: string]: User } => ({
  "current-user": {
    id: "current-user",
    username: "johndoe",
    displayName: "John Doe",
    email: "john.doe@example.com",
    avatar: undefined,
    status: {
      isOnline: true,
      status: "online",
      customMessage: undefined
    },
    lastSeen: new Date(),
    isTyping: false
  },
  "alice": {
    id: "alice",
    username: "alice_wonder",
    displayName: "Alice Wonderland",
    email: "alice@example.com",
    avatar: undefined,
    status: {
      isOnline: true,
      status: "online"
    },
    lastSeen: new Date(Date.now() - 5 * 60 * 1000),
    isTyping: false
  },
  "bob": {
    id: "bob",
    username: "bob_builder",
    displayName: "Bob Builder",
    email: "bob@example.com",
    avatar: undefined,
    status: {
      isOnline: false,
      status: "away"
    },
    lastSeen: new Date(Date.now() - 2 * 60 * 60 * 1000),
    isTyping: false
  },
  "charlie": {
    id: "charlie",
    username: "charlie_brown",
    displayName: "Charlie Brown",
    email: "charlie@example.com",
    avatar: undefined,
    status: {
      isOnline: true,
      status: "busy",
      customMessage: "In a meeting"
    },
    lastSeen: new Date(),
    isTyping: false
  },
  "diana": {
    id: "diana",
    username: "diana_prince",
    displayName: "Diana Prince",
    email: "diana@example.com",
    avatar: undefined,
    status: {
      isOnline: true,
      status: "online",
      customMessage: "Working on new features"
    },
    lastSeen: new Date(),
    isTyping: false
  },
  "eve": {
    id: "eve",
    username: "eve_online",
    displayName: "Eve Online",
    email: "eve@example.com",
    avatar: undefined,
    status: {
      isOnline: false,
      status: "invisible"
    },
    lastSeen: new Date(Date.now() - 30 * 60 * 1000),
    isTyping: false
  }
});

// Sample message templates for realistic conversation
const messageTemplates = [
  "Hey! How's it going?",
  "Great work on the project! 👏",
  "Can we schedule a meeting for tomorrow?",
  "I just finished the design mockups",
  "Thanks for your help with this",
  "Looking forward to the weekend!",
  "Have you seen the new updates?",
  "The presentation went really well",
  "Let me know when you're free to chat",
  "I've uploaded the files to the shared drive",
  "Coffee break? ☕",
  "This is exactly what we needed!",
  "I'll review this and get back to you",
  "Perfect! That solves our issue",
  "Ready for the next sprint planning?",
  "The client loved the proposal",
  "Working from home today",
  "Happy Friday everyone! 🎉",
  "Let's celebrate the successful launch! 🚀",
  "Quick question about the requirements"
];

const reactionEmojis = ['👍', '❤️', '😂', '😍', '👏', '🔥', '💯', '😮', '😢', '😡'];

export const generateRandomMessage = (
  conversationId: string,
  senderId: string,
  baseTime: Date = new Date()
): Message => {
  const content = messageTemplates[Math.floor(Math.random() * messageTemplates.length)];
  const messageId = `msg-${Date.now()}-${Math.random().toString(36).substr(2, 9)}`;
  
  return {
    id: messageId,
    conversationId,
    senderId,
    content,
    timestamp: new Date(baseTime.getTime() - Math.random() * 60 * 60 * 1000), // Within last hour
    type: 'text' as MessageType,
    status: Math.random() > 0.3 ? 'read' : 'delivered',
    reactions: Math.random() > 0.7 ? [{
      emoji: reactionEmojis[Math.floor(Math.random() * reactionEmojis.length)],
      userId: 'current-user',
      timestamp: new Date()
    }] : undefined
  };
};

export const simulateTyping = (
  // userId: string,
  // conversationId: string,
  onTypingStart: () => void,
  onTypingStop: () => void
) => {
  // Random typing duration between 2-5 seconds
  const typingDuration = 2000 + Math.random() * 3000;
  
  onTypingStart();
  
  setTimeout(() => {
    onTypingStop();
  }, typingDuration);
};

export const createMockConversation = (
  id: string,
  type: 'direct' | 'group',
  participants: User[],
  name?: string
): Conversation => {
  const now = new Date();
  const randomUser = participants[Math.floor(Math.random() * participants.length)];
  
  return {
    id,
    type,
    name,
    participants,
    lastMessage: generateRandomMessage(id, randomUser.id, now),
    unreadCount: Math.floor(Math.random() * 5),
    isPinned: Math.random() > 0.8,
    isMuted: Math.random() > 0.9,
    createdAt: new Date(now.getTime() - Math.random() * 30 * 24 * 60 * 60 * 1000), // Within last 30 days
    updatedAt: new Date(now.getTime() - Math.random() * 24 * 60 * 60 * 1000) // Within last day
  };
};

export const generateConversationHistory = (
  conversationId: string,
  participants: User[],
  messageCount: number = 10
): Message[] => {
  const messages: Message[] = [];
  const now = new Date();
  
  for (let i = 0; i < messageCount; i++) {
    const randomParticipant = participants[Math.floor(Math.random() * participants.length)];
    const messageTime = new Date(now.getTime() - (messageCount - i) * 60 * 60 * 1000); // Spread over hours
    
    messages.push(generateRandomMessage(conversationId, randomParticipant.id, messageTime));
  }
  
  return messages.sort((a, b) => a.timestamp.getTime() - b.timestamp.getTime());
};

// Predefined conversation scenarios
export const createDemoConversations = (users: { [userId: string]: User }): Conversation[] => {
  const currentUser = users["current-user"];
  
  return [
    // Direct conversation with Alice (most recent and active)
    {
      id: "conv-alice",
      type: "direct",
      participants: [currentUser, users["alice"]],
      lastMessage: {
        id: "msg-alice-latest",
        conversationId: "conv-alice",
        senderId: "alice",
        content: "Hey! How are you doing today? 😊",
        timestamp: new Date(Date.now() - 10 * 60 * 1000),
        type: "text",
        status: "read"
      },
      unreadCount: 2,
      isPinned: true,
      isMuted: false,
      createdAt: new Date(Date.now() - 7 * 24 * 60 * 60 * 1000),
      updatedAt: new Date(Date.now() - 10 * 60 * 1000)
    },
    
    // Group conversation - Project Team
    {
      id: "conv-team",
      type: "group",
      name: "🚀 Project Team",
      participants: [currentUser, users["alice"], users["bob"], users["charlie"]],
      lastMessage: {
        id: "msg-team-latest",
        conversationId: "conv-team",
        senderId: "charlie",
        content: "Great work everyone! The launch was successful 🎉",
        timestamp: new Date(Date.now() - 30 * 60 * 1000),
        type: "text",
        status: "read",
        reactions: [
          { emoji: "🎉", userId: "current-user", timestamp: new Date() },
          { emoji: "👏", userId: "alice", timestamp: new Date() }
        ]
      },
      unreadCount: 1,
      isPinned: false,
      isMuted: false,
      createdAt: new Date(Date.now() - 15 * 24 * 60 * 60 * 1000),
      updatedAt: new Date(Date.now() - 30 * 60 * 1000)
    },
    
    // Direct conversation with Bob
    {
      id: "conv-bob",
      type: "direct",
      participants: [currentUser, users["bob"]],
      lastMessage: {
        id: "msg-bob-latest",
        conversationId: "conv-bob",
        senderId: "current-user",
        content: "Thanks for the design review!",
        timestamp: new Date(Date.now() - 2 * 60 * 60 * 1000),
        type: "text",
        status: "delivered"
      },
      unreadCount: 0,
      isPinned: false,
      isMuted: false,
      createdAt: new Date(Date.now() - 5 * 24 * 60 * 60 * 1000),
      updatedAt: new Date(Date.now() - 2 * 60 * 60 * 1000)
    },
    
    // Group conversation - Design Team
    {
      id: "conv-design",
      type: "group",
      name: "🎨 Design Team",
      participants: [currentUser, users["diana"], users["eve"]],
      lastMessage: {
        id: "msg-design-latest",
        conversationId: "conv-design",
        senderId: "diana",
        content: "I've updated the wireframes in Figma",
        timestamp: new Date(Date.now() - 4 * 60 * 60 * 1000),
        type: "text",
        status: "read"
      },
      unreadCount: 0,
      isPinned: false,
      isMuted: true,
      createdAt: new Date(Date.now() - 12 * 24 * 60 * 60 * 1000),
      updatedAt: new Date(Date.now() - 4 * 60 * 60 * 1000)
    },
    
    // Direct conversation with Charlie
    {
      id: "conv-charlie",
      type: "direct",
      participants: [currentUser, users["charlie"]],
      lastMessage: {
        id: "msg-charlie-latest",
        conversationId: "conv-charlie",
        senderId: "charlie",
        content: "Can we sync up on the roadmap?",
        timestamp: new Date(Date.now() - 6 * 60 * 60 * 1000),
        type: "text",
        status: "read"
      },
      unreadCount: 0,
      isPinned: false,
      isMuted: false,
      createdAt: new Date(Date.now() - 3 * 24 * 60 * 60 * 1000),
      updatedAt: new Date(Date.now() - 6 * 60 * 60 * 1000)
    }
  ];
};

export const createDemoMessages = (): { [conversationId: string]: Message[] } => {
  const now = new Date();
  
  return {
    "conv-alice": [
      {
        id: "msg-alice-1",
        conversationId: "conv-alice",
        senderId: "alice",
        content: "Hi John! How was your weekend?",
        timestamp: new Date(now.getTime() - 3 * 60 * 60 * 1000),
        type: "text",
        status: "read"
      },
      {
        id: "msg-alice-2",
        conversationId: "conv-alice",
        senderId: "current-user",
        content: "It was great! Went hiking with some friends. How about yours?",
        timestamp: new Date(now.getTime() - 2.5 * 60 * 60 * 1000),
        type: "text",
        status: "read"
      },
      {
        id: "msg-alice-3",
        conversationId: "conv-alice",
        senderId: "alice",
        content: "That sounds amazing! I love hiking too. Where did you go?",
        timestamp: new Date(now.getTime() - 2 * 60 * 60 * 1000),
        type: "text",
        status: "read"
      },
      {
        id: "msg-alice-4",
        conversationId: "conv-alice",
        senderId: "current-user",
        content: "We went to Mount Wilson. The views were incredible! 🏔️",
        timestamp: new Date(now.getTime() - 1.5 * 60 * 60 * 1000),
        type: "text",
        status: "read",
        reactions: [
          { emoji: "😍", userId: "alice", timestamp: new Date() }
        ]
      },
      {
        id: "msg-alice-5",
        conversationId: "conv-alice",
        senderId: "alice",
        content: "Hey! How are you doing today? 😊",
        timestamp: new Date(now.getTime() - 10 * 60 * 1000),
        type: "text",
        status: "read"
      }
    ],
    
    "conv-team": [
      {
        id: "msg-team-1",
        conversationId: "conv-team",
        senderId: "charlie",
        content: "Morning everyone! Ready for the big launch today?",
        timestamp: new Date(now.getTime() - 8 * 60 * 60 * 1000),
        type: "text",
        status: "read"
      },
      {
        id: "msg-team-2",
        conversationId: "conv-team",
        senderId: "alice",
        content: "Yes! All the frontend tests are passing ✅",
        timestamp: new Date(now.getTime() - 7.5 * 60 * 60 * 1000),
        type: "text",
        status: "read",
        reactions: [
          { emoji: "👍", userId: "current-user", timestamp: new Date() },
          { emoji: "🚀", userId: "charlie", timestamp: new Date() }
        ]
      },
      {
        id: "msg-team-3",
        conversationId: "conv-team",
        senderId: "bob",
        content: "Backend is stable and monitoring is in place",
        timestamp: new Date(now.getTime() - 7 * 60 * 60 * 1000),
        type: "text",
        status: "read"
      },
      {
        id: "msg-team-4",
        conversationId: "conv-team",
        senderId: "current-user",
        content: "Awesome team! I've notified the stakeholders",
        timestamp: new Date(now.getTime() - 6.5 * 60 * 60 * 1000),
        type: "text",
        status: "read"
      },
      {
        id: "msg-team-5",
        conversationId: "conv-team",
        senderId: "charlie",
        content: "Great work everyone! The launch was successful 🎉",
        timestamp: new Date(now.getTime() - 30 * 60 * 1000),
        type: "text",
        status: "read",
        reactions: [
          { emoji: "🎉", userId: "current-user", timestamp: new Date() },
          { emoji: "👏", userId: "alice", timestamp: new Date() },
          { emoji: "🚀", userId: "bob", timestamp: new Date() }
        ]
      }
    ],
    
    "conv-bob": [
      {
        id: "msg-bob-1",
        conversationId: "conv-bob",
        senderId: "bob",
        content: "Hey, I've completed the design mockups for the new feature",
        timestamp: new Date(now.getTime() - 5 * 60 * 60 * 1000),
        type: "text",
        status: "read"
      },
      {
        id: "msg-bob-2",
        conversationId: "conv-bob",
        senderId: "current-user",
        content: "Perfect timing! Can you share them in the design channel?",
        timestamp: new Date(now.getTime() - 4.5 * 60 * 60 * 1000),
        type: "text",
        status: "read"
      },
      {
        id: "msg-bob-3",
        conversationId: "conv-bob",
        senderId: "bob",
        content: "Already done! Also added some interaction notes",
        timestamp: new Date(now.getTime() - 4 * 60 * 60 * 1000),
        type: "text",
        status: "read"
      },
      {
        id: "msg-bob-4",
        conversationId: "conv-bob",
        senderId: "current-user",
        content: "Thanks for the design review!",
        timestamp: new Date(now.getTime() - 2 * 60 * 60 * 1000),
        type: "text",
        status: "delivered"
      }
    ]
  };
}; 