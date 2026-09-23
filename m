Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA523AA1B6;
	Wed, 23 Sep 2026 09:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790154965; cv=none; b=cyO9vPd2H2vWGF3Cx+0U1rZ5cQB9f+ZQLTbhF9dBh79+aZHbDd9xwXxe2AbJceD9fIG0JjVgiUZ6yqhBQm40nPoichxV605V6tTNTJWWUUjNn7TagTsMwgQA2RCf7C/nZb57o8Leyflv7Cl7i7PMq5QT+kva73bXaaWYXw3ecQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790154965; c=relaxed/simple;
	bh=ZnKl80xOrL1laez0ASshl03/WC1Y8tQqBTbVlzrrf5Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=seE7uFzr9lEdO5tfbPNw3KGUsmPFN6RIn65xRm/lQ/K4OdByLJ/LFo/NK7SIEBuv0L9wGg9yzVme5fhafSxsTotfu16kCOmQL4p4slFggd6NZjxnLuVKUJhtg51/KmxuY9H4RagxW/puVEdegA46G+xgoD4OreoG85PTUI4Tzgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mZCPp5om; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mZCPp5om"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E47F41F000FF;
	Wed, 23 Sep 2026 09:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790154964;
	bh=wxHg8lksQHbSVOS9YhQsANAr09ELJVVLEJJUfC/jOmQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mZCPp5omBT5ithCXGxi3zdyw4JmbyuahR4oTwQFWIjTWTo5CCtiTLk2vAkbaYt2Md
	 oZdZaFNGXst9NvQIBH/RA8MLXLKFQl/3qbhPLMettDB1R5rjCWA2U/+rwngBDG8/Fr
	 LT4zNdq7XebrSlDy6cH3koo2ZMndsnxRM5vkCmRF+7d3hR8Olljlh5AaEuYm2sPDca
	 HxjFW6UTKQv8iC79AFXXHvltcUhcP+bvSyCC0vJqHhNq2M8nn4lacD9xVo2ELFMt+L
	 KG+/fkLTQJ4DN0z1kF/D8QvyXWP4ckod5WrfAq7Lu1MQWMtf9ntOowx4thgprT+SZx
	 UiQtAKIzLAuEw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] media: verisilicon: Remove deprecated variant
Reply-To: sashiko-reviews@lists.linux.dev
To: "Benjamin Gaignard" <benjamin.gaignard@collabora.com>
Cc: imx@lists.linux.dev, robh@kernel.org, media-ci@linuxtv.org, Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260923090307.49959-2-benjamin.gaignard@collabora.com>
References: <20260923090307.49959-1-benjamin.gaignard@collabora.com>
 <20260923090307.49959-2-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 09:16:03 +0000
Message-Id: <20260923091603.E47F41F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] media: verisilicon: Removing DT compatible string breaks backward =
compatibility
- [Low] media: verisilicon: Dead and misleading backward compatibility bloc=
k in hantro_probe()
- [Low] media: verisilicon: Incomplete removal of imx8mq_vpu_variant leaves=
 dead code
--

commit 1f4bbb2a1b7cf6366695f8a3ceae88b4f0b1e95c
Author: Benjamin Gaignard <benjamin.gaignard@collabora.com>

media: verisilicon: Remove deprecated variant
   =20
"nxp,imx8mq-vpu" is tagged as deprecated since:
commit f3116f2e52e6 ("media: dt-bindings: media: nxp, imx8mq-vpu: Split G1 =
and G2 nodes")
merged since v5.17-rc1.
There is more reference to it since that.
Remove for driver and Documentation to clean up the code.

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

[Severity: High]
Does removing this compatible string break backward compatibility for older
device trees? The driver will silently fail to probe for the VPU on systems
using older Device Tree Blobs that only use the nxp,imx8mq-vpu compatible
string.

[Severity: Low]
Since nxp,imx8mq-vpu is removed from the match table, does this leave a dead
backward compatibility block in hantro_probe()?

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

If an older DTB with only nxp,imx8mq-vpu is used, the device won't probe and
the block is never reached. If a node happens to include both the new valid
string and the deprecated one, the driver will probe via the valid string, =
but
this block will execute and incorrectly print that the valid string is
deprecated.

>  	{ .compatible =3D "nxp,imx8mq-vpu-g1", .data =3D &imx8mq_vpu_g1_variant=
 },
>  	{ .compatible =3D "nxp,imx8mq-vpu-g2", .data =3D &imx8mq_vpu_g2_variant=
 },
>  #endif

> diff --git a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c b/drivers/=
media/platform/verisilicon/imx8m_vpu_hw.c
> index fa4224de4b996..3b63f626d33f2 100644
> --- a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
> +++ b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
[ ... ]
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
Does the removal of imx8mq_vpu_variant leave behind unreferenced variables
and functions?

The imx8mq_vpu_codec_ops array, imx8m_vpu_g1_reset(), and imx8m_soft_reset()
are no longer used anywhere. Additionally, the ctrl_base member in
struct hantro_dev is never assigned anymore, and the extern declaration of
imx8mq_vpu_variant in hantro_hw.h still exists.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923090307.4995=
9-1-benjamin.gaignard@collabora.com?part=3D1
