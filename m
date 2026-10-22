Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792679667;
	b=4bT0iF3ayyoS+2Z1grLUGLibwLLNu70DB/yaqLjgU3E5Hqjh19xGcxof2N6xzQNgv5Zk
	 7YIQ38rV4L82DziApUa8LAVwQBITc/00EHs9OTTF14kK+zSygqAT3M8YI9Npzp/LVSioe
	 28cRbbhiYYfKuM/EjCmgmp28QerySwkCyJQZ7yb2RaH1iH33mr55LfJ10SXaUrWXuFgjs
	 dyzsZyS9P/bf860my6Y9i1gjQbsdnmbWpC3q2W7UgJ0aTaLxgM6GexdgjEkAEqLhDX9Ma
	 RJ/advgviUf6YTQJMng7LJAjUBYKBSKwZxmh+j50Qy/0nMJOholw+2NNVNb9zI+tq2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792679667;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Y2qG705OI1mHMtlD0A+zrip8QEVcy+Em7Ge6aIcZ8sU=;
	b=IqrBZa1pFqY3nJJBVhndRfD3RcTTKCgCTDXPnRqQItKpDRZvlQ7WCwV54boRrKvEIvKe
	 LxjtEJ+aqFgEBqXvmAz4lVmPW5Oswfl9He6aNp7iILLF6sU1jWunChPp/ae/JoRQ3JT8w
	 zznquDMZ8xQVLc1k234iekYvU09zLgQ1IQdN0Y0I7IZk1VQqKilPw4qYa/sCiuK1hOAUn
	 ygY8HOnMGeCxVQ/fBgMdtCkWMUGMS50+gN5XlKMAzx+7lJSDq6kpVgjEtFh9/tywtINhy
	 YRWkT8JXhiaU+2f/Iagt+r4v1/cehnSwrJ4fBt0SuZ5WdlaZ0ujMmv7NYlnUQrD/3sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hiMJb5hB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EF3606A319;
	Thu, 22 Oct 2026 14:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hiMJb5hB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87E951F000C2;
	Thu, 22 Oct 2026 14:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792679667;
	bh=Y2qG705OI1mHMtlD0A+zrip8QEVcy+Em7Ge6aIcZ8sU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hiMJb5hBS6I3yAmIr5LEuHrUNnwPP6mlL6FJySqA8S0BoWJ6R9NJy/jfwX2er8x0Y
	 f+Pxf2aKl6jgHYLBJ+iyql/56YXTvf3ic8pRJSnF9pbq/WCJQRcmoO4keb5VTeL9PZ
	 ri2rzeT6X2+UYrhC8Rm+ZjovRjC8LVvxKN0kX+w5iT+lzvWqRZukd9wvTR3oYrLsiI
	 airmXpyC22/PiH+baPn+z8teqRFoDTN7fP8ZqQidrHSXGGG3xrZhkb8321McSuHWRC
	 5FSraSTfzAU1HE/LfFSKKD0TpEW/m4J0NmwVbAfcSxXwsCwYl8ebt7uv9aZjKYtUby
	 XmcYHm2rftrXA==
Message-ID: <sashiko-outbox-181644@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] arm64: dts: freescale: imx8mp-verdin: Add Cortex-M7
 remoteproc
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ernest Van Hoecke" <ernestvanhoecke@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261022-verdin-imx8mp-m7-v3-1-af284e28531d@toradex.com>
References: <20261022-verdin-imx8mp-m7-v3-1-af284e28531d@toradex.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 14:34:25 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] arm64: dts: imx8mp-verdin: unregistered IMX8MP_CLK_M7_DIV clock in=
 imx8mp-cm7
--

commit 37e821a019361403bc773ac48a7bf68be6a133ac
Author: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

arm64: dts: freescale: imx8mp-verdin: Add Cortex-M7 remoteproc

This commit adds the Cortex-M7 remoteproc node and its associated
reserved-memory regions to the Verdin iMX8M Plus device tree.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm6=
4/boot/dts/freescale/imx8mp-verdin.dtsi
> index 9fee2cf9ef546..45a4713c260f4 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
> @@ -77,6 +77,18 @@ key-wakeup {
>  		};
>  	};
> =20
> +	imx8mp-cm7 {
> +		compatible =3D "fsl,imx8mp-cm7";
> +		clocks =3D <&clk IMX8MP_CLK_M7_DIV>;

[Severity: High]
Should this clock specifier be IMX8MP_CLK_M7_CORE instead of
IMX8MP_CLK_M7_DIV?

In drivers/clk/imx/clk-imx8mp.c, commit 8c83a8ff4dd9 ("clk: imx8mp: use
imx8m_clk_hw_composite_core to simplify code") replaced
hws[IMX8MP_CLK_M7_DIV] in imx8mp_clocks_probe() with
hws[IMX8MP_CLK_M7_CORE] without keeping an alias at IMX8MP_CLK_M7_DIV:

	hws[IMX8MP_CLK_A53_DIV] =3D imx8m_clk_hw_composite_core("arm_a53_div", imx=
8mp_a53_sels, ccm_base + 0x8000);
	hws[IMX8MP_CLK_A53_SRC] =3D hws[IMX8MP_CLK_A53_DIV];
	hws[IMX8MP_CLK_A53_CG] =3D hws[IMX8MP_CLK_A53_DIV];
	hws[IMX8MP_CLK_M7_CORE] =3D imx8m_clk_hw_composite_core("m7_core", imx8mp_=
m7_sels, ccm_base + 0x8080);

Because clk_hw_data is zero-allocated, hws[IMX8MP_CLK_M7_DIV] remains
NULL. When imx_rproc_probe() in drivers/remoteproc/imx_rproc.c requests
the clock for "fsl,imx8mp-cm7" (which sets IMX_RPROC_NEED_CLKS in
imx_rproc_cfg_imx8mn):

	if (dcfg->flags & IMX_RPROC_NEED_CLKS) {
		priv->clk =3D devm_clk_get_enabled(dev, NULL);
		if (IS_ERR(priv->clk))
			return dev_err_probe(dev, PTR_ERR(priv->clk), "Failed to enable clock\n"=
);
	}

of_clk_hw_onecell_get() returns NULL for hw_data->hws[IMX8MP_CLK_M7_DIV],
causing devm_clk_get_enabled() to return NULL without an error. As a
result, m7_core is never prepared or enabled by imx_rproc_probe(), and
clk_disable_unused() can gate it off at late boot when the Cortex-M7 was
not pre-booted by the bootloader, leaving the core unclocked when
imx_rproc accesses TCM or starts the remote processor.

Other i.MX8MP Cortex-M7 device tree descriptions such as
arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-cm7.dtso
use IMX8MP_CLK_M7_CORE:

	imx8mp-cm7 {
		compatible =3D "fsl,imx8mp-cm7-mmio";
		clocks =3D <&clk IMX8MP_CLK_M7_CORE>;

> +		mbox-names =3D "tx", "rx", "rxdb";
> +		mboxes =3D <&mu 0 1
> +			  &mu 1 1
> +			  &mu 3 1>;
> +		memory-region =3D <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
> +				<&rsc_table>;
> +		syscon =3D <&src>;
> +	};
> +
>  	sound_hdmi: sound-hdmi {
>  		compatible =3D "fsl,imx-audio-hdmi";
>  		model =3D "audio-hdmi";

[ ... ]

>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022-verdin-imx=
8mp-m7-v3-1-af284e28531d@toradex.com?part=3D1
