Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB143DFC7F;
	Wed, 23 Sep 2026 09:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790155153; cv=none; b=Mcq43a2GFiuFUwcTfZhxdFbuZQ5sZ7Uq3cWLd7UH8MLgK3xO7JOJeL52nU/FcKmWgboYauwxz6IR0PHy4yebb7sYxRsCvgFFeRePIr+hiODFxIDzz0pUJZp4OU9CvHkESwrj8IyhBbGIj9Rq3sL1KPdVpEyQwD7csU88NsOKab8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790155153; c=relaxed/simple;
	bh=fHXLnsaV4217rJ3eTgNhzJd30l0kZykDDlpU3cD8hj8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BByus57Z6kTHxWBvVs9ScmDFGgxISWjaOHVH14n6QVS0v8Lqv46AC4gTLJqhKWHR4b/x1aOUWwzCawyK36DZyaYwTQKj2JtKPCbeW6TQbKaN4cWdaCNREU3BcCAIDIndPXOLk7GA1V8c+yU++nvOv18vp68Rz1Od5DOMURnueNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZhPR/8+X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZhPR/8+X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B0E41F000FF;
	Wed, 23 Sep 2026 09:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790155152;
	bh=czzPD8aYwks3LsRaDX71YQneXA1l8gtK4kodfrpUAJE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZhPR/8+XvwfRFXkVzf9vchxhvsuC6LB3ucGEci3tcK16FQUHuZ14typGFzbGPejga
	 rWArf2Uf9ji0j6/u8u33kgy5WGOOZV/COkqXs7QHho9Qw/RlU/xPNJb73ScHT+M1ut
	 kl2FJy8j0b0OBMVL/bF5zRsgGUPXaoCMjta0CafibOnw2SoO/OHs/pOzwgbCADdSOI
	 vAdyv6MK38Q7Ca7XQLF7lKHIRMJhJOhByPpztP5G6S3908EJR3p2jQ3euDULKCxj9C
	 P5EToK9q9WhKlzk0o0eGCKG7ZsO9tjVqw/ObXKT7kUfz2z+w/6s7UVPuw2wQYrvANE
	 Ahl0QnaRUnHWg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] media: verisilicon: Remove useless internal fields
Reply-To: sashiko-reviews@lists.linux.dev
To: "Benjamin Gaignard" <benjamin.gaignard@collabora.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, media-ci@linuxtv.org, Frank.Li@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260923090307.49959-3-benjamin.gaignard@collabora.com>
References: <20260923090307.49959-1-benjamin.gaignard@collabora.com>
 <20260923090307.49959-3-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 09:19:10 +0000
Message-Id: <20260923091911.4B0E41F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] media: hantro: orphaned deprecation check prints incorrect warni=
ngs
- [Low] media: hantro: dead code and uninitialized ctrl_base leftover
--

commit 92c1741f69ee792773b715ddb2cdc5d557c1656f
Author: Benjamin Gaignard <benjamin.gaignard@collabora.com>

media: verisilicon: Remove useless internal fields

This commit removes the reg_names and num_regs fields from struct
hantro_variant and simplifies the register mapping in hantro_probe(). It
replaces the array of reg_bases with a single reg_base pointer since
multiple register regions are no longer used.

> diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/=
platform/verisilicon/hantro.h
> index 0353de154a1ec..20c3afb3b8176 100644
> --- a/drivers/media/platform/verisilicon/hantro.h
> +++ b/drivers/media/platform/verisilicon/hantro.h
[ ... ]
> @@ -204,7 +200,7 @@ struct hantro_dev {
>  	struct device *dev;
>  	struct clk_bulk_data *clocks;
>  	struct reset_control *resets;
> -	void __iomem **reg_bases;
> +	void __iomem *reg_base;
>  	void __iomem *enc_base;
>  	void __iomem *dec_base;
>  	void __iomem *ctrl_base;

[Severity: Low]
Is this ctrl_base field still needed?

With the removal of imx8mq_vpu_variant and imx8mq_vpu_hw_init in a prior
patch, vpu->ctrl_base is no longer initialized. This leaves dead code in
imx8m_soft_reset() which attempts to read from it:

drivers/media/platform/verisilicon/imx8m_vpu_hw.c:imx8m_soft_reset() {
	...
	val =3D readl(vpu->ctrl_base + CTRL_SOFT_RESET);
	...
}

This is now mathematically unreachable because the only caller,
imx8m_vpu_g1_reset(), is referenced by imx8mq_vpu_codec_ops, which is also
orphaned. Could ctrl_base and the associated dead code be removed?

> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/me=
dia/platform/verisilicon/hantro_drv.c
> index 70de47ddb023b..f418b04279856 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -1080,7 +1080,6 @@ static int hantro_probe(struct platform_device *pde=
v)
>  {
>  	const struct of_device_id *match;
>  	struct hantro_dev *vpu;
> -	int num_bases;
>  	int i, ret;
> =20
>  	vpu =3D devm_kzalloc(&pdev->dev, sizeof(*vpu), GFP_KERNEL);

[Severity: Medium]
Since a prior patch in this series removed "nxp,imx8mq-vpu" from
of_hantro_match, will the deprecation check further down in hantro_probe()
print incorrect warnings?

If a device tree node contains both the new "nxp,imx8mq-vpu-g1" and the
old "nxp,imx8mq-vpu" compatibles, it will probe successfully with the new
compatible. However, the check in hantro_probe():

drivers/media/platform/verisilicon/hantro_drv.c:hantro_probe() {
	...
	if (of_device_is_compatible(pdev->dev.of_node, "nxp,imx8mq-vpu"))
		dev_warn(&pdev->dev, "%s compatible is deprecated\n",
			 match->compatible);
	...
}

will still trigger because the old string is in the fallback list. It then
prints match->compatible (which resolves to "nxp,imx8mq-vpu-g1") as
deprecated, which is factually incorrect.

Could this orphaned check be removed to avoid misleading kernel logs?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923090307.4995=
9-1-benjamin.gaignard@collabora.com?part=3D2
