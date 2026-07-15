Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD773AF641;
	Wed, 15 Jul 2026 17:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784137011; cv=none; b=qZitxz4x2ee4uwkPq0asdSPn85TzcjADNRj+r5X6d37V55zADRPAxy2bBNWSgNGgXcLW8dITEs8wXDz0t7s1W+bQRf+ONZTcyFwhJ0csz/FovTbzUc0rWQfqcbR2CtyYEnFxmzsTwDIQaSWXrT07GX/A5yrf8lnYvdwxy0w8MUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784137011; c=relaxed/simple;
	bh=bH4L1v3KHe8BMx3tc3m2InmzIenvEmGsIIaTtz1ZJrA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NCDfzQeaWd6G/ea8LdNaSpH5PPIFUwnArcih9GTkqLltBkMlP2jg6KPTAZxJ25AXfSBWtJnyRUFbZBMEP+sAZmJazKulb34zJU/EFHUiguWpeEh1mR9+Tcoxalfwd87DO/dVIlSeRKCvZf6AhCEZu3t6oMlu2evyhm1GKKCC/8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j96ry+HQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j96ry+HQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6C7C1F000E9;
	Wed, 15 Jul 2026 17:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784137009;
	bh=jCgcXk21wwWjKVj1M+8dskbrq41++V4aF4ALs8d781U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j96ry+HQZ4XrELpOHryakqSMVbNhB3ZKGdVt5hXtqa/OROkLYxIHqk/OuO9O6swpn
	 9418JWZZssFI3ltzIHMWAlAkQeJzFCdFmxM/TiNEOty0A2G2dCw2m3sFH+u6EIT+cV
	 r8Y3Ym2tlLe/EEePqFAgL7Zf9z7pYpulnYtX98KgoBi8Fu2BqIY89L3wGRAoET9+IH
	 zJE74mxIcyZtm9Qqa2CK/2vuSItmni1E2eTCVe0Q81Wu6A4J4AQvuLJz2Y+FU+bnr7
	 h3Pn/8O5jadFesX48oIysjk4xiCyPxrrL1PwmDS8RxPiJinz0/FXxpNlSXfGptcglI
	 OXbya2ob2GJfA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v27 5/7] firmware: drivers: imx: adds miscdev
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260715-imx-se-if-v27-5-bb7c45952f06@nxp.com>
References: <20260715-imx-se-if-v27-0-bb7c45952f06@nxp.com>
 <20260715-imx-se-if-v27-5-bb7c45952f06@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 17:36:48 +0000
Message-Id: <20260715173648.D6C7C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 13 potential issue=
(s) to consider:
- [High] The `read()` path drops `fops_lock` and `clbk_rx_lock` before acce=
ssing shared lists and `rx_msg`, leading to Use-After-Free and list corrupt=
ion.
- [High] KASAN slab-out-of-bounds read in `se_val_rsp_hdr_n_status` due to =
insufficient response buffer size validation.
- [High] Indefinite hang during module unload or device unbind when userspa=
ce is blocked in `SE_IOCTL_CMD_SEND_RCV_RSP`.
- [High] Hung task panic triggered by signal interruption during long firmw=
are waits in `ele_msg_rcv()`.
- [High] The `SE_IOCTL_CMD_SEND_RCV_RSP` ioctl silently swallows kernel-lev=
el validation errors, returning success to userspace.
- [High] Memory leak of dynamically allocated `se_buf_desc` structures when=
 a device fd is closed without cleaning up pending buffers.
- [High] IOCTL error path zeroes out shared DMA memory buffers while the fi=
rmware might still be actively accessing them due to a timeout.
- [High] Fatal kernel crash during probe failure due to `dma_free_coherent`=
 on an uninitialized pointer for the internal device context.
- [High] Unsynchronized clearing of `rx_msg_sz` in `se_if_fops_read()` caus=
es lost commands and `-ENODEV` when interrupted by a signal.
- [High] TOCTOU race during device context creation in `open()` against unb=
ind cleanup allows file operations on an unbound driver.
- [High] Race window during driver unbind between `cancel_work_sync()` and =
`se_clear_fw_busy()` allows work scheduling on freed memory.
- [Medium] Race condition exposing device node before probe initialization =
completes.
- [Medium] Mixing `goto`-based error handling with scope-based cleanup (`__=
free` and `guard`) violates kernel cleanup rules.
--

--- Patch [5]: [PATCH v27 5/7] firmware: drivers: imx: adds miscdev ---
commit 688f25f20d4d627be6c43a2c0f20ff6e2aa34b78
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

firmware: drivers: imx: adds miscdev

Adds the driver for communication interface to secure-enclave, that
enables exchanging messages with NXP secure enclave HW IP(s)
like EdgeLock Enclave, from User-Space Applications via character driver.

Link: https://lkml.kernel.org/r/20260629-imx-se-if-v26-0-146446285744@nxp.c=
om?part=3D5

> diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele=
_common.c
> index 955b7409ff9fc..7deff38c46132 100644
> --- a/drivers/firmware/imx/ele_common.c
> +++ b/drivers/firmware/imx/ele_common.c
> @@ -67,6 +122,9 @@ int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, stru=
ct se_clbk_handle *se_clbk
>  			 * synchronized state.
>  			 */
>  			if (READ_ONCE(priv->waiting_rsp_clbk_hdl.dev_ctx)) {
> +				if (!is_rsp_wait_with_timeout)
> +					return ret;
> +
>  				WRITE_ONCE(se_clbk_hdl->signal_rcvd, true);
>  				wait_uninterruptible =3D true;
>  				continue;

[Severity: High]
Can this sequence trigger a hung task panic on systems with the hung task
watchdog enabled?=20

In ele_msg_rcv(), if a signal interrupts the wait, the code sets=20
wait_uninterruptible =3D true and continues waiting. Since the timeout for
a standard command response is set to 5000 seconds, wouldn't waiting in
TASK_UNINTERRUPTIBLE for this long reliably crash the system?

> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> index 25f9cd5441f90..fb82df5c58d56 100644
> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c
> @@ -197,11 +204,234 @@ static int get_se_soc_info(struct se_if_priv *priv=
, const struct se_soc_info *se
>  	return 0;
>  }
> =20
> +static void cleanup_se_shared_mem(struct se_if_device_ctx *dev_ctx)
> +{
> +	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt =3D &dev_ctx->se_sha=
red_mem_mgmt;
> +	struct se_if_priv *priv =3D dev_ctx->priv;
> +
> +	/* Free non-secure shared buffer. */
> +	dma_free_coherent(priv->dev, MAX_DATA_SIZE_PER_USER,
> +			  se_shared_mem_mgmt->non_secure_mem.ptr,
> +			  se_shared_mem_mgmt->non_secure_mem.dma_addr);

[Severity: High]
Could this leak memory by failing to free the se_buf_desc items in the
pending_in and pending_out lists when the device file descriptor is closed?

[Severity: High]
Can this cause a kernel crash during probe failure?=20

If an internal command times out during probe, the internal context=20
priv_dev_ctx might be marked fw_busy before shared memory is allocated=20
(ptr is NULL).=20

Calling dma_free_coherent() with a NULL pointer and a size of 65536 bytes=20
could trigger a bug in the DMA subsystem.

> +static void se_dev_ctx_shared_mem_cleanup(struct se_if_device_ctx *dev_c=
tx)
> +{
> +	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt =3D &dev_ctx->se_sha=
red_mem_mgmt;
> +	struct list_head *pending_lists[] =3D {&se_shared_mem_mgmt->pending_in,
> +						&se_shared_mem_mgmt->pending_out};
> +	struct se_buf_desc *b_desc, *temp;
> +	int i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(pending_lists); i++) {
> +		list_for_each_entry_safe(b_desc, temp, pending_lists[i], link) {
> +			if (b_desc->shared_buf_ptr)
> +				memset(b_desc->shared_buf_ptr, 0, b_desc->size);

[Severity: High]
Does this zero out the shared DMA memory buffers while the firmware might
still be actively accessing them?=20

If ele_msg_send_rcv() times out, this cleanup is called on the error path.=
=20
Modifying active DMA buffers or reusing them for the next command could=20
corrupt firmware execution.

> +static void cleanup_dev_ctx(struct se_if_device_ctx *dev_ctx, bool is_fc=
lose)
> +{
> +	scoped_guard(mutex, &dev_ctx->fops_lock) {
> +		if (dev_ctx->cleanup_done)
> +			goto exit;

[Severity: High]
Can this cause an indefinite hang during unbind?=20

If userspace is blocked in ele_msg_rcv() waiting for a firmware response,=20
it holds fops_lock via scoped_cond_guard in se_ioctl(). This cleanup path=20
uninterruptibly blocks trying to acquire the same fops_lock, deadlocking=20
the unbind thread until the firmware replies or the timeout expires.

[Severity: Medium]
Does this violate the kernel cleanup subsystem rules?=20

Using a goto to jump completely out of a scoped_guard() block creates=20
confusing ownership semantics and can lead to bugs. The same issue appears=
=20
in ele_get_info() with __free(kfree).

> +static int se_ioctl_cmd_snd_rcv_rsp_handler(struct se_if_device_ctx *dev=
_ctx,
> +					    void __user *uarg)
> +{
[ ... ]
> +	if (cmd_snd_rcv_rsp_info.rx_buf_sz < sizeof(struct se_msg_hdr) ||
> +	    cmd_snd_rcv_rsp_info.rx_buf_sz > MAX_ALLOWED_RX_MSG_SZ) {
> +		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
> +		return -EINVAL;
> +	}

[Severity: High]
Does this validation allow a user to allocate an rx_msg buffer of exactly
4 bytes?=20

In se_val_rsp_hdr_n_status(), msg->data[0] (bytes 4-7) is unconditionally=20
read. If the command bypasses size-mismatch validation (like=20
ELE_DEBUG_DUMP_REQ), this could cause a KASAN out-of-bounds read.

> +	rsp_status_err =3D
> +		se_val_rsp_hdr_n_status(priv, rx_msg, tx_msg->header.command,
> +					cmd_snd_rcv_rsp_info.rx_buf_sz,
> +					tx_msg->header.ver =3D=3D priv->if_defs->base_api_ver);
> +
> +	if (!rsp_status_err) {
> +		err =3D se_dev_ctx_cpy_out_data(dev_ctx);
> +		if (err < 0) {
> +			se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
> +			return err;
> +		}
> +	}

[Severity: High]
Is there a missing assignment to err here?=20

If se_val_rsp_hdr_n_status() fails, rsp_status_err is populated but never=20
assigned to err. The function falls through and returns the positive succes=
s=20
byte count from ele_msg_send_rcv(), silently swallowing the validation erro=
r=20
and misleading userspace.

> +static ssize_t se_if_fops_read(struct file *fp, char __user *buf, size_t=
 size,
> +			       loff_t *ppos)
> +{
[ ... ]
> +	/* We may need to copy the output data to user before
> +	 * delivering the completion message.
> +	 */
> +	err =3D se_dev_ctx_cpy_out_data(dev_ctx);
> +	if (err < 0)
> +		goto exit;

[Severity: High]
Can this result in a use-after-free and list corruption?=20

The fops_lock is dropped before the blocking wait in ele_msg_rcv(). When=20
resuming, this code unconditionally accesses the pending_in and pending_out=
=20
lists in se_dev_ctx_cpy_out_data() without reacquiring fops_lock. If the=20
device was closed concurrently, the DMA memory and rx_msg could already be=
=20
freed.

> +exit:
> +	priv->cmd_receiver_clbk_hdl.rx_msg_sz =3D 0;
> +	se_dev_ctx_shared_mem_cleanup(dev_ctx);
> +
> +	return err;
> +}

[Severity: High]
Does clearing rx_msg_sz locklessly here cause lost firmware commands?=20

If the wait in ele_msg_rcv() is interrupted by a signal, this jumps to exit=
=20
and clears the size. If a mailbox interrupt concurrently receives a message=
=20
and sets the size, this will overwrite it with 0. When userspace restarts=20
the read(), it will reject the valid message because rx_msg_sz is 0.

> +static int se_if_fops_open(struct inode *nd, struct file *fp)
> +{
[ ... ]
> +	if (misc_dev_ctx->cleanup_done) {
> +		err =3D -ENODEV;
> +		goto out_unlock_misc;
> +	}
> +
> +	priv->dev_ctx_mono_count++;
> +	err =3D init_device_context(priv, priv->dev_ctx_mono_count, &dev_ctx);

[Severity: High]
Is there a TOCTOU race here against unbind cleanup?=20

The fops_lock is dropped right after checking cleanup_done, but before=20
init_device_context() adds the new context to dev_ctx_list under modify_loc=
k.=20
If se_if_probe_cleanup() runs in between, it could unbind the driver,=20
resulting in open() returning a file descriptor for a fully unbound device.

> +static void se_if_probe_cleanup(void *plat_dev)
> +{
[ ... ]
> +	cancel_work_sync(&priv->fw_busy_work);
> +	/*
> +	 * A timed-out synchronous command may have retained a dev_ctx through
> +	 * priv->fw_busy_dev_ctx even after the fd was closed and the context w=
as
> +	 * removed from dev_ctx_list. If no late response arrived, release that
> +	 * retained context during driver teardown.
> +	 *
> +	 * se_clear_fw_busy() is idempotent and internally checks
> +	 * priv->fw_busy_dev_ctx under fw_busy_lock.
> +	 */
> +	se_clear_fw_busy(priv);

[Severity: High]
Could this race with a late mailbox interrupt to cause a use-after-free?=20

cancel_work_sync() is called before se_clear_fw_busy() clears the fw_busy
state flag. If a mailbox interrupt arrives between these two calls, it will
see fw_busy is still set and call schedule_work() on the soon-to-be-freed
priv->fw_busy_work structure.

> @@ -312,15 +1449,22 @@ static int se_if_probe(struct platform_device *pde=
v)
>  		return dev_err_probe(dev, ret,
>  				    "Failed to init reserved memory region.");
>  	}
> =20
> -	ret =3D init_misc_device_context(priv, 0, &priv->priv_dev_ctx);
> +	ret =3D init_misc_device_context(priv, 0, &priv->priv_dev_ctx, &se_if_f=
ops);
>  	if (ret)
>  		return dev_err_probe(dev, ret,
>  				     "Failed[0x%x] to create device contexts.",

[Severity: Medium]
Could this expose the device node to userspace before probe initialization
completes?=20

misc_register() is called inside init_misc_device_context(), but
se_if_probe() continues to initialize load_fw and SoC info after this retur=
ns.
If userspace immediately opens the device and sends a command, it could byp=
ass
the se_load_firmware() step.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-imx-se-if-=
v27-0-bb7c45952f06@nxp.com?part=3D5
