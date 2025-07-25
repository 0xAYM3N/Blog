import { z, defineCollection, type CollectionEntry } from 'astro:content'

const postsCollection = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    pubDate: z.string(),
    tags: z.array(z.string()),
    thumbnail: z.string(),
  }),
})

export const collections = {
  posts: postsCollection,
}

export type Post = CollectionEntry<'posts'>
