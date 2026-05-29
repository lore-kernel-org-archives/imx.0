Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059083F1651
	for <imx@lists.linux.dev>; Fri, 29 May 2026 18:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780078411; cv=none; b=sdEC7euq/mdBA7PrZBQK1k+W3p4VOAWW+emjxwxWP5s2+I0JN8N/Id0kixDcs1KvHEyIQjkkrdbwv6x70OUbHu6KsuIxAwsVjzjEEFi4CIN8bk4UDonEg6WhyEhJr164A2tCFgbrknFUexDDbMxWCe0k5Db1zTNR9rjZKCYp0vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780078411; c=relaxed/simple;
	bh=MIEYylXM1qda7zOp6hBPKA4keK3Y/ub4vHG6Tn7OuDY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hJDgo2RD9rjAwqacIOmGYEBbInfoi1sfFF3NH/SQZIOzV9ev4UHUxVbBf8aJdabYLXRIyx3kvIvh/V9AR5Otswg2ezKazU4MjTKqM//kmahPfqSp9ECAKpsfP714XUwYHrdm4ASiGb6qY7wH6rP5LR2Vf69QtvQWtvwX+l7+Tlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kYQG+5ph; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kYQG+5ph"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 274501F00893;
	Fri, 29 May 2026 18:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780078409;
	bh=teYH4QBJNJY+Ym0MuKU1mf3gg+a42EcItpx+aEIp15Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kYQG+5phdla9Cl+b/n1JkLJ9qI2IK8f/N2ssVHILPQeCXuIjH2ydDtlSVA0xZY9I8
	 iiyvKr4DKUXMwaid879t58LSkZd83HCxZ0lNFfbYeKWs5qyxS0CShsUbXdIrOKATVx
	 HRxhwfyY3SgrAU2ezNsUno+/zb6otzfjTP+H8qzD0SLv0vFqOhfnjBqS9s8xqynmBy
	 118KX+KbijQOmWQcEbhigDUrKA8HzRYpC/y/dkCpo6PsQOKOzrcI1vkXE9pOlGu5e1
	 vjZBrhMRmOGXQGsWygufRvLlRx5HxjHQ8LXLO2/L9gODuVht1VtxAMVvFa4VLxyl8R
	 rs0wH3rUZ1xzQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] mailbox: imx: Don't force-thread the primary
 handler
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260529-imx_mbox_rproc-v1-4-b8ffc36e11e5@linutronix.de>
References: <20260529-imx_mbox_rproc-v1-4-b8ffc36e11e5@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 18:13:28 +0000
Message-Id: <20260529181329.274501F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Mailbox controller is registered before initialization completes, =
leading to a race condition and potential system crash on probe error paths.
--

commit 1073878552c10da376c68e938a69f8f471bd3ed5
Author: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

mailbox: imx: Don't force-thread the primary handler

The primary interrupt handler no longer invokes callbacks; it only masks
the interrupt source and returns. This patch converts the control register
lock to a raw_spinlock_t to allow the primary handler to run in hardirq
context even on PREEMPT_RT, skipping one thread.

> diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
> --- a/drivers/mailbox/imx-mailbox.c
> +++ b/drivers/mailbox/imx-mailbox.c
[ ... ]
> @@ -964,7 +963,7 @@ static int imx_mu_probe(struct platform_device *pdev)
>  		goto disable_clk;
>  	}
> =20
> -	spin_lock_init(&priv->xcr_lock);
> +	raw_spin_lock_init(&priv->xcr_lock);
> =20
>  	priv->mbox.dev =3D dev;
>  	priv->mbox.ops =3D &imx_mu_ops;

[Severity: High]
This is a pre-existing issue, but could the ordering in imx_mu_probe() lead
to a race condition on probe error paths?

Looking at the initialization sequence, devm_mbox_controller_register() is
called shortly after this lock initialization, but before pm_runtime_enable=
()
and before the probe function is guaranteed to succeed.=20

If a consumer requests a channel immediately after registration and calls
startup(), it gains access to the hardware. If probe() subsequently fails
(for example, if pm_runtime_resume_and_get() fails), the error path calls
clk_disable_unprepare() to manually turn off the hardware clock.

The driver core will then trigger devres cleanup, which unregisters the
mailbox controller and calls imx_mu_shutdown() for the active channel.

Since imx_mu_shutdown() attempts to write to hardware registers to mask
interrupts, and the clock has already been disabled by the probe error path,
will this register access result in a fatal bus error or system hang?

Should the devm_mbox_controller_register() call be moved to the very end of
probe() to ensure consumers cannot interact with the hardware during an ear=
ly
teardown?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529-imx_mbox_r=
proc-v1-0-b8ffc36e11e5@linutronix.de?part=3D4
