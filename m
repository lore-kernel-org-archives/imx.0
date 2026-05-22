Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39753FF1
	for <imx@lists.linux.dev>; Fri, 22 May 2026 07:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779435045; cv=none; b=qSs02/W0pzvwFQCyh+VGy1PBWcnZ+8aLixUP4ItEEup9kDj11IibTTcBGdSHnoSzcLM5hXjViq8E4pqMhqDdXSXDD3yGKeZbykuSyfWOpmRq93qg7qUVnjCN8Znt+2o9abDlUP+QESKxCcuI/Y/JIE8S8RJja7+QJQCzlmc690Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779435045; c=relaxed/simple;
	bh=HNC8kc94IUddRXQpToDDWnk38d8N33E1RmaUtXGbOag=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ORC4IH+5hWeX5bRmTk0zAgcLCjFaiskeBw1WqZ/2ArVtlD4YWTXkD5XkLxhkhkFBHdR75O1EIjd30ywp6Ylht5sWh+OvQgUZJgz5Uuj2U2kpoOC7andtAV/DgI6rJt7PcG5mWJie8ZyCz7SHJHBqzTKkI2/EOtX6uVe2Mg7PIRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JEKw6uEf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JEKw6uEf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 544681F000E9;
	Fri, 22 May 2026 07:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779435044;
	bh=1toLHP9m3cvap0WePRFyven1njwhAVogT3DWCq8xQK4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JEKw6uEfqQij2LVf1tuE+lnl/Qk9HHYhabd2fRFKXYyOoqhGDmX4/5sVqEY+mWrGm
	 rRYR6WTEgqC7Bt09IsZRwqgvdN6UVpwnUFfIM2mamE2+YlcMovkO4zzi/FVwxaPZT+
	 ki5J79O8psYhsOSHRHQ5iCFxxy/dy3LuWmEpQ6nmtJM6mFrg8gsBRcU7hhIDvGNrSQ
	 3LpJzX59PGzjwN7YBCf5KYJ2gbzUHQTPkDXJYL/1VGSmWN5QIfld5icpPsTQ0m7aXo
	 /9d/jGo2Hgc2aeU18ZshoWvewXKzA69Anult8wxvhnnyDT5Ky2k+FYYMFhcabR/aJn
	 iTJ41qp0/Wf0Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] gpio: mxc: fix irq_high handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Stein" <alexander.stein@ew.tq-group.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260522070118.800671-1-alexander.stein@ew.tq-group.com>
References: <20260522070118.800671-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 07:30:43 +0000
Message-Id: <20260522073044.544681F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing teardown of the chained IRQ handler in the `mxc_gpio_probe=
()` error path leads to a Use-After-Free vulnerability.
- [High] Calling `clk_prepare_enable()` during `syscore_ops.suspend` violat=
es atomic context requirements.
- [High] In `mxc_gpio_runtime_resume()`, the chained IRQ handler is hooked =
before the GPIO clock is enabled, risking unclocked register access.
- [High] In `mxc_gpio_runtime_suspend()`, the GPIO clock is disabled before=
 the chained IRQ handler is unhooked, risking unclocked register access.
- [High] `mx2_gpio_irq_handler` iterates over all GPIO ports and reads thei=
r registers unconditionally without checking their runtime PM or clock stat=
e.
--

commit 6fc21eff5d34d702cba087494eeb1fa0e1234c1e
Author: Alexander Stein <alexander.stein@ew.tq-group.com>

gpio: mxc: fix irq_high handling

This commit fixes an issue where enable_irq_wake() is incorrectly called
with a negative value when port irq_high is -1 and gpio_idx is >=3D 16.
It resolves this by initializing irq_high to 0 for the fsl,imx21-gpio
compatible.

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

[Severity: High]
This is a pre-existing issue, but does the error path in mxc_gpio_probe()
properly tear down the chained IRQ handler?

If a subsequent initialization step fails, such as gpio_generic_chip_init()
or devm_irq_alloc_descs(), the error path does not appear to call
mxc_update_irq_chained_handler(port, false) to unhook it.

Since the port pointer is managed by devres and gets freed upon returning
the error, could a subsequent parent interrupt cause a use-after-free when
the IRQ core executes the handler and dereferences the freed port pointer?

[Severity: High]
This is a pre-existing issue, but is it safe for mx2_gpio_irq_handler()
to iterate over all GPIO ports without checking their runtime PM or clock
state?

The handler iterates through the global mxc_gpio_ports list and reads the
GPIO_IMR and GPIO_ISR registers for every port.

If a port is suspended and its clock is disabled, wouldn't attempting
to read its registers violate hardware constraints and potentially trigger
a bus fault?

>  	} else
>  		port->mx_irq_handler =3D mx3_gpio_irq_handler;

[Severity: High]
This is a pre-existing issue, but does mxc_gpio_runtime_resume() risk
accessing unclocked registers?

It calls mxc_update_irq_chained_handler(port, true) to hook the parent IRQ
handler before calling clk_prepare_enable(port->clk).

If an interrupt fires in this window, could the handler execute and
attempt to read device registers while the hardware clock is still
disabled?

[Severity: High]
This is a pre-existing issue, but there appears to be a similar race in
mxc_gpio_runtime_suspend().

The hardware clock is disabled via clk_disable_unprepare(port->clk) before
mxc_update_irq_chained_handler(port, false) unregisters the handler.

If a pending parent interrupt fires between these two calls, could the
active IRQ handler access the hardware registers without an active clock?

[Severity: High]
This is a pre-existing issue, but does mxc_gpio_syscore_suspend() violate
atomic context rules?

It executes in the late stages of system suspend where only one CPU is
online and local interrupts are hard-disabled. By calling
clk_prepare_enable(port->clk), it internally calls clk_prepare() which
takes the global prepare_lock mutex and includes a might_sleep() check.

Could this sleeping or mutex locking in an atomic context cause deadlocks
or trigger warnings?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522070118.8006=
71-1-alexander.stein@ew.tq-group.com?part=3D1
