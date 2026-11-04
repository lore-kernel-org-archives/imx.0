Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793760592;
	b=EPmDKdZj2/9yq6kxgUXb4XpxJzDb9iEMlm79FhNgzJjVAkP9reSA79WqjbpzsCoSbQEk
	 It9/WghpmvMK0AvHtibEhyR6NYwj8y3gysn+o/OxZTY0WD9Jfn9pu2bUa/IgtFm89KfdG
	 3OoHdBMWTXlLAkZED+IWNi0kejLFT8x5zrRlqa2Gvs2+iGEpLBVTHOSa/xCwm0Z+zu+H5
	 v/7Ym2TzYmH4y2xsAUGT0NJ0k/DRI1JFOCeikbKuxBrXlVQIopF08f9QghQQnUtX7Rxfv
	 Vm3GxjWnSSqjHbOksTEDhKM5bDOfvD+lzTbU4+04bseWbPfTcwTkTAHP/C3Oqiozt0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793760592;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=awhcE1A9sjM4O0h9S9mHx2WiFOb9a3gs4WjZbkGrh54=;
	b=CfQF39PS/mTvJsQSVKBpARs2Fgghx/h2zoNM8b8flUs0kYO9fYCfe2w6J7MRvz5J3NDx
	 QoVK/SdgyREo/NEg/OZ+juXKRFpBZCEm9ONAmSJeg9CBZJuHU1UzVQi1La75iAVf0AXA7
	 89/UINmCwDKiwkobRb8BzKMH6nhA3lGKHR5J6uLemL4i79HPnfJlpOahM2oebS6QqHucI
	 ozl3C6wWf7Ea5C3ovf4RywmVUxWgSjTv+gX05xV2Ah2b3MHLU6pjGBfuJAEOasv5BmXAG
	 A6jiXpd5s/ayMmlDvyj1tOQBT2UdNqnHyq9U+tpJOI5/8CYek10qnb3W5rI7vEQjO0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JSftz5d6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78211606A31B;
	Wed,  4 Nov 2026 02:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JSftz5d6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F8181F000C1;
	Wed,  4 Nov 2026 02:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793760592;
	bh=awhcE1A9sjM4O0h9S9mHx2WiFOb9a3gs4WjZbkGrh54=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JSftz5d6Vo1lSDTUeldRgpLlAid44t6/uqkoKKeuE9h5qOPd9OohmPlHrCfe3Dwd9
	 z6wyhaQ+Lg/P5J1VQcrY+76S1HCT/F4eWA8uyEgo0lw720s37O8Xo6oOn6oCiKNwbo
	 kt0/z9qHLy9Zw76EeqjLEqWqa+oVyHqNwu/5Uuc5oi7MfiQ7xe+PzGvOGKo5Pqa2pT
	 F31gsAfGRE1+Ol3KaN45MqgdLBZHJFgf4hfP/Ds7HXEi8VKep9HTMlKGf/REFp6CD/
	 DMDpO75BkfAJJSUThnP7jfAYYfcGsq5aKShypO2CSIEXvPRgiUHqAilSlQbvAS0rZ/
	 PKF7+UA5RIYlQ==
Message-ID: <sashiko-outbox-196531@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: mxs-saif: unregister the mclk if adding the
 provider fails
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wentao Liang" <vulab@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261104024048.1508618-1-vulab@iscas.ac.cn>
References: <20261104024048.1508618-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 02:49:49 +0000
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
- [Medium] ASoC: mxs-saif: clk_divider leak in mxs_saif_mclk_init() on error
--

commit b511c3de71e5dad6a930d46251d7637ae094c5cc
Author: Wentao Liang <vulab@iscas.ac.cn>

ASoC: mxs-saif: unregister the mclk if adding the provider fails

This commit unregisters the mclk in mxs_saif_mclk_init() if
of_clk_add_provider() fails so the registered clock is not leaked.

> diff --git a/sound/soc/mxs/mxs-saif.c b/sound/soc/mxs/mxs-saif.c
> index e46896ac9669c..aaf62f081b327 100644
> --- a/sound/soc/mxs/mxs-saif.c
> +++ b/sound/soc/mxs/mxs-saif.c
> @@ -783,8 +783,10 @@ static int mxs_saif_mclk_init(struct platform_device=
 *pdev)
>  	}
> =20
>  	ret =3D of_clk_add_provider(np, of_clk_src_simple_get, clk);
> -	if (ret)
> +	if (ret) {
> +		clk_unregister(clk);

[Severity: Medium]
Does calling clk_unregister() here in mxs_saif_mclk_init() (in
sound/soc/mxs/mxs-saif.c) still leak the struct clk_divider when
of_clk_add_provider() fails?

Earlier in mxs_saif_mclk_init(), the clock is registered via
clk_register_divider():

	clk =3D clk_register_divider(&pdev->dev, "mxs_saif_mclk",
				   __clk_get_name(saif->clk), 0,
				   saif->base + SAIF_CTRL,
				   BP_SAIF_CTRL_BITCLK_MULT_RATE, 3,
				   0, NULL);

clk_register_divider() calls __clk_hw_register_divider() in
drivers/clk/clk-divider.c, which allocates a struct clk_divider wrapper
around struct clk_hw. Because clk_divider_ops does not implement a
.terminate callback, clk_unregister(clk) only unregisters clk_core and frees
the struct clk handle, leaving the struct clk_divider allocation leaked.

Should this call clk_unregister_divider(clk) instead, which frees the
struct clk_divider after calling clk_unregister(clk):

drivers/clk/clk-divider.c:clk_unregister_divider() {
	struct clk_divider *div;
	struct clk_hw *hw;

	hw =3D __clk_get_hw(clk);
	if (!hw)
		return;

	div =3D to_clk_divider(hw);

	clk_unregister(clk);
	kfree(div);
}

or switch to devm_clk_hw_register_divider() and
devm_of_clk_add_hw_provider()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104024048.1508=
618-1-vulab@iscas.ac.cn?part=3D1
