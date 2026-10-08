Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C1F4772BE
	for <imx@lists.linux.dev>; Thu,  8 Oct 2026 09:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791451100; cv=none; b=ajRMKazm/6LduRN/oFKbET1EgXE0zc3oodx6R7JvfrZ2CRfiz0znTLuRFEkLYxXmL1UoUnqektNMDjdKHqMc7eecK8bcKCiJwfzPFcwniRMVwmbPKKk20OammvHnHSY9WZffMDe/G82vfgZTB7NJXkLVfbLu+NeueO4C5g+se+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791451100; c=relaxed/simple;
	bh=pqsYHhDwz+qpoiRcroM7PIPJwQaLTq7TRiL+DomnusM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=OffK9GqsrfHDPDooKQm4jcF6zG+a1t7AQPydhE6tRwxfnu8udOfHpRw35f19xkDxyclH/6XKTbIUtgOAixnEQ0M+Et0wLHtLl1ICNAJOFH3+kOkxewCFQQDSfxF0wjU+OKBP0YbuPUDxAWTEru88QROd/QJhTJCmyb+9CLJK91Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hYCZ9Ii9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hYCZ9Ii9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64A1E1F000FF;
	Thu,  8 Oct 2026 09:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791451091;
	bh=dJ5VywbTJjmSWguyom8FtMFSvR0VkwTCnbh9Hbgxx7k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hYCZ9Ii97WeWj+lV+Y3Hex3NCkiAnQP7IHeY5P8z2E/SqskPGUWS18Zy4ctEfAUwR
	 nczkMFVOIaGqkj9gj5Tu+tgFJxUvzx3T3iSNRaIxHH8TURIXvHMZvt1f2UHyStgHUm
	 jN7xvWn/JIxfc99GrrxU+F2Bmk4VjDLJUarj6hI6TfBImpXGUl95XAJnfliQklo2XF
	 22FFTMaB78jABA9yjIU1dgTJqn2+U0FWNc6beFcj674N2ppw3MZxppSwbKOswh41at
	 XXSWrabOvIS1BwHlld7napMTUp202zCkhZ3geBmdilbtC01F6CEgbpiIHASgpMFIJc
	 xAMTQgfyoPs2g==
Message-ID: <sashiko-outbox-163917@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 5/9] irqchip/imx-irqsteer: Mask all interrupts in
 probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: Zhipeng.wang_1@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20261008090231.796511-6-Zhipeng.wang_1@oss.nxp.com>
References: <20261008090231.796511-1-Zhipeng.wang_1@oss.nxp.com>
 <20261008090231.796511-6-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 09:18:11 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] irqchip/imx-irqsteer: missing wmb() allows interrupt storm race
--

commit e530007174d6dce33c6ec542e006f51e4a17dc73
Author: Zhipeng Wang <zhipeng.wang_1@nxp.com>

irqchip/imx-irqsteer: Mask all interrupts in probe()

This commit masks all input interrupts in probe() before setting up
chained handlers. This prevents an interrupt storm if a child interrupt
was left unmasked during driver unload, as the hardware would otherwise
assert it immediately upon re-mapping in the new domain.

> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx=
-irqsteer.c
> index 5acc04504e520..fa233de9bc2b2 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c

[ ... ]

> @@ -239,6 +239,14 @@ static int imx_irqsteer_probe(struct platform_device=
 *pdev)
>  	if (irqsteer_has_chanctrl(data->devtype_data))
>  		writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
> =20
> +	/*
> +	 * Mask all interrupts before wiring up the chained handlers. CHANMASK
> +	 * has inverted polarity (a set bit enables the interrupt), so writing
> +	 * zero masks the source.
> +	 */
> +	for (i =3D 0; i < data->reg_num; i++)
> +		writel_relaxed(0, data->regs + CHANMASK(i, data->reg_num));
> +

[Severity: Medium]
Is an explicit memory barrier needed here to ensure the masks are applied
before the parent interrupt is unmasked?

Since writel_relaxed() does not provide a barrier, these writes to the IRQ
Steer hardware could be reordered. The parent GIC interrupt may be unmasked
before the IRQ Steer actually processes the interrupt masks, leaving a wind=
ow
for the interrupt storm this patch is designed to prevent.

The parent GIC driver uses writel_relaxed() to unmask (for example,
gic_unmask_irq() in GICv2 or gic_poke_irq() in GICv3). Furthermore,
intervening locks like desc->lock in the IRQ core or irq_domain_mutex
provide only ACQUIRE and RELEASE semantics. On ARM64, an intervening RELEASE
followed by an ACQUIRE to different lock addresses can be reordered by the
CPU.

Could this allow the subsequent GIC relaxed write to cross the prior IRQ
Steer relaxed write, meaning a full wmb() is strictly required to order
writes to different I/O peripherals?

>  	ret =3D devm_pm_runtime_set_active_enabled(&pdev->dev);
>  	if (ret)
>  		goto out;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008090231.7965=
11-1-Zhipeng.wang_1@oss.nxp.com?part=3D5
