import 'package:fend_flutter/models/task.dart';

const kTitle = "HEALTH MANIA";

List gameNames = [ 
  "Call of Duty",
  "Super Smash Bros",
  "DOTA"
];

Map<String, List<GameTask>> taskLists = {
  "Super Smash Bros": smashBros,
  "Call of Duty": codTasks,
  "DOTA": dota,
  "Expired": expiredList
};

const codTasks = [
  GameTask(
    gameName: "Call of Duty",
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
  GameTask(
    gameName: "Call of Duty",
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
  GameTask(
    gameName: "Call of Duty",
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
  GameTask(
    gameName: "Call of Duty",
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
  GameTask(
    gameName: "Call of Duty",
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
  GameTask(
    gameName: "Call of Duty",
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

const smashBros = [
  GameTask(
    gameName: "Super Smash Bros",
    title: 'Train to win',
    details: 'Run 50 miles',
    reward: '50 credit points',
    networkImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLcj4f1oumTIvOx62PstU0Hn1z9Hg5-fFZMg&s",
    expirationDate: "24th March",
    status: false,
    dateCompleted: "Not completed yet",
    quantity: 50,
    metric: "miles",
    category: "Health",
    progress: 42
  ),
  GameTask(
    gameName: "Super Smash Bros",
    title: 'Move your body',
    details: 'Dance for 30mins',
    reward: '20 credit points',
    networkImage: "https://media.gq.com/photos/5b201cd1525bfc1dee1a65ee/4:3/w_960,h_720,c_limit/Every-super-smash-bros-character-is-in-the-new-game-gq.jpg",
    expirationDate: "25th March",
    status: false,
    dateCompleted: "Not completed yet",
    quantity: 30,
    metric: "minutes",
    category: "Health",
    progress: 15
  ),
  GameTask(
    gameName: "Super Smash Bros",
    title: "Reader's time",
    details: 'Read 10 pages of Pride and Prejudice',
    reward: '10 points',
    networkImage: "https://img.redbull.com/images/c_limit,w_1500,h_1000,f_auto,q_auto/redbullcom/2018/12/03/37b49435-79a0-4646-bc3e-f034bdb7a6d7/super-smash-bros-ultimate-promo",
    expirationDate: "24th March",
    status: false,
    dateCompleted: "Not completed yet",
    quantity: 10,
    metric: "pages",
    category: "Education",
    progress: 2
  ),
  GameTask(
    gameName: "Super Smash Bros",
    title: 'Simp challenge',
    details: 'Take a selfie with someone new',
    reward: 'New character unlocks',
    networkImage: "https://www.dexerto.com/cdn-cgi/image/width=3840,quality=60,format=auto/https://editors.dexerto.com/wp-content/uploads/2023/05/04/smash-bros-movie-concent-poster.jpg",
    expirationDate: "26th March",
    status: false,
    dateCompleted: "Not completed yet",
    quantity: 1,
    metric: "task",
    category: "Social",
    progress: 0
  ),
  GameTask(
    gameName: "Super Smash Bros",
    title: 'Flight test',
    details: 'Jump from the 40th floor',
    reward: "Copyrights to the game",
    networkImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRwvA4c5Mx9QdXHMQprzP1JspTM3v-Zr5gsQ&s",
    expirationDate: "28th March",
    status: false,
    dateCompleted: "Not completed yet",
    quantity: 1,
    metric: "task",
    category: "Strength",
    progress: 0
  ),
  GameTask(
    gameName: "Super Smash Bros",
    title: 'Nerd',
    details: 'Play chess for 20mins',
    reward: "Nerdy glasses",
    networkImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRE8DxrW-_0k2KTzlhUSGBOvCPEfYYXlSWp9w&s",
    expirationDate: "26th March",
    status: false,
    dateCompleted: "Not completed yet",
    quantity: 20,
    metric: "minutes",
    category: "Skill",
    progress: 14
  ),
  GameTask(
    gameName: "Super Smash Bros",
    title: 'Maria bros',
    details: 'Clean your vehicle for atleast 25mins',
    reward: "New vehicle",
    networkImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUE6IwvtEux8ay1947aIMoC770Lpla4Xa4sA&s",
    expirationDate: "26th March",
    status: false,
    dateCompleted: "Not completed yet",
    quantity: 25,
    metric: "minutes",
    category: "Skill",
    progress: 14
  ),
];


const dota = [
  GameTask(
    gameName: "Call of Duty",
    title: 'Marathon mania',
    details: 'Run 50 miles',
    reward: '50 credit points',
    networkImage: "https://bnetcmsus-a.akamaihd.net/cms/blog_header/ti/TI4WAD6CJ4Y51691017340326.jpg",
    expirationDate: "24th March",
    status: true,
    dateCompleted: "Not completed yet",
    quantity: 50,
    metric: "miles",
    category: "Health",
    progress: 42
  ),
  GameTask(
    gameName: "Call of Duty",
    title: 'Move your body',
    details: 'Dance for 30mins',
    reward: '20 credit points',
    networkImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXE7LUfmU4s3ooIuFUCjw0nlGBkOw61DNqnFZJJqys9g&s",
    expirationDate: "25th March",
    status: true,
    dateCompleted: "Not completed yet",
    quantity: 30,
    metric: "minutes",
    category: "Health",
    progress: 15
  ),
  GameTask(
    gameName: "Call of Duty",
    title: "Reader's time",
    details: 'Read 10 pages of Pride and Prejudice',
    reward: '10 points',
    networkImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbtDASBjQ4F7BJp-5k19S_-Ht8eWLZ0acAmQ&s",
    expirationDate: "24th March",
    status: true,
    dateCompleted: "Not completed yet",
    quantity: 10,
    metric: "pages",
    category: "Education",
    progress: 2
  ),
  GameTask(
    gameName: "Call of Duty",
    title: 'Simp challenge',
    details: 'Flirt with the opposite sex',
    reward: 'Virtual temporary girlfriend/boyfriend',
    networkImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTNWmjaNQddELp8jXIIaLINh4Icl_97gqbM7AalSPB9Q&s",
    expirationDate: "26th March",
    status: true,
    dateCompleted: "Not completed yet",
    quantity: 1,
    metric: "task",
    category: "Social",
    progress: 0
  ),
  GameTask(
    gameName: "Call of Duty",
    title: 'Flight test',
    details: 'Jump from the 3rd floor',
    reward: "Pilot's suit",
    networkImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoEyf6wfmdCXxmsU1dlC6Zgu7QS0LG75mT7w&s",
    expirationDate: "28th March",
    status: true,
    dateCompleted: "Not completed yet",
    quantity: 1,
    metric: "task",
    category: "Strength",
    progress: 0
  ),
  GameTask(
    gameName: "Call of Duty",
    title: 'Nerd',
    details: 'Play chess for 20mins',
    reward: "Nerdy glasses",
    networkImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFaVV4sOseOiCMxSt1gu1NrxQiZaPyUKGKISFEMu8mLg&s",
    expirationDate: "26th March",
    status: true,
    dateCompleted: "Not completed yet",
    quantity: 20,
    metric: "minutes",
    category: "Skill",
    progress: 14
  ),
];

var expiredList = [ 
  dota[0],
  smashBros[1],
  smashBros[3],
  dota[4],
  smashBros[4],
  dota[5],
  codTasks[1],
  smashBros[0],
  dota[2],
  smashBros[2],
  codTasks[3],
  smashBros[5],
  smashBros[6],
];