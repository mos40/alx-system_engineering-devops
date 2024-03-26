# using puppet to make changes to the default ssh config file
# so that one can connect to a server without typing a password.
include stdlib

file_line { 'Add SSH Private Key':
  path               => '/etc/ssh/ssh_config',
  line               => '    IdentityFile ~/.ssh/school',
  match              => '^[#]*[\s]*(?i)IdentityFile[\s]+~/.ssh/id_rsa$',
  replace            => true,
  append_on_no_match => true
}

# Explanation of the Regex Match:
#
# ^         - Start of the line
# [#]*      - Zero or more hash characters
# [\s]*     - Zero or more white space characters
# (?i)      - Case-insensitive matching
# IdentityFile - Matching "IdentityFile"
# [\s]+     - One or more whitespace characters
# ~/.ssh/id_rsa - Path to the SSH private key file to replace
# $         - End of the line

file_line { 'Deny Password Authentication':
  path               => '/etc/ssh/ssh_config',
  line               => '    PasswordAuthentication no',
  match              => '^[#]*[\s]*(?i)PasswordAuthentication[\s]+(yes|no)$',
  replace            => true,
  append_on_no_match => true
}

# Explanation of the Regex Match:
#
# ^         - Start of the line
# [#]*      - Zero or more hash characters
# [\s]*     - Zero or more white space characters
# (?i)      - Case-insensitive matching
# PasswordAuthentication - Matching "PasswordAuthentication"
# [\s]+     - One or more whitespace characters
# (yes|no)  - Matching either "yes" or "no" for the value
# $         - End of the line
