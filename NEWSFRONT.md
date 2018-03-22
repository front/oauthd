# Newsfront

The **oauthd** is one of the **Newsfront** support daemons.

Check the running processes with `$ pm2 list`. Process **oauthd** should be in the list.

## Setup (only needed once)

First, make sure `node` and `redis` are installed. Clone the Frontkom **authd** repo (this one!) and install the required dependencies.

```
$ cd ~
$ git clone https://github.com/front/oauthd
...
$ cd oauthd
$ npm install
...
$ npm run build
...
$ cd ..
```

Setup a new instance. Name it `newsfront-auth`. It will create a new folder for the instance.

```
$ ./oauthd/oauthd init
...
```

Edit the **config.local.js** and set the host url (must match the vhost) and random salts.

```
$ cd newsfront-auth
$ nano config.local.js
```

Start the **oauthd** server using the new instance.

```
$ ../oauthd/oauthd start
```

## Deployment

#### Start the app with PM2

If it's not running, you can start the app with the following command.

```
$ cd ~/newsfront-auth
$ pm2 start ../oauthd/oauthd --name=oauthd -- start
```

This should start a **pm2** process with the **oauthd** server.

```
┌──────────┬────┬──────┬───────┬────────┬─────────┬────────┬─────┬───────────┬───────┬──────────┐
│ App name │ id │ mode │ pid   │ status │ restart │ uptime │ cpu │ mem       │ user  │ watching │
├──────────┼────┼──────┼───────┼────────┼─────────┼────────┼─────┼───────────┼───────┼──────────┤
│ oauthd   │ 0  │ fork │ 21198 │ online │ 1       │ 70s    │ 0%  │ 70.9 MB   │ front │ disabled │
└──────────┴────┴──────┴───────┴────────┴─────────┴────────┴─────┴───────────┴───────┴──────────┘
```

#### Restart the app

```
$ pm2 restart oauthd
```

#### Stop the app

```
$ pm2 stop oauthd
```

#### Remove the app from PM2

```
$ pm2 delete oauthd
```


## Admin UI
There is no UI for changing the password. The first username and password entered will have to be used on subsequent logins.
Check LastPass for credentials.

* Production: [http://auth.newsfront.no/](http://auth.newsfront.no/)
* Staging: [http://auth.nf.devz.no/](http://auth.nf.devz.no/)
