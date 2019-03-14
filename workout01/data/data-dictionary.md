
## Data `player.csv`

Here's the description of the data variables:

- `team_name`: name of the team, eg "Golden State Warriors"
- `game_date`: date game was played, in MM/DD/YY
- `season`: season of the game, "2016" for all games in the 2016-2017 season
- `period`: period or quarter of the game, eiher "1", "2", "3", or "4"
- `minutes_remaining`: minutes remaining in the period
- `seconds_remaining`: seconds remaining in the current minute
- `shot_made_flag`: "y" if the shot was made, "n" if the shot was missed
- `action_flag`: description of the shot itself, eg "Jump Shot"
- `shot_type`: either a 2PT or 3PT field goal
- `shot_distance`: how far from the basket the player was when shooting
- `opponent`: full team name of the opposing team
- `x`: x coordinate of location on the court where the shot was taken, with the rim as the origin
- `y`: y coordinate of location on the court where the shot was taken, with the rim as the origin
