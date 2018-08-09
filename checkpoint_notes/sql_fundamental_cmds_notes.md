# SQL Checkpoint Notes: Installing

Here, I will document my experience with the SQL checkpoints at <span>Bloc</span>.io.

---

# Errors:

- The checkpoint references `id`, but in the actual data it is `productid`. Minor annoyance.

- `SET DEFAULT` doesn't work in ALTER TABLE command:

```sql
inventory=# ALTER TABLE products ADD COLUMN description text SET DEFAULT 'None';
ERROR:  syntax error at or near "SET"
LINE 1: ALTER TABLE products ADD COLUMN description text SET DEFAULT...
```

- What works is removing the `SET` so that it is only `DEFAULT`:

```sql
inventory=# ALTER TABLE products ADD COLUMN description text DEFAULT 'None';
ALTER TABLE
```

---
