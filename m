Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5590626A0D5
	for <imx@lists.linux.dev>; Tue, 19 May 2026 11:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779188605; cv=none; b=CWbUzm0i1gqxs0o1OShAWmas0/V36bMm0fmjzMlC/QuBSudDag1GnyyKmGtL6Br8ju3xL7tlUKS4yiEHQ/VYuL6nxNHvdqevVrvxPSX/4i46Qcunlq1N+mXf4RFASRIdzpiKqPgT6fLEBa95wuDpAwgdLqmNE6GqQ14qVqcL/Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779188605; c=relaxed/simple;
	bh=GiU1ET40pgjX03bOfSy0fA9ml/WelT4ehYKgvNrzQrI=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kHpdX/M4It7q9iz8qdoDpt4JXNFVJYGdp3+hTP13kBwUAuxIAcTjOBjsNeu2+gR5lXpaSHg3kbJAbUoDT3nNfdRfjAlTrWjBZI56hM/6RkXy3P7nSTNJA9OGTVnUXRk1rAE3kd659lagLG7eUe9924gsXgY9ZYkXmooTARH3Yuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lqMWkPt2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lqMWkPt2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC197C2BCB3;
	Tue, 19 May 2026 11:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779188605;
	bh=GiU1ET40pgjX03bOfSy0fA9ml/WelT4ehYKgvNrzQrI=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date:From;
	b=lqMWkPt28j/lRRj3NQawwzrEl8ungQXUPpjViIiMvIwJ2xFEjgudtJJfogmFb6oLD
	 ExXBKuj1zvYh7FgZPzI51X7I5qQ3Sd/hIXDA+a0FJ2/aQzhSIcT/yPrwMNfD9qwocA
	 6HQfA/x4saqUsff3B31bB4HLWisOZVJuhmRWnwmXCOcYBftHSOWVvRUZxWRZJoA7mJ
	 qbvH39n6KZLRzT7YlTmlwGQt97ShGEnHmi0twx32Md6ULaPfqtVDYs8ogvAGszRkfh
	 uOO/Fo4itYqr97PGhk8ZtD6kWT4lwVJq8Ecfc+T//mFm5osXfK13Hp3Hge1WBklyJd
	 6Jy1SGI7sKtmw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] i2c: imx: mark I2C adapter when hardware is powered
 down
Reply-To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260519103815.2793953-1-carlos.song@oss.nxp.com>
References: <20260519103815.2793953-1-carlos.song@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 11:03:24 +0000
Message-Id: <20260519110324.CC197C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Race condition: hardware powered down before I2C adapter is marked=
 suspended, risking bus hangs or crashes.
- [High] PM Guideline Violation: Shared IRQ handler accesses hardware regis=
ters without checking Runtime PM state.
- [High] PM Guideline Violation: Missing `synchronize_irq()` in `i2c_imx_ru=
ntime_suspend()`.
--

commit 3cc1c1c3065630f26db74add04c2d7534a0cff83
Author: Carlos Song <carlos.song@nxp.com>

i2c: imx: mark I2C adapter when hardware is powered down

This commit marks the I2C adapter as suspended during system suspend to
block further transfers. It resumes the adapter on system resume to prevent
hangs when clients attempt transfers while hardware is powered down.

> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index a208fefd3c3b3..3b19d4a424ca0 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1913,6 +1913,34 @@ static int i2c_imx_runtime_resume(struct device *d=
ev)
>  	return ret;
>  }
> =20
> +static int __maybe_unused i2c_imx_suspend_noirq(struct device *dev)
> +{
> +	struct imx_i2c_struct *i2c_imx =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D pm_runtime_force_suspend(dev);

Could calling pm_runtime_force_suspend() before marking the adapter as
suspended introduce a race condition?

If a concurrent transfer is in progress, this will disable the hardware clo=
ck
while the transfer is actively accessing registers.

> +	if (ret)
> +		return ret;
> +
> +	i2c_mark_adapter_suspended(&i2c_imx->adapter);

Since i2c_mark_adapter_suspended() attempts to acquire the adapter bus lock,
would it be safer to call it before pm_runtime_force_suspend() to synchroni=
ze
and prevent new transfers?

If pm_runtime_force_suspend() fails after marking the adapter suspended,
i2c_mark_adapter_resumed() could then be called to roll back the state.

> +
> +	return 0;
> +}

[ ... ]

While reviewing this code, I also noticed a couple of pre-existing issues
related to Power Management and shared IRQs in the driver.

Does the shared IRQ handler access hardware registers without checking the
Runtime PM state?

drivers/i2c/busses/i2c-imx.c:i2c_imx_probe() {
    ...
    request_irq(..., IRQF_SHARED, ...)
    ...
}

If another device sharing the same interrupt line fires an IRQ while the I2C
controller is runtime-suspended, the I2C interrupt handler will execute and
read from powered-down hardware. Could pm_runtime_get_if_active() be used in
the ISR to verify the state first?


Also, does i2c_imx_runtime_suspend() need to call synchronize_irq()?

Because the interrupt is requested with IRQF_SHARED, disabling the hardware
clock without synchronizing first could cause an invalid register read/write
if the ISR is concurrently running on another CPU.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519103815.2793=
953-1-carlos.song@oss.nxp.com?part=3D1
