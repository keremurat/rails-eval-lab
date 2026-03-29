# Program

You are working inside an evaluation-driven system.

## Goal

Improve the performance of the `UserDataFetcher` service.

## Context

- The service is located at `app/services/user_data_fetcher.rb`
- It fetches users along with their associated data (profiles, posts, comments)
- The database has 10 users, 30 posts, and 60 comments (see `db/seeds.rb`)
- The current implementation is functionally correct but may have performance issues

## Rules

- Only modify: `app/services/user_data_fetcher.rb`
- Do not change models, tests, schema, or seeds
- All improvements must be measurable
- The output format must remain identical

## Evaluation Criteria

- Total number of SQL queries executed
- Execution time
- Memory efficiency

## Process

1. Analyze the current implementation
2. Measure baseline performance
3. Identify bottlenecks
4. Apply improvements incrementally
5. Measure and compare after each change
6. Keep or revert based on results

## Important

- Do not attempt to solve everything in one step
- Prefer incremental improvements
- Document your reasoning in `claude.md`