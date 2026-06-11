Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B9B26F46F
	for <imx@lists.linux.dev>; Thu, 11 Jun 2026 11:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177028; cv=none; b=LjWJOamYS/Ruwy2aKtY0oEeExOqP+8DENSFFrWm2ILpqfycJM31+Xh4y95VFYz/OzPUli8TkWIU3saxmHp8Ja1VMmjG5RmwNi7WbnwhDMKBjujq4OnDyyIBgsswX/SYBE59fV7a1Mi9KJtcYmKBXwCbk5nMR5OSCscYhHAudUHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177028; c=relaxed/simple;
	bh=fmtnxrI4r4gFSE7eY25zFcQjMPWgpFp8QWA0HQy3rhs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fE2vEc2XQpdoNbtLjXInXTW6f4P1eyM7s2SyQ1U3sir5fND7zF2wG8MqbNdhS5GB17laRK8dBtGWRTjavJ9Db56SDyUZVgGYY36sh/9Jh+3DOmNnQ8cVeA4uh4bCSSDrEG0S/aiM9BaZXon/1GOjuAThpWawFEFqzXCkeegHPO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z4gUuqns; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z4gUuqns"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55A4C1F00893;
	Thu, 11 Jun 2026 11:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781177026;
	bh=RofivW1pTrBHZrj4HJfeIlPafW2kSudJJRJh4f5VxrQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z4gUuqnsbxK+p5lHh99t5oX5azSIqoiGfNgOb19csBUQjpzuz7G5d7uT75jZsHtZL
	 1bj0UUbnbOhMJUS9rcV3XzIrdtpKsjq1cE5/4ybZTmuPlpFnUUHyRyqecea3OMhOys
	 JaSnYMgXs7gljhXNLuGLk9AbahqYWfF54BbJdFKJCZ4HlASYvPVM5/H3TymhZPxvV1
	 F9S2PvbHxEOPmSaYPBNI87U2Zk1Xw36rv6PTxFCj8HQV1scljqALuMF0Jfav+IqZ14
	 D+iNMgewKCBjOrrbQFNE2vMQCt1uEJsauVhN5YW2lbNu/dPZhxX4O8eGTU+6aRQVYo
	 ih61LkZ790o9g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] firmware: imx: Fix device context UAF in close
Reply-To: sashiko-reviews@lists.linux.dev
To: "Harshit Mogalapalli" <harshit.m.mogalapalli@oracle.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260611110534.573543-1-harshit.m.mogalapalli@oracle.com>
References: <20260611110534.573543-1-harshit.m.mogalapalli@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 11:23:45 +0000
Message-Id: <20260611112346.55A4C1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:

Pre-existing issues:
- [Critical] Blind dereference of `se_clbk_hdl->dev_ctx->devname` in the ma=
ilbox rx callback triggers a kernel panic.
- [Critical] Heap buffer overflow in `se_if_rx_callback` due to a negated s=
ize clamping check.
- [Critical] Integer overflow in `round_up()` allows massive out-of-bounds =
write in `se_ioctl_setup_iobuf_handler`.
- [Critical] Timeout in `ele_msg_send_rcv()` leaves `rx_msg` dangling, lead=
ing to a Use-After-Free write and NULL pointer dereference.
- [High] Using scoped_cond_guard(mutex_intr) in the `.release` file operati=
on permanently leaks resources if interrupted.
- [High] Concurrent manipulation of the doubly-linked list `priv->dev_ctx_l=
ist` without proper mutual exclusion.
- [High] Data race on the globally shared `priv->cmd_receiver_clbk_hdl` str=
ucture during `SE_IOCTL_ENABLE_CMD_RCV`.
- [High] Lack of synchronization between `se_if_fops_close()` and `se_if_rx=
_callback()` leads to a Use-After-Free.
- [High] The driver exposes the device to userspace before `probe` finishes=
, leading to a Use-After-Free if `probe` fails.
- [High] Bypassed bounds check for exception commands in `se_if_rx_callback=
()` leads to an out-of-bounds read.
--

commit 74f109ec7fcb05ec697969052fac5982c162908a
Author: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>

firmware: imx: Fix device context UAF in close

se_if_fops_close() frees dev_ctx while still inside a
scoped_cond_guard() that holds dev_ctx->fops_lock. During the cleanup
phase it would do a mutex_unlock(dev_ctx->fops_lock) leading to UAF.

Link: https://lore.kernel.org/all/20260528094337.9C1D41F00A3A@smtp.kernel.o=
rg/

> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> index 8fab3b7767b7a..fc3bbd1788bda 100644
> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c
> @@ -887,9 +887,10 @@ static int se_if_fops_close(struct inode *nd, struct=
 file *fp)
>  		list_del(&dev_ctx->link);
> =20
>  		kfree(dev_ctx->devname);
> -		kfree(dev_ctx);
>  	}
> =20
> +	kfree(dev_ctx);
> +
>  	return 0;
>  }

[Severity: High]
This isn't a bug introduced by this patch, but using scoped_cond_guard() in
the .release file operation permanently leaks resources if interrupted.

se_if_fops_close() is the .release file operation. VFS calls this exactly
once when the final file reference is dropped, and ignores its return value.

drivers/firmware/imx/se_ctrl.c:se_if_fops_close() {
...
        scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
...
}

By using return -EBUSY, if the lock acquisition fails due to a pending
signal, does the function immediately return, bypassing cleanup logic and
permanently leaking the dev_ctx allocation and devname?

[Severity: High]
This isn't a bug introduced by this patch, but concurrent manipulation of
the doubly-linked list priv->dev_ctx_list occurs without proper mutual
exclusion.

In se_if_fops_open(), init_device_context() is called which adds the new
instance to priv->dev_ctx_list and increments priv->active_devctx_count
under the global misc_dev_ctx->fops_lock.

Here in se_if_fops_close(), the instance is removed from the list and
the counter decremented under the local dev_ctx->fops_lock:

drivers/firmware/imx/se_ctrl.c:se_if_fops_close() {
...
        scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
...
                priv->active_devctx_count--;
                list_del(&dev_ctx->link);
...
}

Because close() uses a lock specific to the file instance being closed,
can concurrent close() operations on different file descriptors, or
concurrent open() and close() operations, race on the shared list and
counter, causing list corruption?

[Severity: High]
This isn't a bug introduced by this patch, but there is a lack of
synchronization between se_if_fops_close() and se_if_rx_callback().

se_if_fops_close() clears priv->cmd_receiver_clbk_hdl.dev_ctx and
frees rx_msg while holding only the per-file dev_ctx->fops_lock:

drivers/firmware/imx/se_ctrl.c:se_if_fops_close() {
...
                if (priv->cmd_receiver_clbk_hdl.dev_ctx =3D=3D dev_ctx) {
                        priv->cmd_receiver_clbk_hdl.dev_ctx =3D NULL;
                        kfree(priv->cmd_receiver_clbk_hdl.rx_msg);
...
}

se_if_rx_callback() runs asynchronously in the mailbox hardware callback
context without taking any locks:

drivers/firmware/imx/ele_common.c:se_if_rx_callback() {
...
        memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);
...
}

If the callback reads se_clbk_hdl->dev_ctx concurrently just before the
close operation frees it, could it dereference the freed dev_ctx and
execute a Use-After-Free memcpy() into the freed rx_msg memory?

[Severity: High]
This isn't a bug introduced by this patch, but there is a data race on the
globally shared priv->cmd_receiver_clbk_hdl structure.

When handling SE_IOCTL_ENABLE_CMD_RCV, the driver initializes the shared
global structure:

drivers/firmware/imx/se_ctrl.c:se_ioctl() {
...
        scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
                switch (cmd) {
                case SE_IOCTL_ENABLE_CMD_RCV:
                        if (!priv->cmd_receiver_clbk_hdl.dev_ctx) {
...
}

Since this is protected only by the per-instance dev_ctx->fops_lock, if
two processes open the device independently and concurrently issue this
IOCTL, will they both observe !priv->cmd_receiver_clbk_hdl.dev_ctx as
true? Could they concurrently allocate memory for rx_msg and assign their
dev_ctx to the global state, corrupting it and leaking memory?

[Severity: Critical]
This isn't a bug introduced by this patch, but an integer overflow in
round_up() allows a massive out-of-bounds write in
se_ioctl_setup_iobuf_handler().

A user-provided 32-bit io.length is passed to round_up():

drivers/firmware/imx/se_ctrl.c:se_ioctl_setup_iobuf_handler() {
...
        aligned_len =3D round_up((size_t)io.length, 8);
...
        if (aligned_len > (shared_mem->size - shared_mem->pos)) {
...
        }
...
        memset(shared_mem->ptr + pos, 0, io.length);
...
}

On 32-bit architectures, if io.length is near UINT32_MAX (e.g., 0xFFFFFFF9),
will the round_up() overflow to 0, causing the space check to evaluate
0 > positive_value and be bypassed entirely? Would memset() then attempt
to write nearly 4GB of zeroes to the kernel heap?

[Severity: Critical]
This isn't a bug introduced by this patch, but a blind dereference of
se_clbk_hdl->dev_ctx->devname in the mailbox rx callback can trigger a
kernel panic.

In se_if_rx_callback(), if a command message arrives, it assigns
se_clbk_hdl =3D &priv->cmd_receiver_clbk_hdl and immediately dereferences
se_clbk_hdl->dev_ctx->devname:

drivers/firmware/imx/ele_common.c:se_if_rx_callback() {
...
                dev_dbg(dev, "Selecting cmd receiver:%s for mesg header:0x%=
x.",
                        se_clbk_hdl->dev_ctx->devname,  *(u32 *)header);
...
}

If the firmware sends an unsolicited command before any process has
registered to receive it via IOCTL, se_clbk_hdl->dev_ctx is NULL. Is there
a risk of a fully hardware-triggerable NULL pointer dereference?

[Severity: Critical]
This isn't a bug introduced by this patch, but there appears to be a heap
buffer overflow in se_if_rx_callback() due to a negated size clamping check.

If an incoming message size exceeds MAX_NVM_MSG_LEN, the code attempts to
clamp it:

drivers/firmware/imx/ele_common.c:se_if_rx_callback() {
...
                if (rx_msg_sz > MAX_NVM_MSG_LEN) {
...
                        se_clbk_hdl->rx_msg_sz =3D MAX_NVM_MSG_LEN;
                }
                se_clbk_hdl->rx_msg_sz =3D rx_msg_sz;
...
}

Since it unconditionally overwrites the clamped limit with the original
oversized length immediately after the if block, would the subsequent
memcpy() copy the out-of-bounds firmware payload into the 256-byte rx_msg
buffer?

[Severity: High]
This isn't a bug introduced by this patch, but a bypassed bounds check for
exception commands in se_if_rx_callback() leads to an out-of-bounds read.

If a response matches an exception rule, the bounds check is skipped:

drivers/firmware/imx/ele_common.c:se_if_rx_callback() {
...
                if (rx_msg_sz !=3D se_clbk_hdl->rx_msg_sz &&
                    !check_hdr_exception_for_sz(priv, header)) {
...
                        se_clbk_hdl->rx_msg_sz =3D min(rx_msg_sz, se_clbk_h=
dl->rx_msg_sz);
                }
...
}

This leaves se_clbk_hdl->rx_msg_sz at its original user-controlled value
provided in the IOCTL request. Might the subsequent memcpy() use this
unchecked user size to copy data from the smaller hardware message buffer,
disclosing adjacent kernel memory?

[Severity: Critical]
This isn't a bug introduced by this patch, but a timeout in
ele_msg_send_rcv() leaves rx_msg dangling, leading to a Use-After-Free
write and NULL pointer dereference.

If ele_msg_send_rcv() is interrupted by a signal or times out, it clears
priv->waiting_rsp_clbk_hdl.dev_ctx but leaves rx_msg populated:

drivers/firmware/imx/ele_common.c:ele_msg_send_rcv() {
...
        if (err < 0) {
...
                priv->waiting_rsp_clbk_hdl.dev_ctx =3D NULL;
...
}

When the function returns, rx_msg is automatically freed by the __free(kfre=
e)
attribute in the caller.

If the hardware eventually sends the delayed response, se_if_rx_callback()
processes it. Would it then dereference the NULL dev_ctx for a log message,
and execute memcpy() into the dangling rx_msg pointer?

[Severity: High]
This isn't a bug introduced by this patch, but the driver exposes the device
to userspace before probe() finishes, leading to a Use-After-Free if probe()
fails.

In se_if_probe(), misc_register() is called via init_misc_device_context(),
which exposes the device to userspace:

drivers/firmware/imx/se_ctrl.c:se_if_probe() {
...
        ret =3D init_misc_device_context(priv, 0, &priv->priv_dev_ctx, &se_=
if_fops);
...
}

If a subsequent step in probe() fails, the devm framework automatically
cleans up resources, including freeing the priv structure.

Since misc_deregister() prevents new opens but does not revoke already
opened file descriptors, if userspace opened the device during the race
window, the file descriptor persists. Upon closing the file descriptor
later, will se_if_fops_close() blindly dereference dev_ctx->priv,
resulting in a Use-After-Free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611110534.5735=
43-1-harshit.m.mogalapalli@oracle.com?part=3D1
