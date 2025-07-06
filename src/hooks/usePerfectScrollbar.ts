import { useEffect, useRef } from 'react';
import PerfectScrollbar from 'perfect-scrollbar';

interface UsePerfectScrollbarOptions {
  handlers?: string[];
  maxScrollbarLength?: number;
  minScrollbarLength?: number;
  scrollingThreshold?: number;
  scrollXMarginOffset?: number;
  scrollYMarginOffset?: number;
  suppressScrollX?: boolean;
  suppressScrollY?: boolean;
  useBothWheelAxes?: boolean;
  wheelPropagation?: boolean;
  wheelSpeed?: number;
}

export const usePerfectScrollbar = (options: UsePerfectScrollbarOptions = {}) => {
  const containerRef = useRef<HTMLDivElement>(null);
  const psRef = useRef<PerfectScrollbar | null>(null);

  useEffect(() => {
    if (containerRef.current) {
      try {
        // Professional scrollbar defaults optimized for our theme
        const defaultOptions = {
          wheelSpeed: 1.5,
          wheelPropagation: false,
          minScrollbarLength: 30,
          maxScrollbarLength: null,
          scrollingThreshold: 1000,
          useBothWheelAxes: false,
          suppressScrollX: false,
          suppressScrollY: false,
          scrollXMarginOffset: 0,
          scrollYMarginOffset: 0,
        };

        // Initialize perfect-scrollbar with professional defaults + custom options
        psRef.current = new (PerfectScrollbar as any)(containerRef.current, {
          ...defaultOptions,
          ...options,
        });
      } catch (error) {
        console.warn('Perfect Scrollbar initialization failed:', error);
      }

      // Cleanup function
      return () => {
        if (psRef.current) {
          try {
            (psRef.current as any).destroy();
            psRef.current = null;
          } catch (error) {
            console.warn('Perfect Scrollbar destroy failed:', error);
          }
        }
      };
    }
  }, [JSON.stringify(options)]); // Use JSON.stringify for proper option comparison

  const update = () => {
    if (psRef.current) {
      try {
        (psRef.current as any).update();
      } catch (error) {
        console.warn('Perfect Scrollbar update failed:', error);
      }
    }
  };

  const scrollToTop = () => {
    if (containerRef.current) {
      try {
        // Reset scroll position to top-left (0, 0)
        containerRef.current.scrollTop = 0;
        containerRef.current.scrollLeft = 0;
        
        // Update Perfect Scrollbar to reflect the change
        if (psRef.current) {
          (psRef.current as any).update();
        }
      } catch (error) {
        console.warn('Perfect Scrollbar scroll to top failed:', error);
      }
    }
  };

  const scrollToBottom = (smooth: boolean = true) => {
    if (containerRef.current) {
      try {
        const element = containerRef.current;
        const targetScrollTop = element.scrollHeight - element.clientHeight;
        
        if (smooth) {
          // Smooth scroll animation
          const startScrollTop = element.scrollTop;
          const distance = targetScrollTop - startScrollTop;
          const duration = 300; // ms
          const startTime = performance.now();

          const easeInOutCubic = (t: number): number => {
            return t < 0.5 ? 4 * t * t * t : (t - 1) * (2 * t - 2) * (2 * t - 2) + 1;
          };

          const animateScroll = (currentTime: number) => {
            const elapsed = currentTime - startTime;
            const progress = Math.min(elapsed / duration, 1);
            const easedProgress = easeInOutCubic(progress);
            
            element.scrollTop = startScrollTop + (distance * easedProgress);
            
            if (progress < 1) {
              requestAnimationFrame(animateScroll);
            } else {
              // Update Perfect Scrollbar after animation completes
              if (psRef.current) {
                (psRef.current as any).update();
              }
            }
          };

          requestAnimationFrame(animateScroll);
        } else {
          // Instant scroll
          element.scrollTop = targetScrollTop;
          
          // Update Perfect Scrollbar to reflect the change
          if (psRef.current) {
            (psRef.current as any).update();
          }
        }
      } catch (error) {
        console.warn('Perfect Scrollbar scroll to bottom failed:', error);
      }
    }
  };

  const isAtBottom = (): boolean => {
    if (!containerRef.current) return true;
    
    const element = containerRef.current;
    const threshold = 5; // pixels
    return element.scrollTop >= (element.scrollHeight - element.clientHeight - threshold);
  };

  return { 
    containerRef, 
    update, 
    scrollToTop, 
    scrollToBottom, 
    isAtBottom 
  };
};