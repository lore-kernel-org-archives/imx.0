Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73FB48986D
	for <imx@lists.linux.dev>; Thu,  8 Oct 2026 09:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450913; cv=none; b=MxRJgWiru7x4RURBpFDXJ+ryimnRaWHNZ2Yz1mb8i4veHIacE8SQIX3JridlNriLvHkqX2PKMqXhk0L94Y/S8vnKbhdeLNBDwPuP0Q1MMxmXmEKmkLqXdTIQVjshCYLXa05Wupp2Ld5ohwK8l0cfK4lygR1WvqRRwtatkRIXNHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450913; c=relaxed/simple;
	bh=DnQDNJtbMW0K4ptNTUYMvVmTqisIIfDwZrch9hpPVkE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=X3nMzt9XP3mC/Wyp8u8OuOTXpDZlrZMVwxWmnnWjiKYLfu9oncOtaKlZ1hDcgqlYaAnhnfwUyKru9BLJOSXmGJRRWhc34v5DlmI7AFKkGcTDgm5qJ6BXcO+Hvi/eA1QrLOR7ki7AfOMkEp3KagST6EMd8EdVX36i03A4Ne8omds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E2GWTZB9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E2GWTZB9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A1E41F000FF;
	Thu,  8 Oct 2026 09:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791450906;
	bh=zGb6U0Rr57mdwSh7IR44r3zCJ0J7vt1dHJDq8h8KyXg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E2GWTZB9r4UFjw75T7y3hPhmy7iigYfhG6Ohfb+LWNY+CDijau478D+Lpk8IOkaNc
	 oUl35vLZbpyvpLNkVbohA2KefcqutUM8B0iKw3RBbTAcJP4kghC3mADKn9v1E0I2Ae
	 dz/ZoDmy2Ji/rDTZZ60z3GeatuTPSzFo8MS6ikT0hUcC3E2AmJiUoAcHqzYLxt4VjC
	 uSLhY67pRTkp3bEdiS8wEsKmMCdDBAWde+48CuZ7FzNM75u9XoobJCp2xEhFgJpw5e
	 Le0Ex97oQ/W7TCfRfWm6iKO6dE2Pzjuee+3wYy/ZCuHhCFF6biPZIRipMTqLYxWaMo
	 yqvD1KvkbsIUA==
Message-ID: <sashiko-outbox-163909@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 9/9] irqchip/imx-irqsteer: Use
 devm_irq_domain_create_linear()
Reply-To: sashiko-reviews@lists.linux.dev
To: Zhipeng.wang_1@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261008090231.796511-10-Zhipeng.wang_1@oss.nxp.com>
References: <20261008090231.796511-1-Zhipeng.wang_1@oss.nxp.com>
 <20261008090231.796511-10-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 09:15:05 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] core: code and commit message mismatch regarding old domain API
--

commit 05a4c59bf91334e37803afcd72a82640aa12007b
Author: Zhipeng Wang <zhipeng.wang_1@nxp.com>

irqchip/imx-irqsteer: Use devm_irq_domain_create_linear()

This commit updates the imx-irqsteer driver to use the device-managed
devm_irq_domain_create_linear() function for creating the IRQ domain. It
also removes the manual domain removal code in the driver's remove path.

> The driver open-codes an irq_domain_info and calls
> devm_irq_domain_instantiate() only to get a linear revmap domain tied to
> the device lifetime. Use the new devm_irq_domain_create_linear() helper
> instead. No functional change.

[Severity: Medium]
Does this commit message accurately describe the previous state of the code?

The commit message states that the driver open-codes an irq_domain_info and
calls devm_irq_domain_instantiate(). However, the diff shows the driver was
actually using irq_domain_create_linear() in imx_irqsteer_probe() and
tearing it down manually with irq_domain_remove() in imx_irqsteer_remove().

Could the commit message have been copied from another patch in the series?

> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx=
-irqsteer.c
> index 85edd5e33ca9c..f5601769d0363 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
> @@ -246,8 +246,9 @@ static int imx_irqsteer_probe(struct platform_device =
*pdev)
>  	if (ret)
>  		return ret;
> =20
> -	data->domain =3D irq_domain_create_linear(dev_fwnode(&pdev->dev), data-=
>reg_num * 32,
> -						&imx_irqsteer_domain_ops, data);
> +	data->domain =3D devm_irq_domain_create_linear(&pdev->dev, dev_fwnode(&=
pdev->dev),
> +						     data->reg_num * 32,
> +						     &imx_irqsteer_domain_ops, data);

[ ... ]

> @@ -294,8 +295,6 @@ static void imx_irqsteer_remove(struct platform_devic=
e *pdev)
>  		irq_dispose_mapping(irqsteer_data->irq[i]);
>  	}
> =20
> -	irq_domain_remove(irqsteer_data->domain);
> -
>  	if (ret >=3D 0)
>  		pm_runtime_put_noidle(&pdev->dev);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008090231.7965=
11-1-Zhipeng.wang_1@oss.nxp.com?part=3D9
