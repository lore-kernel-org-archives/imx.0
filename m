Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F053CAA49
	for <imx@lists.linux.dev>; Thu, 11 Jun 2026 10:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781174224; cv=none; b=uIRoQT7s1QfVLdDS8tetY6v9OZ+Q2f0ei8Qk7+rqsvvBtgQm6QZgW7ZqCiuLylingcHiwIicNCXfebPOnm1yroN+USbN/9XOdwcGilJI74SoRP9hydAV6/wl+M/N6hMAQ7HOXVbX21iMhJpIpNRhHBY5jbqVY6SJ+ZQ9rWWR2SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781174224; c=relaxed/simple;
	bh=BiRv+T5pSZeRSO5fzygp4unkeryBvQsmOOxrh2Ra3zU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PbxsphXuDAio/sRRrzxV9EZxbMEGSyLyLrcbM/2Xgv2vpP3il4D9dT5J1yDtQHIRqWzJGD6Q9npF3XAqH5vwy2Kr8q3eypqm21r0vmpeMCsl/AnwuuZRBeYNjPPdGp7JdVugs+9z1QXxufdMxp8C8Js5sss8YxdC0gIl0WmbRR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bZn1FQfi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bZn1FQfi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEFC41F00898;
	Thu, 11 Jun 2026 10:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781174222;
	bh=FZTRJGCf42X6AQnf0HV2wBU4AdcmU0M+oG2yPOzAT/8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bZn1FQfikxERvGHaqR88uw6Embd0zHD73YdOo3m9wdCzVTf26RGEBl7/OPDBOjyJb
	 guCWfjFV28okjMHlIYMOLDlY/tTcSvXwkD1EKU5PaoLqdeisBeCYdVW4ajOUnBJ9nt
	 x6Hw3rDCGEPZ+qw8/fyJaa0eObZnowXKhSp6ozU24mJmpTxKmIE/6pdCB4mEO4DXzo
	 WVZmnlUXIAKEtUatiuhezMzDuS2HN0znVigJ6He/DEeoQDVJXzsK7ZxuGYpGa3pWgc
	 Xj+YrSABGtpS3OF9zxKfaz8ui368H8ISdoQxJzMvpmsRI72nvmXfREHeI+weGzTu/h
	 txV1MyUUwBcbA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH -next] firmware: imx: se_ctrl: detect round_up()
 overflow in iobuf setup
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260611154148.3182727-1-pankaj.gupta@oss.nxp.com>
References: <20260611154148.3182727-1-pankaj.gupta@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 10:37:01 +0000
Message-Id: <20260611103701.CEFC41F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Returning -EBUSY from the file release handler on signal interrupt=
ion causes permanent memory and resource leaks.
- [High] Concurrent modification of shared linked list `priv->dev_ctx_list`=
 under a per-instance lock leads to list corruption.
- [High] Use-After-Free of `dev_ctx->fops_lock` in `se_if_fops_close` upon =
scope exit.
- [High] Infinite kernel loop in `ele_msg_rcv` when interrupted by a pendin=
g signal.
- [High] Unprivileged `read()` operations corrupt the global command receiv=
er state.
--

commit 274dde5deb429b8b8fa60b9158c528c3a6c4f3bc
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

firmware: imx: se_ctrl: detect round_up() overflow in iobuf setup

se_ioctl_setup_iobuf_handler() aligns io.length with round_up(..., 8)
before checking the available shared memory space. On 32-bit builds,
round_up() can overflow for large io.length values and wrap aligned_len
to a smaller value, which can bypass the bounds check while later
memset() still uses the original unbounded io.length.

> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> index 8fab3b7767b7a..5b23485fe42c8 100644
> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c

[ ... ]

[Severity: High]
This is a pre-existing issue, but in se_if_fops_close(), could returning
-EBUSY on signal interruption cause memory and resource leaks?

drivers/firmware/imx/se_ctrl.c:se_if_fops_close() {
    ...
	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
    ...

If the process closing the file has a pending signal, mutex_lock_interrupti=
ble
fails and returns -EINTR, causing scoped_cond_guard to immediately return
-EBUSY.=20

The VFS layer ignores error returns from release handlers and will not retr=
y.
This drops the file structure but permanently bypasses the cleanup block,
permanently leaking the dev_ctx memory and its associated shared DMA buffer=
s.=20

Additionally, if the leaked context was the designated command receiver,
priv->cmd_receiver_clbk_hdl.dev_ctx remains pointing to it forever,
preventing any other process from acquiring the command receiver role.


[Severity: High]
This isn't a bug introduced by this patch, but could this concurrent list
modification lead to corruption?

drivers/firmware/imx/se_ctrl.c:se_if_fops_close() {
    ...
	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
        ...
		list_del(&dev_ctx->link);
        ...

These shared structure modifications are protected solely by dev_ctx->fops_=
lock,
which is a per-file-descriptor lock local to the current dev_ctx instance.=
=20

If multiple processes close their file descriptors concurrently, each acqui=
res
its own distinct fops_lock and they concurrently execute list_del on the
shared priv->dev_ctx_list.


[Severity: High]
This is a pre-existing issue, but does this scoped_cond_guard usage
trigger a use-after-free?

drivers/firmware/imx/se_ctrl.c:se_if_fops_close() {
    ...
	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
        ...
		kfree(dev_ctx);
	}
    ...

Because dev_ctx is freed inside the guarded block, when the block ends,
the implicitly generated scope destructor executes
mutex_unlock(&dev_ctx->fops_lock).

This dereferences a freed pointer and writes into freed memory to update
the mutex state.


[Severity: High]
This isn't a bug introduced by this patch, but can an unprivileged read()
corrupt the global command receiver state?

drivers/firmware/imx/se_ctrl.c:se_if_fops_read() {
    ...
	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
		if (dev_ctx !=3D priv->cmd_receiver_clbk_hdl.dev_ctx) {
			err =3D -EINVAL;
			goto exit;
		}
        ...
exit:
		priv->cmd_receiver_clbk_hdl.rx_msg_sz =3D 0;
        ...

If a process that is not the designated command receiver calls read(), it
gets -EINVAL and jumps to exit, unconditionally clearing the rx_msg_sz field
of the legitimate command receiver.

Could a malicious reader zero out the size concurrently while the legitimate
receiver is fetching a response, causing it to read a corrupted size of 0?


[Severity: High]
This is a pre-existing issue, but can ele_msg_rcv() get stuck in an
infinite loop?

drivers/firmware/imx/ele_common.c:ele_msg_rcv() {
    ...
	do {
        ...
		ret =3D wait_for_completion_interruptible_timeout(&se_clbk_hdl->done, tim=
eout_ms);
		if (ret =3D=3D -ERESTARTSYS) {
			if (dev_ctx->priv->waiting_rsp_clbk_hdl.dev_ctx) {
				dev_ctx->priv->waiting_rsp_clbk_hdl.signal_rcvd =3D true;
				continue;
			}
            ...
		}
        ...
	} while (ret < 0);
    ...

If wait_for_completion_interruptible_timeout() returns -ERESTARTSYS due to
a pending signal, the code sets signal_rcvd and executes continue.

Since the signal remains pending on the kernel thread, the next call to
wait_for_completion_interruptible_timeout() will instantly return
-ERESTARTSYS again, creating an infinite tight loop.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611154148.3182=
727-1-pankaj.gupta@oss.nxp.com?part=3D1
