import React, { ReactNode, useEffect } from 'react';
import { usePerfectScrollbar } from '../hooks/usePerfectScrollbar';

interface ScrollableContentProps {
  children: ReactNode;
  className?: string;
  resetKey?: string | number; // When this changes, scroll to top
}

export const ScrollableContent: React.FC<ScrollableContentProps> = ({ 
  children, 
  className = '',
  resetKey 
}) => {
  const { containerRef, scrollToTop } = usePerfectScrollbar({
    suppressScrollX: true, // Only allow vertical scrolling for pages
    suppressScrollY: false,
    wheelSpeed: 1.2,
    wheelPropagation: false,
    minScrollbarLength: 40,
    scrollingThreshold: 800,
  });

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
};