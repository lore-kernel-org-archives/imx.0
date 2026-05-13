Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A52F3A3E7F
	for <imx@lists.linux.dev>; Wed, 13 May 2026 20:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778702653; cv=none; b=JfaJgLvidvEXv/BMN0oVVZoedghQ7GmDUQDHffm7N8+gr+qVp6DTNp/vk2ANPn0V/ciVEzfxghdxL254AhkSnCelKR5OmYM6WBOiE1Zf6fWsWY7w3vCaO1wP0sTZxIWWEYkoQfslp/mb+ayhzmojjenfP6NY033+iHL2wObuw28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778702653; c=relaxed/simple;
	bh=F+2A2B9W8YJoufqMmQU4xAuTsOkZo6tjhJsQvoXs0MA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iLoziA5Uya8peC09tSKo5X4bX0Pf2VwKtH8AhoPPAxjE7JZ9rSA2owYPGVPr3//zWo07pwr8CUDnVzn7oj1uox1Myvg6Mxxd529DYabOvd/JJI7dapa66e4ZcnbBK8r+XOvlM5L/ldajxtKtctJ39OchI9YxZnehXK+/0AtAjbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qFLIaleW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qFLIaleW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7D34C19425;
	Wed, 13 May 2026 20:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778702652;
	bh=F+2A2B9W8YJoufqMmQU4xAuTsOkZo6tjhJsQvoXs0MA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=qFLIaleWHwcEZnvah4mcY2WZmQQ8IhgfSNNtNLL1FktbaHTDPRc3YtXVmpfdTT4r/
	 JA2JcxewyvQ9BeR00PDuf2OTvMHfRi8jQjcqjxr4b4cZuts4y6mtmnVLZdxYySKuvo
	 XZDFIC/it/orv2/m8H2DL0UeL8oMTjj0F6+VyEBsRO8/+wofmDamQFqvrnHuq6Xd4D
	 nHF5ZCa7naVslgO2LohlAPdBUmBuFujFHaYEccZxGT9Ra0OZjyF2I2Asc8DvLpDsba
	 B7n/I8FipvL/x9n7zSxLxgMc+/Gl111dudW8zA3RXtm+PdCYR/IiSiEKgPIij2OOzG
	 W2x25yhfftkEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] clk: imx: Add audio PLL debugfs for K-divider control
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacky Bai" <ping.bai@nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260512-imx8m_pll_debugfs-v1-1-e1e44b21be90@nxp.com>
References: <20260512-imx8m_pll_debugfs-v1-1-e1e44b21be90@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 20:04:12 +0000
Message-Id: <20260513200412.A7D34C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Unchecked ERR_PTR dereference in `audio_pll_debug_init()` causes k=
ernel panic if PLL registration fails.
- [High] Lockless read-modify-write of PLL registers causes a race conditio=
n with the Common Clock Framework.
- [Medium] Missing bounds checking allows the K-divider to wrap around, cau=
sing massive frequency jumps.
--

commit 654083d958b35cc8cdcae8664a30b757df4a7f7a
Author: Jacky Bai <ping.bai@nxp.com>

clk: imx: Add audio PLL debugfs for K-divider control

This commit adds debugfs support for runtime tuning of the audio PLL K
divider on i.MX platforms. It exposes delta_k and pll_parameter interfaces
to adjust and monitor the fractional dividers.

> diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
> index 39600ee22be30..59f126f354741 100644
> --- a/drivers/clk/imx/clk-pll14xx.c
> +++ b/drivers/clk/imx/clk-pll14xx.c

[ ... ]

> @@ -551,3 +552,81 @@ struct clk_hw *imx_dev_clk_hw_pll14xx(struct device =
*dev, const char *name,

[ ... ]

> +static int pll_delta_k_set(void *data, u64 val)
> +{
> +	struct clk_pll14xx *pll =3D to_clk_pll14xx(data);
> +	s16 delta_k =3D (s16)val;
> +	u32 div_ctl1;
> +	s16 kdiv;
> +
> +	div_ctl1 =3D readl_relaxed(pll->base + DIV_CTL1);
> +	kdiv =3D FIELD_GET(KDIV_MASK, div_ctl1) + delta_k;

If a user provides a large positive delta_k that pushes kdiv beyond 32767,
will this s16 addition wrap around to a large negative number? Does this
need a clamp_val() check to prevent abrupt frequency discontinuities?

> +	writel_relaxed(FIELD_PREP(KDIV_MASK, kdiv), pll->base + DIV_CTL1);

Because this read-modify-write sequence is performed without acquiring the
CCF prepare lock or a hardware spinlock, can it race with a concurrent
clk_set_rate() operation?

If CCF is updating DIV_CTL1 at the same time, could this overwrite the
CCF's register changes and desynchronize the hardware state?

> +
> +	return 0;
> +}

[ ... ]

> +void audio_pll_debug_init(struct clk_hw *hws[], unsigned int num_plls)
> +{
> +	struct dentry *rootdir, *audio_pll_dir;
> +	const char *pll_name;
> +	int i;
> +
> +	rootdir =3D debugfs_create_dir("audio_pll_monitor", NULL);
> +
> +	for (i =3D 0; i < num_plls; i++) {
> +		pll_name =3D clk_hw_get_name(hws[i]);

In imx8mm_clocks_probe(), if the PLL fails to register, the hws array might
contain an error pointer. When clk_hw_get_name() is called here, it directly
dereferences hw->core:

clk_hw_get_name(const struct clk_hw *hw)
{
	return hw->core->name;
}

Could this code cause a kernel panic by dereferencing an error pointer if
the PLL registration failed earlier?

> +		audio_pll_dir =3D debugfs_create_dir(pll_name, rootdir);
> +		debugfs_create_file_unsafe("delta_k", 0200, audio_pll_dir,
> +				hws[i], &delta_k_fops);
> +		debugfs_create_file("pll_parameter", 0444, audio_pll_dir,
> +				hws[i], &pll_setting_fops);
> +	}
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512-imx8m_pll_=
debugfs-v1-1-e1e44b21be90@nxp.com?part=3D1
