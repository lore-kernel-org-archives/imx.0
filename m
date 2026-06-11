Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F98306746
	for <imx@lists.linux.dev>; Thu, 11 Jun 2026 03:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781149802; cv=none; b=aUoQzVoXEVstETZa7U1WVwt622n5flySE5RNBEyDOLUzTGdsUCd+m2u+NCJZn0uZ7CGOpE4682MHL3zSwd0N4rZEEqDlJrTStRLwnSCDW1YwP7mBxtu+MKrP5pRWggSIYbmMuR4bf5qVEuXNwtNHeZlKVA2VjxcW2mCzuQ6zZ5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781149802; c=relaxed/simple;
	bh=c6KWylcHvUOHPWCNXPGtFoKPwQNEHgZzwX2J+7rVP3s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dsndmTn64qXJQtzwHB6qOc3ssq4yOQXzgfulzzx0obGOEqi0/lBAgkGn6KcaiIJBZlVSF08Q83MeuOCeoFPWaNh85k6p+3C8C8vXFKAyZ9aLnwd25ah1pcqJn2j3rE2n8XHEuEVLA/uSup7TiZ/hIQk1RKarfSVeBHCMD718ui0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N6d62ebx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N6d62ebx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB561F00893;
	Thu, 11 Jun 2026 03:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781149801;
	bh=ypFKEl9mgF4FT61siwnH+h8fAsqghQN4EuPGSwJadXw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N6d62ebxkauNWKXeqXvZ4zENnuTeR3JMyI60ds7sVSnRlxGi5BK4AoP5WdcAM0rH9
	 LtMdCBUMRfwnofJZGtGKuwZYKCR3cvVWFI4ozUpzhzbv1OwFj1s/AdVtxRKOaKIUsi
	 wIRWuT3jH2h85ZP413BHCmTz0pJgXw/fMu544cA+uT0IBkpP2P/Pizz8KHfk1eC4KU
	 J5Q6zXkeeZONSqlsSKZvLRq1g/4Lf/pfb8jNAsUTAG0gcoopNfZcchSBp1XdwOaj5X
	 /WQxozTDWNWVdHl0ZCaLUj3nltYJ1HZIMmuwO1Q4+vQSgJ/UxrbFRM/ey73lKEOKai
	 XLeN9hSPuZWUw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv3 1/6] serial: mxs-auart: fix cast type for
 of_device_get_match_data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260611033856.6476-2-rosenp@gmail.com>
References: <20260611033856.6476-2-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 03:50:00 +0000
Message-Id: <20260611035001.0EB561F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Out-of-bounds array access on probe error and driver remove paths.
- [High] NULL pointer dereference and uninitialized spinlock access due to =
early IRQ request.
--

commit f0caca84ea6688e77479d143060974cd96b52b46
Author: Rosen Penev <rosenp@gmail.com>

serial: mxs-auart: fix cast type for of_device_get_match_data

of_device_get_match_data returns const void*. Cast to unsigned long to
avoid implicit integer truncation warnings. All the data parameters are
correct anyway.

> diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auar=
t.c
> --- a/drivers/tty/serial/mxs-auart.c
> +++ b/drivers/tty/serial/mxs-auart.c
> @@ -1598,7 +1598,7 @@ static int mxs_auart_probe(struct platform_device *=
pdev)
>  		return -EINVAL;
>  	}
> =20
> -	s->devtype =3D (enum mxs_auart_type)of_device_get_match_data(&pdev->dev=
);
> +	s->devtype =3D (unsigned long)of_device_get_match_data(&pdev->dev);
> =20
>  	ret =3D mxs_get_clks(s, pdev);
>  	if (ret)

[Severity: High]
This is a pre-existing issue, but I noticed a potential out-of-bounds array
access on the probe error and driver remove paths in mxs_auart_probe().

For Device Tree-probed devices, pdev->id is typically set to -1. The logical
port number is correctly retrieved via of_alias_get_id() and stored in
s->port.line, and the driver instance is registered in the array using:

    auart_port[s->port.line] =3D s;

However, on the probe error path, the driver uses pdev->id to clear the arr=
ay:

out_free_qpio_irq:
    mxs_auart_free_gpio_irq(s);
    auart_port[pdev->id] =3D NULL;

Would this write NULL to auart_port[-1], silently corrupting adjacent memory
located before the auart_port array?

[Severity: High]
This is also a pre-existing issue, but does this function register the IRQ
handler too early?

In mxs_auart_probe(), devm_request_irq() is called before the hardware is
fully reset and before uart_add_one_port() registers the port:

    ret =3D devm_request_irq(&pdev->dev, irq, mxs_auart_irq_handle, 0,
                           dev_name(&pdev->dev), s);

If the bootloader leaves the UART hardware with interrupts enabled and
pending, could the interrupt handler fire immediately upon registration?

If it fires early, the handler attempts to lock s->port.lock, which is
uninitialized at this stage, and then calls mxs_auart_rx_chars() which push=
es
to the buffer:

    tty_flip_buffer_push(&s->port.state->port);

Since s->port.state is only allocated later during uart_add_one_port(),
would this result in a NULL pointer dereference?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611033856.6476=
-2-rosenp@gmail.com?part=3D1
