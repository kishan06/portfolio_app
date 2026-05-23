import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio_app/core/theme/app_theme.dart';
import 'package:portfolio_app/core/utils/responsive.dart';

class ProjectImageCarousel extends StatefulWidget {
  final List<String> imageUrls;

  const ProjectImageCarousel({Key? key, required this.imageUrls})
    : super(key: key);

  @override
  State<ProjectImageCarousel> createState() => _ProjectImageCarouselState();
}

class _ProjectImageCarouselState extends State<ProjectImageCarousel> {
  PageController? _pageController;
  Timer? _timer;
  bool _isHovering = false;
  int _currentPage = 0;

  // Start at a large number to allow backward scrolling immediately (infinite loop illusion)
  final int _initialPage = 1000;

  @override
  void initState() {
    super.initState();
    _currentPage = _initialPage;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_pageController == null) {
      final isMobile = Responsive.isMobile(context);
      final screenWidth = MediaQuery.of(context).size.width;
      // Calculate a viewport fraction that keeps the mockup wide enough
      final fraction = isMobile ? 0.8 : (350 / screenWidth).clamp(0.15, 0.8);

      _pageController = PageController(
        initialPage: _initialPage,
        viewportFraction: fraction,
      );
      _startAutoScroll();
    }
  }

  void _startAutoScroll() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (!_isHovering &&
          _pageController != null &&
          _pageController!.hasClients) {
        _pageController!.nextPage(
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOutCubic,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.imageUrls.isEmpty || _pageController == null)
      return const SizedBox.shrink();

    final isMobile = Responsive.isMobile(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final fraction = isMobile ? 0.8 : (350 / screenWidth).clamp(0.15, 0.8);
    final slotWidth = screenWidth * fraction;
    
    // Horizontal margin is 10 on each side (20 total)
    final usableWidth = slotWidth - 20; 
    
    // Standard modern mobile aspect ratio
    const mockUpAspectRatio = 9 / 19.5; 
    
    // Calculate exact height needed so the width perfectly fills the usable slot
    final mockUpHeight = usableWidth / mockUpAspectRatio;
    
    // Add vertical margin space (max 60 on each side = 120 total)
    // Clamp the height to a reasonable max so it doesn't get ridiculously large on weird aspect ratios
    final height = (mockUpHeight + 120).clamp(400.0, 900.0);

    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovering = true);
        _timer?.cancel();
      },
      onExit: (_) {
        setState(() => _isHovering = false);
        _startAutoScroll();
      },
      child: Column(
        children: [
          SizedBox(
            height: height,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final actualIndex = index % widget.imageUrls.length;
                    final isActive = _currentPage == index;

                    return Center(
                      child: AspectRatio(
                        aspectRatio: mockUpAspectRatio,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeOutCubic,
                          margin: EdgeInsets.symmetric(
                            vertical: isActive ? 20 : 60,
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.navy,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: isActive
                                  ? AppColors.primary
                                  : AppColors.primary.withOpacity(0.2),
                              width: isActive ? 2 : 1,
                            ),
                            boxShadow: isActive
                                ? [
                                    BoxShadow(
                                      color: AppColors.primary.withOpacity(0.3),
                                      blurRadius: 30,
                                      spreadRadius: 2,
                                    ),
                                  ]
                                : [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      blurRadius: 10,
                                    ),
                                  ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(28), // Slightly less than container to fit inside border
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                // Custom image widget that handles retries
                                _ImageWithRetry(
                                  imageUrl: widget.imageUrls[actualIndex],
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topCenter,
                                ),
                                // Mobile device notch illusion
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                    width: 100,
                                    height: 20,
                                    decoration: const BoxDecoration(
                                      color: AppColors.navy,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(16),
                                        bottomRight: Radius.circular(16),
                                      ),
                                    ),
                                  ),
                                ),
                                // Glassmorphism overlay when not active
                                if (!isActive)
                                  Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.backgroundDark.withOpacity(
                                        0.5,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                // Navigation Arrows (Desktop Only)
                if (!isMobile) ...[
                  Positioned(
                    left: 20,
                    child: _buildNavArrow(
                      icon: Icons.arrow_back_ios_new,
                      onTap: () {
                        _pageController?.previousPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                  ),
                  Positioned(
                    right: 20,
                    child: _buildNavArrow(
                      icon: Icons.arrow_forward_ios,
                      onTap: () {
                        _pageController?.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                  ),
                ],
              ],
            ),
          ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.1),
          const SizedBox(height: 24),
          // Pagination Dots
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.imageUrls.length, (index) {
              final isActive =
                  (_currentPage % widget.imageUrls.length) == index;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: isActive ? 24 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: isActive
                      ? AppColors.primary
                      : AppColors.textDim.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: isActive
                      ? [
                          BoxShadow(
                            color: AppColors.primary.withOpacity(0.5),
                            blurRadius: 8,
                          ),
                        ]
                      : [],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildNavArrow({required IconData icon, required VoidCallback onTap}) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: _isHovering ? 1.0 : 0.0,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.glass,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primary.withOpacity(0.5)),
            ),
            child: Icon(icon, color: AppColors.primary, size: 20),
          ),
        ),
      ),
    );
  }
}

class _ImageWithRetry extends StatefulWidget {
  final String imageUrl;
  final BoxFit fit;
  final Alignment alignment;

  const _ImageWithRetry({
    Key? key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
  }) : super(key: key);

  @override
  _ImageWithRetryState createState() => _ImageWithRetryState();
}

class _ImageWithRetryState extends State<_ImageWithRetry> {
  int _retryCount = 0;
  final int _maxRetries = 4;

  @override
  Widget build(BuildContext context) {
    if (widget.imageUrl.startsWith('assets/')) {
      return Image.asset(
        widget.imageUrl,
        fit: widget.fit,
        alignment: widget.alignment,
      );
    }

    // Add the retry count to the key so that changing the count forces a re-render of the network image
    return Image.network(
      widget.imageUrl,
      key: ValueKey('${widget.imageUrl}_$_retryCount'),
      fit: widget.fit,
      alignment: widget.alignment,
      errorBuilder: (context, error, stackTrace) {
        if (_retryCount < _maxRetries) {
          // Schedule a retry after 3 seconds
          Future.delayed(const Duration(seconds: 3), () {
            if (mounted) {
              setState(() {
                _retryCount++;
              });
            }
          });
          return Container(
            color: AppColors.backgroundDark,
            child: const Center(
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          );
        }
        return Container(
          color: AppColors.backgroundDark,
          child: const Center(
            child: Icon(Icons.broken_image, color: Colors.grey, size: 30),
          ),
        );
      },
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Container(
          color: AppColors.backgroundDark,
          child: const Center(
            child: SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ),
        );
      },
    );
  }
}
