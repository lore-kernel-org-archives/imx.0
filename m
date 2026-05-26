Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC57D3B52FE
	for <imx@lists.linux.dev>; Tue, 26 May 2026 07:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779779148; cv=none; b=OelyP6I40QW34r94ITgRDdP/KhxW1FEhDr/C0/JTuSooUQ5Id4qpG3LaxuefMJQZQPcANY1DMkqc085/jasGw6SglyDOHzeHMtREcbGnCjPa+HVrnMwlyBcZpUGriPvPcPp3aXhdadw0G3OUUKnes38XGUS4f9N+OZBLCPtfrak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779779148; c=relaxed/simple;
	bh=hpPaxKrNvBu3IrZmweV5kRdrj8nS24T6X96eo3Eol8A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ql1qXaeLjvp1oj3WXK8psEiVedrBjdONub8LYJkCnbOnSY1G+co7snGtOIV5pIJplxIGRG3aIOVUsc4hi6bGIMK5SWkEKb3tmviZrIB6Pb/RoMrMEGBaEH2eu39G5OSFYXLQuBRl/NTWPncjvN+WqYI9WKoeFG846JTGdxQzoEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qhjaid8d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qhjaid8d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 255661F000E9;
	Tue, 26 May 2026 07:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779779147;
	bh=eq9cHvcf0T1LxKNQ2dkCmuO5KRC0hQwPFMNoFX+67v0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qhjaid8dMRoQqON0XbWeTnFVwjk4c0JDGPSPZDRBt7IzxAAxwc2aHPMuzTcQTlCtX
	 PPZDjINZQrAO3Wx7JoAmzBbxHTQNeUXaB01+VPxwShzp6SK+CEvFWfkJwsEULIX9Kz
	 Mg9UJEy5TPhGdqRCzAKAy0Lyhmev0jLHDERQeORQ0LzRJtnmdrPlvg6pq0m7d1mQOP
	 A9X4/AfQh/jKP4f90DNlmmqHym5/y/vEBife/4XMtX2LDvc+bdRudlTbIv2Ji+sz2l
	 UY6tAJF4PegbrhCIzQHXmh0Ux0coXJYgYxN5zTPuLbDUnMAevHRtmw+GOj4wi+CdaZ
	 /Jrq7JZl1wL8g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] gpio: mxc: fix irq_high handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Stein" <alexander.stein@ew.tq-group.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260526063504.25916-1-alexander.stein@ew.tq-group.com>
References: <20260526063504.25916-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 May 2026 07:05:46 +0000
Message-Id: <20260526070547.255661F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Probe error paths fail to unregister the chained IRQ handlers, lea=
ding to a Use-After-Free when the parent interrupt fires.
- [High] Runtime PM unconditionally unregisters a shared parent IRQ, breaki=
ng interrupts for all other active GPIO ports on i.MX21/i.MX27.
- [High] Concurrent lockless list modification and traversal on `mxc_gpio_p=
orts` causes a data race, leading to list corruption or crashes.
- [Medium] Concurrent modifications to `port->wakeup_pads` in `gpio_set_wak=
e_irq()` are not protected by a lock, and the internal state becomes corrup=
ted if `enable_irq_wake()` fails.
--

commit a1e048afd51baad3a6f2896a7cc95c6e72037208
Author: Alexander Stein <alexander.stein@ew.tq-group.com>

gpio: mxc: fix irq_high handling

If port->irq_high is -1 (fsl,imx21-gpio compatible) and gpio_idx is >=3D 16
enable_irq_wake() is called with -1 which is wrong.

> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 647b6f4861b74..12f11a6c96653 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -469,7 +469,7 @@ static int mxc_gpio_probe(struct platform_device *pde=
v)
>  		 * the handler is needed only once, but doing it for every port
>  		 * is more robust and easier.
>  		 */
> -		port->irq_high =3D -1;
> +		port->irq_high =3D 0;
>  		port->mx_irq_handler =3D mx2_gpio_irq_handler;
>  	} else
>  		port->mx_irq_handler =3D mx3_gpio_irq_handler;

[Severity: High]
This is a pre-existing issue, but do the error paths in mxc_gpio_probe()
need to unregister the chained IRQ handler?

If any initialization step fails after mxc_update_irq_chained_handler() is
called, the probe function jumps to the error labels and returns an error
code. Because the port is managed via devm_kzalloc(), the driver core frees
the memory on error.

If a parent interrupt triggers later, will the kernel attempt to execute
the chained handler using the freed port memory?

[Severity: High]
This is a pre-existing issue, but does runtime PM handle the shared parent
IRQ safely for fsl,imx21-gpio compatible devices?

When any single GPIO port enters runtime suspend,
mxc_gpio_runtime_suspend() invokes
mxc_update_irq_chained_handler(port, false), which overwrites the shared
IRQ descriptor's handler with NULL.

If one port enters runtime suspend while other ports remain active, will
all other active GPIO ports sharing the same parent IRQ lose their
interrupt handler and stop receiving interrupts?

[Severity: High]
This is a pre-existing issue, but is it safe to modify mxc_gpio_ports
without a lock during mxc_gpio_probe()?

In mxc_gpio_probe(), new ports are added via list_add_tail() without
holding a spinlock. mxc_update_irq_chained_handler() is called before
list_add_tail(), enabling the parent IRQ.

If an interrupt fires for an already-probed port on another CPU during
this time, could mx2_gpio_irq_handler() perform a lockless
list_for_each_entry() traverse over a mutating list and crash?

[Severity: Medium]
This is a pre-existing issue, but does gpio_set_wake_irq() need
protection against concurrent modifications to port->wakeup_pads?

The shared bitmask port->wakeup_pads is modified using non-atomic
operations. Since different child IRQs have different descriptor locks,
if irq_set_irq_wake() is called concurrently on two different GPIOs on
the same port, could the read-modify-write operations race and lose
updates?

Additionally, port->wakeup_pads is updated before checking if
enable_irq_wake() returns an error. If the parent IRQ controller
rejects the wake request, does the bit remain set permanently?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526063504.2591=
6-1-alexander.stein@ew.tq-group.com?part=3D1
