Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2402571C7
	for <imx@lists.linux.dev>; Thu, 25 Jun 2026 16:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782404154; cv=none; b=E/c29FRzGSRPZ1HsPm3O+oBBcdPLoaUr7pwM9Jl/DkwLweGKxg9ZydNcTfP8E9s14b+rcVFVhjppBE0Xd+52ijSGk/FkBqFwLX0oNaVYn5PLxOqiCaBsFap2D6spQiET1q+hzp/S7icJV1ox8Do9MQmNgUiWiuTzcEGWzmq+Xi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782404154; c=relaxed/simple;
	bh=gixjXqYhWRNNuuGw4d0wGBS6iavyJrgcTUfg8h6JzBE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GzyRNxF3JixDl3rMZDkcRRAafdH3mLLLxa8hsnhZDYpS8Nse6Yj/jRVYch3zqg6HEjQf/v88YbHrC49gTBOZeWM7hymGc59+UcZH5aJmqvUTisGb6kZMxl7ET9zy24IrKTFgCE1dUvBQ6XLSN5NJ8NcvzhuvKxkmXlJmq0vzqJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SGNd05Fk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SGNd05Fk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41DBC1F000E9;
	Thu, 25 Jun 2026 16:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782404152;
	bh=CdzfLFRneXI3RaP43XP7LzIj+GZz2cVXHT6rJOWP1eM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SGNd05FkME86kpKu/uF9Ma2fQgjiWGl6Xeje05Tc9LsXRaMjKuac11AoHw96vjh9w
	 jGcxklQqB5rfmJHSIpMpFb2BL4CNUzCcQJKoSBCNgdVW/ibttrOVNWEI+Y2j1fwtl+
	 0b4X8cYYJ23cTu36JZjCHD1+EbSUHsgR2g5EYui3hrvnGyM2+N17zuOSd2c7wHS0yG
	 1Wdi0mqABo8t7WbURZHm+xHIrMQRhWAvJZh/JnD/6RLEcHe+tgeXIqDphLcfWcNh2d
	 sgKc2/0kjMc2eQUOlmLznK5rnFLTUPe98cXHErWM6E0w1UtnmBESqS01jpl9Uc7OZi
	 Y2oP8W4qrq1aQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] i2c: imx: Fix slave registration error path and
 missing timer cleanup
Reply-To: sashiko-reviews@lists.linux.dev
To: Liem <liem16213@gmail.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260625160219.55116-1-liem16213@gmail.com>
References: <20260625071130.93544-1-liem16213@gmail.com>
 <20260625160219.55116-1-liem16213@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 16:15:51 +0000
Message-Id: <20260625161552.41DBC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Lockless modification of `i2c_imx->slave` in `i2c_imx_reg_slave()`=
 introduces a data race and potential NULL pointer dereference.

Pre-existing issues:
- [High] Incomplete timer cancellation race in `i2c_imx_unreg_slave()` allo=
ws the ISR to restart the timer, leading to a kernel panic.
- [High] The shared interrupt handler `i2c_imx_isr()` accesses hardware reg=
isters without checking if the device is active, violating PM guidelines an=
d causing bus faults.
- [High] Missing IRQ synchronization in `i2c_imx_runtime_suspend()` allows =
the hardware to be powered down while the shared interrupt handler is execu=
ting.
--

commit 0e234f45db94de278630074d43eb9ffb0e39884e
Author: Liem <liem16213@gmail.com>

i2c: imx: Fix slave registration error path and missing timer cleanup

This commit fixes a potential -EBUSY deadlock when slave registration fails
by properly clearing the slave pointer. It also cancels the slave hrtimer
during unregistration to prevent a system hang caused by the timer firing
after the slave pointer is cleared.

> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index cf5bacf3a4884..17b54d1648441 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -871,6 +871,7 @@ static int i2c_imx_reg_slave(struct i2c_client *clien=
t)
>  	/* Resume */
>  	ret =3D pm_runtime_resume_and_get(i2c_imx->adapter.dev.parent);
>  	if (ret < 0) {
> +		i2c_imx->slave =3D NULL;

[Severity: High]
Can this assignment race with the interrupt handler?

Because the driver uses a shared IRQ, i2c_imx_isr() could execute
concurrently if another device triggers the interrupt line.

If the ISR acquires slave_lock and evaluates i2c_imx->slave as valid, and
this error path locklessly sets it to NULL, wouldn't subsequent accesses
in the ISR dereference a NULL pointer?

>  		dev_err(&i2c_imx->adapter.dev, "failed to resume i2c controller");
>  		return ret;
>  	}

[ ... ]

> @@ -892,7 +893,7 @@ static int i2c_imx_unreg_slave(struct i2c_client *cli=
ent)
>  	imx_i2c_write_reg(0, i2c_imx, IMX_I2C_IADR);
> =20
>  	i2c_imx_reset_regs(i2c_imx);
> -
> +	hrtimer_cancel(&i2c_imx->slave_timer);
>  	i2c_imx->slave =3D NULL;

[Severity: High]
This is a pre-existing issue, but does canceling the timer here completely
prevent it from running?

Since i2c_imx_unreg_slave() doesn't synchronize with the shared interrupt
handler, i2c_imx_isr() could be actively executing on another CPU. If the
ISR finishes after hrtimer_cancel() is called, it will reach
i2c_imx_slave_handle() and unconditionally call
hrtimer_restart(&i2c_imx->slave_timer).

When the re-armed timer expires, i2c_imx_slave_timeout() will attempt to
read hardware registers that have already been powered down by
pm_runtime_put_sync(), which causes a bus fault.

[Severity: High]
This is also a pre-existing issue, but does the shared interrupt handler
safely access hardware registers?

i2c_imx_isr() unconditionally reads IMX_I2C_I2SR and IMX_I2C_I2CR. Because
it handles a shared interrupt line, it could be triggered by another device
while the I2C controller is runtime-suspended and its clock is disabled.
Should this use pm_runtime_get_if_active() before accessing the registers
to prevent a synchronous external abort?

[Severity: High]
This is another pre-existing issue, but does the runtime suspend callback
safely disable the hardware?

i2c_imx_runtime_suspend() disables the hardware clock via clk_disable()
without calling synchronize_irq(). If i2c_imx_isr() is mid-execution on
another CPU when the clock is turned off, wouldn't subsequent register
accesses within the handler fault?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625160219.5511=
6-1-liem16213@gmail.com?part=3D1
