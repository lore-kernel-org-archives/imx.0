Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387B2358368;
	Mon, 17 Aug 2026 08:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786956581; cv=none; b=qs2VRENlt871Z7cO1m91CDyNh95RzUdBTdiLlOh8Vz95Igh2q950JNPKDBBmXKqDg9Zo+yMQKXOmDDe/JXgGioct+Q+zkWztVvpuuYWUfMCpos/JEjfiTGxfjJgzNV98/9Sk2Jf4Py6YMnfyOeWMDY4eplIqa24+zHgJyw0pIvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786956581; c=relaxed/simple;
	bh=QJ+KpyjliBWyRwWuV5zYfKlat5ILYyo6/F9qOMwjug8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fvIhc2PZWRDlxuXAYJu8PC1UDSBkMMNy01/lqkpU45Rvh6iyODw5yD1q4qonM8URgHSzTx7/MCJj3+SatZ/fJKAf0JXV4/b2wMV7V/jfVea8jMSBNgzZ7y3NaOuUHtIWoMo4vt5pM6D8iaPBCubjUEeLQgwQWMMlA/LpmxwCG8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ULTgTuAF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ULTgTuAF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2B541F00A3D;
	Mon, 17 Aug 2026 08:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786956579;
	bh=5yNkb57PyZJ7fuIl0u1akOCqADD2P8s8DaTkQFNFHWM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ULTgTuAF9//06ZY0xIRBGMbdazWhqDFH3fFDZktJylYKPYBKlA07o6v60IbJewsP1
	 o61+FPZ8Ax14B999Yc/uR60Ap8/h+YIZxTRdjQkIAPCNrRADEZukAUtiJBQqEmXzT5
	 /duJVk1sELF94wE2rEFQC1RAQJWzVzsWMp2Ycg1TaXUnpdnU+gXO1Al1qmrOinUqLS
	 rHg5MOBUfRQJYSSmltfmQu4NEZczITv/0l+YAAOq/lWpVpmyLbKYztISwVdBatpPFm
	 P0kO4OmStPjimRzoribP/rwuMdIkA1um0xY6IlIJzYN6xHPT6UD3TVZGnC9OStAA6w
	 vp1kDOQ0di4+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v36 5/7] firmware: imx: adds miscdev
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGFua2FqIEd1cHRhIChPU1Mp?= <pankaj.gupta@oss.nxp.com>
Cc: robh@kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260817-imx-se-if-v36-5-45c42847bfd8@oss.nxp.com>
References: <20260817-imx-se-if-v36-0-45c42847bfd8@oss.nxp.com>
 <20260817-imx-se-if-v36-5-45c42847bfd8@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 08:49:38 +0000
Message-Id: <20260817084938.C2B541F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Dynamic export buffer sizes are stored in global static arrays, ca=
using a race condition between concurrent contexts that allows out-of-bound=
s firmware DMA writes.
- [High] `se_if_fops_read()` calls `fw_api_specific_ops()` on a partially u=
ninitialized stack buffer if a short `size` is provided by userspace.
- [High] Firmware is allowed to read physical memory outside the userspace-=
provided shared-memory window for commands lacking explicit buffer sizes.
- [High] Silent failure to register a command receiver during `ELE_STORAGE_=
OPEN_REQ` allows NVM callback hijacking.
- [High] A concurrent fatal signal and driver unbind bypasses the firmware-=
busy circuit breaker, causing a DMA-after-free vulnerability.
- [Medium] A maliciously small `rx_buf_sz` in `SE_IOCTL_CMD_SEND_RCV_RSP` c=
auses the driver to truncate the firmware response, skip recording the allo=
cated session/storage handle, and permanently leak it.
--

--- Patch [5]: [PATCH v36 5/7] firmware: imx: adds miscdev ---
commit ce3441d90d0e822b990027611af7d091a4f0299f
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

firmware: imx: adds miscdev

This commit introduces the character driver and ABI for communicating with
NXP secure enclaves (like EdgeLock). It includes shared memory management,
message header validation, and command/response processing.

Link: https://github.com/nxp-imx/imx-secure-enclave.git
Link: https://github.com/nxp-imx/imx-smw.git

> --- a/drivers/firmware/imx/ele_common.c
> +++ b/drivers/firmware/imx/ele_common.c
> @@ -101,15 +101,15 @@ int se_val_cmd_addrs(struct se_if_device_ctx *dev_c=
tx, struct se_api_msg *msg,
> =20
>  		addr =3D msg->data[f->lsb_idx];
>  		if (f->has_msb)
>  			addr |=3D (u64)msg->data[f->msb_idx] << 32;
> =20
>  		/* Zero marks an absent optional buffer. */
>  		if (!addr)
>  			continue;
> =20
>  		if (addr < base || addr >=3D end)
>  			return -EACCES;
> =20
>  		/*
>  		 * When the message also carries this buffer's length, the whole
>  		 * buffer [addr, addr + len) must fit inside the window, not just

[Severity: High]
Does this code prevent firmware from reading outside the shared memory wind=
ow
when the command lacks an explicit buffer size?

For commands like ELE_OEM_AUTH_CONTAINER_REQ that use SE_CMD_ADDR_NO_SIZE
with no buf_size, only the start address is checked against the bounds. If a
caller provides a start address at the very end of the window (e.g., end - =
1),
could the firmware read the payload out-of-bounds into adjacent physical
memory?

[ ... ]

> @@ -290,16 +290,16 @@ int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, s=
truct se_clbk_handle *se_clbk
>  			 * before the fatal signal: se_if_rx_callback() has already
>  			 * copied it and set rx_delivered under the same lock, so the
>  			 * enclave is done with the buffer. Report it as a normal
>  			 * receive (rx_msg_sz) so the handle it carries is still
>  			 * recorded and later closed, rather than leaked.
>  			 */
>  			if (is_rsp_wait_with_timeout) {
>  				spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
>  				if (se_clbk_hdl->rx_delivered) {
>  					ret =3D se_clbk_hdl->rx_msg_sz;
>  					spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
>  					break;
>  				}
>  				if (se_clbk_hdl->rx_msg) {
>  					se_clbk_hdl->rx_msg =3D NULL;
>  					if (!completion_done(&se_clbk_hdl->done))
>  						se_mark_fw_busy(dev_ctx);
>  				}
>  				spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);

[Severity: High]
Can a concurrent fatal signal and driver unbind bypass the firmware-busy
circuit breaker here?

If a process blocking in ele_msg_rcv() receives a fatal signal at the exact
moment se_if_probe_cleanup() executes and calls complete_all(), the wait
completes. The signal path wakes up, and completion_done() evaluates to tru=
e.
This causes the signal path to skip calling se_mark_fw_busy().

Could this lead to teardown freeing the DMA buffer via
cleanup_se_shared_mem(..., true) while the firmware is still busy and writi=
ng
into the freed memory?

> --- a/drivers/firmware/imx/ele_fw_api.c
> +++ b/drivers/firmware/imx/ele_fw_api.c
> @@ -180,14 +180,14 @@ void fw_api_specific_ops(struct se_if_device_ctx *d=
ev_ctx, struct se_api_msg *rx
>  	case ELE_STORAGE_OPEN_REQ: {
>  		int rc =3D 0;
> =20
>  		/*
>  		 * Record the storage handle before registering as command
>  		 * receiver. FW has already allocated the handle; if we assigned
>  		 * it only after a successful registration, a failing
>  		 * set_dev_ctx_as_command_receiver() (e.g. -EBUSY) would leave
>  		 * strg_hdl at 0 while the ioctl still returns success to
>  		 * userspace. The kernel would then never close the handle on
>  		 * teardown, leaking it in FW. Storing it first guarantees
>  		 * cleanup_dev_ctx() closes it regardless of registration.
>  		 */
>  		dev_ctx->strg_hdl =3D rx_msg->data[1];
> =20
>  		rc =3D set_dev_ctx_as_command_receiver(dev_ctx);
>  		if (rc)
>  			dev_err(priv->dev,
>  				"Failed to register %s as CMD-Receiver: %d\n",
>  				dev_ctx->devname, rc);
>  		break;
>  	}

[Severity: High]
Does this silently ignore a registration failure and leave the state out of
sync?

If process A already opened a storage session and is the command receiver, =
and
process B calls ELE_STORAGE_OPEN_REQ, set_dev_ctx_as_command_receiver() will
return -EBUSY. However, the error is only logged, and dev_ctx->strg_hdl rem=
ains
set.

Could this trick the firmware into sending NVM callbacks for process B's
storage session that then get routed to process A?

> --- a/drivers/firmware/imx/ele_msg_addr_field.c
> +++ b/drivers/firmware/imx/ele_msg_addr_field.c
> @@ -568,10 +568,10 @@ static const struct se_cmd_addr_field ele_rng_get_r=
andom_addr_fields[] =3D {
>  	/*
>  	 * PSA_COMPLIANT get-random payload. reserved/flags is data[0]; rnd_addr

[ ... ]

>  static struct se_cmd_addr_field ele_storage_master_export_addr_fields[] =
=3D {
>  	{ .lsb_idx =3D 2, .flag_idx =3D SE_CMD_ADDR_ALWAYS,
>  	  .size_idx =3D SE_CMD_ADDR_NO_SIZE, .buf_size =3D 0 },	/* key_store_ex=
port_address */
>  };

[ ... ]

>  void ele_set_sz_in_field_addr(u8 cmd, u32 size)
>  {
>  	switch (cmd) {
>  	case ELE_STORAGE_MASTER_EXPORT_REQ:
>  		ele_storage_master_export_addr_fields[0].buf_size =3D size;
>  		break;
>  	case ELE_STORAGE_CHUNK_EXPORT_REQ:
>  		ele_storage_chunk_export_addr_fields[0].buf_size =3D size;
>  		break;
>  	}
>  }

[Severity: High]
Can concurrent operations cause a race condition when storing transaction
sizes in these global static arrays?

If two callers concurrently trigger ELE_STORAGE_MASTER_EXPORT_REQ,
fw_api_specific_ops() calls ele_set_sz_in_field_addr() which mutates the
shared global array ele_storage_master_export_addr_fields without
synchronization.

If a context requiring a large buffer is overwritten by a context supplying=
 a
small size, could se_val_cmd_addrs() use the clobbered small size, pass the
bounds check, and allow the firmware to write the large export out-of-bound=
s?

> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c
> @@ -1727,14 +1727,14 @@ static int se_ioctl_cmd_snd_rcv_rsp_handler(struc=
t se_if_device_ctx *dev_ctx,
>  	 * ioctl reports plain success; the firmware status is conveyed to
>  	 * userspace inside the response buffer itself.
>  	 */
>  	cmd_snd_rcv_rsp_info.rx_buf_sz =3D err;
>  	err =3D 0;
> =20
>  	dev_dbg(priv->dev, "%s: %s %s.", dev_ctx->devname, __func__,
>  		"message received, start transmit to user");
> =20
>  	rsp_status_err =3D
>  		se_val_rsp_hdr_n_status(priv, rx_msg, tx_msg->header.command,
>  					cmd_snd_rcv_rsp_info.rx_buf_sz,
>  					tx_msg->header.ver =3D=3D priv->if_defs->base_api_ver);
> =20
>  	if (!rsp_status_err) {
>  		/*
>  		 * The response is well formed and fully fits the caller's
>  		 * buffer, so any FW-allocated session/storage handle it carries
>  		 * (data[1]) has been delivered. Record it now, before the
>  		 * copy-out steps below. The FW has already committed the handle;
>  		 * running fw_api_specific_ops() only after a successful
>  		 * se_dev_ctx_cpy_out_data()/copy_to_user() would leave the
>  		 * handle untracked - and so never closed on teardown, leaking it
>  		 * in FW - whenever the caller supplied a bad output pointer.
>  		 */
>  		fw_api_specific_ops(dev_ctx, rx_msg);
> =20
>  		err =3D se_dev_ctx_cpy_out_data(dev_ctx);

[Severity: Medium]
Does a short rx_buf_sz from userspace bypass handle recording and cause a
resource leak?

If a caller issues ELE_SESSION_OPEN_REQ but specifies an artificially small
rx_buf_sz (e.g., 4 bytes), se_val_rsp_hdr_n_status() will return -EINVAL
because the returned buffer size is smaller than the firmware's header leng=
th.

Because rsp_status_err is set, the call to fw_api_specific_ops() is skipped.
Will the successfully allocated handle be permanently leaked since it is
never recorded in dev_ctx->sess_hdl for teardown?

[ ... ]

> @@ -1849,21 +1849,21 @@ static ssize_t se_if_fops_read(struct file *fp, c=
har __user *buf, size_t size,
>  	/*
>  	 * Snapshot rx_msg pointer under clbk_rx_lock before releasing it.
>  	 * unset_dev_ctx_as_command_receiver() can acquire the lock, NULL out
>  	 * rx_msg, and free the buffer at any time after the unlock; using a
>  	 * stale pointer from the shared field after the unlock is a UAF.
>  	 */
>  	scoped_guard(mutex, &priv->modify_lock) {
>  		spin_lock_irqsave(&priv->cmd_receiver_clbk_hdl.clbk_rx_lock, flags);
>  		if (priv->cmd_receiver_clbk_hdl.dev_ctx !=3D dev_ctx ||
>  		    !priv->cmd_receiver_clbk_hdl.rx_msg ||
>  		    !priv->cmd_receiver_clbk_hdl.rx_msg_sz) {
>  			spin_unlock_irqrestore(&priv->cmd_receiver_clbk_hdl.clbk_rx_lock, fla=
gs);
>  			mutex_unlock(&dev_ctx->fops_lock);
>  			return -ENODEV;
>  		}
>  		/* Taking snapshot is enough for the one common pre-allocated buffer. =
*/
>  		copy_len =3D min(size, priv->cmd_receiver_clbk_hdl.rx_msg_sz);
>  		memcpy(rx_msg_snap, priv->cmd_receiver_clbk_hdl.rx_msg, copy_len);
>  		priv->cmd_receiver_clbk_hdl.rx_msg_sz =3D 0;
>  		spin_unlock_irqrestore(&priv->cmd_receiver_clbk_hdl.clbk_rx_lock, flag=
s);
> =20
>  		/* We may need to copy the output data to user before
>  		 * delivering the completion message.
>  		 */
>  		err =3D se_dev_ctx_cpy_out_data(dev_ctx);
>  		if (err < 0) {
>  			se_dev_ctx_shared_mem_cleanup(dev_ctx);
>  			mutex_unlock(&dev_ctx->fops_lock);
>  			return err;
>  		}
>  		/* Copy data from the buffer using the snapshot taken under the lock. =
*/
>  		print_hex_dump_debug("to user ", DUMP_PREFIX_OFFSET, 4, 4,
>  				     rx_msg_snap, copy_len, false);
> =20
>  		fw_api_specific_ops(dev_ctx, (struct se_api_msg *)rx_msg_snap);

[Severity: High]
Can this sequence read uninitialized stack memory if the user provides a sh=
ort
length?

If a user acting as the command receiver calls read() with a short length
(e.g., 4 bytes), se_if_fops_read() copies only 4 bytes into the 256-byte st=
ack
array rx_msg_snap.

It then unconditionally calls fw_api_specific_ops() with this partially
uninitialized buffer. If the command is ELE_STORAGE_MASTER_EXPORT_REQ,
fw_api_specific_ops() reads rx_msg->data[1], which now contains garbage sta=
ck
memory. Could this update the expected buffer size with an invalid value and
break DMA bounds checking?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817-imx-se-if-=
v36-0-45c42847bfd8@oss.nxp.com?part=3D5
