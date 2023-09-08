## Jira handy tips and tricks

### JQL queries

#### Find all child issues of parent using Scriptrunner

```sql
# where MDC-27 is the highest level parent
# https://community.atlassian.com/t5/Jira-questions/JQL-query-to-find-child-issues-of-Initiative/qaq-p/461409

issuekey in portfolioChildIssuesOf(MDC-27)
```
