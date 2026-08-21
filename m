Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA804ADD8A;
	Fri, 21 Aug 2026 14:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787321187; cv=pass; b=mAjQFXBiCLk6AWya/CwN/x0dzEOAB+lkFWDE1REkqZu7uiAJkKe1Ko/EsEzBPmns3MM1Vyf4D/X8K1wXMZW6TJvZ1L8y6aKgZpKMcAGNJKW8UKMx3TLWTsiq83+zupbHblcJhMPtwc9n+Ex3gMDBm1+TxznsJatej8mS3vx61P4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787321187; c=relaxed/simple;
	bh=xY6CnZViDMwNpVsvDIJLXlXMPUGateyd8GAa9iRNToI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ASYKITZBlpFE7ea82LiwpOKqHz+YZa/ckOvFqR8JA9bGab4+XK9w7ZRKti8S4w91ulwTt/7lyZ3ygZ1HEoqGpcUcCqqEZpDnlzloYq0lzAjsC0KkI/nhDIOqAJ6arkByfb2qLpAaJ2FV96pNRyA/Mq/nWAYZUmMNe5dutoW9iCk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=TTKVytQB; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="TTKVytQB"
ARC-Seal: i=1; a=rsa-sha256; t=1787321085; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aS3Wxr42/WowGTQMOwQn+Aik7EWu3ZtXAyK7Ka9JjnfmyekKH/X9DF7cl903wIOEJg01lQp+gWpZGWmsspCAx0u4fU8P+aSiUAIfuOxMh2gINvbdCDlWZZYuBuYcc4/Hgvq6u6X2dotGYHOAUIOO1A5l2vx+Nlrvv36qnd4Zo1U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787321085; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IXNJ/14cVvvKroHplPIGuCBeBYfygG4Y7sUaJ45XWQE=; 
	b=dGSfR9zZz1WQQVWan6t8MG3C7sldyy+btQ1fIcHks35yTU0HKlGgpqkis8Bvw4NE/R8apiMLyVPbZ2hQ/JtlCZybWHRdin/g6Jwx5Uj4lpEPGM+gKQTp/tJmHKoctrb8wHffa2SpJrAL6iyPO9uS8eTa8hjDXKTHy2rgRVXWuH4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787321085;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=IXNJ/14cVvvKroHplPIGuCBeBYfygG4Y7sUaJ45XWQE=;
	b=TTKVytQB8iMxRzpvUXKXpNq1OdRpglO16qtqbszi6lJF4nmFxmWOyOMX5spT+YP3
	Xv/lujJhnv14rcillKejZcMdJjESzp+mPU/hITTrVhEacTe4GuC1BIRlXTEL7mp/IW2
	dTt5sCybxxEgKjnIOYRF8dHMon4uyWe1V4AxLMQU=
Received: by mx.zohomail.com with SMTPS id 1787321084147104.50540849911135;
	Fri, 21 Aug 2026 07:04:44 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 52022181F47; Fri, 21 Aug 2026 16:04:34 +0200 (CEST)
Date: Fri, 21 Aug 2026 16:04:34 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Taichi Sugaya <sugaya.taichi@socionext.com>, 
	Takao Orito <orito.takao@socionext.com>, Linus Walleij <linusw@kernel.org>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	David Lechner <david@lechnology.com>, Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Paul Cercueil <paul@crapouillou.net>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Viresh Kumar <vireshk@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Emilio =?utf-8?B?TMOzcGV6?= <emilio@elopez.com.ar>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Ulf Hansson <ulfh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	arm-scmi@vger.kernel.org, imx@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 28/45] clk: rockchip: Make sure clk_init_data is fully
 initialized
Message-ID: <aohax7qilvrgV1iE@venus>
References: <cover.1787239813.git.geert+renesas@glider.be>
 <49127c1f7529acccb17e1408db9f21f6d15aee2b.1787239813.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zybuuvaovsaw7bmk"
Content-Disposition: inline
In-Reply-To: <49127c1f7529acccb17e1408db9f21f6d15aee2b.1787239813.git.geert+renesas@glider.be>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.10.1.5.2/287.318.86
X-ZohoMailClient: External


--zybuuvaovsaw7bmk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 28/45] clk: rockchip: Make sure clk_init_data is fully
 initialized
MIME-Version: 1.0

Hi,

On Fri, Aug 21, 2026 at 10:53:38AM +0200, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
>=20
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Compile-tested only.
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Greetings,

-- Sebstian

>  drivers/clk/rockchip/clk-cpu.c       | 2 +-
>  drivers/clk/rockchip/clk-ddr.c       | 2 +-
>  drivers/clk/rockchip/clk-gate-grf.c  | 2 +-
>  drivers/clk/rockchip/clk-inverter.c  | 2 +-
>  drivers/clk/rockchip/clk-mmc-phase.c | 2 +-
>  drivers/clk/rockchip/clk-muxgrf.c    | 2 +-
>  drivers/clk/rockchip/clk-pll.c       | 2 +-
>  drivers/clk/rockchip/clk.c           | 2 +-
>  8 files changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/clk/rockchip/clk-cpu.c b/drivers/clk/rockchip/clk-cp=
u.c
> index 6205af9ba88a8def..eb6b8b878e4dbeea 100644
> --- a/drivers/clk/rockchip/clk-cpu.c
> +++ b/drivers/clk/rockchip/clk-cpu.c
> @@ -304,7 +304,7 @@ struct clk *rockchip_clk_register_cpuclk(const char *=
name,
>  			int nrates, void __iomem *reg_base, spinlock_t *lock)
>  {
>  	struct rockchip_cpuclk *cpuclk;
> -	struct clk_init_data init;
> +	struct clk_init_data init =3D {};
>  	struct clk *clk, *cclk;
>  	int ret;
> =20
> diff --git a/drivers/clk/rockchip/clk-ddr.c b/drivers/clk/rockchip/clk-dd=
r.c
> index 81ae8a4ee30ed95c..fbb702d0b9d996d5 100644
> --- a/drivers/clk/rockchip/clk-ddr.c
> +++ b/drivers/clk/rockchip/clk-ddr.c
> @@ -97,7 +97,7 @@ struct clk *rockchip_clk_register_ddrclk(const char *na=
me, int flags,
>  					 spinlock_t *lock)
>  {
>  	struct rockchip_ddrclk *ddrclk;
> -	struct clk_init_data init;
> +	struct clk_init_data init =3D {};
>  	struct clk *clk;
> =20
>  	ddrclk =3D kzalloc_obj(*ddrclk);
> diff --git a/drivers/clk/rockchip/clk-gate-grf.c b/drivers/clk/rockchip/c=
lk-gate-grf.c
> index 88e409e91a636aa1..458314a2569181d1 100644
> --- a/drivers/clk/rockchip/clk-gate-grf.c
> +++ b/drivers/clk/rockchip/clk-gate-grf.c
> @@ -73,7 +73,7 @@ struct clk *rockchip_clk_register_gate_grf(const char *=
name,
>  		u8 gate_flags)
>  {
>  	struct rockchip_gate_grf *gate;
> -	struct clk_init_data init;
> +	struct clk_init_data init =3D {};
>  	struct clk *clk;
> =20
>  	if (IS_ERR(regmap)) {
> diff --git a/drivers/clk/rockchip/clk-inverter.c b/drivers/clk/rockchip/c=
lk-inverter.c
> index bf9072ed9fd4daed..e6c7dad60e966288 100644
> --- a/drivers/clk/rockchip/clk-inverter.c
> +++ b/drivers/clk/rockchip/clk-inverter.c
> @@ -75,8 +75,8 @@ struct clk *rockchip_clk_register_inverter(const char *=
name,
>  				void __iomem *reg, int shift, int flags,
>  				spinlock_t *lock)
>  {
> -	struct clk_init_data init;
>  	struct rockchip_inv_clock *inv_clock;
> +	struct clk_init_data init =3D {};
>  	struct clk *clk;
> =20
>  	inv_clock =3D kmalloc_obj(*inv_clock);
> diff --git a/drivers/clk/rockchip/clk-mmc-phase.c b/drivers/clk/rockchip/=
clk-mmc-phase.c
> index 4efd22953f3e0533..d92bea75faf73767 100644
> --- a/drivers/clk/rockchip/clk-mmc-phase.c
> +++ b/drivers/clk/rockchip/clk-mmc-phase.c
> @@ -205,8 +205,8 @@ struct clk *rockchip_clk_register_mmc(const char *nam=
e,
>  				struct regmap *grf, int grf_reg,
>  				int shift)
>  {
> -	struct clk_init_data init;
>  	struct rockchip_mmc_clock *mmc_clock;
> +	struct clk_init_data init =3D {};
>  	struct clk *clk;
>  	int ret;
> =20
> diff --git a/drivers/clk/rockchip/clk-muxgrf.c b/drivers/clk/rockchip/clk=
-muxgrf.c
> index ccbb1379501ab474..ecdc77654813a3c3 100644
> --- a/drivers/clk/rockchip/clk-muxgrf.c
> +++ b/drivers/clk/rockchip/clk-muxgrf.c
> @@ -59,7 +59,7 @@ struct clk *rockchip_clk_register_muxgrf(const char *na=
me,
>  				int shift, int width, int mux_flags)
>  {
>  	struct rockchip_muxgrf_clock *muxgrf_clock;
> -	struct clk_init_data init;
> +	struct clk_init_data init =3D {};
>  	struct clk *clk;
> =20
>  	if (IS_ERR(regmap)) {
> diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-pl=
l.c
> index 706ca4b344d399a3..7204b09243d483ae 100644
> --- a/drivers/clk/rockchip/clk-pll.c
> +++ b/drivers/clk/rockchip/clk-pll.c
> @@ -1069,7 +1069,7 @@ struct clk *rockchip_clk_register_pll(struct rockch=
ip_clk_provider *ctx,
>  		unsigned long flags, u8 clk_pll_flags)
>  {
>  	const char *pll_parents[3];
> -	struct clk_init_data init;
> +	struct clk_init_data init =3D {};
>  	struct rockchip_clk_pll *pll;
>  	struct clk_mux *pll_mux;
>  	struct clk *pll_clk, *mux_clk;
> diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
> index ee8c79b938d3c15b..10df21178ba483e2 100644
> --- a/drivers/clk/rockchip/clk.c
> +++ b/drivers/clk/rockchip/clk.c
> @@ -257,7 +257,7 @@ static struct clk *rockchip_clk_register_frac_branch(
> =20
>  	if (child) {
>  		struct clk_mux *frac_mux =3D &frac->mux;
> -		struct clk_init_data init;
> +		struct clk_init_data init =3D {};
>  		struct clk *mux_clk;
>  		int ret;
> =20
> --=20
> 2.43.0
>=20
>=20

--zybuuvaovsaw7bmk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmqIWusACgkQ2O7X88g7
+poirhAApVi+Y+WU3mrw03dbGLE92vZNTJMxmeK5fzM3D7/o1HO6GGgy5ZBAlAcY
AHjbpJgLpOY+bLGDnfv97vri7zP1duirRf2Yw3fhqiFp+tdt8AX6f9hU8bfwu+uy
IaquBhUMuFejInZcStNJFlC4BF1UJkkacYSNtxFWAsKFMLlzOJQKu7lnBZwfbFWu
C+FZ7xkWGWrSGNvroDobqiM/LDEYmI6OxnSwbCfoeczBF6D1VEaSeZhbDDVfx0hR
ja1QtzHWcfm4Y3PLzEaNpmYerMSNE1fZIMFmraZZ3oFaak+uOYWZEWk0UzeZF4cv
L5jzi4Cwa2V4TIot/53rF+xlSAjZAxTrBEH99onUWqBf4XyMa4k2DnlE+wPNqG5p
Mz4QW3dtELwXRsHfeWqAT+rF2Iv2rsb8mkWeJ9ir0Ll2v8PHl2Ro9gWyag1zeRF5
cahZmOPxJFpLKOVsNZX6AAhgvlsJN8kSZ8T48gpuTj+TjdEzrvm8A8l2yU5Or/C1
kT56IUoCapPk1sZVEqNNPZQZduKm53nfXe9viHXg4BVjz8xXOU2LAZJ/gvrqjqzX
XzRHvPAAdb+4q0BOqXmFgI6e4nSDBivR2zl2aidohQnxA++NPmGSG0xjBNZAqSY1
HSFBW4PATNUCcY+1z4MjEfCGtmWtnYk0d23W6+Va0wfJjBcmMi8=
=BMUY
-----END PGP SIGNATURE-----

--zybuuvaovsaw7bmk--
