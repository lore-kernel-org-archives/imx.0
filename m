Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEFD3A1A23;
	Thu, 24 Sep 2026 11:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790249146; cv=none; b=RkgmRqllYO8rXOlGQr8pZv9szjvpXZ8c5HQ0xc6xCSl+0W23H1EBwcs1HNxZQwMc9ljf9HZn9BEZeM87Su8YlGHQFi1AZyUMkpzcwtvU/xSxj8X+2SQmUI40JXP6nBFmDrMrnfD5WH7qMTotO9Xfv0msQawCXaFX83JyV6P0pTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790249146; c=relaxed/simple;
	bh=A6aVWw4SIKR0gHcNSoIXvDt0KKKmtBXwQ7exjKTbTYk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ptRos4yfMqCWFtMU4dbjgVWSaaMZYrdbTN+r/5V/Z8FJYUTA989tgEiubAXk4Y0uo4AKRYZg95kDlccE365zDiYZPHEVLnHyLcUMgQ9VSTy3C0CKy0clz68qd5fzyjkYsjzw2xKcCU95bz7tsSYypAgTi+rjUBCtZm4QwZzAmXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OYwbnRYQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OYwbnRYQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 606D31F000FF;
	Thu, 24 Sep 2026 11:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790249138;
	bh=2ABm4SyvuJZ/84FIc2LYh7DCE6LYjzt2jaq+g9mFUSI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OYwbnRYQldkFd9I8svwGWYXb2agkWZSFqbD/8CYCPVcEkXT8x/sXCR2xg6W/mS33Q
	 Ur36Ojdbel77GgkMqw1JHtVYfe5p4YUAkIemeB7XjSMpxzO8ZSqYwU0MfPHicb4bB0
	 ybdXKuIxYOAgs6XK8grOeMTmG5a1arBcMf98vfDtgVJ3JUL2pRV9lz2QeDaWJ5lc8S
	 HZhOsL6891Yx2x09GdT/9oJR2fI7C9c4ab0QtmCYVW8ez7rqzgFaDDoJdyhEknfVJ2
	 s/v3VEh/lNpOL8zL8H9C4HmeC+l90mcEgabE0DmyMW8lbG5LLTAmuogoZZPIuOymfV
	 R65XNgH71hqLQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] media: verisilicon: Remove useless internal
 fields
Reply-To: sashiko-reviews@lists.linux.dev
To: "Benjamin Gaignard" <benjamin.gaignard@collabora.com>
Cc: conor+dt@kernel.org, media-ci@linuxtv.org, Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260924110825.166238-4-benjamin.gaignard@collabora.com>
References: <20260924110825.166238-1-benjamin.gaignard@collabora.com>
 <20260924110825.166238-4-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 11:25:37 +0000
Message-Id: <20260924112538.606D31F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] media: hantro: break backward compatibility by removing DT compati=
ble string
- [Low] media: hantro: dead code and uninitialized pointer ctrl_base left b=
ehind
--

commit c57de89560179f851e42f6a6ea8c48063d12e4c8
Author: Benjamin Gaignard <benjamin.gaignard@collabora.com>

media: verisilicon: Remove useless internal fields
   =20
No more variants are using multiple registers regions.
Remove the useless fields and simplify driver code.

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
Does this struct still need the ctrl_base pointer?

The initialization of vpu->ctrl_base was removed when the multi-base mapping
was dropped, leaving this field uninitialized.

Additionally, imx8mq_vpu_codec_ops in imx8m_vpu_hw.c and its associated res=
et
function imx8m_soft_reset() still unconditionally dereference this pointer.
Since imx8mq_vpu_variant was removed, they appear to be dead code.

Could these orphaned structures and the ctrl_base field be removed?

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

[Severity: High]
Does the removal of the nxp,imx8mq-vpu compatible string in this series bre=
ak
backwards compatibility for older Device Trees?

Because the driver no longer matches that string, it will completely fail to
probe on systems booting with older DTBs, rendering the hardware unusable.

Additionally, since the string is missing from of_hantro_match, the driver
will not probe at all, which makes the existing fallback warning inside
hantro_probe() unreachable dead code:

    if (of_device_is_compatible(pdev->dev.of_node, "nxp,imx8mq-vpu"))
            dev_warn(&pdev->dev, "%s compatible is deprecated\n",
                     match->compatible);

Since kernel policy strictly maintains DT ABI compatibility, should this
deprecated string be restored to the match array so existing systems contin=
ue
to boot and the warning mechanism works as intended?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924110825.1662=
38-1-benjamin.gaignard@collabora.com?part=3D3
