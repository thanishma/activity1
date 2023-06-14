#!/bin/bash

contact_file="contact.txt"
add_contact() {
    read -p "Enter the contact name: " name
    read -p "Enter the contact phone number: " phone
    echo "$name:$phone" >> "$contact_file"
    echo "Contact added successfully."
}
list_contacts() {
    echo "Contacts:"
    if [[ -s "$contact_file" ]]; then
        cat -n "$contact_file"
    else
        echo "No contacts found."
    fi
}
search_contact() {
    read -p "Enter the contact name to search: " search_name
    echo "Search results:"
    if [[ -s "$contact_file" ]]; then
        grep -i "$search_name" "$contact_file"
    else
        echo "No contacts found."
    fi
}
delete_contact() {
    read -p "Enter the contact number to delete: " contact_number
    sed -i "${contact_number}d" "$contact_file"
    echo "Contact deleted successfully."
}
while true; do
    echo "Contacts"
    echo "-----------------------"
    echo "1. Add Contact"
    echo "2. List Contacts"
    echo "3. Search Contact"
    echo "4. Delete Contact"
    echo "5. Quit"
    read -p "Enter your choice: " choice
    case $choice in
        1)
            add_contact
            ;;
        2)
            list_contacts
            ;;
        3)
            search_contact
            ;;
        4)
            delete_contact
            ;;
        5)
            echo "bye!"
            exit 0
            ;;
        *)
            echo "Invalid"
            ;;
    esac
    echo
done
