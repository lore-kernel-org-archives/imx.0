Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07444189C5;
	Tue,  7 Jul 2026 13:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783430708; cv=none; b=ccWxs1Hh8zdGsA81X94OTtkQRQLSDV3ygSuHKyXwv+2Jl4RN0cCmDvhFY5pY5C5mt/xPcvf4wtEuH8/HszaDWpadgNqeEH4l9x5GCXjnQAlWIxuX3fosv9js59XAmnLDv36RwoksnAhlarNDO8kKWNb2GP1+COwbAaw3nyGDGuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783430708; c=relaxed/simple;
	bh=w4Zgr/cBFydsGWGcKVRHk7Z4gZpZcJYLF+duQmH7YS0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Xbkg81puIqZtvCQ+DttpLlf05pViYsiaoFyd5AT3HCtHCYgaBrG478GQMuCA+Rng+mV8aP9AhpSZGWvjPGiR8Dnq4K+kvsTf/GqWId/g0cRZ3kA4tXUvTYSXQxlShRPf3mLnC76FveAe7GLLck/B2o/OTmAljxndPQ0efin7TTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UUaABH7/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UUaABH7/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6AB61F000E9;
	Tue,  7 Jul 2026 13:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783430707;
	bh=YJsVM5qVcHrFc2Jbum/XGwZMZgdj9uhNyg+CjpvCzqQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UUaABH7/p6d7l9sAcUn3ZgHXot68DUnMPdD6D5DlDMR2fcURLwVeYSDqjCOEEPghk
	 9aAUL7iDs5Yg2n5F7mrL+donQzHvwuN3f2Pvaw1mCVfI8xPY/8CU7ZtydTpzDb7Tsy
	 fX4zErgGG/f3e05tSLVCFTomR0T5LzoZ5zCJVl65SFzQkT028WjCc4gSvaqFLpHtoi
	 JWw7jHLI4y7Jw7706JNJ0EZ+zEzTQ+oKMyiiZzChxYjupYmMFuuy9S4dkarILeCUMr
	 1O8UOUM2LPEOzLpqmNq/cVY/DPnaFd1cxMtEfRR6EbqnhvKpD0wJimV1uJRXt5Yhk8
	 wyF6jwqazI2Qg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 18/20] usb: musb: use
 platform_device_set_of_node_from_dev()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: lee@kernel.org, mfd@lists.linux.dev, dri-devel@lists.freedesktop.org, robh@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260706-pdev-fwnode-ref-v3-18-1ff028e33779@oss.qualcomm.com>
References: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
 <20260706-pdev-fwnode-ref-v3-18-1ff028e33779@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 13:25:06 +0000
Message-Id: <20260707132506.E6AB61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch missed replacing `device_set_of_node_from_dev()` with =
the new `platform_device_set_of_node_from_dev()` wrapper for four dynamical=
ly allocated platform devices in the `musb` subsystem. Because the final pa=
tch in this series modifies `platform_device_release()` to only drop the `f=
wnode` reference instead of the `of_node` reference, these four un-migrated=
 drivers will never have their `fwnode` field populated and will leak their=
 `of_node` reference upon device destruction.
--

commit 38644321565357d4bf1b4cbb11a9e179abf72efc
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

usb: musb: use platform_device_set_of_node_from_dev()

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node from another device for
dynamically allocated platform devices with the provided helper.

> diff --git a/drivers/usb/musb/jz4740.c b/drivers/usb/musb/jz4740.c
> index df56c972986f7..c770ba576f05b 100644
> --- a/drivers/usb/musb/jz4740.c
> +++ b/drivers/usb/musb/jz4740.c
> @@ -273,7 +273,7 @@ static int jz4740_probe(struct platform_device *pdev)
>  	musb->dev.parent		=3D dev;
>  	musb->dev.dma_mask		=3D &musb->dev.coherent_dma_mask;
>  	musb->dev.coherent_dma_mask	=3D DMA_BIT_MASK(32);
> -	device_set_of_node_from_dev(&musb->dev, dev);
> +	platform_device_set_of_node_from_dev(musb, dev);

[Severity: Medium]
Will this miss other dynamically allocated platform devices in the musb
subsystem?

Because the final patch in this series modifies platform_device_release() to
only drop the fwnode reference instead of the of_node reference, wouldn't
these remaining un-migrated drivers never have their fwnode field populated?

This could cause an of_node reference leak upon device destruction (e.g., v=
ia
platform_device_put() on probe failure or driver unbinding). If these devic=
es
are instantiated via dynamic Device Tree overlays, the leaked reference will
prevent the overlay from being safely unloaded.

The following files appear to have missed the migration:

drivers/usb/musb/mpfs.c:mpfs_probe()
	device_set_of_node_from_dev(&musb_pdev->dev, dev);

drivers/usb/musb/musb_dsps.c:dsps_create_musb_pdev()
	device_set_of_node_from_dev(&musb->dev, &parent->dev);

drivers/usb/musb/omap2430.c:omap2430_probe()
	device_set_of_node_from_dev(&musb->dev, &pdev->dev);

drivers/usb/musb/ux500.c:ux500_probe()
	device_set_of_node_from_dev(&musb->dev, &pdev->dev);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-pdev-fwnod=
e-ref-v3-0-1ff028e33779@oss.qualcomm.com?part=3D18
