Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A673382EC
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 03:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780457494; cv=none; b=LFWA0ZO1QnR05ImdAOoLiMPxpxPqVtda3YO9bdMAPa5r15OivyqJtP/z2eCJwuyHSvhkPtEbSjoe89F8SU6r6+8ttxTzDiLwFUAKhmjbcVsORofwWAbGirVDvG2hmgUBpuyecvtiA/ukmCMS9RpcVnRiD6v8TDlGveciUsA6dPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780457494; c=relaxed/simple;
	bh=4kPoks/r3FLQFpAWz4ypYi85mSbzV9oWgKHKq2hbswU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=o8qd++boJZI9k/bbs38R0bIxh5/hcjdLNWwdmoCcTYo0avIEWEjuX7uEjHhwvJ5W9P/+8bsJ0pd6TX0OO/wMQ5xAvN48owp873320T1jKK7OBg3hA2zOk4GjbO5rXzJbndZOkNchyanfCY6WcS+HSOzbWbC49+DgMeXO2nP13iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K6d6mlgn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K6d6mlgn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 667071F00893;
	Wed,  3 Jun 2026 03:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780457493;
	bh=K+Igl68/8Yh9e9suKOFq4jaAcdMgISMF0XvqUbW/+x8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K6d6mlgn8lGcLx1bDjXJLkcTzaftTmVyqro0ftySMQDGoapxWT4Jcjef8ARlOg6fa
	 aXj3EZ0PKTEDZhGnn4mq8zgv4RWdtqsreniJ8q5s1BaLKQlJo/poaprntD6nKROmFj
	 bECD52jK+31qDWvV2B7N+6RRVT+uqyylyP0iC+5R0rhxkna4EsXi8uKt5nuLfrONYl
	 zDpS/phLEzaa3LDMjKSUHZfvdAz9MytpkhdzAb3nitZiAjak3ADNFHpRC8EBckI3kg
	 kA7UVsOtlurtfdA4AvIxEKT0eCN6sOWjgiayngdCF3AB6/jFdTC6PAIDGXz5eav69f
	 /kp1/5u7QBIuw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] serial: mxs-auart: fix IRQ registration ordering
 and manage console clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260603025857.287148-4-rosenp@gmail.com>
References: <20260603025857.287148-4-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 03:31:31 +0000
Message-Id: <20260603033132.667071F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Disabling the module clock at the end of `probe()` for non-console=
 ports causes a kernel panic when the serial core queries the port status (=
e.g., via `/proc/tty/driver/serial`). The driver does not implement a `.pm`=
 callback or use `pm_runtime`. Consequently, `uart_change_pm()` acts as a n=
o-op, and `uport->ops->get_mctrl()` performs an unclocked MMIO read of `REG=
_STAT`.
- [High] A spurious interrupt arriving while the port is closed will cause =
a kernel panic due to the clock being disabled. The main IRQ is requested w=
ithout `IRQF_NO_AUTOEN` (or similar mechanisms to mask it at the irqchip). =
If triggered, the ISR unconditionally accesses unclocked MMIO registers.
--

commit 2e7068bb1afe0ba0b9820a896f0d2535ea3517c9
Author: Rosen Penev <rosenp@gmail.com>

serial: mxs-auart: fix IRQ registration ordering and manage console clock

This commit moves the main UART IRQ registration after uart_add_one_port() =
to
ensure port states are initialized before the handler runs, and masks
interrupts to prevent spurious IRQs. It also disables the module clock for
non-console ports after probe, assuming startup will re-enable it on port
open.

> diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auar=
t.c
> index 60a683a497405..35ba2ae740976 100644
> --- a/drivers/tty/serial/mxs-auart.c
> +++ b/drivers/tty/serial/mxs-auart.c
[ ... ]
> @@ -1627,9 +1623,28 @@ static int mxs_auart_probe(struct platform_device =
*pdev)
[ ... ]
> +	/*
> +	 * Request the main IRQ after uart_add_one_port so that
> +	 * s->port.state and s->port.lock are initialized before
> +	 * the handler can run in response to a bootloader-left
> +	 * interrupt.
> +	 */
> +	ret =3D devm_request_irq(&pdev->dev, irq, mxs_auart_irq_handle, 0,
> +			       dev_name(&pdev->dev), s);

[Severity: High]
Does this leave us vulnerable to a crash if a spurious interrupt arrives
while the port is closed?

The main IRQ is requested without IRQF_NO_AUTOEN (or similar mechanisms), so
it remains unmasked at the interrupt controller. If an interrupt fires after
the clock is disabled below, mxs_auart_irq_handle() will perform an
unconditional unclocked MMIO read:

drivers/tty/serial/mxs-auart.c:mxs_auart_irq_handle() {
	...
	stat =3D mxs_read(s, REG_STAT);
	...
}

[ ... ]
> @@ -1641,10 +1656,16 @@ static int mxs_auart_probe(struct platform_device=
 *pdev)
>  			 (version >> 16) & 0xff, version & 0xffff);
>  	}
> =20
> -	return 0;
> +	/*
> +	 * Disable clock - startup will re-enable when the port is opened.
> +	 * For the console port the clock must stay prepared so that
> +	 * auart_console_write() can safely call clk_enable() from
> +	 * atomic context.
> +	 */
> +	if (!uart_console(&s->port))
> +		clk_disable_unprepare(s->clk);

[Severity: High]
Will this cause a crash when the serial core queries the port status (e.g.,
when reading /proc/tty/driver/serial)?

The serial core invokes uart_line_info(), which calls uport->ops->get_mctrl=
()
on the port. Because this driver lacks a .pm callback and doesn't use
pm_runtime, the serial core's uart_change_pm() acts as a no-op and the clock
will remain disabled.

This results in mxs_auart_get_mctrl() executing an unclocked MMIO read:

drivers/tty/serial/mxs-auart.c:mxs_auart_get_mctrl() {
	...
	u32 stat =3D mxs_read(s, REG_STAT);
	...
}

> =20
> -out_free_qpio_irq:
> -	auart_port[s->port.line] =3D NULL;
> +	return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603025857.2871=
48-1-rosenp@gmail.com?part=3D3
