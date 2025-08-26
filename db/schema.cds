namespace com.sap.learning;

using {
     cuid,
     managed,
     Currency,
     Country,
     sap.common.CodeList
     } from '@sap/cds/common';

entity Books : cuid, managed { // Inherit from cuid
    // key ID          : UUID;
        title       : localized String(255);
        author      : Association to Authors;
        genre       : Genre;
        // publCountry : String(3); // Change to Country if you want to use the full entity
        publCountry : Country;
        stock       : NoOfBooks;
        price       : Price;
        isHardcover : Boolean;
}

type Genre     : Integer enum {
    fiction     = 1;
    non_fiction = 2;
}

type NoOfBooks : Integer;

type Price {
    amount   : Decimal;
    currency : Currency;
}


entity Authors : cuid, managed { // Inherit from cuid
    // key ID          : UUID;
        name        : String(100);
        dateOfBirth : Date;
        dateOfDeath : Date;
        Epochs : Association to Epochs;
        Books       : Association to many Books
                    on Books.author = $self
}

entity Epochs : CodeList, cuid {
    //key ID: Integer
}