_This soulution is for when you have tried all else, and just want something that works._

1. Disconnect all existing network shares.
2. Press Win+R.
3. Type `shell:startup`, and hit `enter` or press `OK`.
4. Create an new file called `start.cmd`.
5. In that file paste this:
`net use Z: \\REMOTECOMPUTER\SHARE /user:REMOTECOMPUTER\USER MySuperStrongPassword`
6. Save and close that file.


***Notes!:*** On step 5 change these items to match your environment:
{: .notice--warning}

| From this value         | To this value |
|-------------------------|------------------------------------------------------------------|
| `Z`                     | to the letter you want to use |
| `REMOTECOMPUTER`        | to the name of the computer you are connectiong to |
| `SHARE`                 | to the name of the share on the remote computer/server |
| `USER`                  | to the username that you shall use on the remote computer/server |
| `MySuperStrongPassword` | to the password for that user |
