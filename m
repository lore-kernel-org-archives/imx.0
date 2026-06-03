Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38A7466B74
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 13:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780495109; cv=none; b=ZiV+JJqIMjnQUk+4v3pjWZqtGCpnzuZk2dEfJQXaXcKd91JnBSVgrcrgdsWIhU645JVV9ilS8KFt8K9XeN5+iJCkUYmCjpbxYfv/BNBmyZxrVYWCooRt5Vp6C/nbOyKtTnSyYmpEkgbZguUWGOUhjtIjblozqvwkaE07MiDPaSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780495109; c=relaxed/simple;
	bh=z+qg/EBg2JdJ8Q4GsPirTnw2B8BK1o2wJNj4Py5hLio=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=B3dt+CpalXCvvv0dyO8jp91Sn6fFsvUL2gQRmE0FR93WOr5nYlp8gOYn7sE1zZJt1CuqRpl9/tZbhop3Regf68WB/agOQ0x7ln1toX0JcEPxZrvhSymnrpmVZGYaUPk/TA2Aps3NpoA+ar7gZwF5TvPBh5Hd9EGDckjhom9LMxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KUTp00CE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KUTp00CE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1094E1F00893;
	Wed,  3 Jun 2026 13:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780495103;
	bh=Wj0y2t/uD2CDij6L/A+7Xyn1+nG/DAyjardGMz87tZk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KUTp00CEaRV/dDcxZrUfvSrqJ84uP9I2u7iDGUsE9TZ/jxE4roVFqz3kIp64dR7yo
	 1zxwQXLABuP1kE69zdf7aMhxhC3+H64+SgxngrQy2M1HFU6h6czqVwAgIagNeARpQE
	 LtWRTRcM+XQ1Y+X7Xo8XsdKg+KkPGBOlL3mC4N6FwtQEWMLw4AhtkQMmZ98kczTtMa
	 xdW//ilJ1vzLIDxCGoVYMzAjZpK86Pbouy7wdGsZVXK8fyRgDKZOJi1n61qzpbylNz
	 t0wQyMcjmPUZ8s6MrKxit3HmN+omm0iuIpZMmneapO1OXUEMqfUIDSnpsuTMSS445v
	 6iYFUpxX1fodg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/9] mailbox: imx: Start splitting the IRQ handler in
 primary and threaded handler
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260603-imx_mbox_rproc-v2-5-a0059dc3b69a@linutronix.de>
References: <20260603-imx_mbox_rproc-v2-5-a0059dc3b69a@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 13:58:22 +0000
Message-Id: <20260603135823.1094E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] Double `clk_disable_unprepare()` on `devm_mbox_controller_regist=
er()` error path.

Pre-existing issues:
- [High] Unchecked return value of `pm_runtime_get_sync()` can lead to sync=
hronous external aborts.
--

commit 2c0acf5c8fb62883e0037f32b817dbaada81aae9
Author: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

mailbox: imx: Start splitting the IRQ handler in primary and threaded handl=
er

This commit splits the mailbox IRQ handling into a primary handler and a
threaded handler. The primary handler masks the interrupt event, allowing t=
he
threaded handler to run in a preemptible context without raising the interr=
upt
again. As a first step, it prepares the logic and moves the TX handling par=
t.

> diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
> index d1de07cc0ed62..006aa76b74b62 100644
> --- a/drivers/mailbox/imx-mailbox.c
> +++ b/drivers/mailbox/imx-mailbox.c

[ ... ]

> @@ -629,7 +655,8 @@ static int imx_mu_startup(struct mbox_chan *chan)
>  	if (!(priv->dcfg->type & IMX_MU_V2_IRQ))
>  		irq_flag |=3D IRQF_SHARED;
> =20
> -	ret =3D request_irq(priv->irq[cp->type], imx_mu_isr, irq_flag, cp->irq_=
desc, chan);
> +	ret =3D request_threaded_irq(priv->irq[cp->type], imx_mu_isr, imx_mu_is=
r_th,
> +				   irq_flag, cp->irq_desc, chan);

[Severity: High]
This isn't a bug introduced by this patch, but looking at imx_mu_startup()
in drivers/mailbox/imx-mailbox.c, the return value of pm_runtime_get_sync()
is ignored:

	pm_runtime_get_sync(priv->dev);
	if (cp->type =3D=3D IMX_MU_TYPE_TXDB_V2)
		return 0;

If the PM domain fails to resume (for example, returning -ENOMEM or
-ETIMEDOUT), will the function proceed to interact with hardware registers?
On i.MX platforms, accessing unclocked or unpowered hardware registers
typically results in a synchronous external abort and a kernel panic.

>  	if (ret) {
>  		dev_err(priv->dev, "Unable to acquire IRQ %d\n", priv->irq[cp->type]);
>  		return ret;

[Severity: Medium]
Looking at the driver changes introduced earlier in this patch series
(specifically "mailbox: imx: Use devm_pm_runtime_enable()"), there appears
to be a double clock disable issue on the error path:

drivers/mailbox/imx-mailbox.c:imx_mu_probe() {
...
	clk_disable_unprepare(priv->clk);

	ret =3D devm_mbox_controller_register(dev, &priv->mbox);
	if (ret)
		goto disable_clk;
...
disable_clk:
	clk_disable_unprepare(priv->clk);
	return ret;
}

Could this cause the clock reference count to underflow and trigger a
warning in the clock framework if devm_mbox_controller_register() fails?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-imx_mbox_r=
proc-v2-0-a0059dc3b69a@linutronix.de?part=3D5
