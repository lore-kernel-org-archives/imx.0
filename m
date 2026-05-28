Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732103B636B
	for <imx@lists.linux.dev>; Thu, 28 May 2026 09:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779962349; cv=none; b=diTHCYDRDFwbkY7YKxhz7Eq4kRcgKnIGvfckKyeXnz4SbAOyE6F/m5SXiXT2zS7nT4Bt2ZQ4yIuA3o4uLRSAPEE0ODUyHEqI69+OyJDHNBJCFGhNsTLKGPKd55o8g37qz9OXqHyB1MX2QWmtiLfPIrUNGpDsmNrsMFrHRmh6PaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779962349; c=relaxed/simple;
	bh=1SZIWp1AdMHpjEJvLdTEqiDw5su5e6XhyFTDhi1keqE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EcotmRn6pilvP/ZRHmviXYpD7WVQYJFLP1LB9ExUaO5ETMzV+SlSgVWWS9TF5vy2cpbo70wAPHYXvvuykffrr69GFrgcvKxR82OjSBpRS6wpoIYMF+W+MgeYSFKRF87inSS0c+gBXofBMcXyykMAjVyFofd29bC4f2Sg4u1yj4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dznkoiRF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dznkoiRF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85F911F00A3C;
	Thu, 28 May 2026 09:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779962341;
	bh=l3xw27i3ymAep2egsoO1Mj7u5w7/uYNyE9SRWYoAGp4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dznkoiRF8w61RbL4ShW7qRU5L2k1Q6y9MvjjPp67FJnFQkY42aJwK9+Q/sZnw2dZb
	 6TAb12CDT2PsbXEn7Ao84iyA7rGpdT650telk9MQUQ6uTaa93dGSdmTq/wx/Uf5Fdw
	 35i9PU91wqEOAFddWoJ1kn6ciffqy5j5RciYYhbefq73X2GGBCulLi6T0K1ja/9E+Y
	 A496VpZklRjjWCKk+tLGMsDd/T8FmSbGdhVTB01ehrHke/dqvBXehViOIof6NONjp3
	 7F5PRWBWi/datctOBKZwfww+GcD7JXqsupu9071Qa9Jarh4xrAmhCQ5vwipY52n9sO
	 1lA/cP4cPVBhw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH -next] firmware: imx: se_ctrl: serialize command
 receiver registration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pankaj Gupta" <pankaj.gupta@nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260528091634.3331090-1-pankaj.gupta@nxp.com>
References: <20260528091634.3331090-1-pankaj.gupta@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 09:59:01 +0000
Message-Id: <20260528095901.85F911F00A3C@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

New issues:
- [Medium] Acquiring two mutexes of the same lock class without nested lock=
ing primitives triggers a lockdep warning.
- [Low] Placing a label at the end of a compound statement inside a `scoped=
_guard` causes a build breakage.

Pre-existing issues:
- [Critical] The hardware mailbox receive callback dereferences receiver st=
ate without validation or locks, causing panics on unexpected messages.
- [Critical] A missing `else` block causes bounds check capping to be immed=
iately overwritten, leading to a heap buffer overflow.
- [High] Incomplete locking leaves a race condition between receiver regist=
ration and deregistration, leading to a Use-After-Free and list corruption.
- [High] The per-file `dev_ctx` is freed while its `fops_lock` is still hel=
d by `scoped_cond_guard()`, causing a UAF upon scope exit.
- [High] Using an interruptible lock in the `.release` file operation allow=
s it to fail silently, permanently leaking resources.
--

commit 8ac1aa6f680ca2f1601120862da0213321d4329f
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

firmware: imx: se_ctrl: serialize command receiver registration

This commit addresses a race condition in SE_IOCTL_ENABLE_CMD_RCV where
concurrent ioctls from different file descriptors could register multiple
receivers against the same priv instance. It attempts to serialize this by
acquiring the global priv->priv_dev_ctx->fops_lock.

Link: https://sashiko.dev/#/patchset/20260514090457.2186933-1-pankaj.gupta@=
nxp.com?part=3D1

> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> index 9327d47e4312e..6cd3a987aa742 100644
> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c
> @@ -915,21 +915,22 @@ static long se_ioctl(struct file *fp, unsigned int =
cmd, unsigned long arg)
>  	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
>  		switch (cmd) {
>  		case SE_IOCTL_ENABLE_CMD_RCV:
> -			if (!priv->cmd_receiver_clbk_hdl.dev_ctx) {
> +			scoped_guard(mutex, &priv->priv_dev_ctx->fops_lock) {

[Severity: Medium]
Will this trigger a lockdep warning? We are acquiring
priv->priv_dev_ctx->fops_lock while already holding dev_ctx->fops_lock.
Because both mutexes belong to struct se_if_device_ctx and are initialized
at the same time, they share the same lockdep lock class. Might this cause
a "possible recursive locking detected" splat?

[Severity: High]
This is a pre-existing issue, but I noticed that this locking only protects
the registration side. In se_if_fops_close(), the receiver is deregistered
while only holding the per-file dev_ctx->fops_lock:

drivers/firmware/imx/se_ctrl.c:se_if_fops_close() {
    scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
        if (priv->cmd_receiver_clbk_hdl.dev_ctx =3D=3D dev_ctx) {
            priv->cmd_receiver_clbk_hdl.dev_ctx =3D NULL;
            kfree(priv->cmd_receiver_clbk_hdl.rx_msg);
            priv->cmd_receiver_clbk_hdl.rx_msg =3D NULL;
        }
        ...
}

Because se_if_fops_close() does not acquire priv->priv_dev_ctx->fops_lock,
could a concurrent ioctl() and close() on different file descriptors race,
leading to a use-after-free if close() frees the newly allocated rx_msg?

>  				if (priv->cmd_receiver_clbk_hdl.dev_ctx) {
> -					priv->cmd_receiver_clbk_hdl.rx_msg =3D
> -						kzalloc(MAX_NVM_MSG_LEN,
> -							GFP_KERNEL);
> -					if (!priv->cmd_receiver_clbk_hdl.rx_msg) {
> -						err =3D -ENOMEM;
> -						break;
> -					}
> +					err =3D -EBUSY;
> +					goto out_enable_cmd_rcv;
> +				}
> +				priv->cmd_receiver_clbk_hdl.rx_msg =3D
> +								kzalloc(MAX_NVM_MSG_LEN,
> +									GFP_KERNEL);
> +				if (!priv->cmd_receiver_clbk_hdl.rx_msg) {
> +					err =3D -ENOMEM;
> +					goto out_enable_cmd_rcv;
>  				}
>  				priv->cmd_receiver_clbk_hdl.rx_msg_sz =3D MAX_NVM_MSG_LEN;
>  				priv->cmd_receiver_clbk_hdl.dev_ctx =3D dev_ctx;
>  				err =3D 0;
> -			} else {
> -				err =3D -EBUSY;
> +out_enable_cmd_rcv:
>  			}

[Severity: Low]
Does this label cause a build breakage? The label out_enable_cmd_rcv: is
placed immediately before the closing brace of the scoped_guard compound
statement. In C (prior to C23), a label must precede a statement and cannot
be attached directly to a closing brace.

[ ... ]

While looking at this code, I also noticed a few other pre-existing issues =
in
the surrounding functions:

[Severity: High]
This is a pre-existing issue, but could the lock usage in se_if_fops_close()
lead to a use-after-free and memory leaks?

drivers/firmware/imx/se_ctrl.c:se_if_fops_close() {
    scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
        ...
        kfree(dev_ctx);
    }
    return 0;
}

When the scope ends, the implicit cleanup function calls mutex_unlock() on
dev_ctx->fops_lock, but dev_ctx has already been freed. Will this cause
memory corruption on every close?

Additionally, se_if_fops_close() is the VFS .release handler. It uses an
interruptible lock acquisition, which can fail and return -EBUSY if the task
has a pending signal. Since the VFS layer ignores the return value of
.release and destroys the file regardless, will failing to acquire this lock
permanently leak the dev_ctx memory and leave dangling pointers in
priv->dev_ctx_list?

[Severity: Critical]
This is a pre-existing issue, but I noticed a potential null pointer
dereference and a buffer overflow in the hardware mailbox receive callback:

drivers/firmware/imx/ele_common.c:se_if_rx_callback() {
    ...
    if (header->tag =3D=3D priv->if_defs->cmd_tag) {
        se_clbk_hdl =3D &priv->cmd_receiver_clbk_hdl;
        dev_dbg(dev, "Selecting cmd receiver:%s for mesg header:0x%x.",
            se_clbk_hdl->dev_ctx->devname,  *(u32 *)header);

If no receiver is registered, se_clbk_hdl->dev_ctx and se_clbk_hdl->rx_msg
will be NULL. Will this cause a kernel panic when devname is dereferenced?

Later in the same block:

        if (rx_msg_sz > MAX_NVM_MSG_LEN) {
            dev_err(dev,
                "%s: CMD-RCVER NVM: hdr(0x%x) with different sz(%d !=3D %d)=
.\n",
                se_clbk_hdl->dev_ctx->devname, *(u32 *)header,
                rx_msg_sz, se_clbk_hdl->rx_msg_sz);

            se_clbk_hdl->rx_msg_sz =3D MAX_NVM_MSG_LEN;
        }
        se_clbk_hdl->rx_msg_sz =3D rx_msg_sz;
        ...
    }
    ...
    memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);

Because there is no else block after the size check, the bounded value
MAX_NVM_MSG_LEN is immediately overwritten with the original out-of-bounds
rx_msg_sz. Will this cause a severe heap buffer overflow when memcpy() is
called using the unbounded size?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528091634.3331=
090-1-pankaj.gupta@nxp.com?part=3D1
