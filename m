Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F493BE659
	for <imx@lists.linux.dev>; Thu, 25 Jun 2026 07:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782372390; cv=none; b=S2M2C+aE23JezA19hewDYqELNh28bwTZgp98SQs8Rbbd6Cs62w4q7ciz4TKXWdKD1TTjK9citRFawv/+9b1VtF7wDsFjqaX/qJxoi440CctydFZYd2eXayNfjPUX/LjJ7xaymh7ns593ZE3DZKkrZ4BZTudsp69hXcC4eO1CbQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782372390; c=relaxed/simple;
	bh=8GGlx3sWwCNUfi2uyOIRHp+u5UGLgfIPVOqS/BZEtcE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WFhxVOeMRI0JlQRJFPQH+9r2K8Sj7ZIvhHn9M/py8vtRyayJXPcJgxzfXU0XBjLUqt875Pe+CX9vz3Vs9PnHEQN6HlJRUnOlsr9sm/0EIODLUG1V/BKsMDSCqjBl9hp89tpdNoESwYFGed/24BWM3pe1vfwVIq6iggEgrV5rLu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cdoC5efv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cdoC5efv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F6081F00A3A;
	Thu, 25 Jun 2026 07:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782372388;
	bh=H8HfaKIwFNNxGhgcnN9szR156YBylxxyQ9zuMXBzSlw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cdoC5efvhkGPtpLY+hLgLKCVAOZiTtyu2aEvCET4KEH0e3gDIYLawsM4fZ9zqygk3
	 Z14XW5BrhyQPBXbLsaL6b1S0L0TlPFs1oAWSa8JTniDucPjDdqglFtYdUZhWVAJSpE
	 5BOhSHxpJhgKXXNI2+GITYbATsa54enJWv3/LSSB7IPBnq6J3ieJrsIWaUzF4RSRjb
	 DJYWCDxINTeg4m+EhQfeb3LhjrOo8mYGgvsbWnx315fptjvx4tGP11GSj7FahH8AKB
	 5BQu1DkUl7UZfWXfWcuN+7PJgA5oWddscDCi8tQfT0WLtls2Fgj8aAvNrpkn6Il1R4
	 30cD4+hqkcifg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] i2c: imx: Fix slave registration error path and missing
 NULL check
Reply-To: sashiko-reviews@lists.linux.dev
To: Liem <liem16213@gmail.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260625071130.93544-1-liem16213@gmail.com>
References: <20260625071130.93544-1-liem16213@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 07:26:27 +0000
Message-Id: <20260625072628.3F6081F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [Critical] The newly added NULL check in `i2c_imx_slave_event()` conditio=
nally prevents state updates, creating an infinite loop in `i2c_imx_slave_f=
inish_op()`.
- [High] The lockless NULL check of `i2c_imx->slave` in `i2c_imx_slave_even=
t()` introduces a Time-of-Check to Time-of-Use (TOCTOU) race condition.

Pre-existing issues:
- [High] The background `slave_timer` is not synchronously cancelled in `i2=
c_imx_unreg_slave()`, allowing a suspended device to be accessed.
- [High] The shared IRQ handler accesses hardware registers unconditionally=
 without verifying the runtime PM state, violating PM Subsystem guidelines.
- [High] The runtime suspend callback powers down hardware without calling =
`synchronize_irq()`, violating PM Subsystem Concurrency rules for shared IR=
Qs.
--

commit acf987bc13c7f8a8bbb96ab3004b61c139d9bb11
Author: Liem <liem16213@gmail.com>

i2c: imx: Fix slave registration error path and missing NULL check

This patch fixes an issue in i2c_imx_reg_slave() by clearing the slave
pointer when pm_runtime_resume_and_get() fails. It also adds a NULL check
in i2c_imx_slave_event() to prevent dereferencing a NULL slave pointer
during slave events.

> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index cf5bacf3a4884..8c44f6bf618c1 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -715,8 +715,10 @@ static void i2c_imx_enable_bus_idle(struct imx_i2c_s=
truct *i2c_imx)
>  static void i2c_imx_slave_event(struct imx_i2c_struct *i2c_imx,
>  				enum i2c_slave_event event, u8 *val)
>  {
> -	i2c_slave_event(i2c_imx->slave, event, val);
> -	i2c_imx->last_slave_event =3D event;
> +	if (i2c_imx->slave) {
> +		i2c_slave_event(i2c_imx->slave, event, val);

[Severity: High]
Does this introduce a time-of-check to time-of-use race condition?

The slave pointer is read locklessly here, and the compiler could read
i2c_imx->slave twice: once for the if-condition and once to pass as an
argument to i2c_slave_event().

If i2c_imx_unreg_slave() clears the pointer to NULL concurrently from proce=
ss
context without holding slave_lock:

i2c_imx_unreg_slave() {
    ...
    i2c_imx->slave =3D NULL;
    ...
}

Could i2c_slave_event() receive and dereference a NULL pointer?

> +		i2c_imx->last_slave_event =3D event;
> +	}

[Severity: Critical]
Does skipping this state update when the slave is NULL cause an infinite lo=
op
in i2c_imx_slave_finish_op()?

If i2c_imx->slave is cleared concurrently, last_slave_event is never advanc=
ed
to I2C_SLAVE_STOP.

i2c_imx_slave_finish_op() iterates based on this state:

i2c_imx_slave_finish_op() {
    ...
    while (i2c_imx->last_slave_event !=3D I2C_SLAVE_STOP) {
        ...
        case I2C_SLAVE_WRITE_REQUESTED:
            ...
            i2c_imx_slave_event(i2c_imx, I2C_SLAVE_STOP, &val);
            break;
    }
}

Will this cause the while loop to spin indefinitely?

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but does i2c_imx_unreg_slave()
fail to synchronously cancel the background timer?

It drops the runtime PM reference and disables the clock, but does not canc=
el
i2c_imx->slave_timer.

If the timer executes asynchronously after the clock is off:

i2c_imx_slave_timeout() {
    ...
    status =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
    ...
}

Will reading the hardware register trigger an external abort?

[Severity: High]
This isn't a bug introduced by this patch, but does the shared IRQ handler
access hardware registers unconditionally without verifying the runtime PM
state?

The driver requests a shared IRQ line:

i2c_imx_probe() {
    ...
    ret =3D request_threaded_irq(irq, i2c_imx_isr, NULL, IRQF_SHARED,
                               pdev->name, i2c_imx);
    ...
}

If another device on the shared IRQ line triggers an interrupt while the I2C
controller is runtime-suspended, the ISR reads from a powered-off IP block:

i2c_imx_isr() {
    ...
    status =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
    ...
}

Should the ISR verify the device is active using pm_runtime_get_if_active()?

[Severity: High]
This isn't a bug introduced by this patch, but does the runtime suspend
callback power down hardware without calling synchronize_irq()?

i2c_imx_runtime_suspend() {
    ...
    clk_disable(i2c_imx->clk);
    ...
}

Because the driver requests an IRQ with the IRQF_SHARED flag, PM subsystem
guidelines mandate that synchronize_irq() must be called in the runtime
suspend callback before powering down hardware. This prevents the IRQ
handler from executing mid-flight on another CPU while the clock is being
disabled.

Is a call to synchronize_irq() needed here?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625071130.9354=
4-1-liem16213@gmail.com?part=3D1
