Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7020040E8FC;
	Mon, 28 Sep 2026 08:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790583597; cv=none; b=r5wTLmPA5heCMJCZtzSYK1LysySUk8+TZX+CEA0DPU1NfOGq4GH+aFbEPTWLqQBb5CoAc5kBPcZnrIFKjXUhbc7WBWmBvFFu44bFrvrq7joZEfUMOt5JLaoiRjYDhUq6w1vYxVyUMxEy9WHf54Ce9Bamb7xTHqMqe2yZE/IWDyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790583597; c=relaxed/simple;
	bh=k6TkmAIM+p3Zgjs7Py5EimeYdFwr0YgdRWOJLDPR7og=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Mv8y8poh2bAxkabniAHC4CB2ZbcNKYF0WndTx//XEmDVBcXjdvN7p9JJnTPUNCe8SScLkPEO81Pv8wU8uKLpofeZMAaydd7JsSESPkh8A7lvQc3NA0srPxPhVGy4HGufoxsZta4+sUvFkFjVq3clR27NLKScd3b21Cc96mtggA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cco29uaK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cco29uaK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB2391F000FF;
	Mon, 28 Sep 2026 08:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790583596;
	bh=Js+zyoS86enScoei6v1aInKJhGeuaYXrE65aYiOJoME=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cco29uaKX84uXievZUZX19zpvCmkU3zdPksLH4DsndiEsW1o0sOErwDjF/QJFH5Ed
	 M7CTzqnCCrWaw7u4B9QhYTcA/MvBd8eesaMrOzjwPImrbVLeLcb1yQbKx4fVIluUvL
	 6tgHkwy8VIKxPMkRWbfcu1dYh2T8n8dkCr/UFWHXDriRdhPFUwPpa93yqOvnbTGzK5
	 fdagDmxFnqb4jzgMlXprJsEtrO3wzBtJt2KN2aolwZxlij2MEgit/YqQgvtnQ8SkpX
	 P+/2B183N6+bCOCWBrx5ps1jwAYKkMgPbZrkABtyPzO4Nb5gRpBkKp/uoLuZJ3x+Ey
	 W3DJc6SJTnSXw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/3] media: verisilicon: Remove deprecated
 nxp,imx8mp-vpu variant
Reply-To: sashiko-reviews@lists.linux.dev
To: "Benjamin Gaignard" <benjamin.gaignard@collabora.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, robh@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260928080822.19553-2-benjamin.gaignard@collabora.com>
References: <20260928080822.19553-1-benjamin.gaignard@collabora.com>
 <20260928080822.19553-2-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 08:19:55 +0000
Message-Id: <20260928081955.AB2391F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] media: verisilicon: ABI breakage via removal of nxp,imx8mq-vpu
- [Low] media: verisilicon: incomplete cleanup of runtime_resume
--

commit d5f8aa7d83409c6f9ac3f091a5c490dd769c46dc
Author: Benjamin Gaignard <benjamin.gaignard@collabora.com>

media: verisilicon: Remove deprecated nxp,imx8mp-vpu variant

This commit removes the deprecated monolithic nxp,imx8mq-vpu compatible
string and its associated variant data from the hantro driver. This cleans
up the code since the split G1 and G2 nodes have been preferred since
v5.17-rc1.

> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/me=
dia/platform/verisilicon/hantro_drv.c
> index ad71c0402ef3b..12c804dcc6694 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -725,7 +725,6 @@ static const struct of_device_id of_hantro_match[] =
=3D {
>  #endif
>  #ifdef CONFIG_VIDEO_HANTRO_IMX8M
>  	{ .compatible =3D "nxp,imx8mm-vpu-g1", .data =3D &imx8mm_vpu_g1_variant=
, },
> -	{ .compatible =3D "nxp,imx8mq-vpu", .data =3D &imx8mq_vpu_variant, },

[Severity: Medium]
Since Device Tree bindings are considered a stable ABI, could removing this
compatible string cause a regression?

Old DTBs with the monolithic node might fail to probe hardware video decodi=
ng
on new kernels, which breaks backward compatibility.

>  	{ .compatible =3D "nxp,imx8mq-vpu-g1", .data =3D &imx8mq_vpu_g1_variant=
 },
>  	{ .compatible =3D "nxp,imx8mq-vpu-g2", .data =3D &imx8mq_vpu_g2_variant=
 },
>  #endif

[ ... ]

> diff --git a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c b/drivers/=
media/platform/verisilicon/imx8m_vpu_hw.c
> index fa4224de4b996..0d6a71ae5f454 100644
> --- a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
> +++ b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
[ ... ]
> @@ -319,30 +223,9 @@ static const struct hantro_irq imx8mq_g2_irqs[] =3D {
>  	{ "g2", hantro_g2_irq },
>  };
> =20
> -static const char * const imx8mq_clk_names[] =3D { "g1", "g2", "bus" };
> -static const char * const imx8mq_reg_names[] =3D { "g1", "g2", "ctrl" };
>  static const char * const imx8mq_g1_clk_names[] =3D { "g1" };
>  static const char * const imx8mq_g2_clk_names[] =3D { "g2" };
> =20
> -const struct hantro_variant imx8mq_vpu_variant =3D {
> -	.dec_fmts =3D imx8m_vpu_dec_fmts,
> -	.num_dec_fmts =3D ARRAY_SIZE(imx8m_vpu_dec_fmts),
> -	.postproc_fmts =3D imx8m_vpu_postproc_fmts,
> -	.num_postproc_fmts =3D ARRAY_SIZE(imx8m_vpu_postproc_fmts),
> -	.postproc_ops =3D &hantro_g1_postproc_ops,
> -	.codec =3D HANTRO_MPEG2_DECODER | HANTRO_VP8_DECODER |
> -		 HANTRO_H264_DECODER,
> -	.codec_ops =3D imx8mq_vpu_codec_ops,
> -	.init =3D imx8mq_vpu_hw_init,
> -	.runtime_resume =3D imx8mq_runtime_resume,

[Severity: Low]
With the removal of imx8mq_runtime_resume() and imx8mq_vpu_variant, there
are no remaining users of the runtime_resume callback in struct hantro_vari=
ant.

Should the runtime_resume function pointer in struct hantro_variant and its
wrapper hantro_runtime_resume() in hantro_drv.c also be removed to clean up
the resulting dead code?

> -	.irqs =3D imx8mq_irqs,
> -	.num_irqs =3D ARRAY_SIZE(imx8mq_irqs),
> -	.clk_names =3D imx8mq_clk_names,
> -	.num_clocks =3D ARRAY_SIZE(imx8mq_clk_names),
> -	.reg_names =3D imx8mq_reg_names,
> -	.num_regs =3D ARRAY_SIZE(imx8mq_reg_names)
> -};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928080822.1955=
3-1-benjamin.gaignard@collabora.com?part=3D1
