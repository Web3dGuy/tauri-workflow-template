import { useState, useEffect, useCallback } from "react";
import { Classes } from "@blueprintjs/core";
import { ChatSidebar } from "./components/ChatSidebar";
import { ChatWindow } from "./components/ChatWindow";
import { ChatState, Conversation, Message, User, TypingIndicator } from "./types/chat";
import "./App.scss";

// Mock data for demonstration
const mockCurrentUser: User = {
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
};

const mockUsers: { [userId: string]: User } = {
  "current-user": mockCurrentUser,
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
    lastSeen: new Date(Date.now() - 5 * 60 * 1000), // 5 minutes ago
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
    lastSeen: new Date(Date.now() - 2 * 60 * 60 * 1000), // 2 hours ago
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
  }
};

const generateMockConversations = (): Conversation[] => [
  {
    id: "conv-1",
    type: "direct",
    participants: [mockCurrentUser, mockUsers["alice"]],
    lastMessage: {
      id: "msg-1",
      conversationId: "conv-1",
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
  {
    id: "conv-2",
    type: "direct",
    participants: [mockCurrentUser, mockUsers["bob"]],
    lastMessage: {
      id: "msg-2",
      conversationId: "conv-2",
      senderId: "current-user",
      content: "Thanks for the help with the project!",
      timestamp: new Date(Date.now() - 3 * 60 * 60 * 1000),
      type: "text",
      status: "delivered"
    },
    unreadCount: 0,
    isPinned: false,
    isMuted: false,
    createdAt: new Date(Date.now() - 5 * 24 * 60 * 60 * 1000),
    updatedAt: new Date(Date.now() - 3 * 60 * 60 * 1000)
  },
  {
    id: "conv-3",
    type: "group",
    name: "Project Team",
    participants: [mockCurrentUser, mockUsers["alice"], mockUsers["bob"], mockUsers["charlie"]],
    lastMessage: {
      id: "msg-3",
      conversationId: "conv-3",
      senderId: "charlie",
      content: "Let's schedule a meeting for tomorrow",
      timestamp: new Date(Date.now() - 6 * 60 * 60 * 1000),
      type: "text",
      status: "read"
    },
    unreadCount: 1,
    isPinned: false,
    isMuted: true,
    createdAt: new Date(Date.now() - 10 * 24 * 60 * 60 * 1000),
    updatedAt: new Date(Date.now() - 6 * 60 * 60 * 1000)
  }
];

const generateMockMessages = (): { [conversationId: string]: Message[] } => {
  const now = new Date();
  
  return {
    "conv-1": [
      {
        id: "msg-1-1",
        conversationId: "conv-1",
        senderId: "alice",
        content: "Hi John! How was your weekend?",
        timestamp: new Date(now.getTime() - 2 * 60 * 60 * 1000),
        type: "text",
        status: "read"
      },
      {
        id: "msg-1-2",
        conversationId: "conv-1",
        senderId: "current-user",
        content: "It was great! Went hiking with some friends. How about yours?",
        timestamp: new Date(now.getTime() - 1.5 * 60 * 60 * 1000),
        type: "text",
        status: "read"
      },
      {
        id: "msg-1-3",
        conversationId: "conv-1",
        senderId: "alice",
        content: "That sounds amazing! I love hiking too. Where did you go?",
        timestamp: new Date(now.getTime() - 1 * 60 * 60 * 1000),
        type: "text",
        status: "read"
      },
      {
        id: "msg-1-4",
        conversationId: "conv-1",
        senderId: "alice",
        content: "Hey! How are you doing today? 😊",
        timestamp: new Date(now.getTime() - 10 * 60 * 1000),
        type: "text",
        status: "read"
      }
    ],
    "conv-2": [
      {
        id: "msg-2-1",
        conversationId: "conv-2",
        senderId: "bob",
        content: "Hey, I've completed the design mockups for the new feature",
        timestamp: new Date(now.getTime() - 4 * 60 * 60 * 1000),
        type: "text",
        status: "read"
      },
      {
        id: "msg-2-2",
        conversationId: "conv-2",
        senderId: "current-user",
        content: "Thanks for the help with the project!",
        timestamp: new Date(now.getTime() - 3 * 60 * 60 * 1000),
        type: "text",
        status: "delivered"
      }
    ],
    "conv-3": [
      {
        id: "msg-3-1",
        conversationId: "conv-3",
        senderId: "charlie",
        content: "Hey everyone! How's the project coming along?",
        timestamp: new Date(now.getTime() - 8 * 60 * 60 * 1000),
        type: "text",
        status: "read"
      },
      {
        id: "msg-3-2",
        conversationId: "conv-3",
        senderId: "alice",
        content: "Making good progress on the frontend!",
        timestamp: new Date(now.getTime() - 7 * 60 * 60 * 1000),
        type: "text",
        status: "read"
      },
      {
        id: "msg-3-3",
        conversationId: "conv-3",
        senderId: "charlie",
        content: "Let's schedule a meeting for tomorrow",
        timestamp: new Date(now.getTime() - 6 * 60 * 60 * 1000),
        type: "text",
        status: "read"
      }
    ]
  };
};

function App() {
  const [chatState, setChatState] = useState<ChatState>({
    currentUser: mockCurrentUser,
    conversations: generateMockConversations(),
    activeConversationId: undefined,
    messages: generateMockMessages(),
    typingIndicators: [],
    settings: {
      theme: 'dark',
      notifications: {
        desktop: true,
        sound: true,
        preview: true
      },
      privacy: {
        readReceipts: true,
        lastSeen: true,
        onlineStatus: true
      },
      appearance: {
        fontSize: 'medium',
        compactMode: false,
        showAvatars: true
      }
    },
    searchQuery: '',
    isLoading: false
  });

  // Auto-select first conversation on load
  useEffect(() => {
    if (!chatState.activeConversationId && chatState.conversations.length > 0) {
      setChatState(prev => ({
        ...prev,
        activeConversationId: prev.conversations[0].id
      }));
    }
  }, [chatState.conversations, chatState.activeConversationId]);

  const handleConversationSelect = useCallback((conversationId: string) => {
    setChatState(prev => ({
      ...prev,
      activeConversationId: conversationId
    }));
  }, []);

  const handleSearchChange = useCallback((query: string) => {
    setChatState(prev => ({
      ...prev,
      searchQuery: query
    }));
  }, []);

  const handleSendMessage = useCallback((content: string, attachments?: File[]) => {
    if (!chatState.activeConversationId) return;

    const newMessage: Message = {
      id: `msg-${Date.now()}`,
      conversationId: chatState.activeConversationId,
      senderId: chatState.currentUser.id,
      content,
      timestamp: new Date(),
      type: "text",
      status: "sending",
      attachments: attachments?.map((file, index) => ({
        id: `attachment-${Date.now()}-${index}`,
        name: file.name,
        size: file.size,
        type: file.type,
        url: URL.createObjectURL(file)
      }))
    };

    setChatState(prev => {
      const updatedMessages = {
        ...prev.messages,
        [chatState.activeConversationId!]: [
          ...(prev.messages[chatState.activeConversationId!] || []),
          newMessage
        ]
      };

      // Update conversation with new last message
      const updatedConversations = prev.conversations.map(conv => 
        conv.id === chatState.activeConversationId
          ? { ...conv, lastMessage: newMessage, updatedAt: new Date() }
          : conv
      );

      return {
        ...prev,
        messages: updatedMessages,
        conversations: updatedConversations
      };
    });

    // Simulate message status updates
    setTimeout(() => {
      setChatState(prev => ({
        ...prev,
        messages: {
          ...prev.messages,
          [chatState.activeConversationId!]: prev.messages[chatState.activeConversationId!]?.map(msg =>
            msg.id === newMessage.id ? { ...msg, status: "sent" } : msg
          ) || []
        }
      }));
    }, 1000);

    setTimeout(() => {
      setChatState(prev => ({
        ...prev,
        messages: {
          ...prev.messages,
          [chatState.activeConversationId!]: prev.messages[chatState.activeConversationId!]?.map(msg =>
            msg.id === newMessage.id ? { ...msg, status: "delivered" } : msg
          ) || []
        }
      }));
    }, 2000);
  }, [chatState.activeConversationId, chatState.currentUser.id]);

  const handleTypingStart = useCallback(() => {
    if (!chatState.activeConversationId) return;
    
    const newTypingIndicator: TypingIndicator = {
      conversationId: chatState.activeConversationId,
      userId: chatState.currentUser.id,
      timestamp: new Date()
    };

    setChatState(prev => ({
      ...prev,
      typingIndicators: [
        ...prev.typingIndicators.filter(
          ti => !(ti.conversationId === newTypingIndicator.conversationId && ti.userId === newTypingIndicator.userId)
        ),
        newTypingIndicator
      ]
    }));
  }, [chatState.activeConversationId, chatState.currentUser.id]);

  const handleTypingStop = useCallback(() => {
    setChatState(prev => ({
      ...prev,
      typingIndicators: prev.typingIndicators.filter(
        ti => ti.userId !== prev.currentUser.id
      )
    }));
  }, []);

  const activeConversation = chatState.conversations.find(
    conv => conv.id === chatState.activeConversationId
  );

  const allMessages = Object.values(chatState.messages).flat();

  return (
    <div className={`main-app ${Classes.DARK}`}>
      <div className="chat-layout">
        <ChatSidebar
          conversations={chatState.conversations}
          currentUser={chatState.currentUser}
          activeConversationId={chatState.activeConversationId}
          searchQuery={chatState.searchQuery}
          onSearchChange={handleSearchChange}
          onConversationSelect={handleConversationSelect}
          onNewChat={() => console.log('New chat')}
          onNewGroup={() => console.log('New group')}
          onUserStatusChange={(status) => console.log('Status change:', status)}
          onSettingsOpen={() => console.log('Settings')}
          onSignOut={() => console.log('Sign out')}
          className="chat-layout__sidebar"
        />
        
        <ChatWindow
          conversation={activeConversation}
          messages={allMessages}
          users={mockUsers}
          currentUser={chatState.currentUser}
          typingIndicators={chatState.typingIndicators}
          isLoading={chatState.isLoading}
          onSendMessage={handleSendMessage}
          onTypingStart={handleTypingStart}
          onTypingStop={handleTypingStop}
          onVideoCall={() => console.log('Video call')}
          onVoiceCall={() => console.log('Voice call')}
          onSearchInChat={() => console.log('Search in chat')}
          onViewProfile={() => console.log('View profile')}
          onMuteConversation={() => console.log('Mute conversation')}
          onDeleteConversation={() => console.log('Delete conversation')}
          onArchiveConversation={() => console.log('Archive conversation')}
          onBlockUser={() => console.log('Block user')}
          className="chat-layout__main"
        />
      </div>
    </div>
  );
}

export default App;