Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0754A2A7A;
	Wed,  2 Sep 2026 16:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366926; cv=none; b=QdPEkOdt1U1X9M+ycTXGRe1LcY7aE3O+U7efQM1quHNfkUM3JHmMpkEXuHujSGF/4lDRHz1ofZ5m/u9AciLGDACtmLRq/k7Mh0/UZ3wJKm0bk2ghsU5ambW1eHBq1G4DMOcLvmCbogE2I1ccGNeUXyeaowcOvOxrQo7Tt14Cd64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366926; c=relaxed/simple;
	bh=QZCcSEPCx9Mwfj0ET1qwdlgQ//UVTvGnC+WepA9OeZQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rUBvkSGjEM+4DJjIurAb9AZwHfFeGN4U2INKzC8zSxcbSXvMVv3/G1sBKEd0MegTD27PT9pB3H4Ty69x7RiZp+OLLQGBJXF1sFcSbCFEYcvrPgk6BS/S8fVEzGf9AWJUPV+aUnwhahmA/UcqpHTer5E7lZ+hNWBefCxfrGhZ4eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m5TZhZ/e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m5TZhZ/e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB3231F000E9;
	Wed,  2 Sep 2026 16:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788366922;
	bh=aCmR0zNMAKuf+4saE7GcC1cTkIk4mnTkvVa0llPkIhA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m5TZhZ/eYbO5M9+nYzevt6v2NV1Um1N8DDpmbdasQm0zmmnO6SVALfgoF1hTRx8LX
	 rsfX/UPrldaQ4J4KoEpXlRxXrUJKOTZEEXTsqVucAnruB3jVny0TevTQV37EcZ4CzA
	 zAR3W22oerCvl/z4j6shhfOu3+fQf94Wl/F5yXv1YswbrNotzw5lq6gUJQnmzbC1S3
	 VUw66kBh/mV7CpZ7DmgtuNuFeGIH4PIREj1aMKs5Az5lh0OCcgjqUmxlpLg9xBPEOt
	 DOZkA5rRJdxLjkMsHETPsFWjngY8CKzemq45FNq1f9xCEA36td/edbWFaCxljNooxn
	 8oxwCCsf4/MGg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v46 5/7] firmware: imx: adds miscdev
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260903-imx-se-if-v46-5-aefaab525034@nxp.com>
References: <20260903-imx-se-if-v46-0-aefaab525034@nxp.com>
 <20260903-imx-se-if-v46-5-aefaab525034@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 16:35:21 +0000
Message-Id: <20260902163521.BB3231F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Kernel heap out-of-bounds read when processing firmware responses =
due to trusting the firmware-supplied `header.size` over the actual user-sp=
ecified allocation size.
- [High] Concurrent `ELE_STORAGE_OPEN_REQ` commands bypass the command-rece=
iver exclusivity check, allowing a process to intercept another's NVM traff=
ic.
- [High] Use-after-free on `priv` object due to premature `cancel_work_sync=
()` before `mbox_free_channel()` allows `schedule_work()` to queue work on =
a freed object.
- [High] Syscall returning `-EINTR` after hardware operation is fully compl=
eted leads to lost response payloads, corrupted retries, and broken state s=
ynchronization.
- [Low] Mixing `goto`-based error handling with `scoped_guard()` declaratio=
ns in `se_if_probe_cleanup`.
--

commit afeff3ca68cac56d7230f74585096a1ade46c177
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

firmware: imx: adds miscdev

This commit adds the character driver interface to the NXP secure-enclave,
allowing user-space applications to exchange messages with hardware IPs like
EdgeLock Enclave.

Link: https://sashiko.dev/#/patchset/20260902-imx-se-if-v45-0-6e400879d8ec@=
nxp.com?part=3D5

> diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele=
_common.c
> index 10fb4f60b4293..1e7ee8100f846 100644
> --- a/drivers/firmware/imx/ele_common.c
> +++ b/drivers/firmware/imx/ele_common.c
[ ... ]
> @@ -377,9 +701,24 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, =
void *msg)
>  		se_clbk_hdl =3D &priv->waiting_rsp_clbk_hdl;
>  		spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
>  		if (!se_clbk_hdl->rx_msg) {
> -			/* Close circuit breaker on spinlock race */
> -			atomic_set(&priv->fw_busy, 0);
> +			/*
> +			 * Only schedule fw_busy_work when going_away is clear.
> +			 * se_if_probe_cleanup() sets going_away under
> +			 * clbk_rx_lock before calling cancel_work_sync(). If
> +			 * going_away is already set here, teardown has already
> +			 * run (or is running) cancel_work_sync(); scheduling
> +			 * the work again after that point would re-queue it
> +			 * against the freed priv object, causing a
> +			 * use-after-free when the work executes.
> +			 */
> +			if (atomic_read(&priv->fw_busy) &&
> +			    !atomic_read(&priv->going_away))
> +				schedule_fw_busy_work =3D true;
>  			spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
> +
> +			if (schedule_fw_busy_work)
> +				schedule_work(&priv->fw_busy_work);

[Severity: High]
Does this code risk a use-after-free on the priv object? The spinlock is
explicitly dropped before schedule_work() is called, which widens the race
window. If cancel_work_sync() runs concurrently in se_if_probe_cleanup()
while the lock is dropped here, it will return immediately since the work
hasn't been scheduled yet, allowing the object to be freed before this thre=
ad
calls schedule_work().

> diff --git a/drivers/firmware/imx/ele_fw_api.c b/drivers/firmware/imx/ele=
_fw_api.c
> new file mode 100644
> index 0000000000000..72cecc5c8e258
> --- /dev/null
> +++ b/drivers/firmware/imx/ele_fw_api.c
[ ... ]
> +int ele_uapi_allowed_fw_cmd(struct se_if_device_ctx *dev_ctx, struct se_=
msg_hdr *header,
> +			    u32 tx_msg_sz, u32 rx_msg_sz)
> +{
[ ... ]
> +	case ELE_STORAGE_OPEN_REQ:
> +		/* Might be cleared as part of tear down. */
> +		if (dev_ctx->strg_hdl) {
> +			ret =3D -EEXIST;
> +			break;
> +		}
> +		/*
> +		 * Reject the storage-open request when another context is
> +		 * already registered as the command receiver. If we let the
> +		 * command through, FW would allocate a new storage handle and
> +		 * start sending NVM callbacks for it; those callbacks would be
> +		 * routed to the existing receiver (process A), not to the
> +		 * caller (process B). This would let process A observe and
> +		 * tamper with process B's NVM traffic. Reject early, before
> +		 * the command reaches FW, so no handle is allocated and the
> +		 * state stays consistent.
> +		 */
> +		scoped_guard(mutex, &priv->modify_lock)
> +			if (priv->cmd_receiver_clbk_hdl.dev_ctx &&
> +			    priv->cmd_receiver_clbk_hdl.dev_ctx !=3D dev_ctx)
> +				ret =3D -EBUSY;
> +		if (rx_msg_sz < ELE_STORAGE_OPEN_RSP_SZ)
> +			ret =3D -EINVAL;
> +		break;

[Severity: High]
Could concurrent ELE_STORAGE_OPEN_REQ commands bypass this exclusivity chec=
k?
The lock is dropped immediately after checking
priv->cmd_receiver_clbk_hdl.dev_ctx, which creates a race window before the
command receiver is actually registered. This might allow a secondary proce=
ss
to intercept the NVM traffic of another.

[ ... ]
> +void fw_api_specific_ops(struct se_if_device_ctx *dev_ctx, struct se_api=
_msg *rx_msg,
> +			 bool is_cmd_interrupted)
> +{
[ ... ]
> +	case ELE_STORAGE_OPEN_REQ: {
> +		int rc;
> +
> +		/*
> +		 * Record the storage handle before registering as command
> +		 * receiver. FW has already allocated the handle; if we assigned
> +		 * it only after a successful registration, a failing
> +		 * set_dev_ctx_as_command_receiver() (e.g. -EBUSY) would leave
> +		 * strg_hdl at 0 while the ioctl still returns success to
> +		 * userspace. The kernel would then never close the handle on
> +		 * teardown, leaking it in FW. Storing it first guarantees
> +		 * cleanup_dev_ctx() closes it on the next close(), regardless
> +		 * of whether registration succeeded.
> +		 */
> +		dev_ctx->strg_hdl =3D rx_msg->data[1];
> +
> +		if (is_cmd_interrupted) {
> +			if (se_close_storage(dev_ctx, dev_ctx->strg_hdl))
> +				dev_err(dev_ctx->priv->dev, "failed to close storage.\n");
> +			dev_ctx->strg_hdl =3D 0;
> +			break;
> +		}
> +
> +		rc =3D set_dev_ctx_as_command_receiver(dev_ctx);
> +		if (rc)
> +			dev_err(priv->dev,
> +				"Failed to register %s as CMD-Receiver: %d\n",
> +				dev_ctx->devname, rc);
> +		break;
> +	}

[Severity: High]
If registration fails due to the race mentioned above (rc !=3D 0), is it sa=
fe
to only log an error without closing the storage handle and without returni=
ng
the error to the user? The ioctl will successfully return the valid storage
handle to the second process.

> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> index 0792e5152436b..baeb28929b2de 100644
> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c
[ ... ]
> @@ -341,31 +719,144 @@ static void se_if_probe_cleanup(void *plat_dev)
>  	if (!priv)
>  		return;
[ ... ]
> +	while (true) {
> +		dev_ctx =3D NULL;
> +
> +		scoped_guard(mutex, &priv->modify_lock) {
> +			if (list_empty(&priv->dev_ctx_list))
> +				goto out_done;

[Severity: Low]
Does mixing goto-based error handling with scoped_guard() macros violate the
subsystem's LIFO cleanup definition rules? This can cause confusing ownersh=
ip
semantics and can lead to resource leaks or double frees.

> +
> +			dev_ctx =3D list_first_entry(&priv->dev_ctx_list,
> +						   struct se_if_device_ctx, link);
> +
> +			/* pin this context so close() cannot free it under us */
> +			kref_get(&dev_ctx->refcount);
> +			dlink_dev_ctx(dev_ctx);
> +		}
> +
> +		/*
> +		 * Local cleanup outside the global lock avoids ABBA deadlock
> +		 * with paths that already take dev_ctx->fops_lock first.
> +		 */
> +		cleanup_dev_ctx(dev_ctx, false);
> +		kref_put(&dev_ctx->refcount, se_if_dev_ctx_release);
> +	}
> +out_done:
> +
> +	/*
> +	 * Cancel fw_busy_work before acquiring se_if_cmd_lock. The work
> +	 * handler, se_clear_fw_busy(), acquires dev_ctx->fops_lock. A
> +	 * concurrent close() may hold fops_lock and then attempt to acquire
> +	 * se_if_cmd_lock via se_close_storage(). Calling cancel_work_sync()
> +	 * while already holding se_if_cmd_lock would therefore deadlock all
> +	 * three threads. Canceling first, without any lock held, lets the
> +	 * work and the close() finish independently.
> +	 *
> +	 * going_away was set under clbk_rx_lock earlier in this function.
> +	 * Once set, se_if_rx_callback() will not call schedule_work() again,
> +	 * so the work cannot be re-queued after cancel_work_sync() returns.
> +	 */
> +	cancel_work_sync(&priv->fw_busy_work);
> +	/*
> +	 * Free the mailbox channels under se_if_cmd_lock. ele_msg_send_rcv()
> +	 * holds se_if_cmd_lock for the full duration of a synchronous
> +	 * transaction, including the mbox_send_message() call on priv->tx_chan.
> +	 * going_away was set above and complete_all() has already woken any
> +	 * in-flight waiter, so any transaction in progress will unwind to
> +	 * -ENODEV and release the lock quickly. Acquiring se_if_cmd_lock here
> +	 * guarantees no caller is still touching the channels when they are
> +	 * freed, and nulling the pointers under the lock prevents any sender
> +	 * that races past the going_away check from accessing a freed channel.
> +	 */
> +	scoped_guard(mutex, &priv->se_if_cmd_lock) {
> +		if (priv->rx_chan) {
> +			mbox_free_channel(priv->rx_chan);

[Severity: High]
Could the premature cancel_work_sync() allow schedule_work() to queue work
on a freed object? Moving cancel_work_sync() after mbox_free_channel() would
guarantee no new work could be scheduled from the rx callback.

[ ... ]
> +static int se_ioctl_cmd_snd_rcv_rsp_handler(struct se_if_device_ctx *dev=
_ctx,
> +					    void __user *uarg)
> +{
[ ... ]
> +	err =3D ele_msg_send_rcv(dev_ctx, tx_msg, cmd_snd_rcv_rsp_info.tx_buf_s=
z,
> +			       rx_msg, cmd_snd_rcv_rsp_info.rx_buf_sz);
> +	if (err < 0) {
> +		/*
> +		 * -ERESTARTSYS here means the wait was interrupted by a signal
> +		 * after the command had already been handed to - and executed
> +		 * by - the firmware, with its response delivered into rx_msg
> +		 * (ele_msg_send_rcv() converts only a positive, i.e. successfully
> +		 * received, result to -ERESTARTSYS). If that response carried a
> +		 * freshly allocated session/storage handle, record it now via
> +		 * fw_api_specific_ops(): the handle is already live in firmware,
> +		 * so leaving it untracked would stop cleanup_dev_ctx() from ever
> +		 * closing it and leak the firmware resource. Validate the
> +		 * delivered response first, using its own declared length bounded
> +		 * by the caller's buffer, so a truncated or malformed reply is
> +		 * not acted upon.
> +		 */
> +		if (err =3D=3D -ERESTARTSYS) {
> +			u32 rsp_sz =3D rx_msg->header.size << 2;
> +
> +			if (rsp_sz && rsp_sz <=3D cmd_snd_rcv_rsp_info.rx_buf_sz &&
> +			    !se_val_rsp_hdr_n_status(priv, rx_msg,
> +						     tx_msg->header.command, rsp_sz,
> +						     tx_msg->header.ver)) {
> +				se_dev_ctx_cpy_out_data(dev_ctx);
> +				fw_api_specific_ops(dev_ctx, rx_msg, true);
> +			}
> +			/*
> +			 * Returning -ERESTARTSYS would let the VFS transparently restart
> +			 * the ioctl, which would re-run the command with the just
> +			 * cleaned-up (zeroed) shared input buffers. Report -EINTR instead
> +			 * so the syscall is not auto-restarted; userspace enters its
> +			 * signal handler and can decide whether to reissue the command.
> +			 */
> +			err =3D -EINTR;
> +		}
> +
> +		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
> +
> +		return err;
> +	}

[Severity: High]
Does returning -EINTR here without copying the rx_msg payload back to
userspace cause data loss or corrupted retries? If the hardware operation
completed successfully but was interrupted by a signal, masking success with
an error forces userspace to discard a valid payload and potentially retry,
which can lead to cryptographic IV reuse or leaked handles.

[ ... ]
> +	/*
> +	 * Validate using the size the firmware declared in the response header
> +	 * rather than cmd_snd_rcv_rsp_info.rx_buf_sz (the amount actually
> +	 * received, clamped to the caller's buffer). If the caller supplied a
> +	 * buffer smaller than the firmware's full response, rx_buf_sz reflects
> +	 * the truncated copy and se_val_rsp_hdr_n_status() would fail the size
> +	 * check, causing fw_api_specific_ops() to be skipped and any freshly
> +	 * allocated session/storage handle to go unrecorded. Using the
> +	 * firmware-declared size ensures a well-formed response is always
> +	 * recognised and its handle is tracked for cleanup.
> +	 *
> +	 * Any size discrepancy between the firmware response header and the
> +	 * userspace-supplied buffer is already logged by the mailbox receive
> +	 * callback before control returns here.
> +	 */
> +	rsp_status_err =3D
> +		se_val_rsp_hdr_n_status(priv, rx_msg, tx_msg->header.command,
> +					rx_msg->header.size << 2, tx_msg->header.ver);

[Severity: High]
Does trusting the firmware-supplied header.size instead of the actual user
allocation size cause an out-of-bounds read? Since se_val_rsp_hdr_n_status()
reads from rx_msg->data[0] assuming the buffer size matches the firmware
size, a maliciously small user allocation could lead to out-of-bounds access
on the kernel heap.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903-imx-se-if-=
v46-0-aefaab525034@nxp.com?part=3D5
