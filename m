Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2088472528;
	Thu, 24 Sep 2026 11:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790249124; cv=none; b=Nq+R1GUlij9Uin4J6JDqxrO4Sfb3/nWeO7uaCl5h2cxY6fkRWs7h6FV0Oco2KfoAVxMWS70zhsb/KrHykGkr0wmYlJgox1UE65qAMzowHTQsd7WS4bSlqwcTjrZnV8mF6FQVBX4jA3dmhhrkxkaQZ8s7flDgP03q2ZWN/6Mj4K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790249124; c=relaxed/simple;
	bh=eJOdCEsYlwDThtrxqDsfJirkmtqvdpzuwi+/SDW1KVM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=S4rg92Je53doGbMg4u7cJxOHihxHQxLuf63BzzXEVKd0YK11zlEUyyb70PLgSyYNxk6SQkOIpnB8ev57MVoLIVGVYFeFSWhrnGqs2mnV+u1mtXFfzOFAc89/IjhX2XghrNRwmMviN5I3UQohL2aPGjifqn3vNeIdEaMmuBjlS64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g2+RwysB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g2+RwysB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C8BF1F00893;
	Thu, 24 Sep 2026 11:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790249122;
	bh=wQC1qYQ+HvboutA58g1+VRYRdb3EC1oRAwyJzyk80Pk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g2+RwysBwZLQ/wJ6McdNXPOJiVsLprN+T2/D1Q1HGYHYK5VkF48PmH8MfatRTn6fG
	 SoAYCqdKPzmWhrcobmkUPGEzZE9DpzpIaBew3+qm9n2puups1Qq+VRy8eXIs9XlN3V
	 CfIfzMis9qEoQxVqm6VeXDCxlIcmUb41Ux6FVZQVRC7d07qcx35cvuTURBv2VERO6X
	 Tka0+0QGYOdiNZMbbeKVEGN54e1bdLipowR3ALuu9IEG90rFN5CzjR0sF/YuwlVBtb
	 KEowYx4T8cJsmTb3g7HQpQG0ljJOAtaooMFF/JX/1NEV9z7bpAQ2luQ+q9/kwEY4ii
	 5qn4S1JUCI0gg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] media: verisilicon: Remove deprecated variant
Reply-To: sashiko-reviews@lists.linux.dev
To: "Benjamin Gaignard" <benjamin.gaignard@collabora.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260924110825.166238-2-benjamin.gaignard@collabora.com>
References: <20260924110825.166238-1-benjamin.gaignard@collabora.com>
 <20260924110825.166238-2-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 11:25:22 +0000
Message-Id: <20260924112522.6C8BF1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] media: verisilicon: DT ABI breakage and unreachable deprecation =
warning
- [Low] media: verisilicon: unused codec ops and reset functions left as de=
ad code
--

commit bd50c02dbeb6cf3a61e4c9cb1e9948505f4bb9e8
Author: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: media: verisilicon: Remove deprecated variant

This commit removes the deprecated "nxp,imx8mq-vpu" compatible string
and its associated variant data structure from the hantro driver to clean
up the code. The variant has been deprecated since v5.17-rc1.

> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/me=
dia/platform/verisilicon/hantro_drv.c
> index ad71c0402ef3b..70de47ddb023b 100644
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
Does removing this compatible string completely break backward compatibility
for systems booting with older Device Trees containing only nxp,imx8mq-vpu?

Since the driver no longer matches this string, hantro_probe() is never
invoked for it. This renders the backwards compatibility check and dev_warn=
()
further down in hantro_probe() completely unreachable:

drivers/media/platform/verisilicon/hantro_drv.c:hantro_probe() {
    ...
	/*
	 * Support for nxp,imx8mq-vpu is kept for backwards compatibility
	 * but it's deprecated. Please update your DTS file to use
	 * nxp,imx8mq-vpu-g1 or nxp,imx8mq-vpu-g2 instead.
	 */
	if (of_device_is_compatible(pdev->dev.of_node, "nxp,imx8mq-vpu"))
		dev_warn(&pdev->dev, "%s compatible is deprecated\n",
			 match->compatible);
    ...
}

Is it intentional to prevent the driver from binding entirely instead of ju=
st
warning about the deprecation? If so, should the unreachable warning block
in hantro_probe() also be removed?

>  	{ .compatible =3D "nxp,imx8mq-vpu-g1", .data =3D &imx8mq_vpu_g1_variant=
 },
>  	{ .compatible =3D "nxp,imx8mq-vpu-g2", .data =3D &imx8mq_vpu_g2_variant=
 },
>  #endif

[ ... ]

> diff --git a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c b/drivers/=
media/platform/verisilicon/imx8m_vpu_hw.c
> index fa4224de4b996..3b63f626d33f2 100644
> --- a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
> +++ b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c

[ ... ]

> @@ -319,30 +280,9 @@ static const struct hantro_irq imx8mq_g2_irqs[] =3D {
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
> -	.irqs =3D imx8mq_irqs,
> -	.num_irqs =3D ARRAY_SIZE(imx8mq_irqs),
> -	.clk_names =3D imx8mq_clk_names,
> -	.num_clocks =3D ARRAY_SIZE(imx8mq_clk_names),
> -	.reg_names =3D imx8mq_reg_names,
> -	.num_regs =3D ARRAY_SIZE(imx8mq_reg_names)
> -};
> -

[Severity: Low]
Does the removal of imx8mq_vpu_variant leave several other functions and
declarations orphaned as dead code?

By removing the variant, there are no remaining references to the static
array imx8mq_vpu_codec_ops. That array is the only caller of imx8m_vpu_g1_r=
eset,
which in turn uniquely calls imx8m_soft_reset.

Should these unused declarations, along with the extern declaration for
imx8mq_vpu_variant in drivers/media/platform/verisilicon/hantro_hw.h,
also be removed to prevent compiler warnings about unused variables and
functions?

>  static const struct of_device_id imx8mq_vpu_shared_resources[] =3D {
>  	{ .compatible =3D "nxp,imx8mq-vpu-g1", },
>  	{ .compatible =3D "nxp,imx8mq-vpu-g2", },

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924110825.1662=
38-1-benjamin.gaignard@collabora.com?part=3D1
