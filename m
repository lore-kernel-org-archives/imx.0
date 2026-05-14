Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D42388E6E
	for <imx@lists.linux.dev>; Thu, 14 May 2026 17:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778781093; cv=none; b=nNaDjV8iX+g45Z2LJdZFV6LWmcAXkIDqH/Rx3Wv2kjTWvkus8+48YPcHhPo4mwgKvz1yllSbMP6TenjQG4bPa3G+NEgn+5a4OdSFv5gRUTYAwBYDG+Y1PGOy0SadijHDE+rwLLk8ZvbaMXHwX7PDR0d6B240XyEcDXfT98qKXxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778781093; c=relaxed/simple;
	bh=WKnWvxFnTyiQL+KDjiAi/V6FNaUtq/slHAeyYfWRa04=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=em0og7n7lm+bMEi2fkrc1EZRDW+TWsvIqTSIpNGINjC6vmdDH5kFnUCWq5GpyOjD1eVGr4teS6l1MakGY73rh3QpclaGvPQuFPr7OYcNKDxn0aZGfuSXP5WpkxdD2RstGlj7ilHsZukHY3xOblplIdiRSkShvy71mHiGpXLFjWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mfrluTcG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mfrluTcG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEF00C2BCB3;
	Thu, 14 May 2026 17:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778781093;
	bh=WKnWvxFnTyiQL+KDjiAi/V6FNaUtq/slHAeyYfWRa04=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=mfrluTcGepAHXV6GMjYHzBqd/F8mNpreSDZIYlFwRpoI2Ukq3dDcMAlJd8dGJ4m6V
	 fE0H1SOIH8XnvMG34tSzcgBjVU6JDdeqd15hQI7b0kCJXN3Yo/5MyKB57PNFyWxFNP
	 VJeULXevJnAnHcR7LzHIRNR58P+Olfs+Y/mnl/h8K7Rqy3Kz4FvIMN8aj8UDQ0q8Do
	 B26EIvwuZE0aFXDbbjrk44eYUwcNSjOR+xsR28lPurUfFP61uH8N39vG4gk3dT6h2T
	 qew09Aihr6HdeNncusdxi9CN3BSDIdm2e8vcC57NaKrYfURwI8mkrTXpnSBdwxtO9t
	 dHXsztpJJj/ow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH -next] firmware: imx: se_ctrl: fix init_device_context()
 error path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pankaj Gupta" <pankaj.gupta@nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260514090457.2186933-1-pankaj.gupta@nxp.com>
References: <20260514090457.2186933-1-pankaj.gupta@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 17:51:32 +0000
Message-Id: <20260514175132.EEF00C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Use-After-Free of `dev_ctx` during implicit `mutex_unlock` in `se_=
if_fops_close()`.
- [High] Data race and list corruption on `priv->dev_ctx_list` due to misma=
tched locks.
- [High] Permanent resource leak and Denial of Service (DoS) in `.release` =
handler due to interruptible locking.
- [High] Double free, list poisoning, and Use-After-Free vulnerabilities du=
ring driver unbind.
- [High] Use-After-Free of asynchronous mailbox messages in `se_if_fops_wri=
te()`.
- [High] Data race and memory leak in `se_ioctl()` `SE_IOCTL_ENABLE_CMD_RCV=
` command.
--

commit 9c0909012d811bb09f3480d4ef3613f8e888ad7a
Author: Pankaj Gupta <pankaj.gupta@nxp.com>
firmware: imx: se_ctrl: fix init_device_context() error path

This commit moves the addition of the new device context to the list=20
and the increment of the active count to the success path in=20
init_device_context(). It ensures that the insertion and count updates=20
are not left behind if init_se_shared_mem() fails.

Link: https://lore.kernel.org/oe-kbuild-all/202605090441.GzJS1R6y-lkp@intel=
.com/

> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> index f88e581fc147e..e68ad57c9073f 100644
> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c
> @@ -481,16 +481,17 @@ static int init_device_context(struct se_if_priv *p=
riv, int ch_id,
>  	dev_ctx->priv =3D priv;
>  	*new_dev_ctx =3D dev_ctx;
> =20
> -	list_add_tail(&dev_ctx->link, &priv->dev_ctx_list);
> -	priv->active_devctx_count++;
> -
>  	ret =3D init_se_shared_mem(dev_ctx);
>  	if (ret < 0) {
>  		kfree(dev_ctx->devname);
>  		kfree(dev_ctx);
>  		*new_dev_ctx =3D NULL;
> +		return ret;
>  	}
> =20
> +	list_add_tail(&dev_ctx->link, &priv->dev_ctx_list);

Can this list manipulation cause a data race and list corruption?=20
init_device_context() is called by se_if_fops_open() which holds the global=
=20
misc_dev_ctx->fops_lock to protect this list insertion. However,=20
se_if_fops_close() calls list_del(&dev_ctx->link) while holding only the=20
per-file lock dev_ctx->fops_lock:

drivers/firmware/imx/se_ctrl.c:se_if_fops_close() {
    ...
	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
        ...
		list_del(&dev_ctx->link);
        ...
}

If multiple files are closed concurrently, or an open and close happen at t=
he=20
same time, couldn't this corrupt the doubly linked list?

> +	priv->active_devctx_count++;
> +
>  	return ret;
>  }

This isn't a bug in the diff, but is there a use-after-free in=20
se_if_fops_close()?

drivers/firmware/imx/se_ctrl.c:se_if_fops_close() {
    ...
	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
        ...
		kfree(dev_ctx->devname);
		kfree(dev_ctx);
	}
    ...
}

Because scoped_cond_guard automatically calls mutex_unlock(&dev_ctx->fops_l=
ock)
when the scope block terminates, won't it unlock the mutex after=20
kfree(dev_ctx) has already freed the memory containing the lock?


This isn't a bug in the diff, but does the interruptible lock cause a=20
permanent memory leak and potential denial of service when closing the file?

drivers/firmware/imx/se_ctrl.c:se_if_fops_close() {
    ...
	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
        ...
		kfree(dev_ctx);
	}

	return 0;
}

If the calling process has a pending signal, the lock acquisition fails and=
=20
returns -EBUSY, skipping the kfree and DMA cleanup. Since the VFS ignores=20
the return value of the release handler and destroys the file unconditional=
ly,=20
does this permanently leak dev_ctx and its DMA memory, allowing an attacker=
=20
to exhaust system memory by repeatedly opening and forcefully closing the=20
device?


This isn't a bug in the diff, but could driver unbind cause a double free=20
or list poisoning?

During driver unbind, devres automatically frees the priv structure.=20
Then se_if_probe_cleanup() iterates over the list:

drivers/firmware/imx/se_ctrl.c:se_if_probe_cleanup() {
    ...
	if (priv->dev_ctx_mono_count) {
		list_for_each_entry_safe(dev_ctx, t_dev_ctx, &priv->dev_ctx_list, link) {
			list_del(&dev_ctx->link);
			priv->active_devctx_count--;
		}
	}
    ...
}

Since it removes the links but doesn't free dev_ctx or revoke open file=20
descriptors, if a userspace process later closes a surviving file descripto=
r,=20
won't se_if_fops_close() call list_del(&dev_ctx->link) again on the removed=
=20
node, and also dereference the already-freed dev_ctx->priv structure?


This isn't a bug in the diff, but is there a use-after-free for asynchronou=
s=20
mailbox messages?

In se_if_fops_write(), tx_msg is allocated and queued:

drivers/firmware/imx/se_ctrl.c:se_if_fops_write() {
    ...
		struct se_api_msg *tx_msg __free(kfree) =3D memdup_user(buf, size);
		if (IS_ERR(tx_msg))
			return PTR_ERR(tx_msg);
        ...
		err =3D ele_msg_send(dev_ctx, tx_msg, size);

		return err;
	}
}

The mailbox channel is non-blocking (priv->se_mb_cl.tx_block =3D false), so=
=20
the framework can queue the message pointer asynchronously. Because tx_msg=
=20
uses the __free(kfree) attribute, it is immediately freed upon returning.=20
When the mailbox controller processes the queue later, won't it read from=20
the freed memory?


This isn't a bug in the diff, but does SE_IOCTL_ENABLE_CMD_RCV have a data=
=20
race?

The command modifies the global driver state:

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
				priv->cmd_receiver_clbk_hdl.dev_ctx =3D dev_ctx;
    ...
}

Since this section is only protected by the per-file lock dev_ctx->fops_loc=
k,=20
if two processes invoke this ioctl concurrently, they hold different locks.=
=20
Can they both bypass the !priv->cmd_receiver_clbk_hdl.dev_ctx check, leadin=
g=20
to concurrent kzalloc allocations that overwrite the shared pointer and lea=
k=20
memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514090457.2186=
933-1-pankaj.gupta@nxp.com?part=3D1
