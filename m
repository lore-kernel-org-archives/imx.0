Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B9D2772D
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 14:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497070; cv=none; b=C/87wDdkrLwUmuMTpG9dtxHXZzb7O5gIEp8JmK8aAeazLhbd02vmxxcIHgr3NlLI18TF4WIunBncDL5fydfmGPodpyJ1ajwLHSxW+8T70q5VHDUfHmhjRON4woUbdWBcODpC8LtkomcWipPlU1Dc4A0aUjeLrWzmwakiYphNqRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497070; c=relaxed/simple;
	bh=pPvdA86tedYqC00FVfCtyKkchHNXCUabtG+MXoF8m6I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aCsReFAb4ch3/ZQnbDqI03hHJ18RvLR5LBY7fgwNtS1hm4JZrXD+TjuuazsDPZ5mSQBJpU90ClfxQMtmp7CNPGjhpJJRyYpGS53FR2pXUuR+bElhcHEuNMnhMlSilE31OgMsDDJwvwriRvHXYt1r/AJmaLD54XENUJaqqvNu14o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FlxsoDy7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FlxsoDy7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19A6F1F00893;
	Wed,  3 Jun 2026 14:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780497069;
	bh=75D9CWsoar8uzGFEm1VKW5IVg/+Ojy3ZeN56fR62HbM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FlxsoDy7BHwuGhxvGds+qciReKWrv03sK2FAp6TjfKjDOswLmTaJsWxB/LB6g0PYe
	 SjqJz2jiPLW2DgJl15i4qPIBTPIhx1G0pGFBtTPJb63ravu6OxSGzs7pbXAAu6AT17
	 QgKT/aK8XgdvC9UQODcAGrNBBL7Ys0tGhoU95+YhYhzQU7XPLlIMTu27WDLpzgnJnK
	 rXlWcXBJFQRlNARyZ8tu/KzltybO41XzAJD3kEBUkIW4jQVOJEfjLRdRz9hhzbdsa8
	 +5y5I6pJ5fBsZlUbUJUfHnK1qX7NXqslnj/390lrCp9sJmL2946MuY5gVb0OalKf0N
	 5YNzYrYexoq/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 8/9] mailbox: imx: Don't force-thread the primary
 handler
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260603-imx_mbox_rproc-v2-8-a0059dc3b69a@linutronix.de>
References: <20260603-imx_mbox_rproc-v2-8-a0059dc3b69a@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 14:31:08 +0000
Message-Id: <20260603143109.19A6F1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Medium] Double disable of priv->clk on devm_mbox_controller_register() f=
ailure.

Pre-existing issues:
- [High] Unchecked return value of pm_runtime_get_sync() leads to kernel pa=
nic.
- [High] Silent transmission failure due to ignored timeout error in imx_mu=
_generic_tx().
- [High] Polling jiffies and using time APIs with local interrupts disabled=
 leads to hard lockups.
--

commit 91fcad059338175baa26f9a301cda6d0b62ba3ee
Author: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

mailbox: imx: Don't force-thread the primary handler

This commit avoids force-threading the primary interrupt handler in the
IMX mailbox driver. It converts the xcr_lock to a raw_spinlock_t so the
primary handler can safely run in hardirq context, and marks the interrupt
with IRQF_NO_THREAD.

> diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
> index f0a14449652f1..f3de47908e00f 100644
> --- a/drivers/mailbox/imx-mailbox.c
> +++ b/drivers/mailbox/imx-mailbox.c

[ ... ]

> @@ -649,7 +644,7 @@ static int imx_mu_startup(struct mbox_chan *chan)
>  {
>  	struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
>  	struct imx_mu_con_priv *cp =3D chan->con_priv;
> -	unsigned long irq_flag =3D 0;
> +	unsigned long irq_flag =3D IRQF_NO_THREAD;
>  	int ret;
> =20
>  	pm_runtime_get_sync(priv->dev);

[Severity: High]
This is a pre-existing issue, but does this missing check for the return
value of pm_runtime_get_sync() risk a kernel panic?

If the device fails to resume (e.g., due to a clock enablement failure),
it remains in a suspended/unpowered state.

The function immediately proceeds to configure the device and access its
I/O registers. Accessing unpowered hardware registers can cause system
crashes, such as synchronous external aborts or bus hangs, on ARM platforms.

[ ... ]

While reviewing the driver, I noticed a few other potential regressions out=
side
the diff hunks above:

[Severity: High]
This is a pre-existing issue, but can the timeout loop in imx_mu_generic_tx=
()
lead to silent transmission failures?

When processing IMX_MU_TYPE_TXDB_V2, the code loops up to 10 times waiting
for the readl_poll_timeout() condition:

drivers/mailbox/imx-mailbox.c:imx_mu_generic_tx() {
    ...
    while (ret && (count < 10)) {
        ret =3D readl_poll_timeout(priv->base + priv->dcfg->xCR[IMX_MU_GCR]=
, val,
                                 !(val & IMX_MU_xCR_GIRn(priv->dcfg->type, =
cp->idx)),
                                 0, 10000);
        if (ret) {
            dev_warn_ratelimited(...);
        }
    }
    break;
    ...
}

If all 10 attempts time out, ret is left as -ETIMEDOUT and the while loop
exits. The code then breaks from the switch block and unconditionally hits
return 0 at the end of the function instead of returning ret.

Falsely returning success causes the mailbox framework to drop the message,
leading to silent data loss. Should this return the error code instead?

[Severity: Medium]
Is there a double disable of priv->clk if devm_mbox_controller_register()
fails?

In imx_mu_probe(), the clock is manually disabled via clk_disable_unprepare=
()
after successfully syncing the PM runtime state:

drivers/mailbox/imx-mailbox.c:imx_mu_probe() {
    ...
    clk_disable_unprepare(priv->clk);

    ret =3D devm_mbox_controller_register(dev, &priv->mbox);
    if (ret)
        goto disable_clk;
    ...
disable_clk:
    clk_disable_unprepare(priv->clk);
    return ret;
}

If devm_mbox_controller_register() fails, the code branches to disable_clk,
which executes clk_disable_unprepare(priv->clk) a second time. This double
disable unbalances the clock reference count and triggers a kernel warning.

[Severity: High]
This is a pre-existing issue, but does the use of time APIs and polling
with local interrupts disabled lead to hard lockups?

Mailbox transmission (priv->dcfg->tx) is invoked via mbox_send_message()
with the channel lock (spin_lock_irqsave) held, meaning local interrupts
are disabled.

Inside imx_mu_tx_waiting_write(), the code polls a hardware register while
checking time_is_after_jiffies64():

drivers/mailbox/imx-mailbox.c:imx_mu_tx_waiting_write() {
    ...
    do {
        status =3D imx_mu_read(priv, priv->dcfg->xSR[IMX_MU_TSR]);
        can_write =3D status & IMX_MU_xSR_TEn(priv->dcfg->type, idx % 4);
    } while (!can_write && time_is_after_jiffies64(timeout_time));
    ...
}

Because interrupts are disabled, jiffies will not advance on UP systems,
causing an infinite loop (deadlock).

Additionally, imx_mu_specific_tx() uses readl_poll_timeout() with a
5-second timeout in this atomic context:

drivers/mailbox/imx-mailbox.c:imx_mu_specific_tx() {
    ...
    ret =3D readl_poll_timeout(priv->base + priv->dcfg->xSR[IMX_MU_TSR],
                             xsr,
                             xsr & IMX_MU_xSR_TEn(priv->dcfg->type, i % num=
_tr),
                             0, 5 * USEC_PER_SEC);
    ...
}

Spinning for up to 5 seconds with IRQs disabled violates core kernel
locking rules and can trigger NMI watchdogs and RCU stalls.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-imx_mbox_r=
proc-v2-0-a0059dc3b69a@linutronix.de?part=3D8
