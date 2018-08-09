# SQL Checkpoint Notes: Installing

Here, I will document my experience with the SQL checkpoints at <span>Bloc</span>.io.

## Installation

The provided link doesn't contain clear instructions for Ubuntu users. [This](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-18-04) article from DigitalOcean is what I used and seems to be a great source provided by a reputable company. It uses `apt` which might be better for Ubuntu.

Running the following did not work:

```
createdb -U postgres -w inventory
```

`postgres` is created as a user account in Ubuntu, so you first have to log into that account:

```
sudo -i -u postgres
```

Then you can run `createdb -w invenory` to create the database with the postgres user.

According to the article above, this method of authentication is called <i>ident authentication</i>.

<b>The checkpoint seems to assume postgres has no password. In Windows and Ubuntu the default password is `password`.</b>

In Ubuntu it's not enough to just toss in `postgres` at the end to run psql as the postgres user.

For example, the following didn't work:

```
psql inventory postgres
```

Instead, it should be run like this:

```
sudo -u postgres psql inventory
```

Or log into the postgres user first and then run `psql inventory`.
