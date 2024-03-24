import 'package:fend_flutter/models/task.dart';

const kTitle = "APP NAME";

List gameNames = [ 
  "Call of Duty",
  "Valorant",
  "DOTA"
];

const codTasks = [
  Task(
    title: 'Marathon mania',
    details: 'Run 50 miles',
    reward: '50 credit points',
    networkImage: "https://bnetcmsus-a.akamaihd.net/cms/blog_header/ti/TI4WAD6CJ4Y51691017340326.jpg",
    expirationDate: "24th March",
    status: false,
    dateCompleted: "Not completed yet",
    quantity: 50,
    metric: "miles",
    category: "Health",
    progress: 42
  ),
  Task(
    title: 'Move your body',
    details: 'Dance for 30mins',
    reward: '20 credit points',
    networkImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXE7LUfmU4s3ooIuFUCjw0nlGBkOw61DNqnFZJJqys9g&s",
    expirationDate: "25th March",
    status: false,
    dateCompleted: "Not completed yet",
    quantity: 30,
    metric: "minutes",
    category: "Health",
    progress: 15
  ),
  Task(
    title: "Reader's time",
    details: 'Read 10 pages of Pride and Prejudice',
    reward: '10 points',
    networkImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbtDASBjQ4F7BJp-5k19S_-Ht8eWLZ0acAmQ&s",
    expirationDate: "24th March",
    status: false,
    dateCompleted: "Not completed yet",
    quantity: 10,
    metric: "pages",
    category: "Education",
    progress: 2
  ),
  Task(
    title: 'Simp challenge',
    details: 'Flirt with the opposite sex',
    reward: 'Virtual temporary girlfriend/boyfriend',
    networkImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTNWmjaNQddELp8jXIIaLINh4Icl_97gqbM7AalSPB9Q&s",
    expirationDate: "26th March",
    status: false,
    dateCompleted: "Not completed yet",
    quantity: 1,
    metric: "task",
    category: "Social",
    progress: 0
  ),
  Task(
    title: 'Flight test',
    details: 'Jump from the 3rd floor',
    reward: "Pilot's suit",
    networkImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoEyf6wfmdCXxmsU1dlC6Zgu7QS0LG75mT7w&s",
    expirationDate: "28th March",
    status: false,
    dateCompleted: "Not completed yet",
    quantity: 1,
    metric: "task",
    category: "Strength",
    progress: 0
  ),
  Task(
    title: 'Nerd',
    details: 'Play chess for 20mins',
    reward: "Nerdy glasses",
    networkImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFaVV4sOseOiCMxSt1gu1NrxQiZaPyUKGKISFEMu8mLg&s",
    expirationDate: "26th March",
    status: false,
    dateCompleted: "Not completed yet",
    quantity: 20,
    metric: "minutes",
    category: "Skill",
    progress: 14
  ),
];

