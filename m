Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794669389;
	b=B5UwqQYsuKfAAY9SJYwmUqHgDQw1rPKcI7E0dLNBvf5HVQPYq21oBoGBrptNq9jVAfzX
	 xk5f6m0r6slPeXZaqvkMY5WNXzesHqjZiKXqlBXOjRpF81yFiXWS5Pcv4ncMhbU5ejxTt
	 MXKTzAtv/1sPZ7J40B24hWNSbP+ZrN/HMNcxr1j+m0c7B1pCIRshKjgO6WLwtBgwreu8e
	 oXkPxIfXup+RzafMXhrQIAJSFtYtlk4jH9I7rMkDgSnMxxoCBKzA4OWLL9X/p0IZA+3lU
	 TYghClA/EufplsTn88NmEnNQ8NbnPPUjMPhai0b7IU/KTmS2UP3U8alRi8L9qashxPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794669389;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=crVdfbmQrVwvSA6mLPkFq1j60Ww6CTdS15y1dMo7dzM=;
	b=FypejbcNAHXmddsniIXjWKBUYe/phlldG+7nOkJ+pUO7ilqjodCgIA79iPhThXDuI2Rc
	 Pzaco1Fav+74LwkCH3Mn59JogQi7GDikkrUFHORQNMAflPsEG30qCIx35+VIHKyurdq1N
	 s4sj59B42e0h1BS8lXZkyZkh8KpAiu8filVfXAo1wPFctmaAmbQYEftPBYdLBFcmXnKHz
	 1EgQn3wyrDl646md5qHkoAz3S/lAwtY0l3fDwCAYSw5Ay8HM9smLIwypNZqVehL0LQmHo
	 FTCCGhC/DmElEYnbwtH9LLov4MfusvMXYlLB4LCRV61i1qRA3ugKB5jWMXvzpQ2IqpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BsU7QRcJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A96606A327;
	Sat, 14 Nov 2026 15:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BsU7QRcJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E36691F000C7;
	Sat, 14 Nov 2026 15:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794669389;
	bh=crVdfbmQrVwvSA6mLPkFq1j60Ww6CTdS15y1dMo7dzM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BsU7QRcJ2ZHfIL8ISDp7lGXMpN1C5FUjanqkUXdVOu+s75sv4fGc60reXuA9SboD3
	 9Dz0Ayd6gJd8bxRnexHSNn2uMM6W/xfgFtnJBZUCOl6/kKfV16mpsB7mbN9MT0xdxZ
	 Ys3QCxrplcXSaPxiOmQvZeSTTg5Z4IOH2nE7hazXFaNUndCNPXfHvdmwGXez1MO98v
	 3GRxqyDL2WSb4EOX+9agCN2CKv2RyKZAVo/Yd8ud6qn7RQsDWYlZ5QNg9W733Dc++n
	 R4AHzWtSBnUWJ4pIFR70fozYewqXrhEAbZeEQVEY4Q+mKvzuSlspi6wNA8CFrfofk4
	 4YD49rBxXhFag==
Message-ID: <sashiko-outbox-214683@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] irqchip: Convert chained handlers to
 guard_chained_irq()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Peng Fan" <peng.fan@linux.dev>
Cc: imx@lists.linux.dev, linux-sunxi@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261114-irqchip-cleanup-api-v1-1-4a9d598b0bdb@nxp.com>
References: <20261114-irqchip-cleanup-api-v1-1-4a9d598b0bdb@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 15:16:28 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 2 related pre-existing issues it does not
introduce:
- [High] irqchip/imx-intmux: unclocked MMIO read in
  imx_intmux_irq_handler() [1]
- [High] irqchip/imx-irqsteer: unprotected hardware register access in
  imx_irqsteer_irq_handler() [2]
--

commit 8af6be36eba9f36b4a716dc486539968188a4f42
Author: Peng Fan <peng.fan@nxp.com>

irqchip: Convert chained handlers to guard_chained_irq()

This commit converts chained IRQ handlers across drivers/irqchip/ to use
the scope-based guard_chained_irq() helper instead of explicit
chained_irq_enter() and chained_irq_exit() calls.

[ ... ]

> diff --git a/drivers/irqchip/irq-imx-intmux.c b/drivers/irqchip/irq-imx-i=
ntmux.c
> index c7914fea3d1f9..73926dec52abf 100644
> --- a/drivers/irqchip/irq-imx-intmux.c
> +++ b/drivers/irqchip/irq-imx-intmux.c
> @@ -187,15 +187,13 @@ static void imx_intmux_irq_handler(struct irq_desc =
*desc)
>  	unsigned long irqstat;
>  	int pos;
> =20
> -	chained_irq_enter(irq_desc_get_chip(desc), desc);
> +	guard_chained_irq(irq_desc_get_chip(desc), desc);
> =20
>  	/* read the interrupt source pending status of this channel */
>  	irqstat =3D readl_relaxed(data->regs + CHANIPR(idx));
> =20
>  	for_each_set_bit(pos, &irqstat, 32)
>  		generic_handle_domain_irq(irqchip_data->domain, pos);
> -
> -	chained_irq_exit(irq_desc_get_chip(desc), desc);
>  }
> =20
>  static int imx_intmux_probe(struct platform_device *pdev)

[Severity: High]
This problem wasn't introduced by this patch, but can
imx_intmux_irq_handler() perform an unclocked MMIO read [1] of
CHANIPR(idx) when the device is runtime-suspended?

irq_set_chained_handler_and_data() leaves the upstream parent IRQ unmasked
while runtime PM disables ipg_clk when no child interrupts are active.  A
spurious interrupt on the parent line invokes imx_intmux_irq_handler()
without checking pm_runtime_active(), causing a bus fault and external
abort.

> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx=
-irqsteer.c
> index 4e0f7eac0c8b5..e117c8a1102d3 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
> @@ -148,14 +148,14 @@ static void imx_irqsteer_irq_handler(struct irq_des=
c *desc)
>  	int hwirq;
>  	int irq, i;
> =20
> -	chained_irq_enter(irq_desc_get_chip(desc), desc);
> +	guard_chained_irq(irq_desc_get_chip(desc), desc);
> =20
>  	irq =3D irq_desc_get_irq(desc);
>  	hwirq =3D imx_irqsteer_get_hwirq_base(data, irq);
>  	if (hwirq < 0) {
>  		pr_warn("%s: unable to get hwirq base for irq %d\n",
>  			__func__, irq);
> -		goto out;
> +		return;
>  	}
> =20
>  	for (i =3D 0; i < 2; i++, hwirq +=3D 32) {
> @@ -172,9 +172,6 @@ static void imx_irqsteer_irq_handler(struct irq_desc =
*desc)
>  		for_each_set_bit(pos, &irqmap, 32)
>  			generic_handle_domain_irq(data->domain, pos + hwirq);
>  	}
> -
> -out:
> -	chained_irq_exit(irq_desc_get_chip(desc), desc);
>  }
> =20
>  static int imx_irqsteer_probe(struct platform_device *pdev)

[Severity: High]
This problem wasn't introduced by this patch, but can
imx_irqsteer_irq_handler() read CHANSTATUS while the device is
runtime-suspended [2] and ipg_clk is gated?

If a spurious or shared interrupt fires on the parent IRQ line while
imx-irqsteer is suspended, reading data->regs + CHANSTATUS(idx,
data->reg_num) without checking pm_runtime_active() accesses unclocked
registers and triggers a fatal bus fault or system hang.

[1] https://sashiko.dev/#/bug/linux-ade1ea4a-cd13-49ad-9345-1f0f1b497bba
[2] https://sashiko.dev/#/bug/linux-3ace51f1-8ee3-4863-912d-72f04665b41b

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-irqchip-cl=
eanup-api-v1-1-4a9d598b0bdb@nxp.com?part=3D1
