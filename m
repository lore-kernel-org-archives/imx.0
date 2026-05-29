Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081D23EFFD5
	for <imx@lists.linux.dev>; Fri, 29 May 2026 16:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780073025; cv=none; b=BsGGQktdq0vgfAsNiVS8Jdr+lLdLQXSldwy7Zd9AchmiY0g2tNE7+HGXTfn0vD8XnLX8RS3alNygoNhC0+osDLULcmA8X4D+VnJo79Zw7HrBR5Rarquy1PT8YzH38L/CPK87tPD6gRSbeJZ1eI1UDykwCP9buOY8Up4Jrx2Lplk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780073025; c=relaxed/simple;
	bh=HzLvWoRGOrrI3xJO6ww1Ocsvw00ASjiwxtwXGztD0F8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=W2njU2P0oISkAqbG+txWdOQ/4DoTm5B1/Jz2QnjveXNpE7RA2IJvuQmezPViF/XReR7FpDpFiYbzuSvzieajwQf4scSbjMzweMh9Qw+urcLvh1fI0E2nR4DSuth88rXnv/CIRwSSNRupNs3nTbNsQedNyISp4muFI72QdWEviDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nCaJ7DlC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nCaJ7DlC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C3081F0089A;
	Fri, 29 May 2026 16:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780073023;
	bh=ZgyuT9mL8AlV5f7EcI4WIjIklFJCFRVPcjGtfdEKSHA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nCaJ7DlCVgnTEpMkmHf7ohwpQ3e+t1K2SvmQOeN8fxgciHvgAf72I78ycjQBDrURs
	 kRrSOvYXHy6WFx9c/kwloqM+5EYmvQ83dYmyMM8Y9CJdJM+PT+IvN7nZ5k/FB1Z3t6
	 JUmUzMhmJWwzymRk984u9FPES69vlHWZV6wFVAbE9OAHxMIctLeRccSIWl/uepiS0J
	 809TZ9ml7cG4r77iypAnb8BODJJ6R6d7tydpmW8XNpnoXmErxiicFw8m13lyxsEJDa
	 ynezZGJDDNywGxdHyEKW0QcMUKS2ACbNwpILDnnhUjvNege/Zpx1ldZYi7Y9jja3N1
	 Z/egc7+4lUzjQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/5] mailbox: imx: Start splitting the IRQ handler in
 primary and threaded handler
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260529-imx_mbox_rproc-v1-1-b8ffc36e11e5@linutronix.de>
References: <20260529-imx_mbox_rproc-v1-1-b8ffc36e11e5@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 16:43:42 +0000
Message-Id: <20260529164343.6C3081F0089A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] The commit message claims the primary handler unmasks the interr=
upt, but the code explicitly masks it.

Pre-existing issues:
- [High] Race condition in teardown leaves the hardware interrupt enabled a=
fter the IRQ handler is unregistered, leading to an interrupt storm.
--

commit 07a7a4d7c8c22553b2eceda7f1a65f477dbaef15
Author: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

mailbox: imx: Start splitting the IRQ handler in primary and threaded handl=
er

This commit splits the i.MX mailbox interrupt handling into a primary
and a threaded handler. The primary handler acknowledges the interrupt
and wakes the threaded handler to invoke the actual callback in
preemptible context, starting with the TX path.

> Split the mailbox irq handling into a primary handler (imx_mu_isr()) and
> a threaded handler (imx_mu_isr_th()). The primary handler unmasks the
> interrupt so the threaded handler can run without raising the interrupt
> again. The threaded handler can invoke the actuall callback in
> preemtible context.

[Severity: Medium]
Is this commit message description accurate regarding unmasking?

Looking at imx_mu_isr(), it calls imx_mu_xcr_rmw() passing the interrupt
enable bit as the clr parameter:

imx_mu_xcr_rmw(priv, IMX_MU_TCR, 0, IMX_MU_xCR_TIEn(priv->dcfg->type, cp->i=
dx));

Since this clears the enable bit, doesn't it actually mask the interrupt
rather than unmask it? The code implementation seems structurally correct
to prevent continuous firing until the threaded handler can process the
completion, but the commit message appears reversed.

> diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
> index 246a9a9e39520..2809965677bd7 100644
> --- a/drivers/mailbox/imx-mailbox.c
> +++ b/drivers/mailbox/imx-mailbox.c
[ ... ]
> @@ -508,11 +509,34 @@ static void imx_mu_txdb_work(struct work_struct *t)
>  	mbox_chan_txdone(cp->chan, 0);
>  }
> =20
> +static irqreturn_t imx_mu_isr_th(int irq, void *p)
> +{
> +	struct mbox_chan *chan =3D p;
> +	struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
> +	struct imx_mu_con_priv *cp =3D chan->con_priv;
> +
> +	if (!cp->pending)
> +		return IRQ_NONE;
> +
> +	switch (cp->type) {
> +	case IMX_MU_TYPE_TX:
> +		cp->pending =3D 0;
> +		mbox_chan_txdone(chan, 0);

[Severity: High]
This is a pre-existing issue, but can this lead to an interrupt storm
during channel teardown?

When a client frees a mailbox channel, mbox_free_channel() first calls
the driver's shutdown() callback before calling mbox_clean_and_put_channel()
which aborts queued messages.

If imx_mu_shutdown() calls free_irq(), it synchronizes with the pending
threaded handler. The threaded handler then runs to completion while
shutdown() is blocked, calling mbox_chan_txdone():

imx_mu_isr_th()
  mbox_chan_txdone()
    tx_tick()
      msg_submit()
        imx_mu_send_data()

Because the queues haven't been aborted yet, the core will immediately
submit the next queued message, and imx_mu_send_data() will re-enable
the hardware interrupt.

After the threaded handler finishes, free_irq() completes and unregisters
the IRQ action. Since the hardware interrupt was just re-enabled, won't
the hardware assert the interrupt again, resulting in an unhandled
interrupt storm that permanently disables the shared IRQ line?

> +		return IRQ_HANDLED;
> +
> +	default:
> +		dev_warn_ratelimited(priv->dev, "Unhandled channel type %d\n",
> +				     cp->type);
> +		return IRQ_NONE;
> +	}
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529-imx_mbox_r=
proc-v1-0-b8ffc36e11e5@linutronix.de?part=3D1
