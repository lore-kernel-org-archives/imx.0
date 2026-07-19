Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759DA315D23
	for <imx@lists.linux.dev>; Sun, 19 Jul 2026 22:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784499903; cv=none; b=GZc+18KzjcSngELCj2kw6ZW6hgjL14+XS/RrX+qQgUOA0g0LPQ8nfheFkJEdab7utcaTGII1sq2eGgI1oQuzzrO13Cjgxpdv6Ap1WEJ+O3DHwJtK7L+t4vRFPwwtIJLN4ylnv8HSeDbiyMlncV4j0rjQBfCKL9y/6cH+EPkJK+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784499903; c=relaxed/simple;
	bh=VyP8Rhfalaj/2GSNADh7qlwoShl/z98G4S6MRXUKsBQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D7Jp0hTKdGxImx9ZyaXsNjcVx2oA8nX1Ejp2Yyfv5iO0ufwdD3Lb//5RoDd1/1a8GFjBbVwetzpy0Dyzv3SFadsfjLBayc6eUw2oDz+qz7wKNNAJSUOApASXMMy3K7byWRRNvtdB0FdhHkDu0MvBdnr16qfqjEJxKFvhvdfAnLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dJcaWINC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dJcaWINC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB4CB1F000E9;
	Sun, 19 Jul 2026 22:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784499902;
	bh=7yLQQA2TU4VmXffhr9oSwyNYsBWs20OCkRJIhyBJDVI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dJcaWINCRVWokWmSFL/gYE1bUPxkZroG+NnQKdI6zVwb6Wv/EcWieXVy7/RgKVHRD
	 Rs8Cf0x8Gn+H4ITH3ZsS+AFGH0bdXuAnrYWMOT9DDmSH27LeuL5AYyZGkqz8fwV27z
	 lWd0pm5zNpaUyZp48ubHcuH848z9fnKdeCfZa5aWqjZOGGf+l9h50anXjX2ZEjc02h
	 +7Xs+RspCZwP4xONmik9gb51kVlxBMi45ws+3gG1g1SIRNX60y6/tk/pXMcSajT9BN
	 CHuREzb+QaWdmHH9p6nITePo5ZvFvDikS/GQwyMthTqOaIP55V7HPDoLNyEz1i15Do
	 GsuPufjIpCI0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] serial: imx: serialize imx_uart_ports[] lifetime
Reply-To: sashiko-reviews@lists.linux.dev
To: "Karl Mehltretter" <kmehltretter@gmail.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260719221014.44354-5-kmehltretter@gmail.com>
References: <20260719221014.44354-1-kmehltretter@gmail.com>
 <20260719221014.44354-5-kmehltretter@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 19 Jul 2026 22:25:00 +0000
Message-Id: <20260719222501.CB4CB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Clobbering of an active port entry in `imx_uart_ports` during a du=
plicate-line probe leads to a NULL pointer dereference.

Pre-existing issues:
- [High] Missing explicit cancellation of hrtimers during device removal le=
ads to Use-After-Free.
- [High] imx_uart_probe() requests interrupts before sport->port.state is i=
nitialized, without fully clearing all hardware interrupt enable bits.
--

--- Patch [4]: [PATCH v2 4/4] serial: imx: serialize imx_uart_ports[] lifet=
ime ---
commit 7a4c9e19ce793ebaff93921ddc3c70f324874180
Author: Karl Mehltretter <kmehltretter@gmail.com>

serial: imx: serialize imx_uart_ports[] lifetime

imx_uart_probe() publishes the port in imx_uart_ports[] before
uart_add_one_port(), because console setup during that call uses the
table. Use a driver-wide mutex to serialize table publication, port
addition and rollback with port removal and table clearing.

Link: https://lore.kernel.org/all/20260719162850.043B41F000E9@smtp.kernel.o=
rg

> diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
> index 251a50c8aa387..def874f9cd000 100644
> --- a/drivers/tty/serial/imx.c
> +++ b/drivers/tty/serial/imx.c
[ ... ]
> @@ -2632,11 +2642,14 @@ static int imx_uart_probe(struct platform_device =
*pdev)
>  		}
>  	}
> =20
> -	imx_uart_ports[sport->port.line] =3D sport;
> -
>  	platform_set_drvdata(pdev, sport);
> =20
> +	mutex_lock(&imx_uart_ports_lock);
> +	imx_uart_ports[sport->port.line] =3D sport;
> +	ret =3D uart_add_one_port(&imx_uart_uart_driver, &sport->port);
> +	if (ret)
> +		imx_uart_ports[sport->port.line] =3D NULL;

[Severity: High]
If a duplicate UART alias is probed, such as from a misconfigured device
tree, does this unconditionally overwrite an already active port's entry
in imx_uart_ports?

When uart_add_one_port() subsequently fails for the duplicate, this error
path sets the entry to NULL. The original port remains active, but will
console callbacks that rely on imx_uart_ports[] encounter a NULL pointer
dereference and crash the system?

[Severity: High]
This is a pre-existing issue, but I noticed that just before this code in
imx_uart_probe(), devm_request_irq() is called before sport->port.state is
initialized by uart_add_one_port().

Since UCR4 interrupt flags (like UCR4_TCEN) are not fully cleared, could an
early spurious interrupt fire immediately if left enabled by the bootloader
or a previous crash kernel?

If the interrupt fires, the ISR would call:

imx_uart_transmit_buffer()
    struct tty_port *tport =3D &sport->port.state->port;

Would this dereference the uninitialized sport->port.state and cause a
kernel panic?

> +	mutex_unlock(&imx_uart_ports_lock);
> =20
>  err_clk:
>  	clk_disable_unprepare(sport->clk_ipg);
> =20
>  	return ret;
>  }
> =20
>  static void imx_uart_remove(struct platform_device *pdev)
>  {
>  	struct imx_port *sport =3D platform_get_drvdata(pdev);
> +	unsigned int line =3D sport->port.line;
> =20
> +	mutex_lock(&imx_uart_ports_lock);
>  	uart_remove_one_port(&imx_uart_uart_driver, &sport->port);
> +	imx_uart_ports[line] =3D NULL;
> +	mutex_unlock(&imx_uart_ports_lock);

[Severity: High]
This is a pre-existing issue, but does imx_uart_remove() need to explicitly
cancel any pending hrtimers before returning?

During imx_uart_shutdown(), if the TX state is SEND (e.g., in RS485 mode)
and the hrtimer fires late, the shutdown loop forces the state to OFF upon
timeout but does not cancel the timer:

imx_uart_shutdown()
    if (sport->tx_state !=3D OFF) {
        dev_warn(sport->port.dev, "unexpected tx_state\n");
        ...
        sport->tx_state =3D OFF;
    }

Since sport is devm-allocated, it is freed immediately after
imx_uart_remove() returns. Could the pending trigger_stop_tx hrtimer then
fire and cause a use-after-free on the sport structure?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260719221014.4435=
4-1-kmehltretter@gmail.com?part=3D4
