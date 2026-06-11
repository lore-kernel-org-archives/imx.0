Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE88B3C0617
	for <imx@lists.linux.dev>; Thu, 11 Jun 2026 10:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781174222; cv=none; b=R59e6jYmcNrxi+W1Tjx+z/0XIQ5xi4h/MsXUHjgVLnjWvPywjTHLU0jNcPSH3J1/Ohm4jTCfEuA8poAtbfgRvAgO4KVjC5OBiaF4ccTY8VVqkhUD38NdN/1TABvy9WtDSOKwZmNXpAQF7xNmu08HRiMd6Nq2DOKW02tzZo3gvZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781174222; c=relaxed/simple;
	bh=7SgndWqdGP/U7Z6gN9eb6TJmIF02elA2ImksNPz7r8s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rbB5+zdRZzJEJPbPGvozPDlgaP33Edf9o2sY4atE8aJEFARddEIU4oorGLSFIeEYv/aUQdTKdjEm54b9yLmZbpWFCJOn+5mhpIRx4vZqDf1Vv5c+2ZrwnNYTql0H3BBaFB2gH7lszyCU0PdUp/o+Yz5Z51lmT0dpRkRWh76FhBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F38zdgyh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F38zdgyh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A9DB1F00893;
	Thu, 11 Jun 2026 10:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781174221;
	bh=OKU4jnnErB8yIW5zFPrTRwqvHAtTNrUncf0LNogpbZY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F38zdgyhAevipVbeuQVjP7Wa9h0TWRBwkpz0Q+ZEXEQh+6k8OZg+FVP3K5kRs6RoT
	 c84U5dcS+trBQCMlm19BBUJNJ9i64AzRjq6Dryrq6nhjEPTGN2tdKGMtZDawLkuQAF
	 SzeZs6MjNJ02jfa04wWZM2SaMYJe+vCoPGKyWwhyd4BMwg4gyte5zkA+zobFXtThuj
	 R7lF+3L7aUNIX5v2RsOlYyTaVgEepH18Vic/OfG+EeQBy0zfDMCXvIHB7zvh64Qevy
	 +5XMPshJgfA9NOeEYGSyYazb/sNgbn6kO/N7IJgh9iQEyt8HqDUje1rwefuAXhVy/z
	 6oy3HI2BKXOwA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH -next] firmware: imx: se_ctrl: roll back iobuf
 reservation on setup failure
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260611154232.3184266-1-pankaj.gupta@oss.nxp.com>
References: <20260611154232.3184266-1-pankaj.gupta@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 10:37:00 +0000
Message-Id: <20260611103701.2A9DB1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Integer overflow in `round_up()` calculation bypasses bounds c=
hecks on 32-bit architectures
- [Critical] Use-after-free (UAF) due to implicit mutex_unlock on freed mem=
ory in se_if_fops_close()
- [High] Permanent resource leak if a signal is pending during se_if_fops_c=
lose()
- [High] List corruption due to improper locking of priv->dev_ctx_list
- [High] Unbounded user-controlled allocation size triggers kernel warning
--

commit 4eb035f3a88362d9a0713a5420bbd761a12dcf45
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

firmware: imx: se_ctrl: roll back iobuf reservation on setup failure

This commit fixes a resource leak in the iobuf setup handler where shared
memory reservations were permanently consumed upon failures in user data
copying or descriptor linking. It rolls back the shared memory position
and unlinks the descriptor appropriately.

Link: https://sashiko.dev/#/patchset/20260528091532.3331051-1-pankaj.gupta@=
nxp.com?part=3D1

> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> index 8fab3b7767b7a..f3ac3487e56b1 100644
> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c
[ ... ]
> @@ -641,7 +641,8 @@ static int se_ioctl_setup_iobuf_handler(struct se_if_=
device_ctx *dev_ctx,
>  {
>  	struct se_shared_mem *shared_mem =3D NULL;
>  	struct se_ioctl_setup_iobuf io =3D {0};
> -	size_t aligned_len;
> +	struct se_buf_desc *b_desc =3D NULL;
> +	size_t aligned_len =3D 0;

[Severity: Critical]
This isn't a bug introduced by this patch, but in se_ioctl_setup_iobuf_hand=
ler()
is there a risk of integer overflow when calculating the aligned length?

drivers/firmware/imx/se_ctrl.c:se_ioctl_setup_iobuf_handler() {
    ...
    aligned_len =3D round_up((size_t)io.length, 8);
    ...
}

On 32-bit architectures, size_t is 32-bit. Passing a value near the maximum
32-bit integer (e.g., 0xfffffff9) causes the round_up calculation to overfl=
ow
to 0. Consequently, aligned_len becomes 0, and the bounds check:

    if (shared_mem->size < shared_mem->pos ||
        aligned_len > (shared_mem->size - shared_mem->pos)) {
        ...
    }

incorrectly passes. The code then executes:

    memset(shared_mem->ptr + pos, 0, io.length);

unconditionally writing almost 4GB of zeroes and user data into kernel memo=
ry.
Can this lead to severe memory corruption triggered by any unprivileged user
with access to the device node?


Additional pre-existing issues found in this file:

[Severity: Critical]
This isn't a bug introduced by this patch, but in se_if_fops_close() could
there be a use-after-free due to the implicit mutex unlock?

drivers/firmware/imx/se_ctrl.c:se_if_fops_close() {
    ...
    scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
        ...
        kfree(dev_ctx);
    }
    ...
}

Inside this scope, the dev_ctx object is freed via kfree(dev_ctx). When the
scope ends, the guard's implicit destructor invokes
mutex_unlock(&dev_ctx->fops_lock). Since the structure containing the mutex
has already been freed, does this execute a lock operation on freed memory?


[Severity: High]
This isn't a bug introduced by this patch, but in se_if_fops_close() is the=
re
a permanent resource leak if a signal is pending?

drivers/firmware/imx/se_ctrl.c:se_if_fops_close() {
    ...
    scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
    ...
}

Because se_if_fops_close() is the release file operation, it attempts to
acquire its lock using scoped_cond_guard which can fail if a signal is
pending. If the calling process has a pending signal, the lock acquisition
immediately fails and returns -EBUSY.

Since the virtual file system ignores the return value of release() and
unconditionally destroys the file descriptor, is the cleanup code permanent=
ly
skipped, leaving dev_ctx orphaned but still linked in the global
priv->dev_ctx_list?


[Severity: High]
This isn't a bug introduced by this patch, but is there a risk of list
corruption due to improper locking of priv->dev_ctx_list?

drivers/firmware/imx/se_ctrl.c:init_device_context() {
    ...
    list_add_tail(&dev_ctx->link, &priv->dev_ctx_list);
    ...
}

drivers/firmware/imx/se_ctrl.c:se_if_fops_close() {
    ...
    list_del(&dev_ctx->link);
    ...
}

In init_device_context(), the list and priv->active_devctx_count are modifi=
ed
without any locks. However, in se_if_fops_close(), the code modifies them
while holding only the per-file dev_ctx->fops_lock.

If multiple processes open or close different file descriptors concurrently,
can they execute list modifications without mutual exclusion against each
other, potentially causing list corruption?


[Severity: High]
This isn't a bug introduced by this patch, but in
se_ioctl_cmd_snd_rcv_rsp_handler() is it safe to use an unvalidated user
size for kzalloc?

drivers/firmware/imx/se_ctrl.c:se_ioctl_cmd_snd_rcv_rsp_handler() {
    ...
    struct se_api_msg *rx_msg __free(kfree) =3D
        kzalloc(cmd_snd_rcv_rsp_info.rx_buf_sz, GFP_KERNEL);
    ...
}

The cmd_snd_rcv_rsp_info.rx_buf_sz is copied directly from user space witho=
ut
an upper bound check. If a user provides a negative value or a very large
size exceeding the maximum allocation size, will passing it to kzalloc trig=
ger
a page allocation failure warning in the slab allocator?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611154232.3184=
266-1-pankaj.gupta@oss.nxp.com?part=3D1
