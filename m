Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BED280338
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 09:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784884396; cv=none; b=YITDffjs86gZfx+/h+ZovoA4aQ65odPbyVKNi+cVvWfPjZkFBr1WvY33EkfPxx5TGIGedkxrs5pDVley0Y2MVIUfIXIHSvexxrKTHXj0PAl3fKr66cRbyc6LFCdXOKGRwBo5sdWPYpj1lBxt+/oT6xT1P6fNRYP8vGS+Vvu7bMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784884396; c=relaxed/simple;
	bh=7r75DutFQQU20SZ0Ux2dpXO45hEaYCmb6a29+619rQI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HuUOqJavYToj/vh2HmaXu2IAv8csC6LFyNddbKRNWJJiyafDyHevmg/bwJLAmvn8siPiKbMDWi/ic4iK1mUbCYGTXxLt69cq1Hei3CjuqbiQuwEFuvBcsUQXN2V4l6i3mVC/6h0xsITa6hJPjsQwCIOsPwVxaDRfRDpFl1i3Llo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N682lHHM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N682lHHM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A5B41F000E9;
	Fri, 24 Jul 2026 09:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784884394;
	bh=eBBsmDK0TaHlVTtp3pT3mGLDL6AKN+GTqbcbGkhmxwI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N682lHHMMUiak6isZdK/kMU7vp40D48h3xgyXfYnxK8A6ws6bq1BBpqgoWUwA17XP
	 yP2kVibWCkCGAQbQRbDZlc4JxmryqOk1tldKbztc9euWPW8BuHCMsBtcF8uXHbT9rS
	 Zp0mUoUcmk6p7q/4afZBScuj5JC3xTxB+jPm+NXZBCGYHwGw5GStRkmbR6gARGFSdK
	 HREK/tdP25o9u1AkoYzjA5mXIJBbUflMhKfX5q42UkaydvWnv7V0U7Pnxe6dX7hWOz
	 7zz4wzJwWq/03Nw0BHZYt4OVQRD3xJcVdWB2zc7Xuo70YnltY8fl+PjDbiEjuwMLp2
	 Aai7hHtZOlrvg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] irqchip/imx-irqsteer: Allow building as module
Reply-To: sashiko-reviews@lists.linux.dev
To: Zhipeng.wang_1@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260724090136.3595894-1-Zhipeng.wang_1@oss.nxp.com>
References: <20260724090136.3595894-1-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 09:13:13 +0000
Message-Id: <20260724091314.7A5B41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Unloading the irqchip module leaves dangling pointers to `imx_irqs=
teer_irq_chip` in active `irq_desc` mappings, causing a Use-After-Free kern=
el panic.

Pre-existing issues:
- [High] The driver calls `pm_runtime_enable()` in `probe()` but fails to c=
all `pm_runtime_disable()` in `remove()`, breaking runtime PM on module rel=
oad.
--

--- Patch [1]: [PATCH] irqchip/imx-irqsteer: Allow building as module ---
commit 04000917a2f34d79136a34fa78a99d5b4adbc6e7
Author: Jindong Yue <jindong.yue@nxp.com>

irqchip/imx-irqsteer: Allow building as module

Make the driver buildable as a module by turning the Kconfig symbol into
a tristate and using module_platform_driver() instead of
builtin_platform_driver().

> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index 42f2278a702d0..07db3b678f94a 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -560,7 +560,7 @@ config CSKY_APB_INTC
>  	  the controller's register.
> =20
>  config IMX_IRQSTEER
> -	bool "i.MX IRQSTEER support"
> +	tristate "i.MX IRQSTEER support"

[Severity: High]
Does allowing this driver to be unloaded as a module introduce a
use-after-free?

When the module is unloaded, imx_irqsteer_remove() calls irq_domain_remove(=
),
but this does not unmap existing child interrupts.

If an interrupt remains mapped, the irq_desc->irq_data.chip pointer will
continue to point to the statically allocated imx_irqsteer_irq_chip struct,
which resides in module memory. Once the module is unloaded, this memory is
freed.

Could a subsequent read of /proc/interrupts cause a kernel panic when
show_interrupts() attempts to access the freed imx_irqsteer_irq_chip->name?

[ ... ]
> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx=
-irqsteer.c
> index 87b07f517be35..2365fc04596ef 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
[ ... ]
> @@ -359,4 +361,7 @@ static struct platform_driver imx_irqsteer_driver =3D=
 {
>  	.probe		=3D imx_irqsteer_probe,
>  	.remove		=3D imx_irqsteer_remove,

[Severity: High]
This is a pre-existing issue, but does imx_irqsteer_remove() need to call
pm_runtime_disable() to balance the pm_runtime_enable() called in probe()?

If the driver is unloaded and then reloaded, probe() will call
pm_runtime_set_active(). Since pm_runtime_disable() was never called during
removal, the disable_depth remains 0, causing pm_runtime_set_active() to
return -EAGAIN.

The subsequent call to pm_runtime_enable() in probe() will then trigger an
"Unbalanced pm_runtime_enable!" warning and leave the device's PM state
corrupted.

While this imbalance was present before via sysfs unbind, converting the
driver to a module now exposes it directly to standard rmmod and modprobe
operations.

>  };
> -builtin_platform_driver(imx_irqsteer_driver);
> +module_platform_driver(imx_irqsteer_driver);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724090136.3595=
894-1-Zhipeng.wang_1@oss.nxp.com?part=3D1
