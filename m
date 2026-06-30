Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC8E35F5F8;
	Tue, 30 Jun 2026 09:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811123; cv=none; b=n7i9z8kFovpnyzF31v2vZ8qqDkFL5+WtA7wmljY0j1IlYu2LA7FYcxEvrjRLUcqz4pN9CVLsThiYgESt1c7TI+An85Ki3fxcnqXAb90jLl21Kl9X+qdCl0204bKfnEcDOERpX28gKi4f9KssJwFyzYpQRMd47R5s1kvgFSsjVbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811123; c=relaxed/simple;
	bh=X29VePm95MCgABr7iJfqKTBMBDQQyDsnnWLJgSZHTHU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fbFTAkiN6GdCsy4RuU5XKWUKB3xw0V0ZhlA9x2X+c5Ao/AmDLobGj7cbPEQFGjS3JDz20zDP7gFJZKL+ErG5kjstxgU2SAGTP5Pn+PdhNgtkB4t29H8Di53wuCRJDxXs+e+c56UwcMv/QDgljuqqHAtsqyMuEbmk7IfF2ysx5Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BjFtZ6lY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BjFtZ6lY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFD6D1F00A3E;
	Tue, 30 Jun 2026 09:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782811122;
	bh=EH5/L2M1XpJnyfHNsfPqgccrseXM6UKjnYvjmKgJ5Jc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BjFtZ6lYWu6gymDB6S0FINyVl8dWvlLSYBgSnNC4plnBdpg9Bf8IbCuB4qEfCdd3R
	 fiNK8D8w9m1rpA7c4hWxGwx5kQr1qF09kJfxTHufYclbQuvybA7gA4gQornzq8HTEX
	 atB9RL9bYSPmkJ22BjiLBwpK56fQ5YyqSNG5LpVDLlnTdRYRbQj6XiE+VnjLRY3BRL
	 heOu8U7xlr9si9xHfeyXSx4w/jUxL6u7tJXbHbZUXdMru/IAJvK27mCCeEQ68j5UOe
	 ddaNFJfVVW4SaeiobgLW81UpGdicHlRTkO8Ki5FdK8Kq50j09HSw3wXn40aZzsHvB0
	 IlvdoEFzOHISQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 17/19] usb: musb: use
 platform_device_set_of_node_from_dev()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org, imx@lists.linux.dev
In-Reply-To: <20260629-pdev-fwnode-ref-v2-17-8abe2513f96e@oss.qualcomm.com>
References: <20260629-pdev-fwnode-ref-v2-0-8abe2513f96e@oss.qualcomm.com>
 <20260629-pdev-fwnode-ref-v2-17-8abe2513f96e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 09:18:41 +0000
Message-Id: <20260630091841.CFD6D1F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Incomplete migration to `platform_device_set_of_node_from_dev()` l=
eading to OF node reference leaks.
--

commit fb8a9bf1bacccb38cbdade8a447f9b482f1bd4a3
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

[Severity: High]
Are there other MUSB drivers that need to be updated to prevent OF node
reference leaks?

When the dynamically allocated MUSB platform device is destroyed (e.g.,
during driver unbind or probe error), the reworked platform device reference
counting will drop references using fwnode_handle_put(pdev->dev.fwnode) rat=
her
than of_node_put(pdev->dev.of_node). Because device_set_of_node_from_dev()
doesn't set pdev->dev.fwnode, this leaves the fwnode pointer NULL and leaks
the OF node reference.

It looks like several other MUSB drivers still use
device_set_of_node_from_dev() for dynamically allocated platform devices:

- drivers/usb/musb/mpfs.c:mpfs_probe()
- drivers/usb/musb/musb_dsps.c:dsps_create_musb_pdev()
- drivers/usb/musb/omap2430.c:omap2430_probe()
- drivers/usb/musb/ux500.c:ux500_probe()

Will these also be updated to use platform_device_set_of_node_from_dev()?

> =20
>  	glue->pdev			=3D musb;
>  	glue->clk			=3D clk;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-pdev-fwnod=
e-ref-v2-0-8abe2513f96e@oss.qualcomm.com?part=3D17
