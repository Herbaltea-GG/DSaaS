# Dart-Sass as a Service (DSaaS)
Dart-Sass as a service. Runs a container that quickly ingests/compiles scss and then disappears.
  
I'm not joking when I say I made this just to use `@use`

---

## Usage
Run the example
```sh
docker run --rm -v $PWD/example:/sass herbaltea/dsaas:latest
```
  
Send flags to dart-sass
```sh
docker run --rm -e dart_flags="--no-source-map" -v $PWD/example:/sass herbaltea/dsaas:latest
```

More specific locations is cool too
```sh
docker run --rm -v <Path to Sass>:/sass/ingress -v <Path to Output>:/sass/compiled herbaltea/dsaas:latest
```

### Thanks To
> @michalklempa - (https://github.com/michalklempa/docker-dart-sass)
  
> @jnovack - (https://github.com/jnovack/docker-multi-arch-hooks)

I referenced these repos heavily for guidance as was able to use the build hooks which saved an immense amount of time.
