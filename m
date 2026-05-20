Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E39236EAAB
	for <imx@lists.linux.dev>; Wed, 20 May 2026 07:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779263376; cv=none; b=gbLFmfr2fJFEoDVmmNEpnzasa7joUleXrUTJXMDZzTTD7URW26v6UmrYHD/A1mCqXDY5AteTb4IlcXRokXHVmL1ReXnpQkZs0TlQIND18x0vz54aLGZOjE5eVdw7t1COzsrGHsKHruFzeN+6pd77Tj1OY9YdEjmg4JOKhCjo4us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779263376; c=relaxed/simple;
	bh=ydVZjdRtigwjyQcdVlg0Vd+So7Vsg8bh46tkAaka1UM=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NaXPvY6ED360AK43G5Knd2Z0xc7UE0iuXbitXT+bexjZVlUkyNmrtJZJChaXSyol/Sb3mhEkIOtJwLvSe1cFKYWLqseXCvm+d3wl8s5oTHTPT6p25Q4seNF6f22RSK5mqOYvXhH+UidKs5Y74ImXuhZn2D3Qrzxen+pIJWaeJRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WnDEoBrm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WnDEoBrm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E18B31F000E9;
	Wed, 20 May 2026 07:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779263375;
	bh=af1W5pa0L0OEGYAfKGXZDVeDh0OOFgjiN3/ir+aIq9U=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=WnDEoBrmE91dXDe5nFyhtNZEdL1ckKGAbtCxO6ryh5un1WEGYD51+pelYlKsv2snA
	 u3Keiuw5int/AabnCQVqPFKYS7kp0smJ9enF5E7BL26KAcHa8SGPfaSZ1ux/eak6vZ
	 YMXxkI91WJ5XhSN3rePOo/P/nH7ih/c70pSF+Kawax7vycEwpmj5ndoZGwQ7WhREnz
	 L47KF8dC30cdMiYmOBnrVltgthijfw5vbe79m7k6qW8po1FvTZjCudm/aztJKrIA8f
	 kCPVymVXUpmEDW8epoh8uLnhrzWlrPDMKuBFhcixOfYh58O8WgW9tvOh9cq4g9QP7H
	 DgFYLFppfaXaA==
From: sashiko-bot@kernel.org
Subject: Re: [PACTH v2] i2c: imx: mark I2C adapter when hardware is powered
 down
Reply-To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260520070934.2874114-1-carlos.song@oss.nxp.com>
References: <20260520070934.2874114-1-carlos.song@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 07:49:34 +0000
Message-Id: <20260520074934.E18B31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver fails to protect hardware register access during runtim=
e suspend for its shared interrupt, lacking both `synchronize_irq()` in the=
 suspend path and `pm_runtime_get_if_active()` in the IRQ handler.
- [High] `i2c_imx_runtime_suspend()` leaves the hardware clock disabled if =
`pinctrl_pm_select_sleep_state()` fails.
- [High] The hrtimer `slave_timer` is not cancelled during system suspend, =
potentially leading to a use-after-power-off crash.
--

commit f51a099cc8fd35da4af15931c432736a3d33b710
Author: Carlos Song <carlos.song@nxp.com>

i2c: imx: mark I2C adapter when hardware is powered down

This commit marks the I2C adapter as suspended during system suspend to
block further transfers, and resumes it on system resume. This prevents
potential hangs when the hardware is powered down but clients still
attempt I2C transfers.

> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1913,6 +1913,36 @@ static int i2c_imx_runtime_resume(struct device *d=
ev)
>  	return ret;
>  }
> =20
> +static int __maybe_unused i2c_imx_suspend_noirq(struct device *dev)
> +{
> +	struct imx_i2c_struct *i2c_imx =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	i2c_mark_adapter_suspended(&i2c_imx->adapter);
> +
> +	ret =3D pm_runtime_force_suspend(dev);

[Severity: High]
This isn't a bug introduced by this patch, but does slave_timer need to be
cancelled here before suspending?

If the hrtimer expires while the device is in this forced suspended state
(or immediately upon early resume before the clock is restored),
i2c_imx_slave_timeout() will execute and attempt to read hardware registers.
Accessing registers of a powered-down i.MX block reliably causes a system
crash.

> +	if (ret) {
> +		i2c_mark_adapter_resumed(&i2c_imx->adapter);
> +		return ret;
> +	}
> +
> +	return 0;
> +}

[ ... ]

>  static const struct dev_pm_ops i2c_imx_pm_ops =3D {
> -	NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> -				  pm_runtime_force_resume)
> +	NOIRQ_SYSTEM_SLEEP_PM_OPS(i2c_imx_suspend_noirq,
> +				  i2c_imx_resume_noirq)
>  	SYSTEM_SLEEP_PM_OPS(i2c_imx_suspend, i2c_imx_resume)
>  	RUNTIME_PM_OPS(i2c_imx_runtime_suspend, i2c_imx_runtime_resume, NULL)

[Severity: High]
This is a pre-existing issue, but does i2c_imx_runtime_suspend() properly
protect hardware register access for its shared interrupt?

Since the driver registers its interrupt with IRQF_SHARED, if another
device on the same line triggers an interrupt while this I2C controller
is runtime suspended, i2c_imx_isr() will execute and immediately read
hardware registers. Because the runtime suspend disables the hardware
clock, accessing these registers will cause a system crash.

Should i2c_imx_runtime_suspend() call synchronize_irq() before
disabling the clock, and should i2c_imx_isr() use
pm_runtime_get_if_active() to verify the device is powered?

[Severity: High]
This is also a pre-existing issue, but could i2c_imx_runtime_suspend()
leave the hardware clock disabled if pinctrl_pm_select_sleep_state() fails?

If the pinctrl state change fails, the function returns an error without
re-enabling the clock. The PM core will treat the runtime suspend as
failed and keep the device in the active state. Subsequent I2C
transfers or IRQs will attempt to access the hardware without enabling
the clock, which will crash the system.

>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520070934.2874=
114-1-carlos.song@oss.nxp.com?part=3D1
