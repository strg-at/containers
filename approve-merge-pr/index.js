/**
 * GitHub PR approval and merge automation script
 * This script finds, approves, and merges pull requests based on provided parameters
 */
import { Octokit } from "@octokit/core"

// Parse command line arguments from JSON string
// Format: '{"OWNER": "owner", "REPO": "repo", "BRANCH": "feature-branch", "BASE": "main"}'
const args = JSON.parse(process.argv.slice(2)[0])

// Set standard headers for GitHub API requests
// see https://docs.github.com/en/rest/overview/api-versions
const headers = {
  "X-GitHub-Api-Version": "2022-11-28",
  Accept: "application/vnd.github+json",
}

// Initialize authenticated GitHub API client
const octokit = new Octokit({
  auth: process.env.GITHUB_TOKEN,
})

try {
  // Find open pull requests matching criteria
  const response = await octokit.request("GET /repos/{owner}/{repo}/pulls", {
    owner: `${args.OWNER}`,
    repo: `${args.REPO}`,
    state: "open",
    head: `${args.OWNER}:${args.BRANCH}`,
    base: `${args.BASE}`,
    headers,
  })

  // Exit successfully if no matching PRs found
  if (response.data.length === 0) {
    console.log(JSON.stringify({ message: "success" }))
    process.exit(0)
  }

  // Create a review for the first matching pull request
  const review = await octokit.request(
    "POST /repos/{owner}/{repo}/pulls/{pull_number}/reviews",
    {
      owner: `${args.OWNER}`,
      repo: `${args.REPO}`,
      pull_number: response.data[0].number,
      headers,
    }
  )

  // Submit the review as an approval with comment
  await octokit.request(
    "POST /repos/{owner}/{repo}/pulls/{pull_number}/reviews/{review_id}/events",
    {
      owner: `${args.OWNER}`,
      repo: `${args.REPO}`,
      pull_number: response.data[0].number,
      review_id: review.data.id,
      body: "auto-approved by terraform release helper",
      event: "APPROVE",
      headers,
    }
  )

  // Merge the approved pull request
  await octokit.request("PUT /repos/{owner}/{repo}/pulls/{pull_number}/merge", {
    owner: `${args.OWNER}`,
    repo: `${args.REPO}`,
    pull_number: response.data[0].number,
    headers,
  })

  // Report success after all operations complete
  console.log(JSON.stringify({ message: "success" }))
} catch (error) {
  // Log error details and exit with failure code
  console.error(error)
  process.exit(1)
}
