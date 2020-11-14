# Dart-Sass as a Service (DSaaS)
Dart-Sass as a service. Runs a vm that quickly ingests/compiles scss and then disappears.
  
I'm not joking when I say I made this just to use `@use`

---

## Usage
Run the example
```sh
docker run --rm -v $PWD/example:/sass herbaltea/dsaas:latest
```
  
   
More specific locations is cool too
```sh
docker run --rm -v <Path to Sass>:/sass/ingress -v <Path to Output>:/sass/compiled herbaltea/dsaas:latest
```
