Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB7B43933A
	for <imx@lists.linux.dev>; Wed, 19 Aug 2026 09:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787131508; cv=none; b=nJNhMc2K/flRjdxKwXybV0vXrweugbPgJkkt1vGVB0rvZE1HkM6BtA8vj41k1eGOHGektpT9FI29iXk60EhzTsBNWICZ3AgHcxQ8xliUM6m982oJxYpcNoDhAJBkWsQxGpoVOtRtWU8OD4gNpFdvk7sqAF735SGpbgSxsApZu8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787131508; c=relaxed/simple;
	bh=SzZeu+IAq7ZcxKCZTPV6NeLE5B7tLmx6mDnuEOCr9DM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XODqGEmW2QGuPID4uuYb/ZOu+4Kda1VKdDCBIIF03wkXygib56IOy7l+VJqh1uDHDSMINQipFTABOT/qw4072eVjLNZqZbwSpLsMcDiDLhV28HjjcUq5AG3MTuQVON5tZuusYSr4kLDGvA9CbGnajZAScLz5CiMe/WiSLBQDhCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f2fD0ZLN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f2fD0ZLN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 832631F000E9;
	Wed, 19 Aug 2026 09:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787131506;
	bh=IZnGGw26lXrXWyQyvfxlqIqz2TYvppkULNk9z/yQ6vo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f2fD0ZLNJJcjAB/urR6/XGUBu9pszTwCOOAzl6/6F0Vfwbw9OeJw92knnaq++fL/e
	 Agdmhp/YG3fWSrE4gLb1BeGGLtaEcCx6clo3eOmLQtlWfgEKrGj47oJAoDXHgy2QTM
	 gMkjBVr0UWFJP7bvsyH4AHfdIFV/2G5uwKw9nh/dbC+lDahicyEYerI1Qog2c3LH5a
	 6XUEMuZQUc0J1+lFEabA6Gju1YGgGWcDEHeHp++QQmN1d7IC3tu6oMQtD+KWTK89vp
	 dawB1f/tyi6xL411nZ7FCTzc5Sx+KnSFkY4fgh67ogTs6nSQk1WZGbzVdx7f5gj/eN
	 1ZBx8I2xqjYvQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/5] irqchip/imx-irqsteer: Mask all interrupts in
 probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: Zhipeng.wang_1@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260819090543.585131-5-Zhipeng.wang_1@oss.nxp.com>
References: <20260819090543.585131-1-Zhipeng.wang_1@oss.nxp.com>
 <20260819090543.585131-5-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 09:25:06 +0000
Message-Id: <20260819092506.832631F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The patch introduces an unvalidated loop that performs out-of-boun=
ds MMIO writes if an excessively large `fsl,num-irqs` value is provided.

Pre-existing issues:
- [High] Missing Runtime PM cleanup causes unbalanced clock disable and pot=
ential external abort on device unbind.
- [High] Missing synchronization with chained parent IRQ handler in `remove=
()` leading to potential external abort.
--

--- Patch [4]: [PATCH v4 4/5] irqchip/imx-irqsteer: Mask all interrupts in =
probe() ---
commit ecdadc89363972642c46a3ef5443dd52db1ecece
Author: Zhipeng Wang <zhipeng.wang_1@nxp.com>

irqchip/imx-irqsteer: Mask all interrupts in probe()

probe() sets up the chained handlers without first masking the input
interrupts. Mask all interrupts in probe() before wiring up the chained
handlers to prevent storms from stale asserted lines.

> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx=
-irqsteer.c
> index 320082d3a6325..a9909ecb6fef7 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
> @@ -236,6 +236,14 @@ static int imx_irqsteer_probe(struct platform_device=
 *pdev)
>  	if (irqsteer_has_chanctrl(data->devtype_data))
>  		writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
> =20
> +	/*
> +	 * Mask all interrupts before wiring up the chained handlers. CHANMASK
> +	 * has inverted polarity (a set bit enables the interrupt), so writing
> +	 * zero masks the source.
> +	 */
> +	for (i =3D 0; i < data->reg_num; i++)
> +		writel_relaxed(0, data->regs + CHANMASK(i, data->reg_num));
> +

[Severity: High]
Can this loop perform out-of-bounds MMIO writes?

If a large value is provided for "fsl,num-irqs" in the device tree,
data->reg_num could be oversized. The bounds check for the maximum
number of interrupts happens later in the function:

	if (!data->irq_count || data->irq_count > CHAN_MAX_OUTPUT_INT) {
		ret =3D -EINVAL;
		goto out;
	}

Since this validation executes after the new loop, an oversized value
would cause out-of-bounds writes to data->regs before being caught.

Could the validation check be moved before this loop?

[ ... ]

While reviewing this file, I also noticed a couple of pre-existing issues in
imx_irqsteer_remove().

drivers/irqchip/irq-imx-irqsteer.c:imx_irqsteer_remove() {
...
	for (i =3D 0; i < irqsteer_data->irq_count; i++) {
		irq_set_chained_handler_and_data(irqsteer_data->irq[i],
						 NULL, NULL);
		irq_dispose_mapping(irqsteer_data->irq[i]);
	}

	clk_disable_unprepare(irqsteer_data->ipg_clk);
...
}

[Severity: High]
This isn't a bug introduced by this patch, but can clearing the chained
handler here race with an executing handler and cause an external abort?

Chained handlers bypass desc->lock and do not set IRQS_INPROGRESS, so there
is no natural synchronization when irq_set_chained_handler_and_data() is
called.

If a parent interrupt fires right before the handler is cleared, the chained
handler might be running concurrently:

drivers/irqchip/irq-imx-irqsteer.c:imx_irqsteer_irq_handler() {
...
	irqmap =3D readl_relaxed(data->regs +
			       CHANSTATUS(idx, data->reg_num));
...
}

If imx_irqsteer_remove() proceeds to disable the hardware clock while the
handler is still reading the CHANSTATUS MMIO registers, it could crash the
system. Is there a way to synchronize with the executing handler before
disabling the clock?


[Severity: High]
This is a pre-existing issue, but does imx_irqsteer_remove() miss PM
runtime cleanup, leading to an unbalanced clock disable?

The function unconditionally disables the clock with clk_disable_unprepare(=
),
but fails to call pm_runtime_disable(). If the device is unbound via sysfs,
the driver core calls pm_runtime_put_sync(), which executes
imx_irqsteer_suspend() and disables the clock:

drivers/irqchip/irq-imx-irqsteer.c:imx_irqsteer_suspend() {
...
	imx_irqsteer_save_regs(irqsteer_data);
	clk_disable_unprepare(irqsteer_data->ipg_clk);
}

Then imx_irqsteer_remove() unconditionally disables the clock again, causing
an unbalanced WARN.

Alternatively, if pm_runtime_put_sync() does not immediately suspend the
device, imx_irqsteer_remove() disables the clock but leaves the device acti=
ve
in PM runtime. A later suspend would call imx_irqsteer_suspend(), which tri=
es
to access hardware registers with the clock already gated, crashing the sys=
tem.

Should pm_runtime_disable() be called in remove()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819090543.5851=
31-1-Zhipeng.wang_1@oss.nxp.com?part=3D4
