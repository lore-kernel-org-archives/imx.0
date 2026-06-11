Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550903624C3
	for <imx@lists.linux.dev>; Thu, 11 Jun 2026 10:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781174838; cv=none; b=pIlugHdRqCME7oQbrYg/jJojnqAdIOIkGu/PRR3Y0IwfV18mvhGSnKLvzXVQd34hWLB3Xz/J763GfksFK1I/D8tMNMwjl0ynttlK2tWWe+xgdq1MagiCgpXSaczaK/FJC9U5fjSpL9ra4aJkfUO0rmPYcQBuKuMe0iH2uj089CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781174838; c=relaxed/simple;
	bh=8Ih50Rh//0EkeORA1cW2xYEm1NsA3U2ZOVfSIskavg8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tfuCEjUs4sggVevZSGsn+vMmQFBLJ1kJblDItKzuh6XdTbnbGRGnJT5yJt0f/gsXgwwV61AfUNX+6SnVTLIBS0hzDVAPkNOnphCOq3DnUxV0s4v2hGjDWo2oFQljL69LZLwjlKNm/haXKQoPwICcmoh8RMw7MJWSFvMSu15hY4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DKY8XYDZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DKY8XYDZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C92211F00898;
	Thu, 11 Jun 2026 10:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781174837;
	bh=M/pTEiAl84gziv2EMHLB3rOyrfwBviBden2org3juLQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DKY8XYDZpMYo9mogSl5NpzkCd8Jvl3xABd05iNA5ZONesNSZdFkbTMhyJOOdQBDxa
	 Pt05XSZo//74quunBSnMUSdz/0CRT9wd9RoJePE7dlTHJpV6yQmb9UyqVVvS9jltnU
	 057aObynsG7yKYhqM7Lz31nmF1o94cuPzow+JhTqh+gD764vaVHKKgBzbk2GaCDDkq
	 YqK7M662s5T34gGz5ehrdlkDHQosOz1czaJpHpnCBaBshjGhIgl4g2C2bsd3ntlvG5
	 YmZF77V749kRVfFm0wExdPOBQL6HxNAn6NhtjdD7zCPlZs/BVZ9LVyo2EOfBkvNkz1
	 JlpnPW1WUQzFA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH -next] firmware: imx: se_ctrl: preserve ioctl error
 across cleanup
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260611155317.3205994-1-pankaj.gupta@oss.nxp.com>
References: <20260611155317.3205994-1-pankaj.gupta@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 10:47:16 +0000
Message-Id: <20260611104716.C92211F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Userspace can trigger a kernel out-of-bounds read and memory d=
isclosure by bypassing the response size limitation via the ELE_DEBUG_DUMP_=
REQ exception.
- [Critical] Dangling pointers left in the global callback handle on early =
error returns or timeouts lead to UAF and NULL pointer dereferences in the =
RX interrupt callback.
- [Critical] Freeing `dev_ctx` inside a scoped guard causes a Use-After-Fre=
e when the mutex is automatically unlocked.
- [High] Unbounded user-controlled `rx_buf_sz` passed to `kzalloc` allows u=
nprivileged users to trigger kernel warnings (`WARN_ON_ONCE`) or cause memo=
ry exhaustion.
- [High] Linked list corruption due to mismatched locking when adding/remov=
ing `dev_ctx` from `priv->dev_ctx_list`.
- [High] Returning `-EBUSY` from `se_if_fops_close` on a pending signal lea=
ks `dev_ctx` and shared memory permanently.
- [High] Mismatch between devres lifecycle and VFS file lifecycle leads to =
UAF on device unbind.
- [High] The mailbox receive callback `se_if_rx_callback()` accesses and mo=
difies shared state without holding any locks.
--

commit 481977819a4238dcf5e49fe0ecc0cd7d83d4f0c7
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

firmware: imx: se_ctrl: preserve ioctl error across cleanup

se_ioctl_cmd_snd_rcv_rsp_handler() overwrites the operation error with the
cleanup error. This patch preserves the original error and only uses the
cleanup return value when no earlier error was set.

Closes: https://sashiko.dev/#/patchset/20260528091446.3331006-1-pankaj.gupt=
a@nxp.com?part=3D1

> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> index 8fab3b7767b7a..03ac54c1a2c55 100644
> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c
> @@ -510,6 +510,7 @@ static int se_ioctl_cmd_snd_rcv_rsp_handler(struct se=
_if_device_ctx *dev_ctx,
>  	struct se_ioctl_cmd_snd_rcv_rsp_info cmd_snd_rcv_rsp_info =3D {0};
>  	struct se_if_priv *priv =3D dev_ctx->priv;
>  	int err =3D 0;
> +	int cleanup_err =3D 0;
> =20
>  	if (copy_from_user(&cmd_snd_rcv_rsp_info, uarg,
>  			   sizeof(cmd_snd_rcv_rsp_info))) {

[ ... ]

> @@ -594,7 +595,10 @@ static int se_ioctl_cmd_snd_rcv_rsp_handler(struct s=
e_if_device_ctx *dev_ctx,
>  		err =3D -EFAULT;
>  	}
> =20
> -	err =3D se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_in=
fo);
> +	cleanup_err =3D se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rc=
v_rsp_info);
> +
> +	if (!err)
> +		err =3D cleanup_err;
> =20
>  	return err;
>  }

[Severity: High]
This is a pre-existing issue, but could passing the unbounded
cmd_snd_rcv_rsp_info.rx_buf_sz directly to kzalloc() allow unprivileged
users to trigger kernel warnings or memory exhaustion?

drivers/firmware/imx/se_ctrl.c:se_ioctl_cmd_snd_rcv_rsp_handler() {
    ...
	struct se_api_msg *rx_msg __free(kfree) =3D
		kzalloc(cmd_snd_rcv_rsp_info.rx_buf_sz, GFP_KERNEL);
    ...
}

Because rx_buf_sz is user-provided and unbounded, a negative value becomes a
massive size_t, which guarantees an allocation failure and triggers a
WARN_ON_ONCE in the slab allocator. Can this trivially crash the system if
panic_on_warn is set?


[Severity: Critical]
This isn't a bug introduced by this patch, but can this sequence lead to a
use-after-free and NULL pointer dereference?

If ele_msg_send() fails in ele_msg_send_rcv(), it returns early without
clearing priv->waiting_rsp_clbk_hdl.dev_ctx and rx_msg. If ele_msg_rcv()
times out, it clears dev_ctx to NULL but leaves rx_msg dangling:

drivers/firmware/imx/ele_common.c:ele_msg_send_rcv() {
    ...
	err =3D ele_msg_send(dev_ctx, tx_msg, tx_msg_sz);
	if (err < 0)
		return err;
    ...
}

Because rx_msg is allocated with __free(kfree), it is freed when the ioctl
returns. Later, if an unexpected firmware response arrives, does
se_if_rx_callback() unconditionally dereference the dangling or NULL dev_ctx
and use memcpy() into the freed rx_msg buffer?

drivers/firmware/imx/ele_common.c:se_if_rx_callback() {
    ...
		dev_dbg(dev, "Selecting resp waiter:%s for mesg header:0x%x.",
			se_clbk_hdl->dev_ctx->devname, *(u32 *)header);
    ...
}


[Severity: Critical]
This is a pre-existing issue, but might this code read out-of-bounds from t=
he
msg buffer?

drivers/firmware/imx/ele_common.c:se_if_rx_callback() {
    ...
	memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);
    ...
}

When a response is received, se_if_rx_callback() skips limiting the
callback's rx_msg_sz if check_hdr_exception_for_sz() returns true. Because
the SE_IOCTL_CMD_SEND_RCV_RSP ioctl allows userspace to specify an
arbitrarily large rx_buf_sz, rx_msg_sz remains un-shrunk. Does this cause
the memcpy() to read out-of-bounds from the msg buffer, leaking memory to
userspace in se_ioctl_cmd_snd_rcv_rsp_handler()?


[Severity: High]
This isn't a bug introduced by this patch, but would the mismatch in locking
between se_if_fops_open() and se_if_fops_close() cause linked list corrupti=
on?

se_if_fops_open() adds the device context to priv->dev_ctx_list while holdi=
ng
the parent misc_dev_ctx->fops_lock:

drivers/firmware/imx/se_ctrl.c:se_if_fops_open() {
    ...
	scoped_cond_guard(mutex_intr, return -EBUSY, &misc_dev_ctx->fops_lock) {
    ...
}

Conversely, se_if_fops_close() removes the context while holding the
instance-local dev_ctx->fops_lock:

drivers/firmware/imx/se_ctrl.c:se_if_fops_close() {
    ...
	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
    ...
}

Could concurrent opens and closes race to modify priv->dev_ctx_list and
corrupt the linked list?


[Severity: High]
This is a pre-existing issue, but will returning -EBUSY from
se_if_fops_close() on a pending signal leak dev_ctx permanently?

drivers/firmware/imx/se_ctrl.c:se_if_fops_close() {
    ...
	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
    ...
}

The kernel VFS layer ignores the return value of a release callback and
always destroys the file structure. If the process is killed or has a pendi=
ng
signal, mutex_lock_interruptible() fails and the function returns early.
Does this bypass cleanup of dev_ctx and leak it?


[Severity: Critical]
This isn't a bug introduced by this patch, but is it possible that freeing
dev_ctx inside a scoped guard causes a use-after-free when the mutex is
automatically unlocked?

drivers/firmware/imx/se_ctrl.c:se_if_fops_close() {
    ...
		kfree(dev_ctx);
	}
    ...
}

Because dev_ctx is explicitly freed inside the guarded block, does the
scope's automatic cleanup handler dereference freed memory when it attempts
to call mutex_unlock(&dev_ctx->fops_lock)?


[Severity: High]
This is a pre-existing issue, but could the mismatch between the devres
lifecycle and VFS file lifecycle lead to a use-after-free on device unbind?

drivers/firmware/imx/se_ctrl.c:se_if_probe() {
    ...
	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
    ...
}

If the driver is unbound via sysfs, devres unregisters the miscdevice and
frees priv. Since misc_deregister() does not force closure of open file
descriptors, could subsequent userspace actions on open file descriptors
dereference the freed dev_ctx->priv?


[Severity: High]
This isn't a bug introduced by this patch, but does the mailbox receive
callback access and modify shared state without holding any locks?

drivers/firmware/imx/ele_common.c:se_if_rx_callback() {
    ...
		se_clbk_hdl =3D &priv->waiting_rsp_clbk_hdl;
    ...
}

Process context in ele_msg_send_rcv() uses priv->se_if_cmd_lock to serialize
setup of the waiting_rsp_clbk_hdl state. If a late hardware response arrives
while another thread is setting up a new command, will se_if_rx_callback()
race with it and corrupt the state?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611155317.3205=
994-1-pankaj.gupta@oss.nxp.com?part=3D1
