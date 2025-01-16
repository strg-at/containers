import { Octokit } from "@octokit/core"

const args = JSON.parse(process.argv.slice(2)[0])

const headers = {
  "X-GitHub-Api-Version": "2022-11-28",
  Accept: "application/vnd.github+json",
}

const octokit = new Octokit({
  auth: process.env.GITHUB_TOKEN,
})

try {
  const response = await octokit.request(
    "GET /repos/{owner}/{repo}/pulls{?state,head,base,sort,direction,per_page,page}",
    {
      owner: `${args.OWNER}`,
      repo: `${args.REPO}`,
      state: "open",
      head: `${args.OWNER}:${args.BRANCH}`,
      base: `${args.BASE}`,
      headers,
    }
  )

  if (response.data.length === 0) {
    console.log(JSON.stringify({ message: "success" }))
    process.exit(0)
  }

  const review = await octokit.request(
    "POST /repos/{owner}/{repo}/pulls/{pull_number}/reviews",
    {
      owner: `${args.OWNER}`,
      repo: `${args.REPO}`,
      pull_number: response.data[0].number,
      headers,
    }
  )

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

  await octokit.request("PUT /repos/{owner}/{repo}/pulls/{pull_number}/merge", {
    owner: `${args.OWNER}`,
    repo: `${args.REPO}`,
    pull_number: response.data[0].number,
    headers,
  })
  console.log(JSON.stringify({ message: "success" }))
} catch (error) {
  console.error(error)
  process.exit(1)
}
