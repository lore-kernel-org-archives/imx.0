Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83D7396572
	for <imx@lists.linux.dev>; Tue, 19 May 2026 06:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779172857; cv=none; b=Gfmv4iOcC0Z+F+KDkNAhLIzXILv31JGbS6PZvQvjWs1r0UikvBy2xDDolrkGg+cqxYOnhcLt/sCJqMtBUNAXHBBY/3HHsKkkOy96EfGYZTsiWjK4lCKYwttanc1+uhXKUvCefxnmJtUfHNgmJwfZv0wjZTGEZTvTOMsarKnZ3I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779172857; c=relaxed/simple;
	bh=VuWGWD8V4PXtcGMR65UBsFFjI/PuiNxPBb6jKb85ADc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NuRR2W3wcRR8lQIhsIgNMEBwGGqKCsYqvGzlObla6aesMfrSWT0LZy08KnBC+W2D1SvEBAP29JINfrIgP9lrfRRb8fBUyWEujU/BzJE98vi8RNpyb9Rp2W+cUnaCc+g5XcnglQfZ9lZA642CV233K5qeonW1U0Cchasnmb/pOm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eKyDEenY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eKyDEenY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31E09C2BCB3;
	Tue, 19 May 2026 06:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779172857;
	bh=VuWGWD8V4PXtcGMR65UBsFFjI/PuiNxPBb6jKb85ADc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=eKyDEenYI/mO2Ww2zCbZRyzVkPbk91EZoGV4t07+snu3yYu9QdviiaeeJnsMzo4iT
	 VGVTM/kHC5olybIDw9pfJto7T7BQcP/ezp864lH4i66NZS09xANmSTqzgQRaaTUI5m
	 Hph72yCGTQnKDO4eLM17DGxt8serg3n7F6GXN+Bk7JvMqb/Jc2/2C0eQpjOvbMhgsQ
	 JkXzT+kIfb8aJnFAEt8MOppEB5nraFZalKKrV253W/EJyaoVF8FO0l+TTdIzBkGU4D
	 VeCda8mgpE94A+puAPgcM0GIsXhimBEV5xPFQBqxKj+BiubbOk8kUcPJ6cMHo0su+A
	 ZcfsfEUDe1oAw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH next] firmware: imx: fix use after free in
 init_device_context()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dan Carpenter" <error27@gmail.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <agv_jhP-2CNTfQXk@stanley.mountain>
References: <agv_jhP-2CNTfQXk@stanley.mountain>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 06:40:50 +0000
Message-Id: <20260519064057.31E09C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [Critical] Unlocking `dev_ctx->fops_lock` after `dev_ctx` has been freed =
in `se_if_fops_close`.
- [Critical] Invalid `kfree()` of an error pointer initialized from `memdup=
_user()` causes a kernel panic.
- [Critical] Direct dereference of a user-space pointer without `copy_from_=
user()` in `se_chk_tx_msg_hdr()`.
- [High] Concurrent modifications to the global shared list `priv->dev_ctx_=
list` leading to memory corruption.
- [High] Concurrent access to shared `cmd_receiver_clbk_hdl` state in `se_i=
octl` causes a memory leak and state corruption.
- [High] The `.release` file operation uses an interruptible mutex lock, pe=
rmanently leaking resources if interrupted.
--

commit 561d6840a7db576a2d4ea89445e14d12b2884cfc
Author: Dan Carpenter <error27@gmail.com>

firmware: imx: fix use after free in init_device_context()
   =20
Add a missing return statement on the error path. Otherwise we have a
use after free when it dereferences "dev_ctx" on the next line.

Fixes: 63536a73a3bb ("firmware: drivers: imx: adds miscdev")

> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> index 9327d47e4312e..010af8221dfe7 100644
> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c
> @@ -486,6 +486,7 @@ static int init_device_context(struct se_if_priv *pri=
v, int ch_id,
>  		kfree(dev_ctx->devname);
>  		kfree(dev_ctx);
>  		*new_dev_ctx =3D NULL;
> +		return ret;
>  	}
> =20
>  	list_add_tail(&dev_ctx->link, &priv->dev_ctx_list);

While reviewing this file, I noticed some additional regressions in the
existing code.

Is there a use-after-free risk when releasing the file operations lock?

Looking at se_if_fops_close(), the device context teardown is guarded by
scoped_cond_guard():

drivers/firmware/imx/se_ctrl.c:se_if_fops_close() {
    ...
	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
        ...
		kfree(dev_ctx->devname);
		kfree(dev_ctx);
	}
    ...
}

When the guarded block terminates, the auto-cleanup mechanism implicitly
calls mutex_unlock() using the saved pointer to the lock.

Since dev_ctx is freed inside the block, does this result in mutex_unlock()
accessing freed memory?

Although this problem wasn't introduced by this patch, it appears to be a
regression.

Can concurrent file operations corrupt the global device context list?

In se_if_fops_open(), elements are added to priv->dev_ctx_list under the
global misc_dev_ctx->fops_lock via init_device_context():

drivers/firmware/imx/se_ctrl.c:se_if_fops_open() {
    ...
	scoped_cond_guard(mutex_intr, return -EBUSY, &misc_dev_ctx->fops_lock) {
		priv->dev_ctx_mono_count++;
		err =3D init_device_context(priv, ...);
    ...
}

drivers/firmware/imx/se_ctrl.c:init_device_context() {
    ...
	list_add_tail(&dev_ctx->link, &priv->dev_ctx_list);
    ...
}

However, se_if_fops_close() removes elements while holding only the per-file
dev_ctx->fops_lock:

drivers/firmware/imx/se_ctrl.c:se_if_fops_close() {
    ...
	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
        ...
		list_del(&dev_ctx->link);
    ...
}

Because open() and close() on different file descriptors use different lock=
s,
can they concurrently modify the same doubly-linked list without global mut=
ual
exclusion?

While this problem wasn't introduced by this patch, it is an existing
regression.

Could concurrent IOCTL calls corrupt the shared driver state or leak memory?

In se_ioctl(), the SE_IOCTL_ENABLE_CMD_RCV command modifies the shared driv=
er
context while holding only the per-instance dev_ctx->fops_lock:

drivers/firmware/imx/se_ctrl.c:se_ioctl() {
    ...
	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
		switch (cmd) {
		case SE_IOCTL_ENABLE_CMD_RCV:
			if (!priv->cmd_receiver_clbk_hdl.dev_ctx) {
				if (!priv->cmd_receiver_clbk_hdl.rx_msg) {
					priv->cmd_receiver_clbk_hdl.rx_msg =3D
						kzalloc(MAX_NVM_MSG_LEN,
							GFP_KERNEL);
    ...
}

If two processes invoke this IOCTL on different file descriptors concurrent=
ly,
could they both pass the !priv->cmd_receiver_clbk_hdl.dev_ctx check
simultaneously?

This might result in duplicate allocations of rx_msg, leaking memory, and
leaving the shared driver state inconsistently overwritten.

Again, this problem wasn't introduced by this patch, but it looks like a
regression.

Is there a resource leak if the .release file operation is interrupted?

Looking at se_if_fops_close():

drivers/firmware/imx/se_ctrl.c:se_if_fops_close() {
    ...
	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
        ...
		se_dev_ctx_shared_mem_cleanup(dev_ctx);
		cleanup_se_shared_mem(dev_ctx);
        ...
		list_del(&dev_ctx->link);

		kfree(dev_ctx->devname);
		kfree(dev_ctx);
	}

	return 0;
}

If the process has a pending signal (for example, during process terminatio=
n),
the lock acquisition fails and returns -EBUSY.

Since the VFS .release path ignores this return value and destroys the file
object regardless, does this bypass the teardown entirely?

This would permanently leak dev_ctx and its DMA allocations. Furthermore,
dev_ctx would remain on priv->dev_ctx_list, potentially leading to a
use-after-free during module unload.

Although this wasn't introduced by this patch, it appears to be a regressio=
n.

Will an invalid kfree() of an error pointer cause a kernel panic?

In se_ioctl_cmd_snd_rcv_rsp_handler(), tx_msg is declared with the scoped
cleanup macro __free(kfree) and initialized using memdup_user():

drivers/firmware/imx/se_ctrl.c:se_ioctl_cmd_snd_rcv_rsp_handler() {
    ...
	struct se_api_msg *tx_msg __free(kfree) =3D
		memdup_user(cmd_snd_rcv_rsp_info.tx_buf,
			    cmd_snd_rcv_rsp_info.tx_buf_sz);
	if (IS_ERR(tx_msg)) {
		err =3D PTR_ERR(tx_msg);
		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
		return err;
	}
    ...
}

If memdup_user() fails, it returns an error pointer (e.g., ERR_PTR(-ENOMEM)=
).

The function then checks IS_ERR(tx_msg) and returns early. Upon returning,
the compiler-generated scope cleanup will unconditionally invoke kfree(tx_m=
sg).

Because kfree() expects a valid kernel address or NULL, would dereferencing
the error pointer during page resolution trigger an immediate kernel panic?

This problem wasn't introduced by this patch, but it seems to be a regressi=
on.

Does this code dereference a user-space pointer directly without a copy?

In se_ioctl_cmd_snd_rcv_rsp_handler(), the user-supplied pointer
cmd_snd_rcv_rsp_info.tx_buf is passed directly to se_chk_tx_msg_hdr():

drivers/firmware/imx/se_ctrl.c:se_ioctl_cmd_snd_rcv_rsp_handler() {
    ...
	err =3D se_chk_tx_msg_hdr(priv, (struct se_msg_hdr *)cmd_snd_rcv_rsp_info.=
tx_buf);
	if (err) {
		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
		return err;
	}
    ...
}

Inside se_chk_tx_msg_hdr(), does the kernel directly dereference this user
pointer (such as header->size or header->tag) to validate its contents befo=
re
it has been safely copied into kernel memory?

Direct dereferencing of user space memory could cause an immediate fatal pa=
ge
fault if the page is unmapped, or a SMAP/PAN hardware exception on modern
architectures.

While this problem wasn't introduced by this patch, it appears to be a
regression.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/agv_jhP-2CNTfQXk@st=
anley.mountain?part=3D1
