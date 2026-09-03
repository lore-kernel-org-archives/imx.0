Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC1D44CADC
	for <imx@lists.linux.dev>; Thu,  3 Sep 2026 11:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788434330; cv=none; b=maW9HGjgafpMuZsA+qql7saXEoAeuW0hlo4xEsmYqeW5Dm3AqS8hjQbsVH+xW6M3uvtZPJQhzAPyYaq0grRGzaMv0co1TW52iihAT4BpfEVRkFLzD/TOJMj3G2Kf7On94Up5VZhzW1+2+pkCqr3xV+s8ThBAhM65Kjp96wuziLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788434330; c=relaxed/simple;
	bh=ox3KhwO9B3JV8P1tR72C+CJZxlLHKtZs6c94bkB4HF0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Pt1uxc3sezPtdVgk/ngqAFyZJdAyxj/o4YtlQ+CewHri7Kno4hHgIP0fFOtP+GsWFE/ZId83Uor8jBE2Fceu9dVWt4R/CQ7NAtsUAnt+lc5H0QErtBGQo+MJiuvSiDbI5X9ISH05qvXKR8Qv510Wu88LwC4Hv6JdgN/ZD7xt4LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l9MTCayf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l9MTCayf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDD821F000E9;
	Thu,  3 Sep 2026 11:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788434322;
	bh=peaqJo5Sz5lse1+b8rrrv0/jqCdLPWiv1JrtpkbIAdI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l9MTCayfvVqQjMaFb0va3Q/z6xguI8QJlsbfz9E1VTceE0rHGLHzufcAGj1KpQO3a
	 3zA3P2p9mtN87c3Y8UGslUoW+RBxixH+JiXPj3fQ33jDZT61t5PsytNNPqh9n4Y4S5
	 4qpd7ubpLFbtc6H94DmiihdFqUOZ1ITtWaRyo9zzySdNAyJNpvyL+SR1bSNSQ52Yas
	 8QxzvXgRqdf+kTdOp1MgDtvGJ95W6opoTv24wFzxuStnsAcYGWKe/iOqxAVYeCog9o
	 AfgZXNSloz6wppraeh+wDuOSjJKYt4hm/11ioDtUbceb6dfk5DvRpycSSUOKBHGYdJ
	 Ccm33xcyuiqsA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] Fix i.MX I2C driver zero byte read kernel panic
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?S3J6eXN6dG9mIEhhxYJhc2E=?= <khalasa@piap.pl>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <m37bl2d28d.fsf@t19.piap.pl>
References: <m37bl2d28d.fsf@t19.piap.pl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 11:18:41 +0000
Message-Id: <20260903111842.BDD821F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incorrect message array indexing when checking `I2C_M_RECV_LEN` mi=
sidentifies SMBus block reads, potentially hanging DMA.
- [High] SMBus Block Read protocol violation in `i2c_imx_prepare_read` due =
to NACKing the length byte in atomic mode.
- [High] DMA mapping leak on timeout path in `i2c_imx_dma_read` and `i2c_im=
x_dma_write`.
- [High] Race condition in `i2c_imx_unreg_slave` allows `i2c_imx->slave` to=
 be set to NULL while the ISR is accessing it.
- [High] ISR can restart `slave_timer` after `hrtimer_cancel()`, leading to=
 a UAF when the timer fires after device removal.
--

commit f83c2cb1b7414914f0e2d7d9321edd1e70cbad6d
Author: Krzysztof Ha=C5=82asa <khalasa@piap.pl>
Fix i.MX I2C driver zero byte read kernel panic

This commit fixes a kernel panic caused by zero-sized I2C read requests in
the i.MX driver. By explicitly checking for missing length in the message,
the driver now rejects invalid zero-length reads with an error.

> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 19ec056b00afe..3f39e6027a4fb 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1640,7 +1640,9 @@ static int i2c_imx_xfer_common(struct i2c_adapter *=
adapter,
>  		if (msgs[i].flags & I2C_M_RD) {
>  			int block_data =3D msgs->flags & I2C_M_RECV_LEN;

[Severity: High]
This is a pre-existing issue, but does evaluating the first message
(msgs->flags) instead of the current message (msgs[i].flags) break SMBus
block read DMA filtering?

For a typical multi-message SMBus block read, msgs[0] does not have
I2C_M_RECV_LEN set, so block_data evaluates to 0.

Does this erroneously route the dynamic-length block read to
i2c_imx_dma_read(), which could cause the DMA transfer to hang and time out
since DMA expects a fixed transfer size?

> -			if (atomic)
> +			if (!msgs[i].len) /* invalid, would panic */
> +				result =3D -EINVAL;
> +			else if (atomic)
>  				result =3D i2c_imx_atomic_read(i2c_imx, &msgs[i], is_lastmsg);
>  			else if (use_dma && !block_data)
>  				result =3D i2c_imx_dma_read(i2c_imx, &msgs[i], is_lastmsg);
[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but does the following logic in
i2c_imx_prepare_read() properly handle SMBus block reads in atomic contexts?

drivers/i2c/busses/i2c-imx.c:i2c_imx_prepare_read() {
...
	if (msgs->len - 1)
		temp &=3D ~I2CR_TXAK;
...
}

When an SMBus block read is performed in atomic mode, the core passes a
message length initialized to 1. Since 1 - 1 evaluates to 0, I2CR_TXAK
remains set.

Could this cause the controller to improperly send a NACK immediately after
receiving the count byte, aborting the transfer prematurely?

[Severity: High]
This is a pre-existing issue, but does the timeout error path in
i2c_imx_dma_read() leak the DMA mapping?

drivers/i2c/busses/i2c-imx.c:i2c_imx_dma_read() {
...
	time_left =3D wait_for_completion_timeout(
				&i2c_imx->dma->cmd_complete,
				msecs_to_jiffies(DMA_TIMEOUT));
	if (time_left =3D=3D 0) {
		dmaengine_terminate_sync(dma->chan_using);
		return -ETIMEDOUT;
	}
...
}

If the I2C transfer times out, the function returns without unmapping the
DMA buffer via dma_unmap_single().

Because dmaengine_terminate_sync() prevents the completion callback from
executing, are we leaking IOMMU translation entries or bounce buffers here?
The same pattern appears to exist in i2c_imx_dma_write().

[Severity: High]
This isn't a bug introduced by this patch, but is there a race condition
when clearing the slave pointer?

drivers/i2c/busses/i2c-imx.c:i2c_imx_unreg_slave() {
...
	hrtimer_cancel(&i2c_imx->slave_timer);
	i2c_imx->slave =3D NULL;
...
}

The teardown path clears i2c_imx->slave without acquiring slave_lock or
calling synchronize_irq().

If the interrupt service routine i2c_imx_isr() checks i2c_imx->slave and
enters i2c_imx_slave_handle() just as this teardown code nullifies the
pointer, could this result in a NULL pointer dereference in the ISR?

[Severity: High]
This is a pre-existing issue, but can the timer be erroneously restarted
after cancellation?

drivers/i2c/busses/i2c-imx.c:i2c_imx_slave_handle() {
...
	hrtimer_restart(&i2c_imx->slave_timer);
...
}

Because i2c_imx_unreg_slave() calls hrtimer_cancel() without synchronizing
against the ISR, can a concurrently executing ISR on another CPU restart
the timer after the cancellation has finished?

If the driver is subsequently removed, would the re-armed timer accessing
the freed i2c_imx structure lead to a use-after-free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/m37bl2d28d.fsf@t19.=
piap.pl?part=3D1
