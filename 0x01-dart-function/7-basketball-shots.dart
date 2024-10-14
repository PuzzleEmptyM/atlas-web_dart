int whoWins(Map<String, int> teamA, Map<String, int> teamB) {
  // Calculate total points for team A
  int teamAPoints = (teamA['Free throws']! * 1) +
                    (teamA['2 pointers']! * 2) +
                    (teamA['3 pointers']! * 3);
  
  // Calculate total points for team B
  int teamBPoints = (teamB['Free throws']! * 1) +
                    (teamB['2 pointers']! * 2) +
                    (teamB['3 pointers']! * 3);
  
  // Compare scores
  if (teamAPoints > teamBPoints) {
    return 1;
  } else if (teamAPoints < teamBPoints) {
    return 2;
  } else {
    return 0;
  }
}
