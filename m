Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597C93E00A1
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 20:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785356938; cv=none; b=g4RJbMxcUhWEyNIAOrMLgvYep7LzXJn2SXbJ1Y2E3gueWCs4S1agUl/bXT2l0vBGBOFMWcSPumppNTyiAk5GnJqMg4pa1UQdQo4bf2WP24qbJX4qfctPFSPkqpo21TMWPfttYv9jRas5e4LYWB9DBSVO2Aepy2POs40zo3IsUFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785356938; c=relaxed/simple;
	bh=qh74R3DymMsPsyg/purggY65ZIauS60zdrlKSl4rVq4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kDm++FDz1fAsHUDGIbY5Xq/9A3qjGowbQie63vjI3mfx+zbvWMbFL0DtptiWHRe9w7+9+JLi0XHiu9mTEJy/uwOiJ4mIOFwKIZZWdGUhg4VHXV15qjBw/m0pakI19tFZcgexHe14/VymZweB6fPphcBWVf5HI0bNeLdjO+ldDnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GcRznubr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GcRznubr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7AC91F000E9;
	Wed, 29 Jul 2026 20:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785356936;
	bh=CMvcozLJGVaVH+Y0allXiXAJp1SA3KpdA+oqibu1nFU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GcRznubrSuqy58hd5nJ30BEsjo9MN/CvgR0IKbCTTrcHfPe3yJ966phBRmyTccVx+
	 lOKmLCft8WqKrg9f3EmUaAbj2nzbDx4Hxku+oOCpR8rr4vWZPd1Vy6FnetKIYmY2do
	 Mwbsrb9vKZACg2OUTdwNYJWJiVIEHsXxqGY7LVsAxhVH7J3BzB1o54xcqxmzZB6kCu
	 t7rAhFD+ywjsrjkPhRee8L0Quh2KlYqMkTerX8KSU7Z/3gXYny3qh+D+lUHsGnOxmZ
	 dbSrd4j2P6KDiaHRJ796I4MhWT3mjrwP1I9xNAP9jAdkgM24miu3IuW/OofhbKH8aZ
	 gbvOOBF5C8zgw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] irqchip: imx-irqsteer: Call pm_runtime_disable() on
 remove
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabio Estevam" <festevam@gmail.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260729201634.490317-1-festevam@gmail.com>
References: <20260729201634.490317-1-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 20:28:55 +0000
Message-Id: <20260729202855.B7AC91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] `imx_irqsteer_remove()` unconditionally calls `clk_disable_unprepa=
re()`, which causes a shared clock double-disable and underflow if the devi=
ce is already runtime-suspended.
- [High] The chained interrupt handler `imx_irqsteer_irq_handler()` accesse=
s memory-mapped registers without checking the runtime PM state, risking a =
system panic.
--

--- Patch [1]: [PATCH] irqchip: imx-irqsteer: Call pm_runtime_disable() on =
remove ---
commit 9f44afe2cbf39115bfc35bfc96ec7644902b8a9a
Author: Fabio Estevam <festevam@gmail.com>

irqchip: imx-irqsteer: Call pm_runtime_disable() on remove
   =20
imx_irqsteer_probe() enables runtime PM, but imx_irqsteer_remove()
does not disable it. This commit adds pm_runtime_disable() when
removing the device to prevent an unbalanced pm_runtime_enable.

Fixes: 4730d2233311 ("irqchip/imx-irqsteer: Add runtime PM support")
Signed-off-by: Fabio Estevam <festevam@gmail.com>

> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx=
-irqsteer.c
> index 87b07f517be35..a695ba31db9a2 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
> @@ -276,6 +276,8 @@ static void imx_irqsteer_remove(struct platform_devic=
e *pdev)
>  	struct irqsteer_data *irqsteer_data =3D platform_get_drvdata(pdev);
>  	int i;
> =20
> +	pm_runtime_disable(&pdev->dev);
> +

[Severity: High]
This isn't a bug introduced by this patch, but this sequence appears to cau=
se
a double-disable of the clock if the device is already runtime-suspended.

If the device is in RPM_SUSPENDED state when unbound via sysfs,
pm_runtime_disable() locks the PM state without resuming the device.

The clk_disable_unprepare() call at the end of imx_irqsteer_remove() is then
executed unconditionally:

drivers/irqchip/irq-imx-irqsteer.c:imx_irqsteer_remove() {
	...
	pm_runtime_disable(&pdev->dev);
	...
	clk_disable_unprepare(irqsteer_data->ipg_clk);
}

Could this decrease the clock enable count twice for a single prepare/enable
pair, stealing references from other active peripherals on the same bus?


[Severity: High]
This is a pre-existing issue, but the chained interrupt handler appears to
access memory-mapped registers without checking the runtime PM state.

If no child interrupts are requested, the device's PM usage count drops to =
0,
disabling ipg_clk.

If a spurious interrupt arrives on the parent line,
imx_irqsteer_irq_handler() unconditionally accesses the registers:

drivers/irqchip/irq-imx-irqsteer.c:imx_irqsteer_irq_handler() {
	...
	irqmap =3D readl_relaxed(data->regs +
			       CHANSTATUS(idx, data->reg_num));
	...
}

Accessing these registers with ipg_clk disabled can cause a synchronous
external abort.

Should this handler check the PM state using pm_runtime_get_if_active()
before accessing the hardware?

>  	for (i =3D 0; i < irqsteer_data->irq_count; i++) {
>  		if (!irqsteer_data->irq[i])
>  			break;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729201634.4903=
17-1-festevam@gmail.com?part=3D1
