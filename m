Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D7C2494F0
	for <imx@lists.linux.dev>; Mon, 25 May 2026 06:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779690992; cv=none; b=EsK3QcppAnJGkgvJdsn8DpVJ3fSXypBnAJ1/PQ2MtSMxnUo361gBA4nGDXiAKqv/4zfoH+w1twF9t+wtCs5dT0WNboZEw5v2/ObWyw+51N9QCrKr7I8ttpwiP6XngURQ/k5gWBsQb5uAqf0M7OmCfmmcn2lmr3FfvAdm+oveHAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779690992; c=relaxed/simple;
	bh=SDLmlcNPSQpkY6uuyWKsbbpMS6tnYSXpbKgfkPPROME=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Gibw/ag9yTtdXruo29WRjdL210cuhntEDtZi/zYdvpVfdRbvN9vpOyerF3SYwKageU3vdov126+UwmNTcK7YUFfTRy4da4YM4FabwRQoPGxh3OI+HNnFSvT6hwLutY7AJUbvIfj54pnoYXHhI+qhC8HreMs5q5bjVodXrjVgk1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E0DtfuuD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E0DtfuuD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E34E51F000E9;
	Mon, 25 May 2026 06:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779690991;
	bh=mxzvA9MzH6q/7dkyx6KioGRyc0AozOwRorY6A/3iKzA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E0DtfuuDsBTBhNgVorYtHnXTRuvoriQpuT89VdTR/DFfRuJZkM1/ottDEg32OIoBB
	 F8VtkcIcecvWtBUHfPg2nGTUgtHAyqnGLv01EcwzU4bR2Yo0l4+yTrPHKM4CH5mMjA
	 B5Uxchv9CwTBq3oHhDhfsIo/4Lf//7N7rT8xISxJgTEBHm0lV92sENTTnvHLt1eiAt
	 z9bX/6sGDIQHhFEtRH2m7Vx1HTZHxxf6vBoq9UG3iX0dO9gxSBTQNev6ueLcFvOuqe
	 kHIjUzoZ6hQMv9Hdr1a9jVT/XbBCrLRcQlN1MtBcsl1gj8zKeijFHWmZpyr3O0bGwz
	 VcTKqc9qBasBQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv3] remoteproc: imx_rproc: add missing DRAM ranges for
 i.MX93
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhiqiang Hou" <Zhiqiang.Hou@nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260525062031.24725-1-Zhiqiang.Hou@nxp.com>
References: <20260525062031.24725-1-Zhiqiang.Hou@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 06:36:30 +0000
Message-Id: <20260525063630.E34E51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Address translation fails for requests matching exactly the end bo=
undary of a memory region due to a strict inequality check.
--

commit 32acb41558a7e1f55f57c27cddcfe528e4522a38
Author: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>

remoteproc: imx_rproc: add missing DRAM ranges for i.MX93

This commit adds missing M33 DRAM address mappings (secure and non-secure
ranges) to the i.MX93 remoteproc address translation table. These additions
complete the DRAM coverage and prevent invalid address translations for
firmware accessing these regions.

> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rpro=
c.c
> index 7f54322244aca..175c2d3099794 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -198,6 +198,9 @@ static const struct imx_rproc_att imx_rproc_att_imx93=
[] =3D {
>  	{ 0x80000000, 0x80000000, 0x10000000, 0 },
>  	{ 0x90000000, 0x80000000, 0x10000000, 0 },
> =20
> +	{ 0xA0000000, 0xA0000000, 0x10000000, 0 },
> +	{ 0xB0000000, 0xA0000000, 0x10000000, 0 },
> +

[Severity: High]
This is a pre-existing issue, but I noticed the boundaries of these transla=
tion
regions are checked using a strict inequality in imx_rproc_da_to_sys() and
imx_rproc_da_to_va().

In imx_rproc_da_to_sys(), the translation request is checked like this:

drivers/remoteproc/imx_rproc.c:imx_rproc_da_to_sys() {
	...
	if (da >=3D att->da && da + len < att->da + att->size) {
		unsigned int offset =3D da - att->da;
	...
}

And similarly in imx_rproc_da_to_va():

drivers/remoteproc/imx_rproc.c:imx_rproc_da_to_va() {
	...
	if (sys >=3D priv->mem[i].sys_addr && sys + len <
	    priv->mem[i].sys_addr +  priv->mem[i].size) {
		unsigned int offset =3D sys - priv->mem[i].sys_addr;
	...
}

Does this mean that if a translation request extends exactly to the end of a
memory region (da + len =3D=3D att->da + att->size), it will be incorrectly
rejected?

Could this cause firmware loading or communication to fail if a resource
table, memory segment, or vring is placed exactly at the end of a memory
region?

>  	{ 0xC0000000, 0xC0000000, 0x10000000, 0 },
>  	{ 0xD0000000, 0xC0000000, 0x10000000, 0 },
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525062031.2472=
5-1-Zhiqiang.Hou@nxp.com?part=3D1
