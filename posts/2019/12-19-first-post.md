==title==
First Post

==author==
Hans Hoffman

==description==
Today we create shit...

==tags==
elixir, phoenix

==body==
Does this *support* markdown?

- a
- b
- c

```elixir
posts_path =
    "posts/**/*.md"
    |> Path.wildcard()
    |> Enum.sort()
```
