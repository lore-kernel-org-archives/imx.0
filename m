Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AE047ECDE
	for <imx@lists.linux.dev>; Thu,  4 Jun 2026 13:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780581551; cv=none; b=KlGdq4mAOXk3vA3ZAQ/ahwnT20Ajnu7pbHY9nKsKMYgTq89NhI+yRtupFUX3lyROqMo+XZhsQ91hqHQaZK1N4YYKpxtmTyoxMtmihxC+hxlBoW7+djoxuKpzpQES7IqnuroP4WxGV1nXr55D0D3HgpTvwtQLMD2HRohNJXQgi5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780581551; c=relaxed/simple;
	bh=56V5ueUY/y+ZTcG9lWygoAz3L3tY2YWJtH9Qe6gHsLw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FGCz/aYsbnx98DA4B3oyANa09eTwXMJ7WiyG8LQFydyN0w2wMnz+2sIo8a2V2ChX1O/3IvEAaLzikFmgScLpVxWAkYpE9vnND4MlEJz8dlAhvrjvCTQHjQETDiUuiOblN/70adwpZcv03DzIWwWHJfFIxmslRjodCzKy1+a00aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lowgz6sD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lowgz6sD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 410651F00893;
	Thu,  4 Jun 2026 13:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780581549;
	bh=cxk2dTkEa1QuLAqHRUWA/Zd51vAMgwrpv7XgKFeVlXg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lowgz6sDHXzj5Vp4yrgOWCD9cJMdtSj7I39doxPmB5atqWPPaKfvd+j4theCXow0z
	 gFD07SSBvTEp4N1zhqNzkPr0P8aNNJg2diznq4uyjm6aQRO05CBPECRngTVn1b6SQJ
	 wP6MXIuZC4/QIPiP9ZLEqNmXivX7V7KJQ7Wzx9yfdb1kixPglsiNj775likQ5BkbHA
	 RF/iAxaWWhuPhwUKNnAVkaGrPXcKcL7X539x7hl5TMaHN23jJN5nNWQNK4TCccuDBx
	 YhNUCbJQ0wToLOs0Z1HecXBCJQU/0O9hoy467l1zgubhg1xql+E0AgreFm9cWYjRAm
	 ftdF0aHvqzOIA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] clk: imx: Add audio PLL debugfs for K-divider
 control
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacky Bai" <ping.bai@nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260604-imx8m_pll_debugfs-v3-1-4e331ebc85d7@nxp.com>
References: <20260604-imx8m_pll_debugfs-v3-1-4e331ebc85d7@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 13:59:08 +0000
Message-Id: <20260604135909.410651F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing teardown API for exported debugfs initialization leads to =
Use-After-Free and broken functionality on rebind.
- [Low] Unprotected read of `pll->delta_k` causes a data race.
--

commit 817ee72c2810a6a79b5b707e34db091aae62c704
Author: Jacky Bai <ping.bai@nxp.com>

clk: imx: Add audio PLL debugfs for K-divider control

This commit adds debugfs support for runtime tuning of the audio PLL K divi=
der.
It exports delta_k and pll_parameter interfaces to userspace for fine-grain=
ed
frequency adjustments.

> diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
> index 39600ee22be30..b6f1cc9f57005 100644
> --- a/drivers/clk/imx/clk-pll14xx.c
> +++ b/drivers/clk/imx/clk-pll14xx.c

[ ... ]

> +static int pll_delta_k_get(void *data, u64 *val)
> +{
> +	struct clk_pll14xx *pll =3D to_clk_pll14xx(data);
> +	*val =3D pll->delta_k;

[Severity: Low]
Is this read of delta_k missing protection? It is modified under
lock in pll_delta_k_set(), but read here without holding the
lock or using READ_ONCE(), which can cause a data race.

> +	return 0;
> +}
> +
> +static int pll_delta_k_set(void *data, u64 val)
> +{
> +	struct clk_pll14xx *pll =3D to_clk_pll14xx(data);
> +	unsigned long flags;
> +	u32 div_ctl1;
> +	s16 kdiv, delta_k;
> +
> +	delta_k =3D (s16)clamp_t(s64, val, KDIV_MIN, KDIV_MAX);
> +
> +	spin_lock_irqsave(&pll->lock, flags);
> +
> +	pll->delta_k =3D delta_k;
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

[ ... ]

> +void imx_audio_pll_debug_init(struct clk_hw *hws[], unsigned int num_pll=
s)
> +{
> +	struct dentry *rootdir, *audio_pll_dir;
> +	const char *pll_name;
> +	int i;
> +
> +	rootdir =3D debugfs_create_dir("audio_pll_monitor", NULL);
> +
> +	for (i =3D 0; i < num_plls; i++) {
> +		if (!IS_ERR_OR_NULL(hws[i])) {
> +			pll_name =3D clk_hw_get_name(hws[i]);
> +			audio_pll_dir =3D debugfs_create_dir(pll_name, rootdir);

[Severity: High]
Does this lack a teardown mechanism? If a module that uses this API is unbo=
und
or unloaded, its hws structures will be freed, but the debugfs files remain.

If a subsequent userspace access reads the file, won't it trigger a
use-after-free in pll_delta_k_get() when dereferencing the private data?

Also, debugfs_create_dir("audio_pll_monitor", NULL) is called unconditional=
ly.
If this is called multiple times (like on a rebind), won't the second call
fail and silently break the debug interface?

> +			debugfs_create_file_unsafe("delta_k", 0600, audio_pll_dir,
> +						   hws[i], &delta_k_fops);
> +			debugfs_create_file("pll_parameter", 0444, audio_pll_dir,
> +					    hws[i], &pll_setting_fops);
> +		}
> +	}
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604-imx8m_pll_=
debugfs-v3-1-4e331ebc85d7@nxp.com?part=3D1
