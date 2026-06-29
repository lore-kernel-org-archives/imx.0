Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5E6379C55
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 02:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782701325; cv=none; b=N1AAhJTgGOVilPxoqBIlMq3g88gp9tNJuOjalPPwqUMpv22XoiUErywRaMLp95JI1EA/9MpUph/TMuR2BnbDNJoFyKK3rTJJjXScMQxWSo1P/eNW8bEUGidSm870Q5F7fUEjPmgCPI2MsRH1fb4+Rnyl9XUokg2bfraUhI40eMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782701325; c=relaxed/simple;
	bh=VwP0OUoaO+z46SJK0eDU7CjxY/aTUt0GIuQULgrG15k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QrxN3lYeAt+ZZCj8IpiARPV2kvKbh8YDFuPVXVDhDl/6BoRquDlk5IEMcMPAcrV7mltCNO/HZSlci/1410LRYlJHYWEMFwEIs2PfI8zA2nFWVye39bbCC2ppn8AciIACJuLMzxpv+OuOTHien3ePsoJlAVPZ5iebkNxblMvEgaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZcRqGpjv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZcRqGpjv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 206F91F000E9;
	Mon, 29 Jun 2026 02:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782701324;
	bh=lf7NXyf4/Olu3H6UCZsc19AI3mioEBD5jSbUuRIjS70=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZcRqGpjvfqNA1+KF5w4qg+JBtR1qXJ4LyqTe2niq/9kr0Vvfq9rAWLarcqIIO+m8b
	 eqJEeEhUk7kQWA0kx01UfEc1HBveHKHcP0vlg+lruWDU1xxax+Cpm8V7+RlPUbMzI8
	 vmuOeZZ4z3RhCtN/jp0f9vBTFJ+SqTxcHs1AJstbi/dLsaddwiXyAMT3Cgt0o1YkPK
	 6kuQ1WuUN7ZZDp9HhIFbggD+hFRqrP2QYmDA7gURiwA7/qsuz+EYWFtEcZDPSAbyv9
	 sY3Cd+MCKPUCLRNfgwVnSz6hc6hya0KKBQpIcZfJTpyINnmE1OQ2G4HFw1vXMNt/9q
	 9hPhGuNs8RpvA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] i2c: imx: Cancel hrtimer before clearing slave
 pointer
Reply-To: sashiko-reviews@lists.linux.dev
To: Liem <liem16213@gmail.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260629023829.152651-3-liem16213@gmail.com>
References: <AM0PR04MB6802B863CD9B9AE1609C1785E8EB2@AM0PR04MB6802.eurprd04.prod.outlook.com>
 <20260629023829.152651-1-liem16213@gmail.com>
 <20260629023829.152651-3-liem16213@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 02:48:16 +0000
Message-Id: <20260629024844.206F91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The patch fails to completely resolve the NULL pointer dereference=
 and timer re-arming race because it does not synchronize with the hardware=
 interrupt handler (`i2c_imx_isr`).
- [High] Unsafe register access in shared interrupt handler while device is=
 runtime suspended.
--

commit c2a34f9b292f8911be5d2996abfed1cdbdad49e7
Author: Liem <liem16213@gmail.com>

i2c: imx: Cancel hrtimer before clearing slave pointer

This commit attempts to fix a use-after-free and NULL pointer dereference
by canceling the slave hrtimer before setting the slave pointer to NULL in
i2c_imx_unreg_slave(). The goal is to prevent the timer callback from firing
and dereferencing a cleared pointer.

> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 136e179d18b2d..4a6348f03fc5d 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -895,6 +895,7 @@ static int i2c_imx_unreg_slave(struct i2c_client *cli=
ent)
> =20
>  	i2c_imx_reset_regs(i2c_imx);
> =20
> +	hrtimer_cancel(&i2c_imx->slave_timer);

[Severity: High]
This is a pre-existing issue, but does this patch fully close the race
condition it attempts to fix?

Since teardown happens without holding slave_lock or calling
synchronize_irq(), the hardware interrupt handler (i2c_imx_isr) can
execute concurrently.

If the ISR evaluates i2c_imx->slave before it is set to NULL here, it will
proceed to i2c_imx_slave_handle() and unconditionally re-arm the timer:

drivers/i2c/busses/i2c-imx.c:i2c_imx_slave_handle() {
    ...
    hrtimer_restart(&i2c_imx->slave_timer);
    ...
}

Because i2c_imx_isr() is a hardware interrupt, hrtimer_cancel() here will
return immediately without waiting for it. The concurrent ISR will re-arm
the timer, which can then fire after i2c_imx->slave is set to NULL, still
causing the NULL pointer dereference.

Should synchronize_irq() be called before clearing the pointer and
canceling the timer, or should the slave_lock be held?

>  	i2c_imx->slave =3D NULL;
> =20
>  	/* Suspend */

[Severity: High]
This is a pre-existing issue, but can the shared interrupt handler crash the
system while the device is suspended?

The interrupt is requested as IRQF_SHARED in i2c_imx_probe():

    ret =3D request_threaded_irq(irq, i2c_imx_isr, NULL, IRQF_SHARED,
                               pdev->name, i2c_imx);

When the device is suspended, i2c_imx_runtime_suspend() disables the clock
via clk_disable(i2c_imx->clk) without masking the shared IRQ line.

If another device on the same IRQ line triggers an interrupt while the
controller is suspended, i2c_imx_isr() will execute and unconditionally
read hardware registers:

drivers/i2c/busses/i2c-imx.c:i2c_imx_isr() {
    ...
    status =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
    ...
}

On i.MX hardware, accessing registers of an unclocked peripheral results
in a synchronous bus fault. Does the ISR need a check to ensure the device
is not runtime-suspended before reading registers?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629023829.1526=
51-1-liem16213@gmail.com?part=3D2
