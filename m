Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A6A1D555
	for <imx@lists.linux.dev>; Fri, 29 May 2026 00:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780015083; cv=none; b=ev/RAVkEevkV8fxxfPxUo/Zvpq9qD7cU4RbiL+05TkrHCJl3Aq6xPUdqUQZrspOjbcjTb7kvBwRsGJjgJ/scOFvBYycqg5BgJFm9sz403wssRtQBYjdf1a0x9q85Qb+pButq60uo4GCJ/+U/DOdR32q/lmwXvq8Mr+VOJVlHVX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780015083; c=relaxed/simple;
	bh=Ro5jhvsYINWwMTruiMoToMTmKtdo1QP+XbEjzhU585o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uhWmsi2T82w9zP4+JKP+N2IlQcqhVeQIFuFsNZ4EdQvcdoPRvgW4/R2q6GKlIqwMTbqyo4tZa7Poc1mdZg7hGnDSMNVvuGk8FhEJS3A417bK01yfjnODmF8gs5EIzpqQP3WqxV2Tvb2lATDZmePUJ8cY17hQgIpuxgcoecNPJ/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MSC5PPqb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MSC5PPqb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBBEA1F000E9;
	Fri, 29 May 2026 00:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780015081;
	bh=K1+zmAUDd/OhY7oKRLqTq+30lZgsZrP38qhOyJDlZvU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MSC5PPqbGvWFsdFy1TZm1R9uCj2LXML/5+6svv3Q57wTVS8arnZGJHpxZ5wGCsr3S
	 I8VkWjlMNF6iMC5j6NFMNZdSk3RIZz5NeJT1xmARGFfW8o6/HJGswV1Y+8BfI3FoEh
	 6+k8q2EpA/p+QXkXeUSeyHdK+8/pH69i8Bf4MFrOweAQrz0uSJPXmxSe1n+ahqfC0i
	 hvLqlweXtws5OgpBALSTVOeVX3cW13x1Qq8Cefn4fgOX+PO0680L4zsFBWP4U9YhOI
	 mQ1Qj77OCl8Sh7xNykw8veuUzJelLzVR+OpsUZXOGjZx1SjB1qvfowmZumAODk4yeQ
	 mpPZyBt+9MWAw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] serial: mxs-auart: fix probe error paths and clock
 handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260528230616.186792-1-rosenp@gmail.com>
References: <20260528230616.186792-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 00:38:01 +0000
Message-Id: <20260529003801.BBBEA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Hardware / Clock Initialization Sequence
- [Medium] Power Management / Clock Gating Regression

Pre-existing issues:
- [High] Concurrency / Early IRQ Registration
--

commit 2e33a170f777ef25177279dc109528be2adbe8c8
Author: Rosen Penev <rosenp@gmail.com>

serial: mxs-auart: fix probe error paths and clock handling

This commit converts the mxs-auart driver to fully use devres helpers to
simplify error handling during probe. It switches to devm_clk_get_enabled()
and devm_platform_get_and_ioremap_resource(), and uses devm_request_irq()
for GPIO interrupts.

> diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auar=
t.c
> index 693b491f1e755..0f3df8222ca76 100644
> --- a/drivers/tty/serial/mxs-auart.c
> +++ b/drivers/tty/serial/mxs-auart.c
> @@ -1457,48 +1457,24 @@ static void mxs_init_regs(struct mxs_auart_port *=
s)
>  static int mxs_get_clks(struct mxs_auart_port *s,
>  			struct platform_device *pdev)
>  {
>  	if (!is_asm9260_auart(s)) {
> -		s->clk =3D devm_clk_get(&pdev->dev, NULL);
> +		s->clk =3D devm_clk_get_enabled(&pdev->dev, NULL);
>  		return PTR_ERR_OR_ZERO(s->clk);
>  	}

[Severity: Medium]
Will this prevent the hardware clock from being dynamically gated when the =
UART
port is closed?

By switching to devm_clk_get_enabled() here, the base reference count for t=
he
clock is incremented during probe and never drops to zero while the device =
is
bound.

Previously, the driver enabled the clock dynamically via clk_prepare_enable=
()
in mxs_auart_startup() and disabled it in mxs_auart_shutdown(), which seems
to allow for power savings.

> =20
> -	s->clk =3D devm_clk_get(s->dev, "mod");
> +	s->clk =3D devm_clk_get_enabled(s->dev, "mod");
>  	if (IS_ERR(s->clk)) {
>  		dev_err(s->dev, "Failed to get \"mod\" clk\n");
>  		return PTR_ERR(s->clk);
>  	}
> =20
> -	s->clk_ahb =3D devm_clk_get(s->dev, "ahb");
> +	s->clk_ahb =3D devm_clk_get_enabled(s->dev, "ahb");
>  	if (IS_ERR(s->clk_ahb)) {
>  		dev_err(s->dev, "Failed to get \"ahb\" clk\n");
>  		return PTR_ERR(s->clk_ahb);
>  	}
> =20
> -	err =3D clk_prepare_enable(s->clk_ahb);
> -	if (err) {
> -		dev_err(s->dev, "Failed to enable ahb_clk!\n");
> -		return err;
> -	}
> -
> -	err =3D clk_set_rate(s->clk, clk_get_rate(s->clk_ahb));
> -	if (err) {
> -		dev_err(s->dev, "Failed to set rate!\n");
> -		goto disable_clk_ahb;
> -	}
> -
> -	err =3D clk_prepare_enable(s->clk);
> -	if (err) {
> -		dev_err(s->dev, "Failed to enable clk!\n");
> -		goto disable_clk_ahb;
> -	}
> -
> -	return 0;
> -
> -disable_clk_ahb:
> -	clk_disable_unprepare(s->clk_ahb);
> -	return err;
> +	return clk_set_rate(s->clk, clk_get_rate(s->clk_ahb));
>  }

[Severity: High]
Does this sequence violate the hardware dependency and clock constraints?

The patch now enables the mod clock before the ahb bus clock, which violates
the typical hardware dependency where the bus clock must be active first to
prevent bus hangs.

Furthermore, it calls clk_set_rate() on the mod clock after it has already
been enabled. Modifying the rate of an active clock violates the
CLK_SET_RATE_GATE constraint and could result in hardware glitches or cause
clk_set_rate() to fail with -EBUSY, which would fail the probe entirely.

[ ... ]

> @@ -1628,23 +1579,20 @@ static int mxs_auart_probe(struct platform_device=
 *pdev)
>  	s->mctrl_prev =3D 0;
> =20
>  	irq =3D platform_get_irq(pdev, 0);
> -	if (irq < 0) {
> -		ret =3D irq;
> -		goto out_iounmap;
> -	}
> +	if (irq < 0)
> +		return irq;
> =20
>  	s->port.irq =3D irq;
> -	ret =3D devm_request_irq(&pdev->dev, irq, mxs_auart_irq_handle, 0,
> -			       dev_name(&pdev->dev), s);
> +	ret =3D devm_request_irq(&pdev->dev, irq, mxs_auart_irq_handle, 0, dev_=
name(&pdev->dev), s);
>  	if (ret)
> -		goto out_iounmap;
> +		return ret;

[Severity: High]
This is a pre-existing issue, but is it safe to register this IRQ before the
port is fully initialized?

If the bootloader leaves the UART active with pending interrupts, an interr=
upt
can fire immediately after devm_request_irq() is called.

This happens before uart_add_one_port() is called, so mxs_auart_irq_handle()
will execute, acquire an uninitialized spinlock (s->port.lock), and derefer=
ence
s->port.state which is NULL at this point. This can result in a NULL pointer
dereference (for example, in mxs_auart_rx_chars() calling
tty_flip_buffer_push(&s->port.state->port)) and a kernel panic.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528230616.1867=
92-1-rosenp@gmail.com?part=3D1
