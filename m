Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB4442BC5E
	for <imx@lists.linux.dev>; Wed, 26 Aug 2026 15:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787759490; cv=none; b=WsY5e/rZt+HRJDYBh6Ec75yrJHN95R+mTCwSmxTYAmX+YyGGlecUwlAeDTvXkDEJE3gdrVO9zV/O8uGHp0SWhCNQxs1JgYhJt6brBm/b+GsrkCM+XGMEvoh1qWvnzaci5DCYXu+dim5zl5i6mjVP0BkWuKZeh3e+0Lll0/qMqsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787759490; c=relaxed/simple;
	bh=m9CWaW1AndA5OKzOMRg58wpPxMNlNv2Ttv9fQdq8f+o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JOEv+jx+ltEGwrzYrdeyXITNzd6BDISgjI+JdpJ2egTnxBZkaXafsZUmhFmfDUTjLNkettuPMVtv1ZS18j2NmjMLpronbskoSunvaIKT/7lVSZ0A6veHykNkXYlTwUUp1dvOz2LAyttf4/+Tvvb+2sNgZzwEFp3Kws2Z/BmFk5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d61w12Zo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d61w12Zo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEB731F000E9;
	Wed, 26 Aug 2026 15:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787759483;
	bh=GhR1DFr8vdd+zSO0Ea0hhK+ArmHoZPDJAM3f4Qjfvn4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d61w12Zoe+1dDl297Km17QSghbfO/mZRAtTz1jUvDIyjLbXBxEcOIPzj85uOFhCyH
	 JrZMjl3yJrp8Pp27AWG8Ez1i0dCjdEWd9HC3srry54yc0PMP6QPnXo3Lpp+kCBWboO
	 BL5QoKII8HjDFTdIsHzV1WE5NyE4T27q/S7RX3gD3Bq9OJ4ls3oi8HPRLdnQ2Pu7G6
	 Xk2xr4NgDcPqflh4+YFAyVGUUeLKSo5+/1OoXbZsdK2fJT+CelmgwNQZjmyCbNNtmb
	 lrFW7vfY0KZAoNXCbTtsJKBYv+aBP8MhEThu53M7oSZIutc5pRbg+fUCDrACqfHh9B
	 0CcOz146gGQKg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] remoteproc: imx_rproc: allow mappings ending at region
 boundary
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcel Hofmann" <marcel@hofmania.de>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260826153838.19018-1-marcel@hofmania.de>
References: <20260826153838.19018-1-marcel@hofmania.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Aug 2026 15:51:23 +0000
Message-Id: <20260826155123.AEB731F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing overflow checks on `da + len` and `sys + len` allow a mali=
ciously crafted ELF segment to bypass bounds validation, resulting in massi=
ve out-of-bounds kernel memory corruption.
--

commit d94c3c742cf1fcf451629ba1a51b1c180a0e9a41
Author: Marcel Hofmann <marcel.hofmann@ingenics-digital.com>

remoteproc: imx_rproc: allow mappings ending at region boundary

This commit updates the address bounds checking in imx_rproc_da_to_sys() and
imx_rproc_da_to_va() to include the exact region boundary. It allows ELF
segments that perfectly fill a mapped memory region to load successfully.

> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rpro=
c.c
> index 745ce52cd8226..f3c7c2ff6713c 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -552,7 +552,7 @@ static int imx_rproc_da_to_sys(struct imx_rproc *priv=
, u64 da,
>  				continue;
>  		}
> =20
> -		if (da >=3D att->da && da + len < att->da + att->size) {
> +		if (da >=3D att->da && da + len <=3D att->da + att->size) {

[Severity: High]
This is a pre-existing issue, but in imx_rproc_da_to_sys() does this bounds
check evaluate da + len without guarding against 64-bit integer overflow?

If a maliciously crafted ELF file provides a segment with a massive p_memsz,
could da + len wrap around to a small value? This might satisfy both
da >=3D att->da and da + len <=3D att->da + att->size, bypassing the bounds
validation and potentially causing a massive out-of-bounds memset() in kern=
el
memory during ELF loading.

[ ... ]

> @@ -585,7 +585,7 @@ static void *imx_rproc_da_to_va(struct rproc *rproc, =
u64 da, size_t len, bool *i
>  		return NULL;
> =20
>  	for (i =3D 0; i < IMX_RPROC_MEM_MAX; i++) {
> -		if (sys >=3D priv->mem[i].sys_addr && sys + len <
> +		if (sys >=3D priv->mem[i].sys_addr && sys + len <=3D
>  		    priv->mem[i].sys_addr +  priv->mem[i].size) {

[Severity: High]
This is also a pre-existing issue, but in imx_rproc_da_to_va() does this
secondary check similarly fail to catch the overflow?

Could the sys + len addition allow the bypassed bounds to be translated into
a valid kernel virtual address for the massive segment?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826153838.1901=
8-1-marcel@hofmania.de?part=3D1
