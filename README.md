# How to create and use join tables

These examples use Magic cards, where a card can have many colors and each color can be on many cards, i.e. many-to-many relationship.

## 1. Create the tables

We will have 3 tables:
- listings
- colors
- colors_listing (the join table)

By convention the join table is named with the component tables in alphabetical order, with the first table plural and the second singular, separated by an underscore.

>rails g model Listing name:string price:integer
>rails g model Color color:string
>rails g model ColorsListing listing:references color:references

## 2. Write in the associations

The association for the join table are already written into colors_listing.rb because we  wrote listing:references and color:references in the terminal command.

In color.rb:
>has_many :colors_listings
>has_many :listings, through: :colors_listings

In listing.rb
>has_many :colors_listings
>has_many :listings, through: :colors_listings

Note the plurals on colors_listings when after a has_many.

## 3. Test in rails console

Create a listing
>Listing.create(name: "card1", price: 10)

Check DBeaver to see if the record was created.

Create the colors
>Color.create(color: "Red")
>Color.create(color: "White")
>Color.create(color: "Green")
>Color.create(color: "Black")
>Color.create(color: "Blue")
>Color.create(color: "Colorless")

CHeck DBeaver to see if the records were created.

Give an individual listing record a color
>Listing.last.colors << Color.find(4)

Check DBeaver. There should be no changes to the colors or listings tables. The join table should have a record with the listing_id and associated color_id.