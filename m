Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066973AFD1B
	for <imx@lists.linux.dev>; Thu, 28 May 2026 09:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779961420; cv=none; b=C/+VmgXMWXEAjcqNpMLp0jVAWEwJXQ48IjauvNs+dML8JZJOba7PIIjbFMv/SEzl6Q20uByO3PC8cfEy9ATema+NzqjxkYg5j6qDVdyW6aWuH9GSifh3pqwGI5bN8ya4fYzmIrj6xnjXKlmWFUSyvslpCsXxa98aowdY8wXGXo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779961420; c=relaxed/simple;
	bh=YH8tVs5l9EDVjmJHtv/2fhtHCpocNcJU/EgHb9KiJPI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r6U8f4EW+zu2kZp6+BDQyMfMiXa7parAFnydadt4z7eRPAffIh0kAf+BScEmvAkv0g8RUhw8y4WqGzkWMjEvtkfZlqqkmBtHd8EjkgPYPUUCnw+MCEZlEuvplIo556mIw98Q6gpeh+n4GpB1fZuzIvc9NTM6hZNnwgYHfhdI9ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UJhAlbYs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UJhAlbYs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C1D41F00A3A;
	Thu, 28 May 2026 09:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779961417;
	bh=p5iBnMJMvtASdoaibq5uI+OELDWXxZJad2r7WQwzRO4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UJhAlbYso4vWdoACydSZBKn0rMqxrT1/q9QWy+Ektgy5+ubwSotLXei58PJ6Su/ZT
	 47KhkkBNJzdRcW6O4pOe8TLD1zeuNuoydOV1wwxW27QfcAOqQV/SB6y+JvxFvIUAvP
	 53nv1fK6vpO8/KhJsnicUxXBuM3PPHH7sUBG1fma+y9G19dXZnEd2X11n0HQ+cIDs9
	 lQ3HUUeaQH7S47zf0gfL6Wy2dch6u4rmJ9bI4LAay06h2pNWCfEyueRKwhozJBqPha
	 6p9YO37rYENLLnXQ4HDgFzORZxxxriCSaJU8X2ITBALl5uC8lZkRFwCQWv5G6bziyv
	 ACq+IsjflLDJg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH -next] firmware: imx: Add missing return in error path
 to prevent use-after-free.
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pankaj Gupta" <pankaj.gupta@nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260528091446.3331006-1-pankaj.gupta@nxp.com>
References: <20260528091446.3331006-1-pankaj.gupta@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 09:43:37 +0000
Message-Id: <20260528094337.9C1D41F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Improper cancellation of asynchronous hardware commands leads =
to Use-After-Free and kernel memory corruption upon delayed response.
- [High] Shared driver state is incorrectly protected by per-file descripto=
r locks, leading to list corruption and data races.
- [High] Incorrect usage of `scoped_cond_guard` in `.release` file operatio=
n causes Use-After-Free and permanent resource leaks.
- [High] Direct dereference of user-space pointers without using `copy_from=
_user()` or `get_user()`.
- [High] Devres lifecycle mismatch with character device file descriptors c=
auses Use-After-Free upon unbind.
- [High] Unhandled pending signals in `ele_msg_rcv` cause an infinite loop =
and livelock.
- [Medium] Masked `-EFAULT` error code in `se_ioctl_cmd_snd_rcv_rsp_handler=
` falsely reports success to user space.
--

commit 91ef98b22f1e9e4e106c5851a3e8c69fd60f747c
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

firmware: imx: Add missing return in error path to prevent use-after-free.

This commit fixes a missing return in the error path of init_device_context=
()
to prevent a use-after-free. After setting *new_dev_ctx to NULL, the functi=
on
previously continued execution and dereferenced dev_ctx.

> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> index 9327d47e4312e..4914d3b6bf0b7 100644
> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c
> @@ -486,6 +486,8 @@ static int init_device_context(struct se_if_priv *pri=
v, int ch_id,
>  		kfree(dev_ctx->devname);
>  		kfree(dev_ctx);
>  		*new_dev_ctx =3D NULL;
> +
> +		return ret;
>  	}
> =20
>  	list_add_tail(&dev_ctx->link, &priv->dev_ctx_list);

[Severity: High]
This is a pre-existing issue, but does se_if_fops_close() race with
se_if_fops_open() on the dev_ctx_list?

In se_if_fops_open(), new contexts are added to priv->dev_ctx_list under
misc_dev_ctx->fops_lock. However, in se_if_fops_close(), contexts are remov=
ed
using list_del(&dev_ctx->link) while holding the per-file descriptor lock
dev_ctx->fops_lock.

Since concurrent open and close calls acquire entirely different locks, does
this guarantee list corruption? Furthermore, does se_if_probe_cleanup()
traverse this list without holding any lock?

[Severity: High]
This is a pre-existing issue, but does the usage of scoped_cond_guard in
the .release file operation cause a use-after-free and resource leak?

se_if_fops_close() uses scoped_cond_guard(mutex_intr, return -EBUSY,
&dev_ctx->fops_lock). VFS .release operations ignore the return value, so
returning -EBUSY when interrupted permanently leaks the dev_ctx memory and
leaves dangling pointers in priv->dev_ctx_list.

If the lock is successfully acquired, kfree(dev_ctx) is called inside the s=
cope
block. Upon scope exit, the guard macro automatically calls
mutex_unlock(&dev_ctx->fops_lock). Since dev_ctx was just freed, does this
dereference freed memory?

[Severity: High]
This is a pre-existing issue, but does se_if_fops_write() directly derefere=
nce
user-space pointers?

In se_if_fops_write(), the buf argument is a const char __user *, which is
cast to struct se_msg_hdr * and directly passed to se_chk_tx_msg_hdr(), whi=
ch
accesses its fields directly.

Similarly, in se_ioctl_cmd_snd_rcv_rsp_handler(), the tx_buf field is a user
pointer directly passed to se_chk_tx_msg_hdr() before the data is safely
copied with memdup_user(). Could this violate uaccess rules and trigger a
kernel panic on architectures with SMAP enabled?

[Severity: Critical]
This is a pre-existing issue, but does improper cancellation of asynchronous
hardware commands lead to a use-after-free?

In ele_msg_send_rcv(), the driver assigns a locally-allocated buffer rx_msg=
 to
priv->waiting_rsp_clbk_hdl.rx_msg. If ele_msg_send() fails, the function
returns early without clearing the callback state. If ele_msg_rcv() times o=
ut,
the rx_msg pointer is also left dangling. The local rx_msg buffer is then f=
reed
by the caller.

Later, when the firmware unexpectedly responds, se_if_rx_callback() executes
asynchronously. Is it possible that it dereferences a potentially NULL dev_=
ctx,
or directly copies the hardware payload into the dangling rx_msg pointer us=
ing
memcpy(), leading to kernel heap corruption?

[Severity: Medium]
This is a pre-existing issue, but is the -EFAULT error code masked in
se_ioctl_cmd_snd_rcv_rsp_handler()?

If copy_to_user() fails to copy the rx_msg payload, the function correctly =
sets
err =3D -EFAULT. However, it then immediately calls err =3D
se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info).

If the cleanup succeeds, it returns 0, which unconditionally overwrites the
previously set -EFAULT error code. Does the IOCTL thus return success to us=
er
space despite the data transfer failure?

[Severity: High]
This is a pre-existing issue, but does the devres lifecycle mismatch with
character device file descriptors cause a use-after-free upon unbind?

The core state struct se_if_priv is allocated using devm_kzalloc(), meaning=
 it
is automatically freed when the device is unbound. However, the driver expo=
ses
a miscdevice interface, and applications may keep file descriptors open dur=
ing
unbind.

When an application eventually closes an open file descriptor, VFS will call
se_if_fops_close(). Will this blindly access dev_ctx->priv, which was freed=
 by
devres during the unbind operation?

[Severity: High]
This is a pre-existing issue, but do unhandled pending signals in ele_msg_r=
cv()
cause an infinite loop and livelock?

In ele_msg_rcv(), the code uses a do { ... } while (ret < 0) loop around
wait_for_completion_interruptible_timeout(). If interrupted by a signal,
wait_for_completion returns -ERESTARTSYS.

The error handling block sets signal_rcvd =3D true and calls continue witho=
ut
clearing the pending signal or returning to user space. The loop restarts a=
nd
immediately calls wait_for_completion again, which instantly returns
-ERESTARTSYS because the signal is still pending. Can this create a tight
infinite kernel loop that pins the CPU and livelocks the thread?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528091446.3331=
006-1-pankaj.gupta@nxp.com?part=3D1
