Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BDA37C926
	for <imx@lists.linux.dev>; Wed, 20 May 2026 11:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779277834; cv=none; b=cJB6gryw0Fv1xk+TrGe5nrsNC3WNxhnlaDfadQ5Rp8emeBAEtamdC/uAQueGEbvDCLj3Ez4zoakNckEWMohya/31BEfFOmVTQv5S6gLH1ytIY43Q7+Apd4tMOPtpE15VQZ1Sg9Z0HD6BF7owppSxrUDLqZ2No7vcychiMY18/Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779277834; c=relaxed/simple;
	bh=vz/D7nCE4btfpwdpi4BGN34Ql1rqgTYejmLzuZewrmI=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ttNBiuVxtDYgKagba6siI8Mgx9YJxN+kuFW0d4wwc/wCsFqaJLmYTM1x1xGKRx/sGhY2F94y5rq2HyQIAvD43/HrQhdBSFTj0wlMfcFvEoh9F6/+6nyze06uhE3821RNvuX9x8bPRVP9XRG5Dt3ISxAJL9mURlzw18DliPk/IYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KtDRMHK7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KtDRMHK7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2CA61F000E9;
	Wed, 20 May 2026 11:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779277828;
	bh=jHmSp6CX10XVXt4k/RQlTRFVa620tnaPi+/qPawNPPc=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=KtDRMHK7noazy+IHO0gupht03goSqc7qrNxkiWqzhbhQpE3zLKETxJI465evd0Yd9
	 hEg9/rBZv2AVAGPf276x5Z16EAaG9rHCp2wCjNkORJjUByVhpPlMNYGpYyFrK6g3SR
	 jmT0h2nBS/uW4mL0OoVO7FJdC0kvUI1eaKLnQzs413v5nZBe+eOZdCxlPZ9cZA/RD7
	 Sc6BqfjWLjULTZKqsdf9Ql2ngChfcneLFwjU9o0yAjgmLm2eU0zLUQBfwi23g3846U
	 EE92HVMgzB4Sa+Q2CS3TfJQ1W+dMk9XelF/lw8/d2s92KfqzmVInkNcdzXOYtkY3Uf
	 pRXYSiIHQpGzw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] i2c: imx: mark I2C adapter when hardware is powered
 down
Reply-To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260520101504.2885873-1-carlos.song@oss.nxp.com>
References: <20260520101504.2885873-1-carlos.song@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 11:50:27 +0000
Message-Id: <20260520115027.E2CA61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] If system suspend fails, the I2C slave state machine loses its tim=
eout protection and can permanently hang.

Pre-existing issues:
- [High] The interrupt handler unconditionally accesses hardware registers =
on a shared IRQ line without checking PM state, which will cause a crash if=
 the device is suspended.
- [High] The `slave_timer` can be re-armed during driver removal, leading t=
o a Use-After-Free.
- [High] The `slave_timer` is not cancelled when a slave is unregistered, p=
otentially causing a NULL pointer dereference.
- [High] The I2C slave mode registers are lost during system suspend and ar=
e not restored upon system resume, leaving the slave device non-functional.
--

commit 8b5535f823cf602789b0659057d09e77d12c12d3
Author: Carlos Song <carlos.song@nxp.com>

i2c: imx: mark I2C adapter when hardware is powered down

This commit marks the I2C adapter as suspended during system suspend to blo=
ck
further transfers. It then resumes the adapter on system resume, preventing
hangs when clients attempt transfers while the hardware is powered down.

> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index a208fefd3c3b3..d651ade86267d 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c

[ ... ]

> @@ -1913,6 +1913,43 @@ static int i2c_imx_runtime_resume(struct device *d=
ev)
> +static int __maybe_unused i2c_imx_suspend_noirq(struct device *dev)
> +{
> +	struct imx_i2c_struct *i2c_imx =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	i2c_mark_adapter_suspended(&i2c_imx->adapter);
> +
> +	/*
> +	 * Cancel the slave timer before powering down to prevent
> +	 * i2c_imx_slave_timeout() from accessing hardware registers
> +	 * while the clock is disabled.
> +	 */
> +	hrtimer_cancel(&i2c_imx->slave_timer);

[Severity: High]
This isn't a bug introduced by this patch, but I have a question about the
slave timer lifecycle during driver removal.

In i2c_imx_remove(), hrtimer_cancel() is called before i2c_del_adapter()
and free_irq(). Because the interrupt is still active, could an incoming
I2C transaction trigger i2c_imx_isr(), process a slave event, and restart
the timer?

After i2c_imx_remove() completes, the i2c_imx structure is freed, which
might result in a use-after-free when the re-armed timer expires.

[Severity: High]
This is a pre-existing issue, but I also have a question about the timer
when a slave is unregistered.

In i2c_imx_unreg_slave(), i2c_imx->slave is set to NULL, but the timer is
not explicitly cancelled. If the timer fires after unregistration, could it
call i2c_slave_event() with a NULL client pointer, leading to a dereference
crash?

> +
> +	ret =3D pm_runtime_force_suspend(dev);
> +	if (ret) {
> +		i2c_mark_adapter_resumed(&i2c_imx->adapter);
> +		return ret;
> +	}

[Severity: High]
If pm_runtime_force_suspend() fails, we restore the adapter availability
and return an error to abort system suspend, but the slave timer remains
cancelled.

If a slave transaction was ongoing and relied on this timer for timeout
protection, does cancelling it without restoring leave the I2C bus state
machine permanently hung?

> +
> +	return 0;
> +}
> +
> +static int __maybe_unused i2c_imx_resume_noirq(struct device *dev)
> +{
> +	struct imx_i2c_struct *i2c_imx =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D pm_runtime_force_resume(dev);
> +	if (ret)
> +		return ret;

[Severity: High]
This is a pre-existing issue, but does pm_runtime_force_resume() properly
restore the slave hardware registers?

During system suspend, the controller may lose its register state (like
IMX_I2C_IADR and IMX_I2C_I2CR) when the hardware domain powers down. Since
the runtime resume callback doesn't re-initialize these registers, will
the controller forget its slave address and lose the slave enable bit,
breaking slave mode until the driver is reloaded?

> +
> +	i2c_mark_adapter_resumed(&i2c_imx->adapter);
> +
> +	return 0;
> +}

[ ... ]

> @@ -1946,8 +1983,8 @@ static int i2c_imx_resume(struct device *dev)
>  }
> =20
>  static const struct dev_pm_ops i2c_imx_pm_ops =3D {
> -	NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> -				  pm_runtime_force_resume)
> +	NOIRQ_SYSTEM_SLEEP_PM_OPS(i2c_imx_suspend_noirq,
> +				  i2c_imx_resume_noirq)

[Severity: High]
This isn't a bug introduced by this patch, but since the driver requests
a shared interrupt with IRQF_NO_SUSPEND, is it safe for i2c_imx_isr()
to unconditionally access hardware registers (like IMX_I2C_I2SR) without
checking the PM state?

When the I2C controller is powered down and its clock is disabled during
suspend, a spurious interrupt or one from another device sharing the line
could invoke the ISR.

Since accessing unclocked registers causes a synchronous external abort,
should the ISR use pm_runtime_get_if_active() to prevent a crash?

>  	SYSTEM_SLEEP_PM_OPS(i2c_imx_suspend, i2c_imx_resume)
>  	RUNTIME_PM_OPS(i2c_imx_runtime_suspend, i2c_imx_runtime_resume, NULL)
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520101504.2885=
873-1-carlos.song@oss.nxp.com?part=3D1
