Feature: Sending liquidity info with an identifier

  Scenario: Liquidity info with indentifier on protocol V05
    Given a network with nodes "Alice" and "Custodian" able to mint
    When node "Custodian" generates a NuBit address "cust"
    And node "Alice" votes an amount of "1,000,000" for custodian "cust"
    And node "Alice" finds blocks until custodian "cust" is elected
    And all nodes reach the same height
    And node "Custodian" sends a liquidity of "1000" buy and "2000" sell on unit "B" from address "cust" with identifier "A"
    Then node "Alice" should reach a total liquidity info of "1000" buy and "2000" sell on unit "B"
    And 1 second passes
    And node "Custodian" sends a liquidity of "10" buy and "5" sell on unit "B" from address "cust" with identifier "B"
    Then node "Alice" should reach a total liquidity info of "1010" buy and "2005" sell on unit "B"

    When node "Custodian" restarts
    And 1 second passes
    And node "Custodian" sends a liquidity of "1" buy and "2" sell on unit "B" from address "cust" with identifier "A"
    Then node "Alice" should reach a total liquidity info of "1" buy and "2" sell on unit "B"

  Scenario: Liquidity info with indentifier on protocol 2.0
    Given a network with nodes "Alice" and "Custodian" able to mint
    And the network is at protocol 2.0
    When node "Custodian" generates a NuBit address "cust"
    And node "Alice" votes an amount of "1,000,000" for custodian "cust"
    And node "Alice" finds blocks until custodian "cust" is elected
    And all nodes reach the same height
    And node "Custodian" sends a liquidity of "1000" buy and "2000" sell on unit "B" from address "cust" with identifier "A"
    Then node "Alice" should reach a total liquidity info of "1000" buy and "2000" sell on unit "B"
    And 1 second passes
    And node "Custodian" sends a liquidity of "10" buy and "5" sell on unit "B" from address "cust" with identifier "B"
    Then node "Alice" should reach a total liquidity info of "1010" buy and "2005" sell on unit "B"

    When node "Custodian" restarts
    And 1 second passes
    And node "Custodian" sends a liquidity of "1" buy and "2" sell on unit "B" from address "cust" with identifier "A"
    Then node "Alice" should reach a total liquidity info of "11" buy and "7" sell on unit "B"
