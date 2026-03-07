# CLAUDE.md — TypeScript Web Project

## Project Context

- **Repo:** web-dashboard
- **Purpose:** Internal dashboard for monitoring application metrics
- **Stack:** TypeScript, React 19, Next.js 15, Tailwind CSS, Prisma
- **Status:** v0.1 — Prototype

## Language

- All code, comments, and docs in English

## Code Style

- `camelCase` for variables and functions
- `PascalCase` for components, classes, and types
- `kebab-case` for file and directory names
- Prefer `const` over `let`, never use `var`
- Strict TypeScript (`strict: true`)
- Named exports over default exports
- Prefer interfaces over type aliases for object shapes
- `prettier` for formatting, `eslint` for linting

## Git Workflow

- Feature branches only
- Conventional Commits: `feat:`, `fix:`, `style:`, `refactor:`
- Run `npm run typecheck && npm test` before committing

## Architecture

- App Router (Next.js 15)
- Server Components by default, Client Components only when needed
- Data fetching in Server Components, mutations via Server Actions
- Shared UI components in `components/ui/`
- Business logic in `lib/`
- Database queries in `lib/db/`

## Component Patterns

- One component per file
- Props interface named `<ComponentName>Props`
- Use composition over prop drilling
- Tailwind for styling — no CSS modules or styled-components

## Testing

- Vitest for unit tests
- React Testing Library for component tests
- Test file naming: `<component>.test.tsx`
- Test behavior, not implementation

## Security

- Never commit `.env.local` or credentials
- Sanitize all user input before rendering
- Use Prisma parameterized queries — no raw SQL with user input
- API routes validate input with zod
