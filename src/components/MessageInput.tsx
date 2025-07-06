import React, { useState, useRef, useEffect } from 'react';
import { 
  Button, 
  InputGroup, 
  Icon, 
  Popover, 
  Menu, 
  MenuItem, 
  // FileInput,
  Position,
  Tooltip
} from '@blueprintjs/core';
import { Message } from '../types/chat';
import './MessageInput.scss';

interface MessageInputProps {
  onSendMessage: (content: string, attachments?: File[]) => void;
  onTypingStart?: () => void;
  onTypingStop?: () => void;
  replyingTo?: Message;
  onCancelReply?: () => void;
  placeholder?: string;
  disabled?: boolean;
  maxLength?: number;
  className?: string;
}

export const MessageInput: React.FC<MessageInputProps> = ({
  onSendMessage,
  onTypingStart,
  onTypingStop,
  replyingTo,
  onCancelReply,
  placeholder = "Type a message...",
  disabled = false,
  maxLength = 4000,
  className = ''
}) => {
  const [message, setMessage] = useState('');
  const [attachments, setAttachments] = useState<File[]>([]);
  const [isTyping, setIsTyping] = useState(false);
  const [showEmojiPicker, setShowEmojiPicker] = useState(false);
  
  const inputRef = useRef<HTMLInputElement>(null);
  const fileInputRef = useRef<HTMLInputElement>(null);
  const typingTimeoutRef = useRef<number>();

  // Common emojis for quick access
  const quickEmojis = ['😀', '😂', '😍', '🤔', '👍', '👎', '❤️', '🎉', '🔥', '💯'];

  useEffect(() => {
    // Focus input when reply is set
    if (replyingTo && inputRef.current) {
      inputRef.current.focus();
    }
  }, [replyingTo]);

  const handleTypingStart = () => {
    if (!isTyping) {
      setIsTyping(true);
      onTypingStart?.();
    }

    // Reset typing timeout
    if (typingTimeoutRef.current) {
      clearTimeout(typingTimeoutRef.current);
    }

    typingTimeoutRef.current = setTimeout(() => {
      setIsTyping(false);
      onTypingStop?.();
    }, 2000);
  };

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const value = e.target.value;
    if (value.length <= maxLength) {
      setMessage(value);
      if (value.trim()) {
        handleTypingStart();
      }
    }
  };

  const handleKeyPress = (e: React.KeyboardEvent<HTMLInputElement>) => {
    if (e.key === 'Enter' && !e.shiftKey) {
      e.preventDefault();
      handleSend();
    }
  };

  const handleSend = () => {
    const trimmedMessage = message.trim();
    
    if (!trimmedMessage && attachments.length === 0) return;
    if (disabled) return;

    onSendMessage(trimmedMessage, attachments.length > 0 ? attachments : undefined);
    
    // Reset state
    setMessage('');
    setAttachments([]);
    setIsTyping(false);
    onTypingStop?.();

    // Clear typing timeout
    if (typingTimeoutRef.current) {
      clearTimeout(typingTimeoutRef.current);
    }
  };

  const handleEmojiSelect = (emoji: string) => {
    setMessage(prev => prev + emoji);
    setShowEmojiPicker(false);
    inputRef.current?.focus();
  };

  const handleFileSelect = (e: React.ChangeEvent<HTMLInputElement>) => {
    const files = Array.from(e.target.files || []);
    setAttachments(prev => [...prev, ...files].slice(0, 5)); // Max 5 files
    
    // Reset file input
    if (fileInputRef.current) {
      fileInputRef.current.value = '';
    }
  };

  const removeAttachment = (index: number) => {
    setAttachments(prev => prev.filter((_, i) => i !== index));
  };

  const formatFileSize = (bytes: number): string => {
    const sizes = ['Bytes', 'KB', 'MB', 'GB'];
    if (bytes === 0) return '0 Bytes';
    const i = Math.floor(Math.log(bytes) / Math.log(1024));
    return Math.round(bytes / Math.pow(1024, i) * 100) / 100 + ' ' + sizes[i];
  };

  const renderEmojiPicker = () => (
    <Menu className="message-input__emoji-menu">
      <div className="message-input__emoji-grid">
        {quickEmojis.map(emoji => (
          <MenuItem
            key={emoji}
            text={emoji}
            className="message-input__emoji-item"
            onClick={() => handleEmojiSelect(emoji)}
          />
        ))}
      </div>
    </Menu>
  );

  const renderAttachments = () => {
    if (attachments.length === 0) return null;

    return (
      <div className="message-input__attachments">
        {attachments.map((file, index) => (
          <div key={index} className="message-input__attachment">
            <Icon icon="document" size={16} />
            <div className="message-input__attachment-info">
              <span className="message-input__attachment-name">{file.name}</span>
              <span className="message-input__attachment-size">{formatFileSize(file.size)}</span>
            </div>
            <Button
              icon="cross"
              minimal
              small
              onClick={() => removeAttachment(index)}
              className="message-input__attachment-remove"
            />
          </div>
        ))}
      </div>
    );
  };

  const canSend = (message.trim() || attachments.length > 0) && !disabled;

  return (
    <div className={`message-input ${className}`}>
      {replyingTo && (
        <div className="message-input__reply-preview">
          <div className="message-input__reply-line" />
          <div className="message-input__reply-content">
            <Icon icon="arrow-top-right" size={12} />
            <span className="message-input__reply-text">
              Replying to: {replyingTo.content.substring(0, 50)}
              {replyingTo.content.length > 50 ? '...' : ''}
            </span>
          </div>
          <Button
            icon="cross"
            minimal
            small
            onClick={onCancelReply}
            className="message-input__reply-cancel"
          />
        </div>
      )}

      {renderAttachments()}

      <div className="message-input__main">
        <div className="message-input__actions">
          <input
            ref={fileInputRef}
            type="file"
            multiple
            onChange={handleFileSelect}
            style={{ display: 'none' }}
            accept="*/*"
          />
          
          <Tooltip content="Attach file" position={Position.TOP}>
            <Button
              icon="paperclip"
              minimal
              onClick={() => fileInputRef.current?.click()}
              className="message-input__action-button"
            />
          </Tooltip>

          <Popover
            content={renderEmojiPicker()}
            isOpen={showEmojiPicker}
            onInteraction={setShowEmojiPicker}
            position={Position.TOP}
            minimal
          >
            <Tooltip content="Emoji" position={Position.TOP}>
              <Button
                icon="emoji"
                minimal
                className="message-input__action-button"
              />
            </Tooltip>
          </Popover>
        </div>

        <div className="message-input__input-container">
          <InputGroup
            inputRef={inputRef}
            value={message}
            onChange={handleInputChange}
            onKeyPress={handleKeyPress}
            placeholder={placeholder}
            disabled={disabled}
            fill
            large
            className="message-input__input"
            rightElement={
              <div className="message-input__counter">
                {message.length}/{maxLength}
              </div>
            }
          />
        </div>

        <Tooltip content={canSend ? "Send message" : "Type a message"} position={Position.TOP}>
          <Button
            icon="send-message"
            intent={canSend ? "primary" : undefined}
            disabled={!canSend}
            onClick={handleSend}
            className="message-input__send-button"
            large
          />
        </Tooltip>
      </div>
    </div>
  );
}; 