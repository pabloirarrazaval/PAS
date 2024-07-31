### A Pluto.jl notebook ###
# v0.19.11

#> [frontmatter]
#> author = "Rodrigo F. Cádiz"
#> title = "Extensión a Rn"
#> date = "2022-07-31"
#> tags = ["Señales y sistemas"]
#> description = "Pluto Notebook"

using Markdown
using InteractiveUtils

# ╔═╡ ca1b4f33-1efa-48f3-b527-5e8d452346fd
using PlutoUI

# ╔═╡ c45bc7ce-341c-4066-ac3f-95c12f8f3d48
md"""
!!! danger ""
    Este notebook es parte de una colección de apuntes para los cursos **IEE2103 Señales y Sistemas**, **IEE3702 Procesamiento Avanzado de Señales** y **IEE3732 Procesamiento Digital de Señales**, [Departamento de Ingeniería Eléctrica](https://www.ing.uc.cl/electrica/), [Pontificia Universidad Católica de Chile](https://www.uc.cl). 

	**Profesor: Rodrigo F. Cádiz** - Consultas y comentarios: [rcadiz@ing.puc.cl](mailto://rcadiz@ing.puc.cl)
"""

# ╔═╡ fc64783f-f9fd-4d6f-b383-f488fc93c0c6
md"""
***
!!! warning ""
	[[Volver a la tabla de contenidos](index.jl.html)]
"""

# ╔═╡ ab489690-c04f-4dbe-b7ef-dc16b363d5ca
md"""
# Extensión a $\mathbb{R}^n$

Tal como es posible definir y operar con [señales](PAS-A-Senales_2D.jl.html) y [transformadas](PAS-A-Fourier_2D.jl.html) en $\mathbb{R}^2$, de la misma forma pueden estos conceptos ser extendidos a un espacio de $n$ dimensiones, es decir $\mathbb{R}^n$.
"""

# ╔═╡ 4ad870a0-85e0-4c23-a181-ac06c579fc6f
md"""
## Señales en $\mathbb{R}^n$

Una señal $f \in \mathbb{R}^n$ se define como una función de la forma

!!! note "Señales"
	$$f\left(x_{1}, \ldots, x_{n}\right)$$

	donde $f:\mathbb{R}^n \rightarrow \mathbb{R}$ o bien $f:\mathbb{R}^n \rightarrow \mathbb{C}$.

	Si definimos la variable $n$-dimensional $\mathbf{x} = (x_{1}, x_{2}, \ldots, x_{n}) \in \mathbb{R}^n$, entonces una señal se puede anotar en forma compacta como

	$$f(\mathbf{x})$$

"""

# ╔═╡ dcbf7fec-1851-474e-af2a-985d32198ab8
md"""
## Sistemas en $\mathbb{R}^n$

Podemos concebir sistemas que operan sobre señales en $\mathbb{R}^n$. En este caso los denotamos en forma vectorial como

!!! note "Sistemas"
	$$g(\mathbf{x}) = \mathcal{S}\{f\}(\mathbf{x})$$

	o bien

	$$f(\mathbf{x}) \xrightarrow{\mathcal{S}} g(\mathbf{x})$$

	donde $\mathcal{S}$ denota un sistema en particular.

"""

# ╔═╡ e5b8965d-13af-408b-aba8-9ce5fc380175
md"""
## Producto punto

Definimos el producto punto, interno o escalar entre dos vectores en $\mathbb{R}^n$ como

!!! note "Producto punto" 
	$$\mathbf{x} \cdot \mathbf{\xi}=x_{1} \xi_{1}+x_{2} \xi_{2}+\cdots+x_{n} \xi_{n}$$

"""

# ╔═╡ 8db99e3c-ea6a-4d00-88a3-4c3d9dfe840f
md"""
## Impulso en $\mathbb{R}^n$

La distribución impulso en $\mathbb{R}^n$ puede definirse en forma análoga a los casos [uni](SS-A-Impulso.jl.html) o [bidimensionales](PAS-A-Impulso_2D.jl.html). Es decir,

!!! note "Distribución delta o impulso"
	$$\langle\delta, \varphi\rangle=\varphi(0, \ldots, 0)$$

	o en notación vectorial

	$$\langle\delta, \varphi\rangle=\varphi(\mathbf{0})$$

	donde $\varphi\left(x_{1},, \ldots, x_{n}\right)$ es una función de Schwartz

Relajando la notación, estas nociones típicamente se expresan como 

> $$\int_{\mathbb{R}^{n}} \varphi(\mathbf{x}) \delta(\mathbf{x}) d \mathbf{x}=\varphi(\mathbf{0})$$

"""

# ╔═╡ 4719a1c7-f6ba-4926-abc9-d4db93c928fd
md"""
### Propiedades del impulso

Las propiedades conocidas el impulso para una o dos dimensiones, se mantienen en el caso $n$-dimensional. Por ejemplo, la propiedad del muestreo 

!!! note "Propiedad del muestreo"
	$$f(\mathbf{x}) \delta=f(\mathbf{0}) \delta$$

o de la convolución

!!! note "Propiedad de la convolución"
	$$(f * \delta)(\mathbf{x})=f(\mathbf{x})$$
"""

# ╔═╡ 9efc4439-3fac-4ecb-b927-053bf528fbbb
md"""
### Impulso desplazado

La distribución $\delta$ desplazada puede definirse mediante el operador de desplazamiento $\tau$:

!!! note "Impulso desplazado"
	$$\delta_{\mathbf{b}}=\tau_{\mathbf{b}} \delta$$ 

	o en una notación menos estricta

	$$\delta(\mathbf{x}-\mathbf{b})=\delta\left(x_{1}-b_{1}, x_{2}-b_{2},\ldots, x_{n}-b_{n}\right)$$

Esta distribución tiene las propiedades

> $$f(\mathbf{x}) \delta_{\mathbf{b}}=f(\mathbf{b})\delta_{\mathbf{b}}$$

y también

> $$f * \delta_{\mathbf{b}}=f * \tau_{\mathbf{b}} \delta=\tau_{\mathbf{b}} f=f(\mathbf{x}-\mathbf{b})$$

"""

# ╔═╡ 89faf1cb-8b8c-4e3b-952b-cc06c4cb923c
md"""
### Separabilidad

En muchos casos, es de utilidad separar el impulso mediante el producto tensor. Entonces, podemos escribir

!!! note "Separabilidad"
	$$\delta\left(x_{1}, x_{2}, \ldots, x_{n}\right)=\delta_{1}\left(x_{1}\right) \otimes \delta_{2}\left(x_{2}\right) \otimes \cdots \otimes \delta_{n}\left(x_{n}\right)$$


!!! danger "Composición del impulso en diferentes dimensiones"
	Es importante tener en mente que en general las distribuciones no pueden ser multiplicadas, sin embargo en el caso de la distribución $\delta$, esta idea cobra sentido utilizando el producto tensor, dado que el efecto de cada impulso es posible de entener como una composición del efecto de aplicar un impulso en cada una de las $n$ dimensiones.
"""

# ╔═╡ 874f5ef8-f998-4367-a1d8-d1a4c06d1ea5
md"""
## Transformada de Fourier en $\mathbb{R}^n$

Podemos concebir la Transformada continua de Fourier en $n$ dimensiones de la siguiente forma:

> $$\mathcal{F} f\left(\xi_{1}, \xi_{2}, \ldots, \xi_{n}\right)=\int_{\mathbb{R}^{n}} e^{-2 \pi i\left(x_{1} \xi_{1}+\cdots+x_{n} \xi_{n}\right)} f\left(x_{1}, \ldots, x_{n}\right) d x_{1} \ldots d x_{n}$$

"""

# ╔═╡ b0e15e80-1586-4197-a9a2-bb63372e22ba
md"""
donde el vector

> $$\mathbf{\xi}=\left(\xi_{1}, \xi_{2}, \ldots, \xi_{n}\right)$$

puede interpretarse como las variables de frecuencia duales de las variables  $\mathbf{x}$. La dimensión de $\xi_{i}$ es el recíproco de la dimensión de $x_{i}$

En forma más compacta, la Transformada de Fourier de una señal en $\mathbb{R}^n$ de $f(\mathbf{x})$ es la función $\mathcal{F}\{f\}(\xi)$ definida por 

!!! note "Transformada de Fourier" 
	$$\mathcal{F}\{f\}(\mathbf{\xi})=\int_{\mathbb{R}^{n}} e^{-2 \pi i \mathbf{x} \cdot \xi} f(\mathbf{x}) d \mathbf{x}$$

La Transformada de Fourier inversa está dada por:

!!! note "Transformada inversa de Fourier"
	$$\mathcal{F}^{-1}\{f\}(\mathbf{x})=\int_{\mathbb{R}^{n}} e^{2 \pi i \mathbf{x} \cdot \mathbf{\xi}} \mathcal{F}\{f\}(\xi) d \xi$$

"""

# ╔═╡ a45375b1-9905-4248-b187-e954a1c2c741
md"""
### Separabilidad

En muchos casos es posible escribir una función de $n$ variables $f\left(x_{1}, \ldots, x_{n}\right)$ como un producto de $n$ funciones de una sola variable:

> $$f\left(x_{1}, \ldots, x_{n}\right)=f_{1}\left(x_{1}\right) f_{2}\left(x_{2}\right) \cdots f_{n}\left(x_{n}\right)$$

Esta idea es central al método de separación de variables en la solución de ecuaciones diferenciales parciales.

Cuando una función es separable, su Transformada de Fourier se puede calcular como el producto de las Transformadas de Fourier unidimensionales sobre cada variable, por lo que:

!!! note "Transformada de Fourier separable"
	$$\mathcal{F}\{f\}\left(\xi_{1}, \xi_{2}, \ldots, \xi_{n}\right)=\mathcal{F} \{f_{1}\}\left(\xi_{1}\right) \mathcal{F}\{f_{2}\}\left(\xi_{2}\right) \cdots \mathcal{F}\{f_{n}\}\left(\xi_{n}\right)$$
"""

# ╔═╡ 11474d1a-2baf-4ea2-97fd-62c4769e941a
md"""

 ### Escalamiento y desplazamiento. 

Utilizando los operadores de escalamiento $\sigma_{A}$ y de desplazamiento $\tau_b$, entonces se cumple que:

!!! note "Escalamiento y desplazamiento"
	$$\begin{align}\mathcal{F}\{\left(\sigma_{A}\left(\tau_{\underline{b}} f\right)\right)\}(\xi)=\frac{1}{|\operatorname{det} A|} \mathcal{F}\{\left(\tau_{\underline{b}} f\right)\}\left(A^{-\top} \xi\right) \\ =\frac{1}{|\operatorname{det} A|} \exp \left(-2 \pi i A^{-\mathrm{T}} \underline{\xi} \cdot \underline{b}\right) \mathcal{F} \{f\}\left(A^{-\top} \xi\right)\end{align}$$

"""

# ╔═╡ af9eaa84-db36-4898-bc6d-7853e887a6a6
md"""
### Derivadas

Al considerar señales de $n$ dimensiones, la operación derivar implica muchas derivadas parciales. Sin embargo, el criterio general se mantiene: la Transformada de Fourier intercambia derivación por multiplicación.

Por lo tanto:

!!! note "Derivadas" 
	$$\begin{aligned}\frac{\partial}{\partial \xi_{k}} \mathcal{F}\{f\}(\xi) &=\mathcal{F}\{-2 \pi i x_{k} f\}(\mathbf{x}) \\ \mathcal{F}\{\frac{\partial}{\partial x_{k}} f\}(\xi) &=2 \pi i \xi_{k} \mathcal{F}\{f\}(\mathbf{\xi})\end{aligned}$$
"""

# ╔═╡ ac6054f2-ce5d-401b-a078-21ef1efe1f91
md"""
### Convolución


Para dos funciones $f, g \in \mathbb{R}^{n}$ se tiene que

!!! note "Convolución"
	$$(f * g)(\mathbf{x})=\int_{\mathbb{R}^{n}} f(\mathbf{x}-\mathbf{a}) g(\mathbf{a}) d \mathbf{a}$$

En forma adicional, la propiedades de la convolución y multplicación de la Transformada de Fourier, se mantienen:

!!! note "Convolución intercambia multiplicación"
	$$\mathcal{F}\{(f * g)\}(\mathbf{\xi})=\mathcal{F}\{f\}(\mathbf{\xi}) \mathcal{F}\{g\}(\xi) \quad \text { y } \quad \mathcal{F}\{(f g)\}(\xi)=(\mathcal{F}\{f\} * \mathcal{F}\{g\})(\mathbf{\xi})$$

"""

# ╔═╡ a3f103b2-1b1d-4f7b-9a09-b1fde1c0189b
md"""
### Parseval-Plancherel

En $n$ dimensiones, las identidades de Parseval-Plancherel se mantienen, es decir

!!! note "Identidad de Parseval-Plancherel"
	$$\begin{aligned} \int_{\mathbb{R}^{n}} f(\mathbf{x}) g^{\ast}(\mathbf{x}) d \mathbf{x} &=\int_{\mathbb{R}^{n}} \mathcal{F}\{f\}(\mathbf{\xi}) \mathcal{F}^{\ast} \{g\}(\xi) d \xi \\ \int_{\mathbb{R}^{n}}|f(\mathbf{x})|^{2} d \mathbf{x} &=\int_{\mathbb{R}^{n}}|\mathcal{F}\{f\}(\mathbf{\xi})|^{2} d \xi\end{aligned}$$

"""

# ╔═╡ ae004e92-2214-4179-8598-c88e50f546a6
md"""
***
!!! warning ""
	[[Volver a la tabla de contenidos](index.jl.html)]
"""

# ╔═╡ a18bfce8-1088-40e9-97d8-56e92ffafb4d
md"""
***
!!! footer "Licencia"
	Estos apuntes están licenciados bajo la licencia [Creative Commons Attribution 4.0](https://creativecommons.org/licenses/by/4.0/). 

	**Como citar: Rodrigo F. Cádiz, Notebooks de Señales y Sistemas, 2022.**
"""

# ╔═╡ a1ba123c-f291-480c-a8b9-44c0d316ecde
md"""
!!! danger "Colaboradores y referencias"
	Estos apuntes han contado con la colaboración de Magdalena Araya y Fabián Cádiz. Parte del contenido está basado en apuntes de clases de Pablo Irarrázaval y en las siguientes [referencias bibliográficas](Referencias.jl.html).
"""

# ╔═╡ f13459c1-17ef-43f1-a390-4fda027a2b99
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
# ╟─c45bc7ce-341c-4066-ac3f-95c12f8f3d48
# ╟─fc64783f-f9fd-4d6f-b383-f488fc93c0c6
# ╟─ab489690-c04f-4dbe-b7ef-dc16b363d5ca
# ╟─4ad870a0-85e0-4c23-a181-ac06c579fc6f
# ╟─dcbf7fec-1851-474e-af2a-985d32198ab8
# ╟─e5b8965d-13af-408b-aba8-9ce5fc380175
# ╟─8db99e3c-ea6a-4d00-88a3-4c3d9dfe840f
# ╟─4719a1c7-f6ba-4926-abc9-d4db93c928fd
# ╟─9efc4439-3fac-4ecb-b927-053bf528fbbb
# ╟─89faf1cb-8b8c-4e3b-952b-cc06c4cb923c
# ╟─874f5ef8-f998-4367-a1d8-d1a4c06d1ea5
# ╟─b0e15e80-1586-4197-a9a2-bb63372e22ba
# ╟─a45375b1-9905-4248-b187-e954a1c2c741
# ╟─11474d1a-2baf-4ea2-97fd-62c4769e941a
# ╟─af9eaa84-db36-4898-bc6d-7853e887a6a6
# ╟─ac6054f2-ce5d-401b-a078-21ef1efe1f91
# ╟─a3f103b2-1b1d-4f7b-9a09-b1fde1c0189b
# ╟─ae004e92-2214-4179-8598-c88e50f546a6
# ╟─a18bfce8-1088-40e9-97d8-56e92ffafb4d
# ╟─a1ba123c-f291-480c-a8b9-44c0d316ecde
# ╟─ca1b4f33-1efa-48f3-b527-5e8d452346fd
# ╟─f13459c1-17ef-43f1-a390-4fda027a2b99
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
