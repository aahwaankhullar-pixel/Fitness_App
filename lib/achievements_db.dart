import 'package:flutter/material.dart';

final List<Map<String, dynamic>> challengeMap = [
  // 🏃 Step & Movement Challenges
  {
    'title': 'Step Master',
    'instruction': 'Reach 3000 steps for 4 days this week',
    'current_progress': 0,
    'end_goal': 4,
    'points': 40,
    'icon': "directions_walk",
    'category': 'Steps',
    "challenge_completed": false,
  },
  {
    'title': 'Steady Strider',
    'instruction': 'Reach 5000 steps on any 3 days this week',
    'progress': '0/3',
    'points': 50,
    'icon': "directions_run",
    'category': 'Steps',
  },
  {
    'title': 'Move More!',
    'instruction': 'Walk for at least 3 different sessions this week',
    'progress': '0/3',
    'points': 30,
    'icon': "self_improvement",
    'category': 'Steps',
  },
  {
    'title': 'Morning Starter',
    'instruction': 'Complete any one exercise before 10 AM for 3 days this week',
    'progress': '0/3',
    'points': 25,
    'icon': "wb_sunny",
    'category': 'Steps',
  },

  // 💪 Body Movement Challenges
  {
    'title': 'Body Balance',
    'instruction': 'Try 3 different body-part exercises this week',
    'progress': '0/3',
    'points': 30,
    'icon': "fitness_center",
    'category': 'Body',
  },
  {
    'title': 'Stretch Champ',
    'instruction': 'Do 2 flexibility/stretching exercises',
    'progress': '0/2',
    'points': 20,
    'icon': "accessibility_new",
    'category': 'Body',
  },
  {
    'title': 'Arm & Leg Legend',
    'instruction': 'Complete one arm and one leg exercise on 3 different days',
    'progress': '0/3',
    'points': 40,
    'icon': "accessibility",
    'category': 'Body',
  },
  {
    'title': 'Core Keeper',
    'instruction': 'Do at least one core exercise each day for 4 days',
    'progress': '0/4',
    'points': 35,
    'icon': "sports_gymnastics",
    'category': 'Body',
  },

  // 🎾 Prop-Based Challenges
  {
    'title': 'Props Champion',
    'instruction': 'Try 2 different prop exercises this week',
    'progress': '0/2',
    'points': 15,
    'icon': "sports_tennis",
    'category': 'Props',
  },
  {
    'title': 'Bottle Boss',
    'instruction': 'Complete 2 different bottle exercises this week',
    'progress': '0/2',
    'points': 25,
    'icon': "local_drink",
    'category': 'Props',
  },
  {
    'title': 'Tennis Ace',
    'instruction': 'Try any 3 tennis ball activities this week',
    'progress': '0/3',
    'points': 30,
    'icon': "sports_tennis_outlined",
    'category': 'Props',
  },
  {
    'title': 'Pillow Pro',
    'instruction': 'Use a pillow in at least 2 exercise sessions this week',
    'progress': '0/2',
    'points': 25,
    'icon': "bed",
    'category': 'Props',
  },

  // 💃 Dance & Fun Movement Challenges
  {
    'title': 'Groove Starter',
    'instruction': 'Complete one dance session this week',
    'progress': '0/1',
    'points': 20,
    'icon': "music_note",
    'category': 'Dance',
  },
  {
    'title': 'Beat Follower',
    'instruction': 'Do dance-based movement 3 times this week',
    'progress': '0/3',
    'points': 35,
    'icon': "queue_music",
    'category': 'Dance',
  },
  {
    'title': 'Freestyle Hero',
    'instruction': 'Try 3 different dance moves across sessions',
    'progress': '0/3',
    'points': 30,
    'icon': "directions_run_outlined",
    'category': 'Dance',
  },
  {
    'title': 'Dance Duo',
    'instruction': 'Do any dance exercise with a partner/family once this week',
    'progress': '0/1',
    'points': 20,
    'icon': "group",
    'category': 'Dance',
  },

  // 🌈 Mixed & Motivation Challenges
  {
    'title': 'Consistency King/Queen',
    'instruction': 'Do any kind of exercise for 5 days this week',
    'progress': '0/5',
    'points': 50,
    'icon': "calendar_today",
    'category': 'Mixed',
  },
  {
    'title': 'Try-It-All!',
    'instruction': 'Try 1 body, 1 dance, and 1 prop exercise this week',
    'progress': '0/3',
    'points': 40,
    'icon': "explore",
    'category': 'Mixed',
  },
  {
    'title': 'New Explorer',
    'instruction': 'Try 2 completely new exercises you haven’t done before',
    'progress': '0/2',
    'points': 25,
    'icon': "lightbulb_outline",
    'category': 'Mixed',
  },
  {
    'title': 'Happy Finisher',
    'instruction': 'Complete at least one exercise every alternate day this week',
    'progress': '0/4',
    'points': 30,
    'icon': "emoji_emotions",
    'category': 'Mixed',
  },
];


final List<Map<String, dynamic>> bonusChallenges = [
  {
    "title": "Perfect Week",
    "instruction": "Complete all weekly challenges successfully!",
    "icon": "🏆", // 🏆
    "points": 100,
    "current_progress": 0,
    "end_goal": 5
  },
  {
    "title": "Consistency Star",
    "instruction": "Exercise 7 days in a row to build your daily streak.",
    "icon": "⭐", // ⭐
    "points": 50,
  },
  {
    "title": "Explorer Badge",
    "instruction": "Try every type of exercise — dance, props, body part, and step activities.",
    "icon": "🌍", // 🌍
    "points": 75,
  },
  {
    "title": "Prop Pro",
    "instruction": "Use at least 3 different props during your workouts this week.",
    "icon": "🏸", // 🏸
    "points": 60,
  },
  {
    "title": "Dance Dynamo",
    "instruction": "Complete all dance-based exercises in a single week.",
    "icon": "💃", // 💃
    "points": 70,
  },
  {
    "title": "Balance Hero",
    "instruction": "Finish all body-part-focused exercises this week.",
    "icon": "🧘", // 🧘
    "points": 65,
  },
  {
    "title": "Body Challenger",
    "instruction": "Do 2 exercises for arms, 2 for legs, and 2 for core this week.",
    "icon": "💪", // 💪
    "points": 55,
  },
  {
    "title": "Prop Explorer",
    "instruction": "Use each prop (pillow, bottle, ball, etc.) at least once this week.",
    "icon": "🪣", // 🪣
    "points": 70,
  },
  {
    "title": "Ultimate Groover",
    "instruction": "Complete all challenge categories — props, dance, steps, and body exercises — in one week.",
    "icon": "🎯", // 🎯
    "points": 120,
  },
  {
    "title": "Rhythm Rookie",
    "instruction": "Complete 3 different dance exercises this week.",
    "icon": "🕺", // 🕺
    "points": 45,
  },
  {
    "title": "Body Balance Master",
    "instruction": "Complete 5 upper or lower body exercises this week.",
    "icon": "🤸", // 🤸
    "points": 55,
  },
  {
    "title": "Prop Challenger",
    "instruction": "Repeat one prop exercise 3 times across the week.",
    "icon": "🪀", // 🪀
    "points": 40,
  },
  {
    "title": "Fitness Combo",
    "instruction": "Do one dance, one prop, one body, and one step activity in a week.",
    "icon": "🧩", // 🧩
    "points": 75,
  },
  {
    "title": "Motivation Master",
    "instruction": "Complete at least one exercise every day for 5 days in a row.",
    "icon": "🔥", // 🔥
    "points": 65,
  },
  {
    "title": "Movement Marathon",
    "instruction": "Complete a total of 15 exercises this week.",
    "icon": "🏁", // 🏁
    "points": 100,
  },
  {
    "title": "Prop Wizard",
    "instruction": "Complete all exercises that use props this week.",
    "icon": "🎯", // 🎯
    "points": 80,
  },
  {
    "title": "Groove Champion",
    "instruction": "Finish every daily goal for 7 days in a row.",
    "icon": "🏅", // 🏅
    "points": 90,
  },
  {
    "title": "Variety Victor",
    "instruction": "Complete exercises from at least 4 different exercise categories.",
    "icon": "🎨", // 🎨
    "points": 70,
  },
];

final List<Map<String, dynamic>> todaysGoals = [
  {
    "goal": "Complete one dance exercise today!",
  },
  {
    "goal": "Reach 3000 steps by the end of the day!",
  },
  {
    "goal": "Try one prop-based exercise using a pillow!",
  },
  {
    "goal": "Finish any 3 exercises today!",
  },
  {
    "goal": "Do one arm exercise and one leg exercise in a single day!",
  },
  {
    "goal": "Complete a bottle-based exercise today!",
  },
  {
    "goal": "Achieve 2000 steps and finish one prop exercise today!",
  },
  {
    "goal": "Do one dance exercise and one body exercise today!",
  },
  {
    "goal": "Complete 2 body-part exercises today!",
  },
  {
    "goal": "Use a tennis ball for one exercise today!",
  },
  {
    "goal": "Complete 4 total exercises today!",
  },
  {
    "goal": "Walk or move enough to reach 2500 steps!",
  },
  {
    "goal": "Try one new exercise you haven’t done this week!",
  },
  {
    "goal": "Do 3 prop-related exercises today!",
  },
  {
    "goal": "Do one dance exercise and one arm exercise today!",
  },
  {
    "goal": "Finish 5 short exercises today!",
  },
  {
    "goal": "Reach 3500 steps and complete one dance activity!",
  },
  {
    "goal": "Do one arm-focused and one core exercise today!",
  },
  {
    "goal": "Try one exercise with a bottle or a pillow today!",
  },
  {
    "goal": "Complete one full-body exercise today!",
  },
  {
    "goal": "Do 4 different exercises from any categories today!",
  },
  {
    "goal": "Use two different props in your workouts today!",
  },
  {
    "goal": "Reach 4000 steps through walking and exercise!",
  },
  {
    "goal": "Do one dance exercise and one prop exercise today!",
  },
  {
    "goal": "Repeat your favorite exercise twice today!",
  },
  {
    "goal": "Do one exercise focusing on your legs today!",
  },
  {
    "goal": "Do both a prop and a body exercise today!",
  },
  {
    "goal": "Complete 3 upper-body exercises today!",
  },
  {
    "goal": "Do 5 different exercises today!",
  },
  {
    "goal": "Reach 5000 steps today!",
  },
];