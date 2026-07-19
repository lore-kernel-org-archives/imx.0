Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F8A2E5429
	for <imx@lists.linux.dev>; Sun, 19 Jul 2026 16:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784478532; cv=none; b=ZW0cVttXBVHaQ1W57nCgUTijzg4WD1Exf9pk++v48hg3q4WZDi5jEvv7U8MTVkW07oRSuERNIwr8uL27kWy4eop1p+dBim/mGPr6HtQ56JlixNW2gjYKlnUN0fDIaVgjgQXwW4lYeAgZbfuegTe9TWLZ/nELLJAdOWOUiqIiet4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784478532; c=relaxed/simple;
	bh=g8DskHYf+BqnI+8X4bE1TS+EqZMZVc3PTRFz8R6Zbtc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=e9h2PxIRv2nh5I9xlhfZBYNcfXq7JWdtQX61cxfIazJBfd71s6WqKcftYtb0exA6tn7KqQnV2sTJgr5rHUTve4DRscTYatlR1fQZ4gzHigOZd4C9Qj26SP+X0P6JFRgFEDuTPxh3rcPCyc+3/SxZed+D8eSqWBms1LGsCa8bDjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L6KOOBUi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L6KOOBUi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 043B41F000E9;
	Sun, 19 Jul 2026 16:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784478530;
	bh=78kleI3D2rvzkPlJB2ZHTHYRK78UhGyktGxalka5RZw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L6KOOBUi1EK8X2PCSGX+s1tAwBscrqaB2+6Nu3XucX7dRB/HCnjcCrqcJZaKiVtnY
	 RGR51MCzpwaV7YePhPxDWWvLTMyDTEeShKmS9O50Xs5989vYFyX1GNWzutU8yfWouy
	 QNNaUf4/YVY0dlzDA+LFZzRTHeajnJBjO1mAVMeoOka/YF3ms0wIsnQehV4NyUVMKN
	 XRPTjM1FHYYyjWncOJl8lOQyQP4amQhQjZib0vfi3y08eobKcsUcCdWibOSytY+fDv
	 EwThtJrxeJxoicuOcUO8+nBoCUeUQ7+MPNKZOS1f/FEBIFq8nuQtLZ8NDoA+fyZqOW
	 2u1jur5kayelw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] serial: imx: clear imx_uart_ports[] entry on probe
 failure and removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Karl Mehltretter" <kmehltretter@gmail.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260719160812.35407-5-kmehltretter@gmail.com>
References: <20260719160812.35407-1-kmehltretter@gmail.com>
 <20260719160812.35407-5-kmehltretter@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 19 Jul 2026 16:28:49 +0000
Message-Id: <20260719162850.043B41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Lockless updates to the global imx_uart_ports[] array leave a Time=
-Of-Check to Time-Of-Use (TOCTOU) race condition during concurrent sibling =
probes and removals, allowing a stale pointer to be used for console regist=
ration and causing a deferred NULL pointer dereference.

Pre-existing issues:
- [High] Missing hrtimer cancellation for RS485 tx timers during device rem=
oval and shutdown leads to a Use-After-Free of the sport structure.
--

--- Patch [4]: [PATCH 4/4] serial: imx: clear imx_uart_ports[] entry on pro=
be failure and removal ---
commit 85b874e619e770afd678fef4f09d60cd44a0c477
Author: Karl Mehltretter <kmehltretter@gmail.com>

serial: imx: clear imx_uart_ports[] entry on probe failure and removal

This commit clears the imx_uart_ports[] entry on probe failure and driver
removal. It prevents a stale pointer from being used by a sibling probe's
console setup during a devres free.

> diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
> index 251a50c8aa387..617c35772056c 100644
> --- a/drivers/tty/serial/imx.c
> +++ b/drivers/tty/serial/imx.c
> @@ -2637,6 +2637,8 @@ static int imx_uart_probe(struct platform_device *p=
dev)
>  	platform_set_drvdata(pdev, sport);
> =20
>  	ret =3D uart_add_one_port(&imx_uart_uart_driver, &sport->port);
> +	if (ret)
> +		imx_uart_ports[sport->port.line] =3D NULL;
> =20
>  err_clk:

[ ... ]

> @@ -2647,8 +2649,10 @@ static int imx_uart_probe(struct platform_device *=
pdev)
>  static void imx_uart_remove(struct platform_device *pdev)
>  {
>  	struct imx_port *sport =3D platform_get_drvdata(pdev);
> +	unsigned int line =3D sport->port.line;
> =20
>  	uart_remove_one_port(&imx_uart_uart_driver, &sport->port);
> +	imx_uart_ports[line] =3D NULL;

[Severity: High]
Does clearing imx_uart_ports[] after uart_remove_one_port() create a race
condition with concurrent sibling probes?

When uart_remove_one_port() returns, all locks (including console_list_lock
and port->mutex) have been dropped.

If Thread A unbinds the UART, it unregisters the console inside
uart_remove_one_port(), drops the locks, but has not yet executed the newly
added line to clear imx_uart_ports[line].

Concurrently, Thread B probing a sibling UART can see the console is
unregistered, and successfully register it. During registration, Thread B's
imx_uart_console_setup() locklessly reads the still-valid=20
imx_uart_ports[0].

When Thread A resumes, it clears imx_uart_ports[0] =3D NULL, and devres fre=
es
the port. A subsequent printk calls imx_uart_console_write_atomic(), which
reads the NULL pointer from the array and dereferences it.

>  }

[Severity: High]
This is a pre-existing issue, but does device removal fail to cancel RS485
tx timers, leading to a use-after-free?

During device unbind, imx_uart_shutdown() loops waiting for=20
tx_state !=3D OFF.

If the trigger_start_tx or trigger_stop_tx hrtimer is delayed or executing
concurrently, the loop times out, forcefully sets tx_state to OFF, and
returns without explicitly cancelling the timer using hrtimer_cancel().

Because imx_uart_remove() finishes without cancelling these driver-specific
hrtimers, devres will free the sport structure memory. If the delayed timer
subsequently fires, it will dereference the freed sport memory.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260719160812.3540=
7-1-kmehltretter@gmail.com?part=3D4
