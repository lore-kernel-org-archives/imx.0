Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63859282F1E
	for <imx@lists.linux.dev>; Wed, 19 Aug 2026 02:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787106941; cv=none; b=vDRUDoka0c6jdRrKcry1KuiWhYf/W78hZoFc4vpkJzGLEoC2kJx9IQ0Md5eYB0qBYxM5EXlTpKIUmGT21FmHlyPd6kHSdVDGTmfEB3c9fAYcrnAQJgDLoN02aVay0NGGqjshNmXBZOLXwWJun5TRYOJESNqF6cqAQk+msHlXLyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787106941; c=relaxed/simple;
	bh=PDMz+Awr5mVU764bcCM43i5i/kp6LKHqzmbxMOLso7o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JiubgMgHPt7rIDTfnoUSH5J/HqhwPDANShKwbsbbmBtlQ9Xi+EC/ewLn3qYvj9JRfWdFtIpN3fJ0QDsdZ29ftShnDTWC+i/Aw3mpp4Y+xNj6VGHB7SRftzFJ/7W5/Vcbw2CSs5LeNtEPaHBA3sbJq378nxhm+Xk3Fq1F+PPnoPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ip5hr8lX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ip5hr8lX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2478E1F000E9;
	Wed, 19 Aug 2026 02:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787106939;
	bh=k8c3xlJF1di+1tl+S1+TuAa5ZBqUVPX6hMCWf/Qfu4A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ip5hr8lXn7h5act42QM6RYOpRDTft1Je4v+C5ZFjgBpfBXluZATZf1OBzWs7GUOL/
	 L1usR6ftS84z89QkobopfztoZlmqscpV1S9wbre125xSsnWgdxJDnSdaDfV0ERYYXc
	 6BPClcfYBa1Wt3pFsOTf7k++/U2mpSAMAsMB/bYRclBVcB1y81CX/zMRsQLSL0kgBR
	 h46oTU25qkkKTzSDKju7NSnMuv3xaq4/GGwVxJZyI+Hf4dtJSJZ5fQp5oh2YB4FzSC
	 bj24DZq7VXo+uLyTGscIr/FUtGt8waCTbjQ749f92GDB3EEQYHmIz8wIlGEs1GZKMG
	 kNEE72JKJyicw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] serial: imx: cancel RS485 trigger hrtimers in shutdown
 and remove
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fan Wu" <fanwu01@zju.edu.cn>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260819021916.442827-1-fanwu01@zju.edu.cn>
References: <20260819021916.442827-1-fanwu01@zju.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 02:35:38 +0000
Message-Id: <20260819023539.2478E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing cancellation of `sport->timer` and modem status GPIO IRQs =
in `imx_uart_remove()` leads to a use-after-free and system crash (bus faul=
t) for console ports.
--

--- Patch [1]: [PATCH] serial: imx: cancel RS485 trigger hrtimers in shutdo=
wn and remove ---
commit 00c3fef931cf8afdbbbb1c6e8dc49797a632d082
Author: Fan Wu <fanwu01@zju.edu.cn>

serial: imx: cancel RS485 trigger hrtimers in shutdown and remove

This commit cancels the RS485 trigger hrtimers synchronously in
imx_uart_shutdown() and imx_uart_remove() to prevent use-after-free
after the devm-allocated port is freed.

> diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
> index 251a50c8aa387..86c99f73c50a3 100644
> --- a/drivers/tty/serial/imx.c
> +++ b/drivers/tty/serial/imx.c

[ ... ]

> @@ -2649,6 +2653,10 @@ static void imx_uart_remove(struct platform_device=
 *pdev)
>  	struct imx_port *sport =3D platform_get_drvdata(pdev);
> =20
>  	uart_remove_one_port(&imx_uart_uart_driver, &sport->port);
> +
> +	/* Serial core can reach remove() without calling the driver shutdown. =
*/
> +	hrtimer_cancel(&sport->trigger_start_tx);
> +	hrtimer_cancel(&sport->trigger_stop_tx);

[Severity: High]
This is a pre-existing issue, but since we are cancelling timers in
imx_uart_remove(), does this function also need to cancel sport->timer and
disable the modem status GPIO IRQs?

If the system boots with hardware flow control enabled on the console,
imx_uart_console_setup() sets termios, which calls imx_uart_enable_ms() and
arms sport->timer.

If the driver is unbound via sysfs or the module is unloaded,
imx_uart_remove() unregisters the console, disabling the UART clocks.
However, it does not cancel sport->timer or disable the MS GPIO interrupts.

When devres frees the imx_port structure, the timer can still fire:

drivers/tty/serial/imx.c:imx_uart_timeout() {
        struct imx_port *sport =3D timer_container_of(sport, t, timer);
        unsigned long flags;

        if (sport->port.state) {
                uart_port_lock_irqsave(&sport->port, &flags);
                imx_uart_mctrl_check(sport);
                uart_port_unlock_irqrestore(&sport->port, flags);

                mod_timer(&sport->timer, jiffies + MCTRL_TIMEOUT);
        }
}

Could this lead to accessing the freed sport struct and reading disabled
UART registers, resulting in a use-after-free and system crash?

>  }
> =20
>  static void imx_uart_restore_context(struct imx_port *sport)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819021916.4428=
27-1-fanwu01@zju.edu.cn?part=3D1
