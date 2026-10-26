Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793016105;
	b=GGzAoP+Dig+SHOgBWQOdC5FZPsKhwa3o0f9cbi2HrtkyWaLw/ZQqyx5VBz6UHus1UzAx
	 ls8WUfx/hFJwkoyHpzQ/VYcvjVOB+r8I8pwsnNEh4KLyLI7HgVo+1A4BggPThsRYOsLDK
	 I6tNwuX9qzItnpsct3FaX576DGJFfB6decfUU6IzMBjGLvp/35DjTZ0AlVQO9JA392HiL
	 m57wiA1V0Myu5/kDe5JZcQsZ7Tri5ZcSEogUUCcUd8FZXfa4tvZoycMHPKkHEwpZJ00QA
	 vcs/vAPxHCMe6TJnoQE6vZJx2y4Xh+rj1IPU+WDr6F9sBdUpzKSvZ2YGicLlV2V5C7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016105;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YlzxsM+I5sjQdg8MF4q4GmHlBacz+7Wy/Xw5ZiK05NU=;
	b=pZ5gx4/z0mOQz8sDiEUUcE5IH5u6AhGYi93+tJuZIOAT2/nDwDpEv/FWXZCIVWc2fQr5
	 6I7i6NbLQWwPfSkIEhcb4LlMKWUN99j5gSG/4uyEwJH7V7CzAWEkiTR8lLCQP0U+Kik/c
	 zxSUS93nCxVtZgPL0x6iJ+sxvYdUFt6kzypTFtMOfGjfsrPqkLht3dF6bCXQLFdto4qf6
	 tzeNXZTp8tKAjmqXPp0H3iM19eWf1/JkKtaYgHV6IXt2s3XWVL4BxkxuOgjGxoH4FFtpg
	 4iKQmHDtDBsLGuv10OqU3REhFNy1l1QYZcpFjfPEaj26stwMfcQT843IQkltor91iew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="h8Cdizn/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A3D606A332;
	Mon, 26 Oct 2026 12:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h8Cdizn/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22E411F01825;
	Mon, 26 Oct 2026 12:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793016104;
	bh=YlzxsM+I5sjQdg8MF4q4GmHlBacz+7Wy/Xw5ZiK05NU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h8Cdizn/0898e5pomPrkGCD1tDhufp7mFIvKa7zQaYM5xWS078DtKfd8+CpIBP8Sc
	 sATPqyqGLL21Kp8z1PLDpcvgUJ4FePeryXN6/dbdJ6nuRXVvAZIidj++SnhFemNbs2
	 p/2ZltpGBrk2cgySmXB4x7wXN+6WiL+tREKfaRpucnmAkitrVni4nnGkMm4EBNLbEw
	 zl+qP8DE0xavCg8QavZjcxtt42yyr3MbyWEVNvTtaVMAPqQbQxQh5URp+BaHk/uA8/
	 cSAKuPmsSXU/Qd/Jom3QpbZp5wFrnIwxbYBG7pgNyvuYQzw/w/sp0MtoZStt4PuF5V
	 9TnQhhA53jgmg==
Message-ID: <sashiko-outbox-185150@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 10/15] drm/imx: dc-ed: Support getting source
 selection
Reply-To: sashiko-reviews@lists.linux.dev
To: "Liu Ying" <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261026-imx8-dc-prefetch-v7-10-a0b50cc4fc65@nxp.com>
References: <20261026-imx8-dc-prefetch-v7-0-a0b50cc4fc65@nxp.com>
 <20261026-imx8-dc-prefetch-v7-10-a0b50cc4fc65@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 12:01:43 +0000
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
- [Medium] drm/imx: dc-ed: invalid link IDs accepted in dc_ed_pec_src_sel_g=
et()
--

commit e94375137aef3b831a8ffe20e951e2c25abaed0f
Author: Liu Ying <victor.liu@nxp.com>

drm/imx: dc-ed: Support getting source selection

This commit adds dc_ed_pec_src_sel_get() to read and validate the ExtDst
source selection from PIXENGCFG_DYNAMIC.

> diff --git a/drivers/gpu/drm/imx/dc/dc-ed.c b/drivers/gpu/drm/imx/dc/dc-e=
d.c
> index de1b71315eabd..67163dca1363c 100644
> --- a/drivers/gpu/drm/imx/dc/dc-ed.c
> +++ b/drivers/gpu/drm/imx/dc/dc-ed.c
> @@ -149,6 +149,35 @@ void dc_ed_pec_src_sel(struct dc_ed *ed, enum dc_lin=
k_id src)
>  	}
>  }
> =20
> +int dc_ed_pec_src_sel_get(struct dc_ed *ed, enum dc_link_id *src)
> +{
> +	u32 val;
> +	int ret;
> +
> +	ret =3D regmap_read(ed->reg_pec, PIXENGCFG_DYNAMIC, &val);
> +	if (ret)
> +		return -EINVAL;
> +
> +	switch (val) {
> +	case LINK_ID_NONE:
> +	case LINK_ID_CONSTFRAME0:
> +	case LINK_ID_CONSTFRAME4:
> +	case LINK_ID_CONSTFRAME1:
> +	case LINK_ID_CONSTFRAME5:
> +	case LINK_ID_FETCHWARP2:
> +	case LINK_ID_FETCHLAYER0:
> +	case LINK_ID_LAYERBLEND0:
> +	case LINK_ID_LAYERBLEND1:
> +	case LINK_ID_LAYERBLEND2:
> +	case LINK_ID_LAYERBLEND3:
> +		*src =3D val;
> +		dev_dbg(ed->dev, "get source selection: 0x%02x\n", val);
> +		return 0;
> +	default:
> +		return -EINVAL;
> +	}
> +}

[Severity: Medium]
Should dc_ed_pec_src_sel_get() validate the value read from PIXENGCFG_DYNAM=
IC
against src_sels[] rather than accepting LINK_ID_FETCHWARP2 and
LINK_ID_FETCHLAYER0?

In drivers/gpu/drm/imx/dc/dc-ed.c, src_sels[] defines the valid source link
IDs for the ExtDst unit and is used by dc_ed_pec_src_sel():

static const enum dc_link_id src_sels[] =3D {
	LINK_ID_NONE,
	LINK_ID_CONSTFRAME0,
	LINK_ID_CONSTFRAME1,
	LINK_ID_CONSTFRAME4,
	LINK_ID_CONSTFRAME5,
	LINK_ID_LAYERBLEND3,
	LINK_ID_LAYERBLEND2,
	LINK_ID_LAYERBLEND1,
	LINK_ID_LAYERBLEND0,
};

void dc_ed_pec_src_sel(struct dc_ed *ed, enum dc_link_id src)
{
	int i;

	for (i =3D 0; i < ARRAY_SIZE(src_sels); i++) {
		if (src_sels[i] =3D=3D src) {
			regmap_write(ed->reg_pec, PIXENGCFG_DYNAMIC, src);
			return;
		}
	}
}

Because fetch units only connect to LayerBlend secondary inputs (sec_sels[]=
 in
dc-lb.c), LINK_ID_FETCHWARP2 and LINK_ID_FETCHLAYER0 are rejected by
dc_ed_pec_src_sel(). However, dc_ed_pec_src_sel_get() accepts them and retu=
rns
0 instead of -EINVAL, which could cause callers such as
dc_crtc_disable_at_boot() to treat an invalid ExtDst source as an active
pipeline.

Would it be better to iterate over src_sels[] in dc_ed_pec_src_sel_get() ju=
st
like dc_ed_pec_src_sel() does?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026-imx8-dc-pr=
efetch-v7-0-a0b50cc4fc65@nxp.com?part=3D10
