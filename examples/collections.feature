Feature: Collections
  Scenario: Use collections as a function
    Given a file named "main.cloe" with:
    """
    (seq!
      (write ([123 [456 789] "foo" true nil false] 2))
      (write ({123 [456 789] "foo" "It's me." nil false} "foo"))
      (write ("Hello, world!" 6)))
    """
    When I successfully run `cloe main.cloe`
    Then the stdout should contain exactly:
    """
    [456 789]
    It's me.
    ,
    """

  Scenario: Chain indexing
    Given a file named "main.cloe" with:
    """
    (write ({"foo" {"bar" 42}} "foo" "bar"))
    """
    When I successfully run `cloe main.cloe`
    Then the stdout should contain exactly:
    """
    42
    """
