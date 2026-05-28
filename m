Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2341F3AFB18
	for <imx@lists.linux.dev>; Thu, 28 May 2026 09:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779961905; cv=none; b=Uonej5JQkCUsnbMPkFrhgpWcBHJmvnvTPNNytZr7vkS90E1SDno0Q5lZHgGY0CMPkXghk7ej8wmbl/v/dZNz/lcRybkoWA51qePJwcJfGGIdXKVfjzcdiorhcp5dkoL2LXSCr2EvETaphCwRvGO74/KlhFVoBbiS6Ce0HlA++YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779961905; c=relaxed/simple;
	bh=ed33ROXENTYQVVE+TyCtyi3+Y1SszncAieIl104D6aM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Wbmdy3jwIiM5/m//4sL4imM0jp/YvEosGhJHebRQ5qZg/NPOGGPn8EhIxMmZi0axjMhbSgyy6DG/VRL7cu3f2/UHPSkED9AP6Y/CP+F+LfzinwY/YIlk+0VBos6Sg0HU4HByjzTmMdWeNb3q4EEUQVnT2iHyIvH3DOVTc5ILjEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RWDXb4e0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RWDXb4e0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0CB61F000E9;
	Thu, 28 May 2026 09:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779961904;
	bh=EukwYpbBh7B4e+4OGDJxQJ8+oeQ3FDbv3bFdExHMoJ0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RWDXb4e0KQqtTRHS0EzQ9YyW7Y/hxYR9eIVb3wjl5ZtNgPfX07lfosI3gZo98Vz01
	 k9DKNtrdgDWX8ALp/QdjTjIOBrMJUDIlLVYXqUi8PAr+Z+lj3ijjKtjL/RDWUh/UjF
	 9b98hSRrMCMutU2hED2Zz1iOM+1wvQDdS2+NLLpch+wDkhp0S777Imo01Uuo+MGcXk
	 aVb77saMK3v94oDnrjEvO31hgnEOaB8IMiB1Mc1DUHFwGXH6f6uODku172W5Qlhf7u
	 KXdzyt8Ih4rpsMYa3HHhc0mwZ2SclNHOfeWPV/RBYU5FAxkFxz5CwV/0Wl6fjC1XU2
	 oU2yzS15e0LBA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH -next] firmware: imx: secure-enclave: prevent overflow
 in round_up() of iobuf length
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pankaj Gupta" <pankaj.gupta@nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260528091532.3331051-1-pankaj.gupta@nxp.com>
References: <20260528091532.3331051-1-pankaj.gupta@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 09:51:43 +0000
Message-Id: <20260528095143.D0CB61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [Medium] The proposed patch does not address any real bug; the added `(si=
ze_t)` cast is semantically redundant and functionally meaningless.

Pre-existing issues:
- [Critical] Direct dereference of user-space pointers causing SMAP panics =
and a TOCTOU vulnerability in `se_ioctl_cmd_snd_rcv_rsp_handler` and `se_if=
_fops_write`.
- [High] User-controlled buffer size is passed to `kzalloc` without bounds =
checking in `se_ioctl_cmd_snd_rcv_rsp_handler`.
- [Medium] Error paths in `se_ioctl_setup_iobuf_handler` fail to rollback t=
he shared memory pool position pointer, leading to memory exhaustion for th=
e file descriptor.
- [Low] The error path for `add_b_desc_to_pending_list` in `se_ioctl_setup_=
iobuf_handler` is missing an early return, causing it to incorrectly copy s=
tate back to userspace on failure.
--

commit bbd807b9a739aa9d518e60b1b997831f480b787f
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

firmware: imx: secure-enclave: prevent overflow in round_up() of iobuf leng=
th

This commit attempts to fix an integer overflow before calling round_up() by
adding an explicit cast to size_t. It claims that on 32-bit architectures,
the internal addition in round_up(io.length, 8) can overflow if io.length
is near SIZE_MAX.

Closes: https://sashiko.dev/#/patchset/20260514090321.2186877-1-pankaj.gupt=
a@nxp.com?part=3D

> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> index 9327d47e4312e..71c71115f8eeb 100644
> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c
> @@ -670,7 +670,7 @@ static int se_ioctl_setup_iobuf_handler(struct se_if_=
device_ctx *dev_ctx,
>  		goto copy;
>  	}
> =20
> -	if (io.length > SIZE_MAX - 7) {
> +	if ((size_t)io.length > SIZE_MAX - 7) {

[Severity: Medium]
Does this explicit cast actually change the behavior?

Since io.length is unsigned, any value that could cause an overflow (like
0xFFFFFFFF on a 32-bit architecture) is already strictly greater than
SIZE_MAX - 7 (which is 0xFFFFFFF8).

The bounds check was already properly triggering without this change.

>  		dev_err(dev_ctx->priv->dev, "%s: Invalid buffer length.",
>  			dev_ctx->devname);
>  		return -EINVAL;


[Severity: Critical]
This is a pre-existing issue, but can we safely pass user pointers directly=
 to
se_chk_tx_msg_hdr()?

In se_ioctl_cmd_snd_rcv_rsp_handler(), cmd_snd_rcv_rsp_info.tx_buf is a user
pointer cast directly to a struct:

drivers/firmware/imx/se_ctrl.c:se_ioctl_cmd_snd_rcv_rsp_handler() {
...
	err =3D se_chk_tx_msg_hdr(priv, (struct se_msg_hdr *)cmd_snd_rcv_rsp_info.=
tx_buf);
...
}

And similarly in se_if_fops_write():

drivers/firmware/imx/se_ctrl.c:se_if_fops_write() {
...
	err =3D se_chk_tx_msg_hdr(priv, (struct se_msg_hdr *)buf);
...
}

Does this cause an immediate panic on architectures with SMAP/PAN enabled s=
ince
we are directly dereferencing a __user pointer without using copy_from_user=
()?

Additionally, does this introduce a time-of-check to time-of-use (double fe=
tch)
vulnerability, since a malicious thread can modify the payload immediately
after validation but before it is copied to kernel memory?


[Severity: High]
This is a pre-existing issue, but does this allocation require an upper bou=
nds
check?

drivers/firmware/imx/se_ctrl.c:se_ioctl_cmd_snd_rcv_rsp_handler() {
...
	struct se_api_msg *rx_msg __free(kfree) =3D
		kzalloc(cmd_snd_rcv_rsp_info.rx_buf_sz, GFP_KERNEL);
...
}

Since cmd_snd_rcv_rsp_info.rx_buf_sz comes directly from userspace, can an
unprivileged user pass an extremely large value to trigger an allocation
failure and potentially cause a local denial of service?


[Severity: Medium]
This is a pre-existing issue, but does this error path permanently exhaust
memory for the file descriptor?

drivers/firmware/imx/se_ctrl.c:se_ioctl_setup_iobuf_handler() {
...
	/* Allocate space in shared memory. 8 bytes aligned. */
	pos =3D shared_mem->pos;
	shared_mem->pos +=3D aligned_len;
	io.ele_addr =3D (u64)shared_mem->dma_addr + pos;

	memset(shared_mem->ptr + pos, 0, io.length);
	if ((io.flags & SE_IO_BUF_FLAGS_IS_INPUT) ||
	    (io.flags & SE_IO_BUF_FLAGS_IS_IN_OUT)) {
		/*
		 * buffer is input:
		 * copy data from user space to this allocated buffer.
		 */
		if (copy_from_user(shared_mem->ptr + pos, io.user_buf, io.length)) {
			dev_err(dev_ctx->priv->dev,
				"%s: Failed copy data to shared memory.",
				dev_ctx->devname);
			return -EFAULT;
		}
	}
...
}

If copy_from_user() or add_b_desc_to_pending_list() fails, the function
returns an error but shared_mem->pos is not decremented. Could a malicious
user repeatedly trigger these errors to drain the shared memory pool?


[Severity: Low]
This is a pre-existing issue, but is the function incorrectly copying state
back to userspace when add_b_desc_to_pending_list() fails?

drivers/firmware/imx/se_ctrl.c:se_ioctl_setup_iobuf_handler() {
...
	err =3D add_b_desc_to_pending_list(shared_mem->ptr + pos, &io, dev_ctx);
	if (err < 0)
		dev_err(dev_ctx->priv->dev, "%s: Failed to allocate/link b_desc.",
			dev_ctx->devname);

copy:
	/* Provide the EdgeLock Enclave address to user space only if success.*/
	if (copy_to_user(uarg, &io, sizeof(io))) {
...
}

When add_b_desc_to_pending_list() fails, execution falls through to the copy
label instead of returning early. Doesn't this directly contradict the inli=
ne
comment about providing the address only on success?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528091532.3331=
051-1-pankaj.gupta@nxp.com?part=3D1
