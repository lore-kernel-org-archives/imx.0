Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0C61D9A5F
	for <imx@lists.linux.dev>; Sun,  2 Aug 2026 14:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785681166; cv=none; b=Bg1LPVug2/wjF3fRbASQKTePqMUYm4MTLM8/mZ2Y3lh4OCNw65rjYSn3MqlUCLyGr81bFU6+nFTdFNrXvzhTfRs/hF1glMJPgfcKE8a/RSpeNNsQd00pZVTL7wyVoDRqDjR2vNviwlH3Wj6aquSzqIoHL4+wr3V9Y9B69WKxsGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785681166; c=relaxed/simple;
	bh=tpNU0BmL5GCZ+BRq0XRBDwnzJirh0SFI/WWuHNGHsnw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KOtEzjL+TFKaBiprqypn/1IL8uu5OBzLKf7WHoqPeQVl41SA8Zq4vD6gLlGjFShkRHebVpDwKyzGEAe43RWcYoEZ700Qn5ndKKdjWawI8GxxK31kGD+7/TKYM2Iid+6xEdCf/Of1pFxWtyhcWQYbtpvFrtzMA6PZZf/IqC/vEKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lkhzT6mw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lkhzT6mw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C76AB1F000E9;
	Sun,  2 Aug 2026 14:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785681165;
	bh=sW7ZMZnraT3VSX1dbgXAjF/7T2/fLnKk3c5zFHuDHv0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lkhzT6mwZmzYf3Rb92/VYr29SMD1zCZP16m1TGUs/o2ySktwe7NCLRMduuicSHeBf
	 AbZDG44Hklee9/AVEYjJQhO6WXEfDge28Aj5xO8FxHxQBKSukOzcMQer16/2RJnXP5
	 ce+0459aUZ7z3h0eVwP/QpViLc/EVaPF65azUPPYYLW04SSkem5+gv8jXhZWugKKcu
	 a0i9yKFWxcS2YUSXchiW0E/X1Wh0F5sIVfiCHvGhyBJ72kqfGEr2FcI0u9eIP9982E
	 u64ZExJbzYuscP1kLskkPhHIzpUhuCNaWehsgJdznxJn9VZzTbWSxKaIsy9Ciyrntw
	 5BLrhQYspIe+g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] gpio: Use IRQ trigger mask helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maulik Shah" <maulik.shah@oss.qualcomm.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260802-b4b4-irq-trigger-mask-gpio-v1-1-948973636c84@oss.qualcomm.com>
References: <20260802-b4b4-irq-trigger-mask-gpio-v1-1-948973636c84@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 14:32:44 +0000
Message-Id: <20260802143244.C76AB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing spinlock serialization for shared bank registers in IRQ ch=
ip callbacks.
--

--- Patch [1]: [PATCH] gpio: Use IRQ trigger mask helpers ---
commit a6c81ea868de6b9a08df67a583f7641fb4809834
Author: Maulik Shah <maulik.shah@oss.qualcomm.com>

    gpio: Use IRQ trigger mask helpers
   =20
    Use IRQ_TYPE_LEVEL_MASK and IRQ_TYPE_EDGE_BOTH instead of open-coded
    trigger type combinations in irqchip callbacks.
   =20
    No functional change intended.

[ ... ]

> diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
> index 5d61053e0596a..2b5da973f51fe 100644
> --- a/drivers/gpio/gpio-pxa.c
> +++ b/drivers/gpio/gpio-pxa.c
> @@ -406,7 +406,7 @@ static int pxa_gpio_irq_type(struct irq_data *d, unsi=
gned int type)
>  		if (__gpio_is_occupied(pchip, gpio))
>  			return 0;
> =20
> -		type =3D IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING;
> +		type =3D IRQ_TYPE_EDGE_BOTH;
>  	}
> =20
>  	gpdr =3D readl_relaxed(c->regbase + GPDR_OFFSET);
> =20
>  	if (__gpio_is_inverted(gpio))
>  		writel_relaxed(gpdr | mask,  c->regbase + GPDR_OFFSET);
>  	else
>  		writel_relaxed(gpdr & ~mask, c->regbase + GPDR_OFFSET);

[Severity: High]
This is a pre-existing issue, but since you are touching this function,
is it safe to perform these read-modify-write operations on the GPDR regist=
er=20
without a spinlock?=20

It seems this could race with other IRQs in the same bank and with=20
gpio_direction operations. For instance, pxa_gpio_irq_type() races with=20
pxa_gpio_direction_input() and pxa_gpio_direction_output() over the GPDR=20
register, as the latter use gpio_lock but the former does not.

A similar issue appears in pxa_mask_muxed_gpio():

pxa_mask_muxed_gpio() {
    ...
    b->irq_mask &=3D ~GPIO_bit(gpio);

    grer =3D readl_relaxed(base + GRER_OFFSET) & ~GPIO_bit(gpio);
    gfer =3D readl_relaxed(base + GFER_OFFSET) & ~GPIO_bit(gpio);
    writel_relaxed(grer, base + GRER_OFFSET);
    writel_relaxed(gfer, base + GFER_OFFSET);
    ...
}

and pxa_unmask_muxed_gpio():

pxa_unmask_muxed_gpio() {
    ...
    c->irq_mask |=3D GPIO_bit(gpio);
    update_edge_detect(c);
    ...
}

Can this lack of serialization lead to data corruption of the GPIO direction
configuration (GPDR) and interrupt edge detection configuration, potentially
causing improperly configured pins or permanent loss of interrupts on SMP
systems when called concurrently for different GPIOs within the same bank?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802-b4b4-irq-t=
rigger-mask-gpio-v1-1-948973636c84@oss.qualcomm.com?part=3D1
