Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF433ACEE2
	for <imx@lists.linux.dev>; Tue, 19 May 2026 09:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779184245; cv=none; b=NKeAD5rACCzt8aLQlPL8P+nVRVTDsq9yzSAPKN4gPpucsGgZoJTIzIqXYWV1/E8ap4JeyXXZ/OgWPp3CELYhGml1UySffpZkAfN1X90XMaWYKBeN8eaYFwBQMGLkG1NLeJk4oISRqvv4SCQ4LqrlyZp6Fj0l+cXZxlhx+puvmdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779184245; c=relaxed/simple;
	bh=pX10sT9h10Z5n3QoG3sQuTO3vawrT3LzSHbfWPTKJ2c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LTs1qqiQDl/lP9tLKtMMAH2HsMdCvuLNen/bkU1A5aZIqiNSya78TFp84Yor7k741UNoQwY9CyH9bjFt2vi2adkv6vk9Ox4GZm396j2U3eNnJRnp+tzo93+B0HmhnNo0gZQjlZ5Wc0dDVhN2S7m3mbgn5Yk5km6uxCSDJSqW66E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aErgeqiB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aErgeqiB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 996B7C2BCB3;
	Tue, 19 May 2026 09:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779184244;
	bh=pX10sT9h10Z5n3QoG3sQuTO3vawrT3LzSHbfWPTKJ2c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=aErgeqiBlng04fK+r+u8rqi0r+UmLFhg/q5Qbtw+1nKqxrjm2sf8QNqBw9CLLG+DA
	 +oDCXKB6I1TS/Lmunl6fVKgUhY6XiMboB3kxazBgkJ5PiWtt24gE8xno/fILvJWeGg
	 LcDFn/NmKjC9iRPBVGay23y+YrfUzUYUs1eFemyJuu9E3tWG9R3RhkS8nSYsjbzhUa
	 HgIWutJBF+cBJrecupGBHOGR3gbiOTHUg/+n2EeD4U4g+PiJAXhm+q6wVYPXMLoobH
	 Qxe/KPwhSFALSFkXn7wVexJ0FlUqts4kHNRsrX0Rb00XPZwlNcFmouEw6b6EJsCJ2y
	 6iHyD+FjJiFuA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] clk: imx: Add audio PLL debugfs for K-divider
 control
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacky Bai" <ping.bai@nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260519-imx8m_pll_debugfs-v2-1-20e1d88526b0@nxp.com>
References: <20260519-imx8m_pll_debugfs-v2-1-20e1d88526b0@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 09:50:43 +0000
Message-Id: <20260519095044.996B7C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] Data race on `pll->delta_k` assignment outside lock.
- [Medium] Torn reads of PLL state in `pll_setting_show` due to missing loc=
ks.
- [Medium] Type truncation in `clamp_t` bypasses upper bounds on 32-bit pla=
tforms.
--

commit f3539cad304e6bd44f1d2c105a546db8ccf75dd1
Author: Jacky Bai <ping.bai@nxp.com>

clk: imx: Add audio PLL debugfs for K-divider control

Add debugfs support for runtime tuning of the audio PLL K divider,
enabling fine-grained frequency adjustments for audio PLL. Two debug
interfaces are exported to userspace: delta_k and pll_parameter.

> diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
> index 39600ee22be30..b00529cb196a2 100644
> --- a/drivers/clk/imx/clk-pll14xx.c
> +++ b/drivers/clk/imx/clk-pll14xx.c
[ ... ]
> @@ -551,3 +566,95 @@ struct clk_hw *imx_dev_clk_hw_pll14xx(struct device =
*dev, const char *name,
[ ... ]
> +static int pll_delta_k_set(void *data, u64 val)
> +{
> +	struct clk_pll14xx *pll =3D to_clk_pll14xx(data);
> +	unsigned long flags;
> +	u32 div_ctl1;
> +	s16 kdiv, delta_k;
> +
> +	delta_k =3D (s16)clamp_t(long, val, KDIV_MIN, KDIV_MAX);

Is it possible for this cast to long to cause truncation issues on 32-bit
platforms?

If a user writes a large positive value like 4294967295 (0xFFFFFFFF) to the
debugfs file, wouldn't it be truncated and sign-extended to -1?

Since -1 falls within the valid range, it seems this would bypass the max
bound check and apply an incorrect delta. Does this need to use s64 or long
long for the clamp type?

> +	pll->delta_k =3D delta_k;
> +
> +	spin_lock_irqsave(&pll->lock, flags);

Could this lockless assignment lead to state inconsistencies?

If two threads concurrently write to delta_k, could their execution interle=
ave
such that both update pll->delta_k locklessly, but the lock is acquired
sequentially?

This might result in the hardware accumulating both changes while pll->delt=
a_k
only reflects the last lockless assignment. Should the update of pll->delta=
_k
be moved inside the lock?

> +
> +	div_ctl1 =3D readl_relaxed(pll->base + DIV_CTL1);
> +	kdiv =3D (s16)FIELD_GET(KDIV_MASK, div_ctl1);
> +	kdiv =3D (s16)clamp_t(s32, (s32)kdiv + delta_k, KDIV_MIN, KDIV_MAX);
> +	writel_relaxed(FIELD_PREP(KDIV_MASK, kdiv), pll->base + DIV_CTL1);
> +
> +	spin_unlock_irqrestore(&pll->lock, flags);
> +
> +	return 0;
> +}
> +DEFINE_DEBUGFS_ATTRIBUTE_SIGNED(delta_k_fops, pll_delta_k_get, pll_delta=
_k_set, "%lld\n");
> +
> +static int pll_setting_show(struct seq_file *s, void *data)
> +{
> +	struct clk_pll14xx *pll =3D to_clk_pll14xx(s->private);
> +	u32 div_ctl0, div_ctl1;
> +	u32 mdiv, pdiv, sdiv, kdiv;
> +
> +	div_ctl0 =3D readl_relaxed(pll->base + DIV_CTL0);
> +	div_ctl1 =3D readl_relaxed(pll->base + DIV_CTL1);

Could this sequence result in torn reads if called concurrently with a rate
change?

Looking at clk_pll1443x_set_rate(), the hardware registers are updated
sequentially. DIV_CTL0 is written, followed by a locked write to DIV_CTL1:

    div_ctl0 |=3D FIELD_PREP(SDIV_MASK, rate.sdiv);
    writel_relaxed(div_ctl0, pll->base + DIV_CTL0);

    spin_lock_irqsave(&pll->lock, flags);
    writel_relaxed(FIELD_PREP(KDIV_MASK, rate.kdiv), pll->base + DIV_CTL1);
    spin_unlock_irqrestore(&pll->lock, flags);

If pll_setting_show() runs concurrently without holding pll->lock, could it
interleave between those two writes, reading the updated dividers from
DIV_CTL0 but the stale K divider from DIV_CTL1?

> +
> +	mdiv =3D FIELD_GET(MDIV_MASK, div_ctl0);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-imx8m_pll_=
debugfs-v2-1-20e1d88526b0@nxp.com?part=3D1
