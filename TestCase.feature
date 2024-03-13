Feature: BetSlip Functionality
    As a user
    I want to be able to add, remove, and adjust bets in my betslip
    So that I can place bets on different events and manage my selections


    Scenario: Book Bet For Family and friends sharing
        Given user is signed into "https://www.efbet.net"
        When user clicks the match "Chelsea vs Burnley" in the "Premier League" under "Football" in "England"
        And user selects "1x" for Double Chance as a single bet for the event
        And user clicks the "Book Bet" button
        Then user should have a booking code generated so it can be shared with friends to bet on same games and options selected
        And they should be able to enter the booking code on the betslip page to preview picks before betting. (We don't have this feature on efbet now though)


    Scenario: Adding a Single Bet to BetSlip
        Given user is signed into "https://www.efbet.net"
        When user clicks the match "Chelsea vs Burnley" in the "Premier League" under "Football" in "England"
        And user select "1x" for Double Chance as a single bet for the event
        Then user should see the bet successfully added to my betslip


    Scenario: View Open Bets
        Given user added a bet to his betslip
        When user clicks on "Open Bets"
        Then user should be able to see all open bets


    Scenario: User Attempts to Place Bet with Insufficient Balance
        Given user is signed into "https://www.efbet.net"
        When user clicks the match "Chelsea vs Burnley" in the "Premier League" under "Football" in "England"
        And user selects "1x" for Double Chance as a single bet for the event
        And user attempts to place the bet with amount higher than my current balance
        Then user should see an error message indicating insufficient balance
        And user should be able to start deposit process by clicking the "Deposit" button on the betslip


    Scenario: Adding Multiple Bets for different events to BetSlip
        Given user is signed into "https://www.efbet.net"
        When user clicks the match "Chelsea vs Burnley" in the "Premier League" under "Football" in "England"
        And user selects "1x" for Double Chance as a single bet for the event
        And user navigates backward to select the match "Arsenal vs Westham"
        And user selects "Yes" for Both teams to score as a single bet for the event
        Then user should see both bets successfully added to betslip


    Scenario: Adding Multiple Bets for same events to BetSlip
        Given user is signed into "https://www.efbet.net"
        When user clicks the match "Chelsea vs Burnley" in the "Premier League" under "Football" in "England"
        And user selects "1x" for Double Chance as a single bet for the event
        And user selects "Yes" for Both teams to score as a bet for the same event
        Then user should see both bets added to betslip
        And user should see warning symbols on the betslip with text "Highlighted events cannot be combined"


    Scenario: Removing a Bet from my BetSlip
        Given user is signed into "https://www.efbet.net"
        When user clicks the match "Chelsea vs Burnley" in the "Premier League" under "Football" in "England"
        And user selects "1x" for Double Chance as a single bet for the event
        And user navigates backward to select the match "Arsenal vs Westham"
        And user select "Yes" for Both teams to score as a single bet for the event
        And user clicks the "Cancel" button on the pick for Arsenal vs Westham on the betslip
        Then user should see the bet removed from the betslip
        And user should only have pick for Chelsea on the bet slip


    Scenario: Removing all Bet from BetSlip
        Given user is signed into "https://www.efbet.net"
        When user clicks the match "Chelsea vs Burnley" in the "Premier League" under "Football" in "England"
        And user selects "1x" for Double Chance as a single bet for the event
        And user navigates backward to select the match "Arsenal vs Westham"
        And user selects "Yes" for Both teams to score as a single bet for the event
        And user clicks the "Remove All" button on his bet slip
        Then user should see both bets removed with betslip cleared.


    Scenario: Adjusting Stake for a Bet
        Given user is signed into "https://www.efbet.net"
        When user clicks the match "Chelsea vs Burnley" in the "Premier League" under "Football" in "England"
        And user selects "1x" for Double Chance as a single bet for the event
        And user adjusts stake from 500 to 2000
        Then user should see the potential win updated accordingly


    Scenario: Using suggested amounts to stake
        Given user is signed into "https://www.efbet.net"
        When user clicks the match "Chelsea vs Burnley" in the "Premier League" under "Football" in "England"
        And user select "1x" for Double Chance as a single bet for the event
        And user clicks 10 at the buttom of my betslip
        Then user should see the total stake as 10 with potential returns calculated accurately


    Scenario: Editing suggested amount on my betslip
        Given user is signed into "https://www.efbet.net"
        When user clicks the match "Chelsea vs Burnley" in the "Premier League" under "Football" in "England"
        And user selects "1x" for Double Chance as a single bet for the event
        And user clicks the edit button at the buttom of my betslip to modify any of the suggested stake
        And user clicks the check mark button
        Then user should see the modified stake updated successfully


    Scenario: Placing bet when betslip is empty
        Given users' betslip is empty
        When user try to place a bet
        Then user should get a message "Your betslip is empty"


    Scenario: Placing bet with Invalid Stake Amount
        Given user have added a bet to the betslip
        When user enters 0 as stake amount
        Then user should see an error message indicating the invalid stake amount with the "Bet Now" button greyed out


    Scenario: Users Opinion to odd changes
        Given user have added bets to the bet slip
        And user navigates to the bet slip
        When user click the "Always ask" button
        Then user should have the options of selecting "Accept Higher odds", "Accept any odds", as well as "Always Ask"


    Scenario: Toggle counter offer On
        Given user added bets to the bet slip
        And user navigates to my bet slip
        When user clicks the "counter offer" toggle
        Then user should have counter offer toggled On
        And user should be able to enter his offer


    Scenario: Trigger MAX stake
        Given user is signed into "https://www.efbet.net"
        When user clicks the match "Chelsea vs Burnley" in the "Premier League" under "Football" in "England"
        And user selects "1x" for Double Chance as a single bet for the event
        And user click the "MAX" button on the betslip
        Then user should see Stake and Potential win updated accordingly






