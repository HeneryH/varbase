Feature: Landing page (Paragraphs) - Add any paragraph types to the page
As a logged in user with a permission to mange Landing pages
I want to be able to add any paragraph type to the page
So that the Landing page (Paragraphs)" will show up having paragrpahs of different types

 @local @development @staging @production
  Scenario: Upload the "Embed Flag Earth" file
     Given I am a logged in user with the "test_site_admin" user
      When I go to "media/add/image"
       And I wait
      Then I should see "Allowed types: png gif jpg jpeg."
      When I attach the file "flag-earth.jpg" to "edit-field-media-image-0-upload"
       And I wait
       And I press the "Save" button
       And I wait
       And I fill in "Embed Flag Earth in space" for "field_media_image[0][alt]"
       And I fill in "Embed Flag Earth all earth in space" for "field_media_image[0][title]"
       And I fill in "Embed Flag Earth" for "name[0][value]"
       And I check the box "Show in media library"
       And I press the "Save" button
       And I wait
      Then I should see "Embed Flag Earth"
  #-----------------------------------------------------------------------------

  @javascript @local @development @staging @production
  Scenario: Check Varbase Bootstrap Paragraphs settings
    Given I am a logged in user with the "webmaster" user
     When I go to "/admin/config/varbase/varbase-bootstrap-paragraphs"
      And I wait
     Then I should see "Varbase Bootstrap Paragraphs settings"
      And I should see "Available CSS styles (classes) for Varbase Bootstrap Paragraphs"
      And I press "Save configuration"
     Then I should see "The configuration options have been saved."

  @javascript @local @development @staging @production
  Scenario: Check if a user with a permission to manage Landing page (Paragraphs) content type can add paragraphs of type Drupal Block
    Given I am a logged in user with the "test_site_admin" user
     When I go to "node/add/landing_page"
      And I wait
      And I fill in "Test Landing page Drupal Block" for "Title"
      And I fill in "Test Landing page description Drupal Block" for "Page description"
      And I wait for AJAX to finish
      And I wait for 1 second
      And I press "Add Component"
      And I wait for AJAX to finish
      And I wait for 1 second
      And I select the "bp_block" paragraph component
      And I wait for AJAX to finish
     Then I should see "Block"
     When I select "Site branding" from "Block"
      And I wait
      And I select "published" from "edit-moderation-state-0-state"
      And I press the "Save" button
      And I wait
     Then I should see "Landing page (Paragraphs) Test Landing page Drupal Block has been created"

  @javascript @local @development @staging @production
  Scenario: Check if a user with a permission to manage Landing page (Paragraphs) content type can add paragraphs of type Columns Equal
    Given I am a logged in user with the "test_site_admin" user
     When I go to "node/add/landing_page"
      And I wait
      And I fill in "Test Landing page Columns (Equal)" for "Title"
      And I fill in "Test Landing page description Columns (Equal)" for "Page description"
      And I wait for AJAX to finish
      And I wait for 1 second
      And I press "Add Component"
      And I wait for AJAX to finish
      And I wait for 1 second
      And I select the "bp_columns" paragraph component
      And I wait for AJAX to finish
      And I select "published" from "edit-moderation-state-0-state"
      And I press the "Save" button
      And I wait
     Then I should see "Landing page (Paragraphs) Test Landing page Columns (Equal) has been created"

  @javascript @local @development @staging @production
  Scenario: Check if a user with a permission to manage Landing page (Paragraphs) content type can add paragraphs of type Columns Two Uneven
    Given I am a logged in user with the "test_site_admin" user
     When I go to "node/add/landing_page"
      And I wait
      And I fill in "Test Landing page Columns (Two Uneven)" for "Title"
      And I fill in "Test Landing page description Columns (Two Uneven)" for "Page description"
      And I wait for AJAX to finish
      And I wait for 1 second
      And I press "Add Component"
      And I wait for AJAX to finish
      And I wait for 1 second
      And I select the "bp_columns_two_uneven" paragraph component
      And I wait for AJAX to finish
      And I select "published" from "edit-moderation-state-0-state"
      And I press the "Save" button
      And I wait
     Then I should see "Landing page (Paragraphs) Test Landing page Columns (Two Uneven) has been created"

  @javascript @local @development @staging @production
  Scenario: Check if a user with a permission to manage Landing page (Paragraphs) content type can add paragraphs of type Modal
    Given I am a logged in user with the "test_site_admin" user
     When I go to "node/add/landing_page"
      And I wait
      And I fill in "Test Landing page Modal" for "Title"
      And I fill in "Test Landing page description Modal" for "Page description"
      And I wait for AJAX to finish
      And I wait for 1 second
      And I press "Add Component"
      And I wait for AJAX to finish
      And I wait for 1 second
      And I select the "bp_modal" paragraph component
      And I wait for AJAX to finish
     Then I should see "Components"
     When I fill in "Modal button" for "Modal button text"
      And I fill in "Modal title" for "Modal title"
      And I press "Add Component"
      And I wait for AJAX to finish
      And I select the "bp_simple" paragraph component
      And I wait
      And I wait for AJAX to finish
      And I wait for 1 second
     Then I should see "Modal body"
     When I fill in the rich text editor field "Text" with "Modal Body test"
      And I select "published" from "edit-moderation-state-0-state"
      And I press the "Save" button
     Then I should see "Landing page (Paragraphs) Test Landing page Modal has been created"
     When I press "Modal button"
      And I wait for AJAX to finish
      And I wait 2 seconds
     Then I should see "Modal title"

  @javascript @local @development @staging @production
  Scenario: Check if a user with a permission to manage Landing page (Paragraphs) content type can add paragraphs of type Rich Text
    Given I am a logged in user with the "test_site_admin" user
     When I go to "node/add/landing_page"
      And I wait
      And I fill in "Test Landing page Rich Text" for "Title"
      And I fill in "Test Landing page description Rich Text" for "Page description"
      And I wait for AJAX to finish
      And I wait for 1 second
      And I press "Add Component"
      And I wait for AJAX to finish
      And I wait for 1 second
      And I select the "bp_simple" paragraph component
      And I wait for AJAX to finish
     Then I should see "Components"
     When I fill in the rich text editor field "Text" with "Rich Text test"
      And I select "published" from "edit-moderation-state-0-state"
      And I press the "Save" button
      And I wait
     Then I should see "Landing page (Paragraphs) Test Landing page Rich Text has been created"
      And I should see "Rich Text test"

  @javascript @local @development @staging @production
  Scenario: Check if a user with a permission to manage Landing page (Paragraphs) content type can add paragraphs of type Tabs
    Given I am a logged in user with the "test_site_admin" user
     When I go to "node/add/landing_page"
      And I wait
      And I fill in "Test Landing page Tabs" for "Title"
      And I fill in "Test Landing page description Tabs" for "Page description"
      And I wait for AJAX to finish
      And I wait for 1 second
      And I press "Add Component"
      And I wait for AJAX to finish
      And I wait for 1 second
      And I select the "bp_tabs" paragraph component
      And I wait for AJAX to finish
     Then I should see "Components"
     When I fill in "Tab 1" for "Tab name"
      And I press "Add Component"
      And I wait for AJAX to finish
      And I select the "bp_simple" paragraph component
      And I wait
     Then I should see "Tab body"
      And I fill in the rich text editor field "Text" with "Tab 1 - Body test"
      And I select "published" from "edit-moderation-state-0-state"
      And I press the "Save" button
      And I wait
     Then I should see "Landing page (Paragraphs) Test Landing page Tabs has been created"
      And I should see "Tab 1"

  @javascript @local @development @staging @production
  Scenario: Check if a user with a permission to manage Landing page (Paragraphs) content type can add paragraphs of type WebForm
    Given I am a logged in user with the "test_site_admin" user
     When I go to "node/add/landing_page"
      And I wait
      And I fill in "Test Landing page WebForm" for "Title"
      And I fill in "Test Landing page description WebForm" for "Page description"
      And I wait for AJAX to finish
      And I wait for 1 second
      And I press "Add Component"
      And I wait for AJAX to finish
      And I wait for 1 second
      And I select the "bp_webform" paragraph component
      And I wait for AJAX to finish
     Then I should see "Components"
     When I select "Contact" from "Webform"
      And I wait
      And I select "published" from "edit-moderation-state-0-state"
      And I press the "Save" button
      And I wait
     Then I should see "Landing page (Paragraphs) Test Landing page WebForm has been created"
