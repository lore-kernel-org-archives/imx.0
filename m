Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8766B307AE3
	for <imx@lists.linux.dev>; Fri, 31 Jul 2026 18:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785522957; cv=none; b=EST11kIRomZORPhJgdzAhhfKCeq/BY29UdtVzm2HaRoWEa6tEgD95hflPOjTBJAGMaNOPV3kCYnI0pJAuKMkdMP0fpyfSDK7IV5qLTgwM1GnmCjrOyQ/o0MWDASIOikFLbu1v7s8N1oNb69HenNByaBaX37oDTt9yoZ5hT4PAFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785522957; c=relaxed/simple;
	bh=VnMuZAvZfxYFx+WG3iJPZ8ol8+VqZiGfwunIz6YIGgI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aHdJf8CwRFdwDBLjwoFKY8K5cBwIjHhvR+8MVqMqx0NafWvUwAVQJNjWjkKhyTGjUIy5OG/Jnlj/8GiG8rg1BIYh/SibUQS5PdEnaJN77149w83FrIfwkkczWK3AwpQI7pw0tJmR06wdmZAaLUGWZxqYZI2/Qryjf8cVrxKRYhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HzBdyBWe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HzBdyBWe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFB791F00AC4;
	Fri, 31 Jul 2026 18:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785522956;
	bh=wdPx/QoIkXyXwp8++i7os62xb8vMri9FhcHj+cLJVzo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HzBdyBWeAOjRTGGTBbeiQ+dxJPT0X8oQM4wqxdU3cVhUuyV7k2jWQG5p4Vv+lOLPB
	 95iSmuzryplx1eZWEiZzydf2BxIdDG2ZJr/COMlaqpUG8j3XA7mC6wIUa97SeLfuJI
	 iRVGFENoVj8eoiklUneuCB/oK4gpmzY/1wKOa/bVUf9pERjwP503Pzo/FtBc57t+/M
	 LOv6kqjrp8sa3nI9/Qi2GEQaTADfTblCvoZN52/T9NpklR/Dk9AkxtStEbuYaAJzQM
	 8Ljb68HIxJoJNcZYhoxFzZsUCFYKAegBGw6tZ/sFH5c4aHwx0gUgqGN2Ch+6aGsik0
	 bFxWp7cmQpJ7A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/5] serial: imx: serialize imx_uart_ports[] lifetime
Reply-To: sashiko-reviews@lists.linux.dev
To: "Karl Mehltretter" <kmehltretter@gmail.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260731181844.11330-6-kmehltretter@gmail.com>
References: <20260731181844.11330-1-kmehltretter@gmail.com>
 <20260731181844.11330-6-kmehltretter@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 18:35:55 +0000
Message-Id: <20260731183555.CFB791F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] Mixing goto-based error handling with scope-based cleanup helper=
s (`scoped_guard`) in the same function.

Pre-existing issues:
- [High] The `trigger_start_tx` and `trigger_stop_tx` hrtimers are never ex=
plicitly canceled, leading to a potential Use-After-Free.
- [High] The interrupt handlers are registered before the UART port's spinl=
ock is initialized, exposing an uninitialized lock to concurrent execution.
--

--- Patch [5]: [PATCH v4 5/5] serial: imx: serialize imx_uart_ports[] lifet=
ime ---
commit e68620832979b5e6ab71402a28efa1b401b7be4c
Author: Karl Mehltretter <kmehltretter@gmail.com>

serial: imx: serialize imx_uart_ports[] lifetime

This patch protects port addition and removal with a mutex to prevent sibli=
ng
operations from interleaving. It keeps the imx_uart_ports[] entry valid
through uart_remove_one_port() and clears it afterward, rejecting occupied
slots during a duplicate-line probe rather than clobbering an active port.

Link: https://lore.kernel.org/all/20260719162850.043B41F000E9@smtp.kernel.o=
rg
Link: https://lore.kernel.org/all/20260719222501.CB4CB1F000E9@smtp.kernel.o=
rg

> diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
> index 251a50c8aa387..b0f34a6e7d4f8 100644
> --- a/drivers/tty/serial/imx.c
> +++ b/drivers/tty/serial/imx.c

[ ... ]

> @@ -2632,11 +2636,19 @@ static int imx_uart_probe(struct platform_device =
*pdev)
>  		}
>  	}
> =20
> -	imx_uart_ports[sport->port.line] =3D sport;
> -
>  	platform_set_drvdata(pdev, sport);
> =20
> -	ret =3D uart_add_one_port(&imx_uart_uart_driver, &sport->port);
> +	scoped_guard(mutex, &imx_uart_ports_lock) {

[Severity: Medium]
Does this mix goto-based error handling and scope-based cleanup helpers in
the same function?

Looking at imx_uart_probe(), the function heavily relies on goto labels like
goto err_clk for error cleanup. The cleanup subsystem guidelines expect that
usage of goto and cleanup helpers are never mixed in the same routine, and
that all resources should either be converted to scope-based cleanup or left
unconverted.

Should this function be converted entirely, or should this continue using
standard mutex_lock/unlock to match the rest of the error handling?

[Severity: High]
This isn't a bug introduced by this patch, but is there a race condition
with interrupt handlers being registered before the UART port's spinlock
is initialized?

Earlier in imx_uart_probe(), devm_request_irq() is called to request
interrupts before uart_add_one_port() is called here. The sport structure
is allocated via devm_kzalloc(), leaving sport->port.lock zero-initialized.
The lock is not formally initialized until uart_add_one_port() runs.

If a spurious interrupt or a pending interrupt from the bootloader triggers
between devm_request_irq() and uart_add_one_port(), would the IRQ handler
imx_uart_int() attempt to acquire an uninitialized lock, leading to a
panic or lockdep crash?

> +		if (imx_uart_ports[sport->port.line]) {
> +			ret =3D -EBUSY;
> +		} else {
> +			imx_uart_ports[sport->port.line] =3D sport;
> +			ret =3D uart_add_one_port(&imx_uart_uart_driver,
> +						&sport->port);
> +			if (ret)
> +				imx_uart_ports[sport->port.line] =3D NULL;
> +		}
> +	}
> =20
>  err_clk:
>  	clk_disable_unprepare(sport->clk_ipg);
> @@ -2648,7 +2660,9 @@ static void imx_uart_remove(struct platform_device =
*pdev)
>  {
>  	struct imx_port *sport =3D platform_get_drvdata(pdev);
> =20
> +	guard(mutex)(&imx_uart_ports_lock);
>  	uart_remove_one_port(&imx_uart_uart_driver, &sport->port);

[Severity: High]
This is a pre-existing issue, but does driver removal leave active hrtimers
running that could cause a use-after-free?

During driver unbind, imx_uart_shutdown() waits for the hrtimer-driven state
machine to finish using a simple timeout loop, but it doesn't explicitly ca=
ll
hrtimer_cancel() if it times out.

Shortly after uart_remove_one_port() completes here, devres will free the
sport memory. If either the trigger_start_tx or trigger_stop_tx hrtimers
are still active, could they fire and dereference the freed sport structure?

> +	imx_uart_ports[sport->port.line] =3D NULL;
>  }
> =20
>  static void imx_uart_restore_context(struct imx_port *sport)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731181844.1133=
0-1-kmehltretter@gmail.com?part=3D5
