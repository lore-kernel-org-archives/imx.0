Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2349939A05D;
	Wed,  2 Sep 2026 06:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788332149; cv=none; b=tSoR0o6GJiFBdMNELvYZZIIl7RYuqJ1Lah5LU1Z4fd20vFeI1FMlikB/V8MqrMbIMxx5+Rs+FNG2Xd/fBEHAPUfnpHQo6iWJ/4A2WHjCcqzeyZsk4XrOJ9wBjXKtGnPnZ1VNqoIxY/Uzz3omlDN4DvqEHpBAHOcuOko1RONdois=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788332149; c=relaxed/simple;
	bh=8SR0aoHM4fJO5nzvzla9yNAvcr9FbKRsUS8rXXmylC4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ot7w2jmkmENvX6MbgyjRd6ZzOnbHCdaBphTtM8joH1NlvhuwCKVGSh/8scnDequGHQQUZF2GXvL7dj3FCyvFd3MrsMFsxbAZdbq73tsD8LdfzVr74PDeVvFSK1pAPjkVjDIUhtKlIcdoTvFWIUf92mLD1Lq1807A5RL2HgMJAjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bSvVKRDa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bSvVKRDa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA8B11F000E9;
	Wed,  2 Sep 2026 06:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788332144;
	bh=hWHalo4Oyt2ezrsgqjFvT77M8lzN1nJ9saat6x2iftw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bSvVKRDa+CXWy4pRhwEOHhvggSkS55KsfKMsO2fK20hP1p+V0KmUr8Ll8whX2966t
	 1tU9U321pXyKz7ggYs8RtgPZyW6/tDwZEJAXKeP0Xr68m6tAggLyIArN4vWIw5LyOp
	 Khw6PvMkz9uwysFz5qxD1VOAJMT6RUNOJYE43fegpL12GlGlkgici1OOwfEfMBpC51
	 XBu+Rk38ak+8Xjg6KoLMeO4KfVlO+OB4JFyQnqN6StMPTmQBxoSo+CI7ttIEczhl4A
	 DhWaSY98yXD6LGIlNzICulcnqEwbUpsIOdhAPEbqY2uz/aYvVxJspzvcZ84U9Zg7TO
	 bZ5w8MZgTxD0A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v44 5/7] firmware: imx: adds miscdev
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: robh@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260902-imx-se-if-v44-5-104658bf941a@nxp.com>
References: <20260902-imx-se-if-v44-0-104658bf941a@nxp.com>
 <20260902-imx-se-if-v44-5-104658bf941a@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 06:55:43 +0000
Message-Id: <20260902065543.DA8B11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] `se_close_session()` uses `base_api_ver` instead of `fw_api_ver`, =
causing firmware to reject the close command.
- [High] Firmware resource leak when `ELE_SESSION_OPEN_REQ` or `ELE_STORAGE=
_OPEN_REQ` is interrupted by a fatal signal.
- [High] Memory and device reference leak if `devm_mutex_init` fails.
- [High] Heap out-of-bounds read in `se_val_rsp_hdr_n_status()` caused by u=
nder-validated user-supplied buffer size.
- [High] Dropping successfully completed firmware responses on non-fatal si=
gnals causes permanent enclave resource leaks.
- [High] Unlocked Use-After-Free of `dev_ctx->devname` in the error path of=
 `se_if_fops_read`.
- [High] TOCTOU race in `ELE_STORAGE_OPEN_REQ` validation allows intercepti=
on of another process's NVM traffic.
- [Medium] NULL pointer passed to `%s` in diagnostic output during unbind t=
imeout.
--

commit e63a03a67125c375869dd06113b5aaa189772c32
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

firmware: imx: adds miscdev

This commit adds a character driver to communicate with NXP secure enclave
hardware IPs such as the EdgeLock Enclave. It supports shared memory
management, IO buffer allocation, and sending commands/responses via an
ioctl-based ABI.

> diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele=
_common.c
> index 10fb4f60b4293..1e7ee8100f846 100644
> --- a/drivers/firmware/imx/ele_common.c
> +++ b/drivers/firmware/imx/ele_common.c
> @@ -371,10 +371,10 @@ int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, s=
truct se_clbk_handle *se_clbk
>  			if (is_rsp_wait_with_timeout) {
>  				spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
>  				if (se_clbk_hdl->rx_delivered) {
[ ... ]
>  				}
>  				if (se_clbk_hdl->rx_msg) {
>  					/*
>  					 * The enclave may still DMA into this
>  					 * buffer (either a normal timeout or
>  					 * a teardown complete_all() wakeup).
>  					 * Quarantine the buffer and arm the
>  					 * circuit breaker unconditionally.
>  					 */
>  					se_clbk_hdl->rx_msg =3D NULL;
>  					se_mark_fw_busy(dev_ctx);
>  				}

[Severity: High]
If a fatal signal interrupts the wait here, rx_msg is cleared to NULL.
In se_ioctl_cmd_snd_rcv_rsp_handler(), this causes rsp_sz to evaluate to 0,
which bypasses the fw_api_specific_ops() call entirely.

Could this lead to a firmware resource leak if ELE_SESSION_OPEN_REQ or
ELE_STORAGE_OPEN_REQ allocated a new handle that never gets recorded for
teardown?

[ ... ]
> @@ -576,6 +576,6 @@ int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx=
, void *tx_msg,
>  	if (priv->waiting_rsp_clbk_hdl.signal_rcvd) {
>  		/*
>  		 * Signal was deferred until the FW/kernel protocol resynchronized.
>  		 * On success report -ERESTARTSYS for the interrupted wait; the
>  		 * command is not re-sent. Keep real errors like -ETIMEDOUT.
>  		 */
>  		if (err > 0)
>  			err =3D -ERESTARTSYS;

[Severity: High]
By overriding a successful response size with -ERESTARTSYS, the ioctl
handler translates the error to -EINTR and aborts without copying data to
userspace.

For stateful commands like key generation, wouldn't the enclave successfully
allocate the resource, but the handle is then discarded by the kernel and
never delivered to userspace?

> diff --git a/drivers/firmware/imx/ele_fw_api.c b/drivers/firmware/imx/ele=
_fw_api.c
> new file mode 100644
> index 0000000000000..e301911d3ddc7
> --- /dev/null
> +++ b/drivers/firmware/imx/ele_fw_api.c
> @@ -168,4 +168,4 @@ int ele_uapi_allowed_fw_cmd(struct se_if_device_ctx *=
dev_ctx, struct se_msg_hdr
>  		/*
>  		 * Reject the storage-open request when another context is
>  		 * already registered as the command receiver. If we let the
>  		 * command through, FW would allocate a new storage handle and
>  		 * start sending NVM callbacks for it; those callbacks would be
>  		 * routed to the existing receiver (process A), not to the
>  		 * caller (process B). This would let process A observe and
>  		 * tamper with process B's NVM traffic. Reject early, before
>  		 * the command reaches FW, so no handle is allocated and the
>  		 * state stays consistent.
>  		 */
>  		scoped_guard(mutex, &priv->modify_lock)
>  			if (priv->cmd_receiver_clbk_hdl.dev_ctx &&
>  			    priv->cmd_receiver_clbk_hdl.dev_ctx !=3D dev_ctx)
>  				ret =3D -EBUSY;

[Severity: High]
The modify_lock is dropped immediately after checking the command receiver
status, before the command is sent and set_dev_ctx_as_command_receiver()
is called.

Could two concurrent ioctls from different processes pass this check? If
the second process fails registration in fw_api_specific_ops() but returns
success to userspace, its storage handle remains open in the enclave, which
might then route its NVM traffic to the first process.

[ ... ]
> @@ -331,5 +331,5 @@ int se_close_session(struct se_if_device_ctx *dev_ctx=
, u32 session_hdl)
>  	/*
>  	 * Session close is a FW-API command; format it with the FW API version
>  	 * so se_val_rsp_hdr_n_status() below (called with is_base_api =3D fals=
e,
>  	 * i.e. expecting fw_api_ver) does not reject the matching response and
>  	 * wrongly report the close as failed, which would leak the handle.
>  	 */
>  	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
>  			    ELE_SESSION_CLOSE_REQ, ELE_SESSION_CLOSE_REQ_SZ,
>  			    priv->if_defs->fw_api_ver);

[Severity: High]
The fifth argument to se_fill_cmd_msg_hdr() is defined as bool is_base_api.

Since fw_api_ver is an integer, passing it here evaluates to true. Does this
cause the header to be incorrectly formatted with base_api_ver, leading the
firmware to reject the close command and leak the session handle?

> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> index 0792e5152436b..f09f134707300 100644
> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c
> @@ -907,4 +907,4 @@ static int se_if_probe(struct platform_device *pdev)
>  	/*
>  	 * Initialize load_fw_lock before registering the misc device.
>  	 * A userspace process could open the device and trigger se_load_firmwa=
re()
>  	 * via IOCTL immediately after misc_register(), so the mutex must be re=
ady
>  	 * before the device becomes visible.
>  	 */
>  	if (se_info->se_fw_img_nm.seco_fw_nm_in_rfs) {
>  		load_fw =3D get_load_fw_instance(priv);
>  		ret =3D devm_mutex_init(dev, &load_fw->load_fw_lock);
>  		if (ret)
>  			return dev_err_probe(dev, ret,
>  					     "Failed to init mutex: load_fw_lock.\n");

[Severity: High]
If devm_mutex_init() fails here, it returns early and bypasses the
devm_add_action_or_reset() call that sets up se_if_probe_cleanup.

Because priv was manually allocated with kzalloc_obj() and the dev reference
was bumped via get_device(priv->dev), wouldn't this early return permanently
leak the memory and leave the struct device reference unbalanced?

[ ... ]
> @@ -1162,5 +1162,5 @@ static void se_clear_fw_busy(struct se_if_priv *pri=
v)
>  		if (atomic_read(&priv->going_away)) {
>  			/*
>  			 * Fatal, but deliberately non-panic: the enclave is
>  			 * unresponsive at unbind with a transaction still in
>  			 * flight. Both the coherent staging buffer and any
>  			 * gen_pool buffers this context owns are abandoned
>  			 * (host descriptors freed, DMA-visible memory leaked)
>  			 * to avoid a DMA-after-free while the enclave may still
>  			 * be writing. Emit one headline error here rather than
>  			 * per-buffer so the count of faulted contexts is clear.
>  			 * Do not use WARN/BUG: this path is recoverable and
>  			 * panic_on_warn kernels must not be brought down by it.
>  			 */
>  			dev_err(priv->dev,
>  				"%s: FATAL: enclave stuck at unbind, DMA leaked.\n",
>  				dev_ctx->devname);

[Severity: Medium]
During unbind timeouts, se_if_probe_cleanup() iterates through contexts and
calls cleanup_dev_ctx(), which unconditionally frees and nullifies
dev_ctx->devname.

When se_clear_fw_busy() executes shortly after, wouldn't this printk
formatting dereference a NULL dev_ctx->devname?

[ ... ]
> @@ -1897,4 +1897,4 @@ static ssize_t se_if_fops_read(struct file *fp, cha=
r __user *buf, size_t size,
>  	err =3D ele_msg_rcv(dev_ctx, &priv->cmd_receiver_clbk_hdl);
>  	if (err < 0) {
>  		if (err !=3D -ERESTARTSYS)
>  			dev_err(priv->dev,
>  				"%s: Er[0x%x]: Signal Interrupted. Current act-dev-ctx count: %d.",
>  				dev_ctx->devname, err, dev_ctx->priv->active_devctx_count);

[Severity: High]
The fops_lock is dropped before waiting on ele_msg_rcv(). If the wait
aborts due to an unbind and lands in this error path, it accesses
dev_ctx->devname outside the lock.

Could a concurrent cleanup_dev_ctx() free dev_ctx->devname during this
window, causing a use-after-free during printk formatting?

[ ... ]
> @@ -1968,4 +1968,4 @@ static int se_ioctl_cmd_snd_rcv_rsp_handler(struct =
se_if_device_ctx *dev_ctx,
>  	/*
>  	 * Validate using the size the firmware declared in the response header
>  	 * rather than cmd_snd_rcv_rsp_info.rx_buf_sz (the amount actually
>  	 * received, clamped to the caller's buffer). If the caller supplied a
>  	 * buffer smaller than the firmware's full response, rx_buf_sz reflects
>  	 * the truncated copy and se_val_rsp_hdr_n_status() would fail the size
>  	 * check, causing fw_api_specific_ops() to be skipped and any freshly
>  	 * allocated session/storage handle to go unrecorded. Using the
>  	 * firmware-declared size ensures a well-formed response is always
>  	 * recognised and its handle is tracked for cleanup.
>  	 *
>  	 * Any size discrepancy between the firmware response header and the
>  	 * userspace-supplied buffer is already logged by the mailbox receive
>  	 * callback before control returns here.
>  	 */
>  	rsp_status_err =3D
>  		se_val_rsp_hdr_n_status(priv, rx_msg, tx_msg->header.command,
>  					rx_msg->header.size << 2, tx_msg->header.ver);

[Severity: High]
The rx_msg buffer is allocated using the userspace-supplied rx_buf_sz.

If userspace passes a very small rx_buf_sz (e.g. 4 bytes), but the firmware
returns a larger header size, could using rx_msg->header.size << 2 here
lead to an out-of-bounds read inside se_val_rsp_hdr_n_status()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-imx-se-if-=
v44-0-104658bf941a@nxp.com?part=3D5
