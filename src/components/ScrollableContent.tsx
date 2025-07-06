import { ReactNode, useEffect, forwardRef, useImperativeHandle } from 'react';
import { usePerfectScrollbar } from '../hooks/usePerfectScrollbar';

interface ScrollableContentProps {
  children: ReactNode;
  className?: string;
  resetKey?: string | number; // When this changes, scroll to top
}

export interface ScrollableContentRef {
  scrollToTop: () => void;
  scrollToBottom: (smooth?: boolean) => void;
  update: () => void;
  isAtBottom: () => boolean;
}

export const ScrollableContent = forwardRef<ScrollableContentRef, ScrollableContentProps>(({ 
  children, 
  className = '',
  resetKey 
}, ref) => {
  const { containerRef, scrollToTop, scrollToBottom, update, isAtBottom } = usePerfectScrollbar({
    suppressScrollX: true, // Only allow vertical scrolling for pages
    suppressScrollY: false,
    wheelSpeed: 1.2,
    wheelPropagation: false,
    minScrollbarLength: 40,
    scrollingThreshold: 800,
  });

  // Expose scroll functions to parent components
  useImperativeHandle(ref, () => ({
    scrollToTop,
    scrollToBottom,
    update,
    isAtBottom,
  }), [scrollToTop, scrollToBottom, update, isAtBottom]);

  // Reset scroll position when resetKey changes (e.g., page navigation)
  useEffect(() => {
    if (resetKey !== undefined) {
      scrollToTop();
    }
  }, [resetKey, scrollToTop]);

  return (
    <div
      ref={containerRef}
      className={`scrollable-page-content ${className}`}
    >
      <div className="page-content-inner">
        {children}
      </div>
    </div>
  );
}); 