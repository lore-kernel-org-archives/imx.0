Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B4D3E49FD
	for <imx@lists.linux.dev>; Thu,  8 Oct 2026 09:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791451159; cv=none; b=sUeQNb8ZaXGUfQAhGW4iPsMf2m288CUwyakxuswi4B0IWgMICwc+vNornZ8ghG03bxVBj/kGop+Iqjr5eRYZ0ekeKVlIrkbuQuDlXbdZ4Sa+NuXBtqOYiwjmyyoL9J7k06NkeU8WR0OB7S7+tcgvRWgWMLDILGaVp0YaNmWKofo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791451159; c=relaxed/simple;
	bh=8FnQf8cSiTWxOcQ+6Ks/8xHPStNPYdQd/qTr4c9giis=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=YtzYGXBFihNPib8602Qk6syiyQpWobKVebzGbZIlI85a64HtQnYR0JZZ4mv7dsPKDRtF8iOgWdzmEJI8z6IaMy41iXfxqhNPTeqg5fc5/LbgoYYd6v+h8mmwdqO6j7M3hMh7msnyE1ZRdORFawYQ0UD+NIHBBQRkSACOlHbNGyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mJqvR+sd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mJqvR+sd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5AF71F00893;
	Thu,  8 Oct 2026 09:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791451148;
	bh=IX6OD3XMr6BOhYjA4MDNTKoQ5ZjPqIXzu9RfFgyusE4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mJqvR+sd0SOOlqhl1V33pHVgohxTu0mV42MUT10piULBv6VzW5xV7Q4kv3161w2e0
	 Tv4H+vKz94KlcY1LqqU4ylcmogoYRPkpV8jY3nU9zFMM5Nl7k/Grb9w6l4mEnYUTs9
	 v68DnLSON2emfCzJNi542Vwy9VSyB51Hgd7gRnJOLBwSzLOLU2oCTY9MGY/R1+OuC6
	 wc8ZRXhwaKuB/yghYlylP7IJxVsH8mVca+/DJ5Gf3RQ8H5cuXk8KE1Av3Rr/rbi7s7
	 tnfotkF+Gmv92VSnWsKnermPbpTTPAfk9xq7XQ+awTnAFxhD3LVQb2Ggd71i1D7A5c
	 hDVa8glefPMOg==
Message-ID: <sashiko-outbox-163920@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 7/9] irqchip/imx-irqsteer: Allow building as module
Reply-To: sashiko-reviews@lists.linux.dev
To: Zhipeng.wang_1@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261008090231.796511-8-Zhipeng.wang_1@oss.nxp.com>
References: <20261008090231.796511-1-Zhipeng.wang_1@oss.nxp.com>
 <20261008090231.796511-8-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 09:19:07 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] irqchip: imx-irqsteer module unload causes use-after-free
- [High] irqchip: imx-irqsteer UAF due to missing synchronize_irq() on remo=
ve
- [Medium] pm: CCF warning in devres teardown if pm_runtime_resume_and_get(=
) fails
--

commit 47b4fb3a979bc15759a7bda151b9b79c2c92332a
Author: Jindong Yue <jindong.yue@nxp.com>

irqchip/imx-irqsteer: Allow building as module

Make the driver buildable as a module by turning the Kconfig symbol into
a tristate and using module_platform_driver() instead of
builtin_platform_driver(), and add the MODULE_DEVICE_TABLE() and module
metadata needed for autoloading.

> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index 20b77fbc51ee0..105108d2e6ff7 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -555,7 +555,7 @@ config CSKY_APB_INTC
>  	  the controller's register.
> =20
>  config IMX_IRQSTEER
> -	bool "i.MX IRQSTEER support"
> +	tristate "i.MX IRQSTEER support"

[Severity: High]
Does converting IMX_IRQSTEER to a tristate expose a use-after-free during
module unload?

The IRQ domain framework does not take a module reference on the irqchip
module. This means the module can be unloaded even while downstream
consumers hold active IRQ mappings in their irq_desc structures.

When unloaded, irq_domain_remove() emits a warning but proceeds to free
the domain. The irqchip module's .text and .rodata sections are then
freed, leaving the downstream irq_desc structures with dangling chip
pointers to the freed imx_irqsteer_irq_chip struct. A subsequent read of
/proc/interrupts will dereference the freed pointer.

> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx=
-irqsteer.c
> index 15ee50f65d54c..85edd5e33ca9c 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
[ ... ]
> @@ -369,4 +371,7 @@ static struct platform_driver imx_irqsteer_driver =3D=
 {
>  	.probe		=3D imx_irqsteer_probe,
>  	.remove		=3D imx_irqsteer_remove,
>  };
> -builtin_platform_driver(imx_irqsteer_driver);
> +module_platform_driver(imx_irqsteer_driver);

[Severity: High]
Does enabling module unload via module_platform_driver() expose a
use-after-free in imx_irqsteer_remove() due to missing synchronization?

When the module is unloaded, imx_irqsteer_remove() clears the chained
handler:

    for (i =3D 0; i < irqsteer_data->irq_count; i++) {
        if (!irqsteer_data->irq[i])
            break;

        irq_set_chained_handler_and_data(irqsteer_data->irq[i],
                                         NULL, NULL);
        irq_dispose_mapping(irqsteer_data->irq[i]);
    }

This teardown loop lacks a call to synchronize_irq(). If a parent
interrupt fires concurrently on another CPU just before the handler is
set to NULL, imx_irqsteer_irq_handler() will execute. Since there is no
synchronization, imx_irqsteer_remove() will return and trigger the
devres framework to free irqsteer_data while the handler is still
actively dereferencing it.

[Severity: Medium]
Will enabling module unload also trigger a clock underflow warning if
pm_runtime_resume_and_get() fails in imx_irqsteer_remove()?

During unload, imx_irqsteer_remove() calls:

    ret =3D pm_runtime_resume_and_get(&pdev->dev);

And later:

    if (ret >=3D 0)
        pm_runtime_put_noidle(&pdev->dev);

If pm_runtime_resume_and_get() fails (for example, due to a hardware
timeout), the device remains suspended and the clock's enable_count
remains 0. The function ignores this failure and allows devres to
unconditionally call clk_disable_unprepare() on the clock. Calling
clk_disable() on a clock with an enable_count of 0 triggers a kernel
stack trace.

> +
> +MODULE_DESCRIPTION("i.MX IRQSTEER interrupt multiplexer/remapper driver"=
);
> +MODULE_LICENSE("GPL");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008090231.7965=
11-1-Zhipeng.wang_1@oss.nxp.com?part=3D7
