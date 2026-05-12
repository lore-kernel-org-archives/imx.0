Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33039234964;
	Tue, 12 May 2026 01:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778550965; cv=none; b=F3sTh5pEtTzND/7M/WxJKCP8Gm82275viK+uWqAWmAA4rUyYzy4/gdmwqLUgEM0uQFocMGo9JO7sWNuaJIqLvAyPBbIMemhw6i8ygMIAx0/b8Cs+lJQK4+NuqCAKDCZUIAhf3m6FLIZnh+MjokkG5QDxH0O34n75/a4gFP1cuzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778550965; c=relaxed/simple;
	bh=P+LmNTDVZuuDnfqZUEGQcbp6m3JZde5Y8cTYtQ/lVHQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CJqNEiWRT8MsD9Pb+S07yPi1NwaelIwvlsnvlIIfzZkNabuvywPKuC/fcATFsjaMrTWtMOMuWx9IL5C+4e5dC2z2LkaGvXZwQSUDOCeAkKDbX3ehkhhSlyz/UF5RqpqI878Kzn38JQJDsl+MtjuYsNIkj0b4cS5qS1AqBrnTv5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c5Gmesnk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c5Gmesnk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71A27C2BCB0;
	Tue, 12 May 2026 01:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778550965;
	bh=P+LmNTDVZuuDnfqZUEGQcbp6m3JZde5Y8cTYtQ/lVHQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=c5GmesnkT+3EShNsK8C99VEsd4Jsk7Y5Xn3pNLcabzfjw9O/TEGs1tg0T8ntKAPZF
	 yo65Yk0fs3hMGYi5TLJCo8xRnNyn+vCjTjCtPgsJ+i89+BFPCH7Bndq7/xBiwM5qr7
	 TvfLRhF4Mc01gANSpX+HHlYqrQ5EyoOXwP+hIDx4qA1TI0N98Opw0nRIDEwIhPxiEB
	 jrXXS6L7r/+rggRubmCecQBgdcik4qPFFHDo6WhupjVKj018lGSBMpqn+kJWwGIdSe
	 WiyAkGdvBs5BCWU/W7QwJXpP1txn+DBYCsD7bowSamI/9qHGLvH+maKTYG1Eajrlgp
	 /JKubuJ7OQZjg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/5] media: hi846: fix link frequency handling
Reply-To: sashiko@lists.linux.dev
To: "Pengyu Luo" <mitltlatltl@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260511090924.269106-3-mitltlatltl@gmail.com>
References: <20260511090924.269106-3-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 01:56:03 +0000
Message-Id: <20260512015604.71A27C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Uninitialized clock usage completely bypasses Device Tree link fre=
quency validation.
- [High] Precision loss in link frequency calculation falsely rejects valid=
 Device Tree configurations.
- [High] Native 64-bit integer division breaks compilation on 32-bit platfo=
rms.
- [High] Dynamic doubling of `link_freq` for 2-lane modes introduces a seve=
re framerate regression.
- [Medium] Removal of `V4L2_CID_LINK_FREQ` control without a replacement vi=
olates V4L2 subsystem APIs.
- [Low] Commit message falsely claims to have dropped the `mclk` clock rate=
 check.
--

commit 42a7ca82b9bb88db227afdc90d80e44ac458930b
Author: Pengyu Luo <mitltlatltl@gmail.com>

media: hi846: fix link frequency handling

This commit modifies the link frequency handling in the hi846 driver to
calculate it at runtime based on the PLL configuration, lane count, and
external clock rate instead of using hardcoded values. It also removes
the exposed link frequency control and attaches the configuration to the
current mode.

> 3. dropped mclk clock rate check.

This isn't a bug, but the commit message states the mclk clock rate check
was dropped.

Looking at hi846_probe(), the code block checking if mclk_freq !=3D 25000000
appears to have been left untouched by this patch. Is this description
accurate?

> diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
> index 7f069aca0fce5..befd54553df2e 100644
> --- a/drivers/media/i2c/hi846.c
> +++ b/drivers/media/i2c/hi846.c
[ ... ]
> @@ -1192,21 +1185,37 @@ static const struct hi846_datafmt *hi846_find_dat=
afmt(u32 code)
>  	return NULL;
>  }
> =20
> -static inline u8 hi846_get_link_freq_index(struct hi846 *hi846)
> +static u64
> +hi846_get_link_freq(struct hi846 *hi846, const struct hi846_mode *cur_mo=
de)
>  {
> -	return hi846->cur_mode->link_freq_index;
> -}
> +	u16 cfg =3D cur_mode->pll_cfg_4lane;
> +	u64 mclk =3D clk_get_rate(hi846->clock);

Can mclk be zero here during probe?

Looking at hi846_probe(), hi846_parse_dt() is called before hi846->clock
is requested via devm_v4l2_sensor_clk_get().

When hi846_parse_dt() calls hi846_check_link_freqs(), hi846->clock will be
NULL, causing clk_get_rate() to return 0.

Will this result in a computed frequency of 0, which fails to match the DT
endpoints and completely bypasses the device tree link frequency validation?

> -static u64 hi846_get_link_freq(struct hi846 *hi846)
> -{
> -	u8 index =3D hi846_get_link_freq_index(hi846);
> +	/* NOTE: 6, 7 actually map to 8, 10, but this won't be that big */
> +	u8 post_div1 =3D 1 + FIELD_GET(GENMASK(10, 8), cfg);
> +	u8 post_div2 =3D 1 << FIELD_GET(GENMASK(12, 11), cfg);
> =20
> -	return hi846_link_freqs[index];
> +	/*
> +	 * HI846_REG_PLL_CFG_MIPI1_H =3D 0x025a, it is fixed in listed modes
> +	 * [11:8]: 0x02 =3D> pre_div =3D 3
> +	 * [7:0]: 0x5a =3D> multiplier =3D 90
> +	 */
> +	u64 link_freq =3D mclk / 3 * 90 / post_div1 / post_div2;

Does this native 64-bit division break compilation on 32-bit platforms?

Since mclk is a u64, using the native division operator / with 32-bit values
will emit a call to __udivdi3, which is intentionally absent from the kernel
libgcc. Should this use div_u64() or do_div() instead?

Also, does the order of operations cause a precision loss that falsely
rejects valid device tree configurations?

For the expected 25MHz external clock, dividing by 3 first evaluates to
8333333, truncating the fractional part early. The final calculated frequen=
cy
becomes 187499992 instead of 187500000.

Since hi846_check_link_freqs() strictly checks for equality against the DT
values, will this cause validation to fail and abort the probe?

> +	/*
> +	 * for shared modes, since lane count is halved for 2-lane, then getting
> +	 * link_freq doubled to match the same data rate. Since 720x480 is
> +	 * 2-lane only(reg_list_4lane.num_of_regs =3D=3D 0), no pll cfg for 4-l=
ane,
> +	 * the pll cfg is for 2-lane, so use the cfg as is.
> +	 */
> +	if (2 =3D=3D hi846->nr_lanes && cur_mode->reg_list_4lane.num_of_regs)
> +		link_freq *=3D 2;
> +
> +	return link_freq;
>  }
[ ... ]
> @@ -1426,14 +1435,6 @@ static int hi846_init_controls(struct hi846 *hi846)
> =20
>  	ctrl_hdlr->lock =3D &hi846->mutex;
> =20
> -	hi846->link_freq =3D
> -		v4l2_ctrl_new_int_menu(ctrl_hdlr, &hi846_ctrl_ops,
> -				       V4L2_CID_LINK_FREQ,
> -				       ARRAY_SIZE(hi846_link_freqs) - 1,
> -				       0, hi846_link_freqs);
> -	if (hi846->link_freq)
> -		hi846->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> -

Does the removal of the V4L2_CID_LINK_FREQ control violate the V4L2 subsyst=
em
APIs?

The V4L2 MIPI CSI-2 specification mandates that transmitter drivers report
their link frequency so receiver PHYs can dynamically configure their timin=
gs.

Since the .get_mbus_config pad operation isn't implemented as an alternativ=
e,
does this force the V4L2 core to fall back to an inaccurate estimation based
on pixel rate, potentially misconfiguring receiver hardware?

[ ... ]
> @@ -1503,10 +1504,10 @@ static int hi846_set_video_mode(struct hi846 *hi8=
46, int fps)
>  	u64 frame_length;
>  	int ret =3D 0;
>  	int dummy_lines;
> -	u64 link_freq =3D hi846_get_link_freq(hi846);
> +	u64 link_freq =3D hi846_get_link_freq(hi846, hi846->cur_mode);
> =20
>  	dev_dbg(&client->dev, "%s: link freq: %llu\n", __func__,
> -		hi846_get_link_freq(hi846));
> +		link_freq);
> =20
>  	do_div(link_freq, fps);
>  	frame_length =3D link_freq;

Does this calculation introduce a framerate regression for 2-lane modes?

Earlier in hi846_get_link_freq(), the link_freq is dynamically doubled
for 2-lane modes to match the data rate.

Because frame_length relies directly on link_freq here, the resulting
frame_length programmed into the HI846_REG_FLL register will also be double=
d.

Since FLL dictates the duration of a frame, will doubling it halve the actu=
al
physical output framerate?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511090924.2691=
06-1-mitltlatltl@gmail.com?part=3D2
