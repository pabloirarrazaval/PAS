### A Pluto.jl notebook ###
# v0.19.11

#> [frontmatter]
#> author = "Rodrigo F. Cádiz"
#> title = "Otras transformadas continuas 2D"
#> date = "2022-07-31"
#> tags = ["Señales y sistemas"]
#> description = "Pluto Notebook"

using Markdown
using InteractiveUtils

# ╔═╡ d1c7480e-e705-41d9-9bf6-15135ba97466
using PlutoUI

# ╔═╡ ca16a445-fc26-4cdc-9ca9-f0ade05928a9
md"""
!!! danger ""
    Este notebook es parte de una colección de apuntes para los cursos **IEE2103 Señales y Sistemas**, **IEE3702 Procesamiento Avanzado de Señales** y **IEE3732 Procesamiento Digital de Señales**, [Departamento de Ingeniería Eléctrica](https://www.ing.uc.cl/electrica/), [Pontificia Universidad Católica de Chile](https://www.uc.cl). 

	**Profesor: Rodrigo F. Cádiz** - Consultas y comentarios: [rcadiz@ing.puc.cl](mailto://rcadiz@ing.puc.cl)
"""

# ╔═╡ 81ac7a1e-aca7-4133-a318-4aa8a7ca1b4f
md"""
!!! warning ""
	[[Volver a la tabla de contenidos](index.jl.html)]
"""

# ╔═╡ 601e2f8a-d27d-461a-85f4-e2a533493c13
md"""
# Otras transformadas continuas en $\mathbb{R}^2$
"""

# ╔═╡ 39a9b07a-e05f-4179-ac06-35dbaa95186b
md"""
## Transformada Wavelet

La Transformada Wavelet bidimensional es una herramienta muy útil para examinar sets de datos no estacionarios en un plano o para eliminación de ruido en imágenes. En comparación con la Transformada de Fourier, la Transformada Wavelet proporciona información espectral localizada de los datos. 

El punto de partida para la Transformada Wavelet es comenzar con una función base, conocida como la **wavelet madre**. A partir de una wavelet madre  $\psi \in$ $L^{2}(\mathbb{R}^2)$, se genera una familia de wavelets transladadas, dilatadas y rotadas $\psi_{a,\mathbf{b},\theta}$.

### Condición de admisibilidad
Sean $\mathbf{x}=(x_1,x_2), \mathbf{u}=(u_1,u_2) \in \mathbb{R}^2$. La wavelet madre debe cumplir con la condición de admisibilidad:

> $$C_{\psi}=\int_{\mathbb{R}^2} |\Psi(\mathbf{u})|^{2} \frac{\mathrm{d} \mathbf{u}}{|\mathbf{u}|}<\infty$$

donde 

> $$\Psi(\mathbf{u})=\int_{\mathbb{R}^2} \psi(\mathbf{x}) \mathrm{e}^{-i 2 \pi \mathbf{u}\mathbf{x}} \mathrm{~d} \mathrm{x}$$

denota la Transformada de Fourier bi-dimensional de $\psi$. Si $\psi$ es integrable, esto es, $\psi \in$ $L^{1}(\mathbb{R^2})$, esto implica que $\psi$ tiene media cero: 

> $$\int_{\mathbb{R}^2} \psi(\mathbf{x}) \mathrm{d} \mathbf{x}=0 \quad \text { o } \quad \Psi(0)=0$$

Sea $\mathbf{x}=(x_1,x_2) \in \mathbb{R}^2$. Se define la Transformada Wavelet $\mathcal{W}$ de la función $f \in \mathrm{L}^2(\mathbb{R}^2)$ como

!!! note "Transformada Wavelet"
	$$\mathcal{W}\{f\}(a,\mathbf{b},\theta) = F_\mathcal{W}(a,\mathbf{b},\theta) = \int_{\mathbb{R}^2} f(\mathbf{x}) \psi_{a,\mathbf{b},\theta}^{*} d\mathbf{x}$$


donde las bases de la transformada, denominadas Wavelets y denotadas por $\psi$, son tales que:

!!! note "Bases de la Transformada Wavelet"
	$$\psi_{a,\mathbf{b},\theta}(\mathbf{x}) = \frac{1}{a}\psi\{\mathbf{R}_\theta^{-1}\left(\frac{\mathbf{x}-\mathbf{b}}{a}\right)\}$$

y $a$ es un factor de escalamiento, $\mathbf{b}$ es un vector de desplazamientos, y $\mathbf{R}_{\theta}$ es una matriz de rotación de ángulo $\theta$. 


!!! danger "Análisis a distintas escalas"
	Al considerar versiones escaladas de las bases de la transformada, es posible analizar en frecuencia la señal a distintas escalas, es decir un **análisis de multiresolución**. Esta es una importante diferencia respecto a la Transformada de Fourier, que no permite esta diferenciación.

La transformada inversa es

!!! note "Transformada Wavelet inversa"
	$$f(\mathbf{x})=\frac{1}{C_{\psi}} \int_{0}^{\infty} \int_{\mathbb{R}^{2}} \int_{0}^{2 \pi} F_\mathcal{W}(a, \mathbf{b}, \theta) \psi_{a, \mathbf{b}, \theta}(\mathbf{x}) \frac{\mathrm{d} a \mathrm{~d} b \mathrm{~d} \theta}{a^{3}}$$

"""

# ╔═╡ 333fed06-88ad-4bf7-9ad1-f85542331660
md"""
### Tipos de wavelets

Existen diversos tipos de wavelets que han sido propuestas y que han sido aplicadas en diversos campos donde el análisis espacio-frecuencial es relevante. Las más comunes son:


- [Gabor *(Wikipedia)*](https://en.wikipedia.org/wiki/Gabor_wavelet)
- [Morlet *(Wikipedia)*](https://en.wikipedia.org/wiki/Morlet_wavelet)
- [Haar *(Wikipedia)*](https://en.wikipedia.org/wiki/Haar_wavelet)
- [Daubechies *(Wikipedia)*](https://en.wikipedia.org/wiki/Daubechies_wavelet)


"""

# ╔═╡ 4f540839-12d6-49b8-b8ab-7494482980a0
md"""
## Transformada de Radon

Consideremos un corte en el plano bidimensional y una línea $L$ sobre ese corte. La línea se puede parametrizar mediante $x_1(s)$ y $x_2(s)$, donde $s$ es un parámetro de longitud de arco.

Para una función $f(x_1,x_2)$ la expresión

!!! note "Transformada de Radón"
	$$\mathcal{R}_f(L) = \int_{L} f(x_1,x_2) ds$$

	da un número y se denomina la Transformada de Radon de $f$ sobre la línea $L$. 

!!! danger "Proyección de una función en una línea"
	Esta transformada representa la proyección de una función hacia una línea en un plano bidimensional.

"""

# ╔═╡ e54cd182-22b9-4a44-828d-7f6ad51258d0
md"""
### Teorema de la sección central

Este teorema establece que dada una función radial $f(r)$, la Transformada de Fourier de su projección hacia una línea $L$, es decir la Transformada de Fourier de la Transformada de Radon es equivalente a primero tomar la Transformada 2D de Fourier y luego tomar un plano o un corte en espacio de Fourier en esa misma línea $L$. Es decir,

Sea $f(x,y) \in \mathbb{R}^2$, $\mathcal{F}$ la Transformada de Fourier unidimensional, $\mathcal{F}^2$ la Transformada de Fourier bidimensional, $\mathcal{R}(L)$ el operador de proyección mediante la Transformada de Radon y $\mathcal{P}(L)$ el operador de corte o plano. Entonces

!!! alert "Teorema de la sección central"
	$$\mathcal{F}\{\mathcal{R}(L)\{f\}\} = \mathcal{P}(L)\{\mathcal{F}^2\{f\}\}$$ 

Este teorema es fundamental en el campo de las imágenes médicas, en el contexto de la tomografía computarizada donde se toman proyecciones mediante rayos X de un órgano interno.

"""

# ╔═╡ 5c6a9c14-7b53-4dca-abce-9cb96496a807
md"""
## Transformada de Hankel

La Transformada Hankel expande una función radial 2D continua como una suma infinita de funciones de Bessel del primer orden $J_{0}(kr)$. Recordemos que estas funciones de Bessel son de la forma:

!!! note "Funciones de Bessel"
	$$J_{0}(k) = \frac{1}{2\pi}\int_{0}^{2\pi} e^{-i k \cos \theta} d\theta$$

Definimos la Transformada Hankel de una función radial $f(r)$ como

!!! note "Transformada de Hankel"
	$$F(k) = 2\pi \int_{0}^{\infty} f(r)J_{0}(2\pi k r) r dr$$

y la Transformada Hankel Inversa como

!!! note "Transformada de Hankel inversa"
	$$f(r) = 2 \pi \int_{0}^{\infty} F(k)J_{0}(2 \pi kr) k dk$$

### Relación con la Transformada de Fourier 2D
Esta transformada aparece cuando la Transformada de Fourier 2D se escribe en coordenadas polares. Consideremos una función radial $f(r)$. Su Transformada de Fourier es

> $$F(u,v) = \int_{\mathbb{R}^2} f(r) e^{-i 2 \pi (ux + vy)} dxdy$$

con $r = \sqrt{x^2 + y^2}$. Los límites de integración podrían ser escritos de esta manera si la función $f(r)$ cubriese todo el plano $0 < r < \infty$. Sin embargo, en la práctica es de interés considerar una función constante sobre una región circular y cero en otros lugares. En este caso, podemos escribir esta expresión en coordenadas polares. Sean $(r,\theta)$ las coordenadas polares de $x,y$. 


Entonces,

> $$F(u,v) = \int_{0}^{\infty}\int_{0}^{2\pi} f(r) e^{-i 2 \pi k r \cos(\theta - \phi)}r dr d\theta$$

En esta expresión se integra de $0$ a $\infty$ en forma radial y de $0$ a $2 \pi$ en la fase. $k,\phi$ son las coordenadas polares en el plano cartesiano:

> $$k^2 = u^2 + v^2 \,\, \text{y} \,\, \tan(\phi) = v/u$$

Las bases de Fourier en estas nuevas coordenadas tienen como argumento $2 \pi k r \cos(\theta - \phi)$ porque

> $$ux + vy = \Re\{(x+iy)(u-iv)\} = \Re\{re^{i\theta}ke^{-i\phi}\} = k r \cos(\theta - \phi)$$

Reagrupando, tenemos que:

> $$F(u,v) = \int_{0}^{\infty} f(r) \left[\int_{0}^{2\pi}  e^{-i 2 \pi k r \cos(\theta - \phi)}  d\theta \right] r dr$$

donde reconocemos que $\int_{0}^{2\pi}  e^{-i 2 \pi k r \cos(\theta - \phi)}  d\theta$ es la función de Bessel de orden cero evaluada en $2 \pi k r$.

!!! alert "Relación de Hankel con Fourier"
	Observamos que la Transformada Hankel es en realidad la Transformada de Fourier bi-dimensional cuando se evalúa en coordenadas polares.


"""

# ╔═╡ 4910333e-340e-4a2f-aeb6-424174510bf9
md"""
!!! warning ""
	[[Volver a la tabla de contenidos](index.jl.html)]
"""

# ╔═╡ e91e24fa-fa2e-46a5-a0c9-65ffb2c9b85d
md"""
***
!!! footer "Licencia"
	Estos apuntes están licenciados bajo la licencia [Creative Commons Attribution 4.0](https://creativecommons.org/licenses/by/4.0/). 

	**Como citar: Rodrigo F. Cádiz, Notebooks de Señales y Sistemas, 2022.**
"""

# ╔═╡ fd25e8e9-975a-4669-93d7-3c70b3bbcea7
md"""
!!! danger "Colaboradores y referencias"
	Estos apuntes han contado con la colaboración de Magdalena Araya y Fabián Cádiz. Parte del contenido está basado en apuntes de clases de Pablo Irarrázaval y en las siguientes [referencias bibliográficas](Referencias.jl.html).
"""

# ╔═╡ 2ab76bc4-9048-491c-b89f-2942f0fe95fd
PlutoUI.TableOfContents(title="Indice", indent=true, depth=4, aside=true)

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
PlutoUI = "~0.7.39"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "8eaf9f1b4921132a4cff3f36a1d9ba923b14a481"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.1.4"

[[ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"

[[Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "eb7f0f8307f71fac7c606984ea5fb2817275d6e4"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.4"

[[CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"

[[Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[Downloads]]
deps = ["ArgTools", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"

[[FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "8d511d5b81240fc8e6802386302675bdf47737b9"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.4"

[[HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "c47c5fa4c5308f27ccaac35504858d8914e102f9"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.4"

[[IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "f7be53659ab06ddc986428d3a9dcc95f6fa6705a"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.2"

[[InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "3c837543ddb02250ef42f4738347454f95079d4e"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.3"

[[LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"

[[LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"

[[LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"

[[Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"

[[Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"

[[NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"

[[OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"

[[Parsers]]
deps = ["Dates"]
git-tree-sha1 = "0044b23da09b5608b4ecacb4e5e6c6332f833a7e"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.3.2"

[[Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"

[[PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "UUIDs"]
git-tree-sha1 = "8d1f54886b9037091edf146b517989fc4a09efec"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.39"

[[Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"

[[Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"

[[Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[Tricks]]
git-tree-sha1 = "6bac775f2d42a611cdfcd1fb217ee719630c4175"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.6"

[[UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"

[[libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"

[[nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"

[[p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
"""

# ╔═╡ Cell order:
# ╟─ca16a445-fc26-4cdc-9ca9-f0ade05928a9
# ╟─81ac7a1e-aca7-4133-a318-4aa8a7ca1b4f
# ╟─601e2f8a-d27d-461a-85f4-e2a533493c13
# ╟─39a9b07a-e05f-4179-ac06-35dbaa95186b
# ╟─333fed06-88ad-4bf7-9ad1-f85542331660
# ╟─4f540839-12d6-49b8-b8ab-7494482980a0
# ╟─e54cd182-22b9-4a44-828d-7f6ad51258d0
# ╟─5c6a9c14-7b53-4dca-abce-9cb96496a807
# ╟─4910333e-340e-4a2f-aeb6-424174510bf9
# ╟─e91e24fa-fa2e-46a5-a0c9-65ffb2c9b85d
# ╟─fd25e8e9-975a-4669-93d7-3c70b3bbcea7
# ╟─d1c7480e-e705-41d9-9bf6-15135ba97466
# ╟─2ab76bc4-9048-491c-b89f-2942f0fe95fd
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
