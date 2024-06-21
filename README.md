User          Register Page     Verification Service     Decision      Login Page     Authentication Service     Reset Password Page
 |                  |                     |                     |                |                  |                           |
 | --Access Form Register--> |             |                     |                |                  |                           |
 | <---Display form---------- |             |                     |                |                  |                           |
 | --Submit form------------->|             |                     |                |                  |                           |
 |                            | --Send code->|                     |                |                  |                           |
 |                            | <---Display code form-------------|                |                  |                           |
 | --Submit code------------->|             | --Check code validity-->|           |                  |                           |
 |                            | <---------------------Valid/Invalid-|               |                  |                           |
 | <---Display message--------|             |                     |                |                  |                           |
 |                            |             | <--------Option to resend code----| |                  |                           |
 |                            |             |                     |                |                  |                           |
 |                            | --Confirm verification->|         |                |                  |                           |
 |                            | ---->Redirect to login screen---| |                |                  |                           |
 |                            |                     |             |                |                  |                           |
 | --Access login screen----->|                     |             |                |                  |                           |
 | <---Display login options--|                     |             |                |                  |                           |
 |                            | --Select login option--------------|                |                  |                           |
 | --Submit email/phone------>|                     |             |                |                  |                           |
 |                            | --Check validity----->|           |                |                  |                           |
 |                            | <---------Valid/Invalid-|         |                |                  |                           |
 | <---Display message--------|                     |             |                |                  |                           |
 |                            | --Submit password----->|           |                |                  |                           |
 |                            | --Validate password----->|         |                |                  |                           |
 |                            | <---------Valid/Invalid-|         |                |                  |                           |
 | <---Display message--------|                     |             |                |                  |                           |
 | --Select forgot password-->|                     |             |                |                  |                           |
 | <---Display email form-----|                     |             |                |                  |                           |
 | --Submit email------------>|                     | --Send code->|                |                  |                           |
 |                            |                     | <---Display code form--------|                  |                           |
 | --Submit code------------->|                     | --Check code validity-------->|                  |                           |
 |                            |                     | <---------Valid/Invalid------|                  |                           |
 | <---Display message--------|                     |             |                |                  |                           |
 |                            |                     | <--------Option to resend code--------------|                           |
 |                            | --Redirect to new password form-------------------|                  |                           |
 | --Submit new password----->|                     |             |                | --Update password--->|                     |
 | <---Password reset success--|                     |             |                |                  |                           |
 | --Redirect to login screen->|                     |             |                |                  |                           |
