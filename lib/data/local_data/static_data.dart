import 'package:portfolio_app/core/constants/app_constants.dart';
import 'package:portfolio_app/data/models/experience_model.dart';
import 'package:portfolio_app/data/models/project_model.dart';

class StaticData {
  static final List<ProjectModel> projects = [
    ProjectModel(
      title: "AO & TRACES Portal",
      description:
          "Worked on population-scale government portals for the Income Tax Department of India using FlutterFlow and Flutter hybrid architecture. Developed and optimized high-traffic modules handling sensitive workflows and large-scale user interactions.",
      imageUrl: AppAssets.project1Image, // keeping placeholder for now
      techStack: [
        "FlutterFlow",
        "Flutter",
        "Dart",
        "REST APIs",
        "State Management",
      ],
      company: "Idealake Technologies Pvt Ltd",
      role: "Senior Software Developer",
      duration: "2025 – Present",
      projectType: "Enterprise Government Web Platform",
      contributions: [
        "Built E-Proceedings, Penalty, and Rectification modules.",
        "Worked on enterprise-grade FlutterFlow architecture.",
        "Integrated APIs and complex government workflows.",
        "Collaborated directly with FlutterFlow engineering teams.",
        "Optimized UI responsiveness and state handling.",
        "Improved development speed using FlutterFlow + Flutter hybrid systems.",
      ],
      impactMetrics: [
        "Enterprise-scale government platform.",
        "High concurrent user handling.",
        "Optimized workflow performance.",
        "Faster delivery using low-code architecture.",
      ],
      websiteUrl: "https://traces.tdscpc.gov.in/",
      // Add other URLs when available
    ),
    ProjectModel(
      title: "Tata Mutual Fund",
      description:
          "Worked on the Tata Mutual Fund mobile application focused on simplifying investing, portfolio tracking, and financial planning for millions of users.\n\nContributed to enterprise-scale fintech modules enabling goal-based investing, intelligent portfolio tracking, and seamless mutual fund management experiences.\n\nBuilt and optimized high-performance Flutter modules for responsive financial dashboards, onboarding workflows, and investment planning systems.",
      imageUrl:
          "https://play-lh.googleusercontent.com/HfT51YbU-zyQoPzqB_rsaQ2815cp2YS5iW8pZZlNLvWJ7_5WFBDgx__vDzqzeVg5EZU=w5120-h2880-rw",
      techStack: [
        "Flutter",
        "Dart",
        "FlutterFlow",
        "REST APIs",
        "Fintech Systems",
        "State Management",
        "Enterprise UI Architecture",
      ],
      company: "Idealake Technologies Pvt Ltd",
      role: "Senior Software Developer",
      projectType: "Fintech / Wealth Management Platform",
      contributions: [
        "Developed Financial Roadmap modules for goal-based investing.",
        "Built interactive Risk Assessment and investor profiling systems.",
        "Worked on Portfolio 360° investment dashboards.",
        "Optimized fintech onboarding and investment flows.",
        "Improved UI responsiveness and workflow scalability.",
        "Contributed to enterprise-grade fintech architecture.",
        "Built intelligent financial calculators and planning systems.",
        "Enhanced user engagement through smart financial tooling.",
      ],
      impactMetrics: [
        "Built for millions of investors and large-scale financial operations.",
        "Enterprise-grade fintech architecture.",
        "High-performance investment dashboard experiences.",
        "Scalable modules optimized for heavy concurrent traffic.",
        "Enhanced user experience through intelligent financial planning tools.",
      ],
      playStoreUrl:
          "https://play.google.com/store/apps/details?id=com.nextgenmf.investor&hl=en_IN",
      appStoreUrl:
          "https://apps.apple.com/in/app/tata-mutual-fund-sip-track/id6744349856",
      gallery: [
        "https://play-lh.googleusercontent.com/HfT51YbU-zyQoPzqB_rsaQ2815cp2YS5iW8pZZlNLvWJ7_5WFBDgx__vDzqzeVg5EZU=w5120-h2880-rw",
        "https://play-lh.googleusercontent.com/rE3NOwu_bGtvrlbUu-GdyfeWfL5klM-_OrK_GJLLmHGKZNG0QATmwanBEowilb2SDTo=w5120-h2880-rw",
        "https://play-lh.googleusercontent.com/KoTORnIy3557lXpUTPxvcCUP3Twlhns-lzYffRMHPGAYuH7KNp9awwPd9Yt775u4gFk=w5120-h2880-rw",
        "https://play-lh.googleusercontent.com/-IXvVNzMcrUmPOtjOeIsR1r57dn4_tq0CznEnKHmOoSR2R0BMKWiqvJfC-MFCpCyOdU=w5120-h2880-rw",
      ],
    ),
    ProjectModel(
      title: "Get Set Fit",
      description:
          "Worked on Get Set Fit, a comprehensive fitness and wellness platform designed to help users track health metrics, maintain workout consistency, and achieve long-term fitness goals.\n\nBuilt and optimized high-performance Flutter modules focused on fitness tracking, wellness analytics, real-time health monitoring, and engaging user experiences.\n\nContributed to scalable health-tech architecture integrating wearable devices, analytics systems, personalized fitness journeys, and intelligent wellness features.",
      imageUrl:
          "https://play-lh.googleusercontent.com/SFfdZyv-gtveIQykMRzcpR_Z0uoTQBVcwqOfp3WQcelpK4zJR8DdZ8cwwXG0MOLwTLHH9zvjlJIDEtSLEYN8YQ=w1052-h592-rw",
      techStack: [
        "Flutter",
        "Dart",
        "Bluetooth Integration",
        "Health Tracking",
        "Firebase",
        "REST APIs",
        "Video Optimization",
        "Real-Time Analytics",
      ],
      company: "WDIPL Pvt Ltd",
      role: "Flutter Team Lead",
      projectType: "Health-Tech / Fitness & Wellness Platform",
      contributions: [
        "Developed advanced step tracking and pedometer systems.",
        "Integrated Bluetooth weighing scale support for body metrics.",
        "Built fitness analytics and wellness progress dashboards.",
        "Optimized video-based fitness content experiences.",
        "Worked on workout tracking and calorie monitoring systems.",
        "Built smooth real-time health monitoring experiences.",
        "Improved app responsiveness and animation performance.",
        "Architected scalable Flutter modules for wellness workflows.",
        "Led development and deployment of production-ready releases.",
        "Delivered highly optimized UI experiences with smooth 60fps performance.",
      ],
      impactMetrics: [
        "Enterprise-grade health-tech application.",
        "Real-time fitness and wellness tracking.",
        "High-performance wearable integrations.",
        "Optimized media-heavy experiences.",
        "Scalable architecture for large user engagement.",
      ],
      coreFeatures: [
        "Personalized workout journeys.",
        "Nutrition and wellness tracking.",
        "Activity and calorie monitoring.",
        "Goal-based fitness systems.",
        "Workout demonstrations and video guidance.",
        "Fitness analytics and progress reports.",
        "Mental wellness and mindfulness modules.",
        "Achievement systems and motivation tracking.",
        "Real-time wearable integrations.",
      ],
      playStoreUrl:
          "https://play.google.com/store/apps/details?id=com.getsetfit.gsf&hl=en",
      appStoreUrl: "https://apps.apple.com/in/app/getsetfit/id6455990055",
      gallery: [
        "https://play-lh.googleusercontent.com/SFfdZyv-gtveIQykMRzcpR_Z0uoTQBVcwqOfp3WQcelpK4zJR8DdZ8cwwXG0MOLwTLHH9zvjlJIDEtSLEYN8YQ=w1052-h592-rw",
        "https://play-lh.googleusercontent.com/fDuyqDoSPA_WwANWYnHDoHqkWO4CU6TBZyE-Hmbzzy831NoKAXerYnSpQSP2nnRuBoZp2pPSgTLq2ixfcx8nmQ=w1052-h592-rw",
        "https://play-lh.googleusercontent.com/3kzk9XTpR0kuVb349nsT-LabpzlzxPyY2AUfqNlg7nfx3zJ9_fxzC0zpatMqe1lLebhYXkHy2FiGpDbuX_Xccw=w1052-h592-rw",
        "https://play-lh.googleusercontent.com/oLHRO_iP82YM9-AGaEnvw_IrbvgJm-NIUZeIQ9jO7vM972kyVAJcPoF0QHzjrxVqUx0VzA5m2Mk1ju2gOL0icA=w1052-h592-rw",
        "https://play-lh.googleusercontent.com/KsZ_AUy9_rKKBQXI6XTyG_fcPpFl8IU9K-DNS_P5-wzcjCckUWYMjJoxJykG-8MNUzxCxtHOhYX_SLr5c2Lp8g=w1052-h592-rw",
        "https://play-lh.googleusercontent.com/fDuyqDoSPA_WwANWYnHDoHqkWO4CU6TBZyE-Hmbzzy831NoKAXerYnSpQSP2nnRuBoZp2pPSgTLq2ixfcx8nmQ=w1052-h592-rw",
      ],
    ),
    ProjectModel(
      title: "Traders Circuit",
      description:
          "Worked on Traders Circuit, an advanced stock market and trading platform designed to simplify investing and trading for retail investors and active traders.\n\nBuilt scalable fintech modules focused on real-time market insights, trading recommendations, portfolio intelligence, and seamless broker-integrated user experiences.\n\nDeveloped high-performance Flutter architecture for financial dashboards, live trading workflows, and intelligent market analysis systems used by thousands of users.",
      imageUrl:
          "https://play-lh.googleusercontent.com/zTTAqGwiLGh6uNH-Vpi-9pyaaVGkk6MOsvT4byox8okocPFe4gsgVkMa9C-D7t37Dw=w1052-h592-rw",
      techStack: ["Flutter", "Broker Integrations", "Real-Time Systems"],
      company: "WDIPL Pvt Ltd",
      role: "Flutter Team Lead",
      projectType: "Fintech / Stock Market & Trading Platform",
      contributions: [
        "Built advanced trading and stock recommendation modules.",
        "Developed Portfolio365 for portfolio tracking and analytics.",
        "Integrated multiple broker APIs and trading systems.",
        "Built real-time signal engines for Nifty and BankNifty trading.",
        "Optimized fintech dashboards for large-scale live data handling.",
        "Improved UI responsiveness and chart rendering performance.",
        "Developed scalable Flutter + backend integrated architecture.",
        "Worked on high-frequency notification and alert systems.",
        "Led deployment and production optimization workflows.",
        "Delivered smooth real-time experiences with optimized performance.",
      ],
      impactMetrics: [
        "Built for 50,000+ active users.",
        "Enterprise-grade trading platform architecture.",
        "High-performance real-time market workflows.",
        "Scalable fintech infrastructure for live updates.",
        "Optimized user engagement with intelligent trading systems.",
      ],
      coreFeatures: [
        "Research-backed stock recommendations.",
        "Real-time buy/sell trading signals.",
        "Portfolio analytics and stock tracking.",
        "Risk-aware investing systems.",
        "Subscription and premium membership flows.",
        "Real-time market alerts and notifications.",
        "Broker integration and multi-account connectivity.",
        "Market education and trading insights.",
      ],
      playStoreUrl:
          "https://play.google.com/store/apps/details?id=com.traders_circuit.app&hl=en_IN",
      appStoreUrl: "https://apps.apple.com/in/app/traders-circuit/id6670790027",
      gallery: [
        "https://play-lh.googleusercontent.com/zTTAqGwiLGh6uNH-Vpi-9pyaaVGkk6MOsvT4byox8okocPFe4gsgVkMa9C-D7t37Dw=w1052-h592-rw",
        "https://play-lh.googleusercontent.com/spQ9aMSTHR3b2DcyIF8UU_VG8HIN_0j171O0h--eecY_DZqiXhmz56pzQbObJfTAsA=w1052-h592-rw",
        "https://play-lh.googleusercontent.com/lnKMthiqWOCOu0eCZ-7IDwBZrNl0ryTuD9u0KEka3tQOKIFOiVfhAZZ3y-5Y6ZDPEvpY=w1052-h592-rw",
      ],
    ),
    ProjectModel(
      title: "Good Times",
      description:
          "Worked on Good Times, a modern event discovery and social engagement platform designed to connect event organizers and attendees through real-time interactions and immersive event experiences.\n\nBuilt scalable Flutter modules focused on event discovery, real-time community engagement, social networking, live communication, and interactive location-based experiences.\n\nDeveloped high-performance features for organizers and attendees while delivering smooth UI experiences and scalable backend integrations.",
      imageUrl:
          "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/08/5f/b8/085fb836-f068-f557-936e-178ba7182b26/89ba7aff-c31d-4ba2-bc26-499a36d5778c_intro-11-pro.jpeg/300x650bb.webp",
      techStack: [
        "Flutter",
        "WebSockets",
        "Google Maps API",
        "Social Platform Architecture",
      ],
      company: "WDIPL Pvt Ltd",
      role: "Flutter Developer (Frontend & Backend)",
      projectType: "Event-Tech / Social Community Platform",
      contributions: [
        "Built dual-flow architecture for organizers and attendees.",
        "Developed real-time community chat using WebSockets.",
        "Integrated Google Maps with live navigation and route polylines.",
        "Built dynamic event discovery and preference systems.",
        "Developed referral and reward-based engagement features.",
        "Optimized real-time communication and notification workflows.",
        "Worked on scalable backend integrations and APIs.",
        "Improved animation performance and UI responsiveness.",
        "Delivered smooth social-interaction experiences using Flutter.",
        "Built highly interactive event-based user journeys.",
      ],
      coreFeatures: [
        "Event discovery and recommendations.",
        "Real-time community and group chats.",
        "Event organizer management tools.",
        "Live notifications and social engagement.",
        "Google Maps and navigation integrations.",
        "Reward and referral systems.",
        "Personalized event preferences.",
        "Community interaction and networking experiences.",
      ],
      impactMetrics: [
        "Real-time event engagement platform.",
        "Scalable social and communication systems.",
        "Optimized live interaction workflows.",
        "Smooth high-performance Flutter experiences.",
        "Enterprise-ready event-tech architecture.",
      ],
      playStoreUrl:
          "https://play.google.com/store/apps/details?id=com.goodtimes&hl=en_IN",
      appStoreUrl: "https://apps.apple.com/in/app/good-times-app/id6479345939",
      gallery: [
        "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/08/5f/b8/085fb836-f068-f557-936e-178ba7182b26/89ba7aff-c31d-4ba2-bc26-499a36d5778c_intro-11-pro.jpeg/300x650bb.webp",
        "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/33/68/d8/3368d830-b0a1-cdea-ea0d-6285ab5227df/c2971799-40ae-436d-b261-b2adf82c80a7_preference-11-pro.jpg/300x650bb.webp",
        "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/45/a9/e5/45a9e5f4-57a5-75f5-27a5-b59941863737/2b4654a7-f44a-4e93-926b-db6787ec3b39_home-11-pro.jpg/300x650bb.webp",
        "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/37/83/15/378315bd-4285-e265-a493-4bf87ae04c60/0e9ec82f-9bee-45ba-9ef4-83d2b7bd2e03_event-inner-11-pro.jpg/300x650bb.webp",
        "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource221/v4/6c/31/2f/6c312f54-c1b0-cb56-936a-f407e2cc4af8/cbb64a53-1770-46dd-b8a8-07a9e7cabf1f_refer-earn.jpg/300x650bb.webp",
      ],
    ),
  ];

  static final List<ExperienceModel> experience = [
    ExperienceModel(
      role: "Senior Software Developer",
      company: "Idealake Technologies Pvt Ltd",
      period: "Feb 2025 – Present",
      description:
          "• Building enterprise-scale government portals using FlutterFlow.\n• Developed high-traffic Income Tax modules used at population scale.\n• Built fintech systems for Tata Mutual Funds.\n• Collaborated directly with FlutterFlow engineering teams.",
    ),
    ExperienceModel(
      role: "Flutter Team Lead",
      company: "WDIPL Pvt Ltd",
      period: "Jun 2023 – Feb 2025",
      description:
          "• Led a team of 7 Flutter developers.\n• Deployed 10+ apps on Play Store & App Store.\n• Built fintech platforms with 100K+ downloads.\n• Reduced development time using AI-assisted workflows.\n• Improved company profitability by optimizing delivery speed.\n• Architected scalable Flutter + Laravel systems.",
    ),
    ExperienceModel(
      role: "Flutter Developer",
      company: "WDIPL Pvt Ltd",
      period: "Jun 2022 – Jun 2023",
      description:
          "• Developed production-grade fintech & health-tech apps.\n• Integrated KYC, Google Maps, Pedometer & Deep Linking.\n• Built real-time trading and portfolio tracking features.\n• Worked on REST APIs and backend integrations.",
    ),
  ];
}
