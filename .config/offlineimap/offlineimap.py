'''
gkgetsecret.py
This provides a handful of functions for retrieving secrets from GNOME Keyring
using the libsecret API. See the documentation for each function
'''

from gi import require_version
require_version('Secret', '1')
from gi.repository import Secret

def get_pw_from_desc(pw_desc) :
    '''
    This function returns the password for an item in the default keyring
    which contains the description provided.
    Use this function if you created a password using the dialogue in Seahorse
    '''
    # Get service
    service = Secret.Service.get_sync(Secret.ServiceFlags.LOAD_COLLECTIONS)

    # Get default keyring
    keyring = Secret.Collection.for_alias_sync(service, "default", \
          Secret.CollectionFlags.NONE, None)

    # Get keyring items
    items = keyring.get_items()

    # Load secrets
    Secret.Item.load_secrets_sync(items)

    # Loop through items, find the matching one and return its password
    password = None
    for item in items :
        if item.get_label() == pw_desc :
            password = item.get_secret().get_text()
            break

    # Close connection
    service.disconnect()

    return password

def get_pw_from_attrs(*attr_val_pairs) :
    '''
    This function returns the password for an item in the default keyring
    which contains all of the attribute value pairs provided as arguments.
    Use this function if you created a password using the secret-tool command
    or another such program that interfaces with libsecret
    '''
    # Check the list of attr-val pairs is present and contains an even number
    # of elements
    if attr_val_pairs == () :
        raise TypeError("get_pw_from_attrs() at least 1 attribute-value pair " \
                "must be supplied")
    if len(attr_val_pairs) % 2 != 0 :
        raise TypeError("get_pw_from_attrs() incomplete attribute-value " \
                "pair was supplied")

    # Get service
    service = Secret.Service.get_sync(Secret.ServiceFlags.LOAD_COLLECTIONS)

    # Get default keyring
    keyring = Secret.Collection.for_alias_sync(service, "default", \
          Secret.CollectionFlags.NONE, None)

    # Get keyring items
    items = keyring.get_items()

    # Load secrets
    Secret.Item.load_secrets_sync(items)

    # Loop through items, find the one which contains all supplied attr_val
    # pairs and return its password
    password = None
    for item in items :
        attrs = item.get_attributes()
        match = True
        for x in range(0, len(attr_val_pairs), 2) :
            key = attr_val_pairs[x]
            value = attr_val_pairs[x + 1]
            try :
                if attrs[key] != value :
                    match = False
                    break
            except KeyError :
                match = False
                break
        if match :
            password = item.get_secret().get_text()
            break

    # Close connection
    service.disconnect()

    return password

def get_val_from_attrs(attr, *attr_val_pairs) :
    '''
    This function returns the value for a given attribute. The first item
    found that contains that attribute will be the one that is used. To ensure
    that the correct item is chosen, any number of attribute-value pairs can
    be optionally supplied as arguments and only the item which contains all
    of those attr-val pairs (along with the main attr) will be used.
    Use this function if you created a password using the secret-tool command
    or another such program that interfaces with libsecret
    '''
    # Check the list of attr-val pairs contains an even number of elements
    # if it exists
    if attr_val_pairs != () :
        if len(attr_val_pairs) % 2 != 0 :
            raise TypeError("get_val_from_attrs() incomplete attribute-value " \
                    "pair was supplied")

    # Get service
    service = Secret.Service.get_sync(Secret.ServiceFlags.LOAD_COLLECTIONS)

    # Get default keyring
    keyring = Secret.Collection.for_alias_sync(service, "default", \
          Secret.CollectionFlags.NONE, None)

    # Get keyring items
    items = keyring.get_items()

    # Loop through items, find the one which contains the supplied attribute
    # (plus any attr_val pairs if specified) and return that attribute's
    # value
    attr_value = None
    for item in items :
        attrs = item.get_attributes()
        try :
            attrs[attr]
        except KeyError :
            continue
        match = True
        for x in range(0, len(attr_val_pairs), 2) :
            key = attr_val_pairs[x]
            value = attr_val_pairs[x + 1]
            try :
                if attrs[key] != value :
                    match = False
                    break
            except KeyError :
                match = False
                break
        if match :
            attr_value = attrs[attr]
            break

    # Close connection
    service.disconnect()

    return attr_value
