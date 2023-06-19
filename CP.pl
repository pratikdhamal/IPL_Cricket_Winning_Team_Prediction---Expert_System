%venues(ID, name, location, pitch_report, venue_avg_score, matches_played, wins_bat_first, wins_field_first)

venues(1, 'Chinnaswamy Stadium', 'Bengaluru', ['bounce'], 171, 43.37, 55.42).
venues(2, 'Arun Jetli Stadium', 'Delhi', ['bounce'], 164.1, 43.37, 55.42).
venues(3, 'Narendra Modi Stadium', 'Ahmedabad', ['red_soil'], 165.4, 42, 58).
venues(4, 'Wankhede Stadium', 'Mumbai', ['red_soil'], 167.7, 45.79, 54.2).
venues(5, 'Chidambaram Stadium', 'Chennai', ['spin'], 162.8, 61.64, 38.35).
venues(6, 'HPCA Stadium', 'Mohali', ['swing'], 175.7, 45, 55).
venues(7, 'Eden Gardens', 'Kolkata', ['black_soil'], 163.4, 40.96, 59.03).
venues(8, 'Sawai Mansingh Stadium', 'Jaipur', ['bounce'], 157.6, 33.33, 66.66).
venues(9, 'Rajiv Gandhi International Stadium', 'Hyderabad', ['spin'], 158.4, 43.66, 53.52).
venues(10, 'Atal Bihari Vajpayee Stadium', 'Lucknow', ['black_soil'], 152, 83.33, 16.66).


% Define the team names as a list
team_names([royal_challengers_bangalore, chennai_super_kings, mumbai_indians, gujarat_titans, lucknow_super_giants, sunrisers_hyderabad, punjab_kings, delhi_capitals, kolkata_knight_riders, rajasthan_royals]).

% team(ID, name, ranking, home_venueId)

team(1,rcb,5,1).
team(2,csk,4,5).
team(3,mi,9,4).
team(4,gt,1,3).
team(5,lsg,3,10).
team(6,srh,8,9).
team(7,pbks,6,6).
team(8,dc,10,2).
team(9,kkr,7,7).
team(10,rr,2,8).

% weather(option, day/night, climate)

weather(1, [day, night], clear).
weather(2, [day, night], overcast).
weather(3, [night], humid).


% key_players(team_ID, players)
key_players(1, ['Glenn Maxwell', 'Faf Du Plessis', 'Virat Kohli', 'Mohammad Siraj', 'Michael Bracewell', 'Wayne Parnell']).
key_players(2, ['Devon Conway', 'Ruturaj Gaikwad', 'Moeen Ali', 'Ben Stokes', 'Matheesha Pathirana', 'Shivam Dube']).
key_players(3, ['Suryakumar Yadav', 'Cameron Green', 'Jasprit Bumrah', 'Tilak Verma', 'Tim David', 'Jofra Archer']).
key_players(4, ['Shubman Gill', 'Hardik Pandya', 'David Miller', 'Rashid Khan', 'Mohammad Shami']).
key_players(5, ['KL Rahul', 'Quinton De Kock', 'Nicholas Pooran', 'Marcus Stoinis']).
key_players(6, ['Aiden Markram', 'Bhuvneshwar Kumar', 'Heinrich Klaasen', 'Umran Malik', 'Rahul Tripathi']).
key_players(7, ['Shikhar Dhawan', 'Liam Livingstone', 'Sam Curran', 'Johny Bairstow', 'Nathan Ellis']).
key_players(8, ['David Warner', 'Anrich Nortje', 'Rishabh Pant', 'Axar Patel']).
key_players(9, ['Jason Roy', 'Andre Russell', 'Shreyas Iyer', 'Varun Chakaravarthy']).
key_players(10, ['Jos Buttler', 'Sanju Samson', 'Yashasvi Jaiswal', 'Yuzvendra Chahal']).

% Predicate to display the key players in a team
display_key_players(TeamId) :-
    key_players(TeamId, KeyPlayers),
    write("Key players for Team "), write(TeamId), write(": "),
    write(KeyPlayers), nl.

% Predicate to display the result of the comparison
display_result(Order) :-
    Order =:= 0,
    write("Both teams have an equal number of key players.").
display_result(Order) :-
    Order < 0,
    write("The first team has fewer key players than the second team.").
display_result(Order) :-
    Order > 0,
    write("The first team has more key players than the second team.").


% Define a predicate to get the name of a team given its ID
get_team_name(TeamID, TeamName) :-
    team_names(TeamNames),
    nth1(TeamID, TeamNames, TeamName).

% ----------------------User Input--------------------------------

% Define the predict_match predicate to read the team numbers and display their names
predict_match(Winner) :- 
    write('Which two teams are playing:\n\n'),
    write('1 - Royal Challengers Bangalore\n'),
    write('2 - Chennai Super Kings\n'),
    write('3 - Mumbai Indians\n'),
    write('4 - Gujarat Titans\n'),
    write('5 - Lucknow Super Giants\n'),
    write('6 - Sunrisers Hyderabad\n'),
    write('7 - Punjab Kings\n'),
    write('8 - Delhi Capitals\n'),
    write('9 - Kolkata Knight Riders\n'),
    write('10 - Rajasthan Royals\n\n'),
    read(T1),
    read(T2),
    team(T1, _, _, Home1),
    team(T2, _, _, Home2),

    get_team_name(T1, Team1Name), 
    get_team_name(T2, Team2Name),
    write('\n'),
    write('--------------------------------------------------------'),
    write('\n'),
    write(Team1Name),
    write(' vs '),
    write(Team2Name),
    write('\n'),
    write('--------------------------------------------------------'),
    write('\n\n'),

    write('Which venue will the match be played at?
    1 - Chinnaswamy Stadium    
    2 - Arun Jetli Stadium    
    3 - Narendra Modi Stadium    
    4 - Wankhede Stadium    
    5 - Chidambaram Stadium  
    6 - HPCA Stadium    
    7 - Eden Gardens    
    8 - Sawai Mansingh Stadium    
    9 - Rajiv Gandhi International Stadium    
    10 - Atal Bihari Vajpayee Stadium
    \n\n'),
    read(Venue),
    write(Venue),

    venues(Venue, VenueName, _, _, _, Stat1, Stat2),
    write('\nMatch between '),
    write(Team1Name), write(' and '), write(Team2Name), write(' at '),
    write(VenueName), write('\n\n'),
    (Home1 = Venue -> 
        write(Team1Name), write(' is playing at home ground \n')
    ;
    Home2 = Venue -> 
        write(Team2Name), write(' is playing at home ground \n')
    ;
    write('\nBoth teams are not playing at their home grounds\n')
    ),

    write('\nSelect weather conditions:\n'),
    write('1 - (day/night, clear)\n'),
    write('2 - (day/night, overcast)\n'),
    write('3 - (night, humid)\n\n'),
    read(Weather),
    (
        Weather = 1 ->
        write('\nWeather condition chosen: (day/night, clear)\n')
        ;
        Weather = 2 ->
        write('\nWeather condition chosen: (day/night, overcast)\n')
        ;
        Weather = 3 ->
        write('\nWeather condition chosen: (night, humid)\n')
        ;
        write('Invalid choice, please select again.\n'),
        predict_match(M)
    ),

    write('\n'),
    display_key_players(T1),
    write("\nEnter the number of key players in the first team: "),
    read(NumKeyPlayers1),
    write('\n'),
    display_key_players(T2),
    write("\nEnter the number of key players in the second team: "),
    read(NumKeyPlayers2),

    write('\n\nWho won the toss?\n'),
    write(Team1Name),
    write('('),
    write(T1),
    write(')'),
    write(' or '),
    write(Team2Name),
    write('('),
    write(T2),
    write(')'),
    write('\n'),
    read(TossWinner),
    ((TossWinner =:= T1, TossWinnerName = Team1Name, TossLoserName = Team2Name);
    (TossWinner =:= T2, TossWinnerName = Team2Name, TossLoserName = Team1Name)),
    write('\n'),
    write(TossWinnerName),
    write(' won the toss and chose to '),
    write('bat (1)'),
    write(' or '),
    write('bowl (2)'),
    write('\n'),
    read(TossDecision),
    ((TossDecision =:= 1, TossDecisionName = 'bat first');
    (TossDecision =:= 2, TossDecisionName = 'bowl first')),
    write('\n'),
    write(TossWinnerName),
    write(' won the toss and chose to '),
    write(TossDecisionName),
    write('\n\n'),

    write('\nHow many spinners and pacers does '),
    write(Team1Name),
    write(' have? (Enter spinners first, then pacers)\n'),
    read(T1SPINNERS),
    read(T1PACERS),
    write('\nHow many spinners and pacers does '),
    write(Team2Name),
    write(' have? (Enter spinners first, then pacers)\n'),
    read(T2SPINNERS),
    read(T2PACERS),

    predict_match_winner(T1, T2, Venue, TossWinner, TossDecision, Stat1, Stat2, NumKeyPlayers1, NumKeyPlayers2, T1PACERS, T1SPINNERS, T2PACERS, T2SPINNERS, Home1, Home2, Weather, Winner).


predict_match_winner(T1, T2, Venue, TossWinner, TossDecision, Stat1, Stat2, NumKeyPlayers1, NumKeyPlayers2, T1PACERS, T1SPINNERS, T2PACERS, T2SPINNERS, Home1, Home2, Weather, Winner) :-
    % Get team information
    team(T1, T1Name, T1Ranking, T1HomeVenue),
    team(T2, T2Name, T2Ranking, T2HomeVenue),
    
    % Get venue information
    venues(Venue, VenueName, _, VenuePitchReport, VenueAvgScore, _, _),
    
    % Get home team for the venue
    %(T1HomeVenue = Venue, HomeTeam = T1Name; T2HomeVenue = Venue, HomeTeam = T2Name),
    
    % Calculate pitch score
    ((T1PACERS =:= T2PACERS, T1SPINNERS =:= T2SPINNERS, T1_pitch is 0, T2_pitch is 0);
    (member('black_soil', VenuePitchReport), T2SPINNERS > T1SPINNERS, T2SPINNERS > T2PACERS, T2_pitch is 15, T1_pitch is 5);
    (member('black_soil', VenuePitchReport), T1SPINNERS > T2SPINNERS, T1SPINNERS > T1PACERS, T2_pitch is 5, T1_pitch is 15);
    (member('spin', VenuePitchReport), T2SPINNERS > T1SPINNERS, T2SPINNERS > T2PACERS, T2_pitch is 15, T1_pitch is 5);
    (member('spin', VenuePitchReport), T1SPINNERS > T2SPINNERS, T1SPINNERS > T1PACERS, T2_pitch is 5, T1_pitch is 15);
     (member('red_soil', VenuePitchReport), T2PACERS > T1PACERS, T2PACERS > T2SPINNERS, T2_pitch is 15, T1_pitch is 5);
     (member('red_soil', VenuePitchReport), T1PACERS > T2PACERS, T1PACERS > T1SPINNERS, T2_pitch is 5, T1_pitch is 15);
     (member('swing', VenuePitchReport), T2PACERS > T1PACERS, T2PACERS > T2SPINNERS, T2_pitch is 15, T1_pitch is 5);
     (member('swing', VenuePitchReport), T1PACERS > T2PACERS, T1PACERS > T1SPINNERS, T2_pitch is 5, T1_pitch is 15);
     (member('bounce', VenuePitchReport), T2PACERS > T1PACERS, T2PACERS > T2SPINNERS, T2_pitch is 15, T1_pitch is 5);
     (member('bounce', VenuePitchReport), T1PACERS > T2PACERS, T1PACERS > T1SPINNERS, T2_pitch is 5, T1_pitch is 15);
     T1_pitch is 0, T2_pitch is 0 
     ),

     write('t1 pitch - '),
     write(T1_pitch),
     write('t2 pitch - '),
     write(T2_pitch),
    
    
    % Calculate home team advantage
    ((Home1 =:= Venue, T1_Home is 5, T2_Home is 0);
    (Home2 =:= Venue, T1_Home is 5, T2_Home is 0);
     T1_Home is 0, T2_Home is 0),
    
    % Calculate team rankings score
    (T1_rankscore is 2*(10 - T1Ranking),
     T2_rankscore is 2*(10 - T2Ranking)),


    % key player factor
    (Key_Score_1 is (NumKeyPlayers1)*3,
     Key_Score_2 is (NumKeyPlayers2)*3),

    % toss factor
    
    ((TossWinner =:= T1, TossDecision =:= 1, Stat1 > 50, Toss1 is 12, Toss2 is 0);
    (T1 =:= TossWinner, TossDecision =:= 2, Stat2 > 50, Toss1 is 12, Toss2 is 0);
    (T2 =:= TossWinner, TossDecision =:= 1, Stat1 > 50, Toss2 is 12, Toss1 is 0);
    (T2 =:= TossWinner, TossDecision =:= 2, Stat2 > 50, Toss2 is 12, Toss1 is 0);
    Toss1 is 0, Toss2 is 0
    ),

    % weather factor
    ((Weather =:= 1, T1SPINNERS > T2SPINNERS, WeatherScore1 is 15, WeatherScore2 is 10);
    (Weather =:= 1, T2SPINNERS > T1SPINNERS, WeatherScore2 is 15, WeatherScore1 is 10);
    (Weather =:= 2, T1PACERS > T2PACERS, WeatherScore1 is 15, WeatherScore2 is 10);
    (Weather =:= 2, T1PACERS > T2PACERS, WeatherScore2 is 15, WeatherScore1 is 10);
    (Weather =:= 3, TossWinner =:= T1, TossDecision =:= 1,  WeatherScore1 is 10, WeatherScore2 is 15);
    (Weather =:= 3, TossWinner =:= T1, TossDecision =:= 2,  WeatherScore1 is 15, WeatherScore2 is 10);
    (Weather =:= 3, TossWinner =:= T2, TossDecision =:= 1,  WeatherScore1 is 10, WeatherScore2 is 15);
    (Weather =:= 3, TossWinner =:= T2, TossDecision =:= 2,  WeatherScore1 is 15, WeatherScore2 is 10);
    WeatherScore1 is 0, WeatherScore2 is 0
    ),

    write('t1 toss - '),
    write(Toss1),
    write('t1 toss - '),
    write(Toss2),
    
    % Calculate final scores and predict winner
    T1Score is T1_Home +  T1_pitch + WeatherScore1 + T1_rankscore + Key_Score_1 + Toss1,
    T2Score is T2_Home + T2_pitch + WeatherScore2 + T2_rankscore + Key_Score_2 + Toss2,
    write('T1Score - '),
    write(T1Score),
    write('\n'),
    write('T2Score - '),
    write(T2Score),
    write('\n'),
    (T1Score > T2Score, Winner = T1Name;
     T2Score > T1Score, Winner = T2Name;
    Winner=tie),
    write('Ranking Score - '),
    write(RankingScore),
    write('\n'),
    write('Wiining TEam Prediction\n'),
    write(Winner).