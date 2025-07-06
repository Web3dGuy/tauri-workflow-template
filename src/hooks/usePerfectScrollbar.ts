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

  return { containerRef, update, scrollToTop };
};