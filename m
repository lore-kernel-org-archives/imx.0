Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DC837EFE3;
	Mon, 24 Aug 2026 17:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787593813; cv=none; b=lQpRXj4bi4Q7zTasK0j8qTbpjW5weu2QwffNeoQJ4wa8S+e1pluGjPsJz4qs9FNGpfXD5E/b7QxGKdxHOctSVGuEN+O0qqbt5mXJ37bBOp8mT7ZH2WxuembVoozBMe7sqb2VYCl8Foq7nBiZuC0eOyO5pGezhhr38HOTMLj6Upg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787593813; c=relaxed/simple;
	bh=Fhh2UffmUuF5+HmE0WM9lPcbYNUmTiZ7y1Rg8TJQg9A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=G/eWppsQ48TtpDnMT2Z2UxydFy9wSen1BVt08BroUxlP+CHCuhdgORQ+B0A5SjTTwYmh9aqOb+Lv496LftA45nnqTVxiS3L70/KTwC6+VyaSt+3FpNJckpzaObOtQQBSkT6jmfsPX9M/Lhro+uLmfUMLwsocWiS3SyxDYuV9DgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VKbCODsx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VKbCODsx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8E2E1F000E9;
	Mon, 24 Aug 2026 17:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787593811;
	bh=ed5jbee2CBtPFs/Cfkb51MbQGLH5UObqa4KM1g18ofg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VKbCODsxxLywLUMyEnPxaAt5R2uY5VBklSpbzyqqmten+pXhTWUHUKM8OF2Aua9Ok
	 qOWR1OL+li04wNS0C4+Tn738yib9xlV4XBadjceZmuAqf7s2Nl1gK5RBW8Gc6/WGUe
	 l4EbeyeCBxLv4B3tJHAV1qGKpjbXhZZD8GQPBT6Y0cffN2aOv0JlPoTtRJqdpQOldq
	 wYjQZD/QeqAupgN9VMUyCurf8w58HOyc1W25zuJnUGoUYyFnSMcq/yKoUPUZU9WLrv
	 xbUvUMz9LpLjf7NButj1R9ElL+13aghW593apOcUz9WIMAVu/1chmp6kOML4vS87yI
	 CvcqJZBgqkh9Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v42 5/7] firmware: imx: adds miscdev
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260825-imx-se-if-v42-5-2e8efac0bb16@nxp.com>
References: <20260825-imx-se-if-v42-0-2e8efac0bb16@nxp.com>
 <20260825-imx-se-if-v42-5-2e8efac0bb16@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 17:50:10 +0000
Message-Id: <20260824175010.E8E2E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] TOCTOU race condition in ELE_STORAGE_OPEN_REQ allows NVM traffic i=
nterception
- [High] Firmware session handles permanently leak if a process exits via a=
 fatal signal due to the fw_busy circuit breaker
- [High] SE_IOCTL_ENABLE_CMD_RCV_STATUS unconditionally returns -ENOMEM, re=
ndering it broken
- [High] Missing bounds validation for SE_CMD_ADDR_NO_SIZE buffers allows a=
rbitrary out-of-bounds DMA reads
- [High] Use-After-Free of priv due to fw_busy_work being scheduled after c=
ancel_work_sync
- [High] Mutexes initialized via devm_mutex_init() are destroyed before se_=
if_probe_cleanup() executes
- [High] Successfully received firmware responses are dropped on non-fatal =
signals, leaking firmware resources
- [Medium] SE_IOCTL_GET_MU_INFO returns hardcoded zeroes instead of enclave=
 identification data
--

--- Patch [5]: [PATCH v42 5/7] firmware: imx: adds miscdev ---
commit 2e1b01a2a813fca5bf21f8f8fd015fe9ea573491
Author: Pankaj Gupta <pankaj.gupta@nxp.com>
Subject: firmware: imx: adds miscdev

This patch adds a character driver to communicate with NXP secure enclaves
(such as EdgeLock) from user-space. It introduces an ioctl ABI, shared memo=
ry
management, and validation checks for firmware commands.

> diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele=
_common.c
> index 0000000000000..0000000000000
> --- a/drivers/firmware/imx/ele_common.c
> +++ b/drivers/firmware/imx/ele_common.c
> [ ... ]
> @@ -546,6 +546,14 @@ int ele_msg_send_rcv(struct se_if_device_ctx *dev_ct=
x, void *tx_msg,
>  	err =3D ele_msg_rcv(dev_ctx, &priv->waiting_rsp_clbk_hdl);
> =20
>  	if (priv->waiting_rsp_clbk_hdl.signal_rcvd) {
>  		/*
>  		 * Signal was deferred until the FW/kernel protocol resynchronized.
>  		 * On success report -ERESTARTSYS for the interrupted wait; the
>  		 * command is not re-sent. Keep real errors like -ETIMEDOUT.
>  		 */
>  		if (err > 0)
>  			err =3D -ERESTARTSYS;

[Severity: High]
Could this leak firmware resources when a non-fatal signal arrives?
If a firmware response successfully arrives but defers a non-fatal signal,
this code overwrites the positive success size with -ERESTARTSYS.
Then in se_ioctl_cmd_snd_rcv_rsp_handler(), this is converted to -EINTR
and returns early without copying the response payload to userspace.
Because userspace never receives the newly generated handles (e.g., keys
or contexts), it cannot issue cleanup commands.

> [ ... ]
> @@ -660,11 +660,11 @@ void se_if_rx_callback(struct mbox_client *mbox_cl,=
 void *msg)
>  		se_clbk_hdl =3D &priv->waiting_rsp_clbk_hdl;
>  		spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
>  		if (!se_clbk_hdl->rx_msg) {
>  			if (atomic_read(&priv->fw_busy))
>  				schedule_fw_busy_work =3D true;
>  			spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
> =20
>  			if (schedule_fw_busy_work)
>  				schedule_work(&priv->fw_busy_work);

[Severity: High]
Could this lead to a use-after-free of the priv object?
In se_if_probe_cleanup(), cancel_work_sync() is called to wait for and canc=
el
fw_busy_work before the rx_chan mailbox is disabled. If a late firmware
response arrives in this window, this callback will execute. Because the
callback schedules the work unconditionally if fw_busy is set without check=
ing
going_away, the work could be re-queued after cancel_work_sync() returns,
causing it to access the freed priv object when the unbind finishes.

> diff --git a/drivers/firmware/imx/ele_fw_api.c b/drivers/firmware/imx/ele=
_fw_api.c
> index 0000000000000..0000000000000
> --- a/drivers/firmware/imx/ele_fw_api.c
> +++ b/drivers/firmware/imx/ele_fw_api.c
> [ ... ]
> @@ -155,10 +155,10 @@ int ele_uapi_allowed_fw_cmd(struct se_if_device_ctx=
 *dev_ctx, struct se_msg_hdr *he
>  		/*
>  		 * Reject the storage-open request when another context is
>  		 * already registered as the command receiver.
>  		 */
>  		scoped_guard(mutex, &priv->modify_lock)
>  			if (priv->cmd_receiver_clbk_hdl.dev_ctx &&
>  			    priv->cmd_receiver_clbk_hdl.dev_ctx !=3D dev_ctx)
>  				ret =3D -EBUSY;

[Severity: High]
Can this create a TOCTOU race condition?
The modify_lock is dropped immediately after checking the receiver
availability, opening a window before the command reaches firmware.
If two threads concurrently send ELE_STORAGE_OPEN_REQ, both could pass this
check and receive valid storage handles.

> [ ... ]
> @@ -244,11 +244,11 @@ void fw_api_specific_ops(struct se_if_device_ctx *d=
ev_ctx, struct se_api_msg *rx
>  		rc =3D set_dev_ctx_as_command_receiver(dev_ctx, false);
>  		if (rc)
>  			dev_err(priv->dev,
>  				"Failed to register %s as CMD-Receiver: %d\n",
>  				dev_ctx->devname, rc);
>  		break;
>  	}

[Severity: High]
Following the race condition above, if one thread successfully registers as=
 the
command receiver but the other fails here, the failure to register only logs
an error and returns void. Does this allow the ioctl to return success, rou=
ting
the second thread's firmware callbacks to the first thread and allowing
interception of NVM traffic?

> diff --git a/drivers/firmware/imx/ele_msg_addr_field.c b/drivers/firmware=
/imx/ele_msg_addr_field.c
> index 0000000000000..0000000000000
> --- a/drivers/firmware/imx/ele_msg_addr_field.c
> +++ b/drivers/firmware/imx/ele_msg_addr_field.c
> [ ... ]
> @@ -51,7 +51,7 @@ static const struct se_cmd_addr_field ele_oem_auth_cntr=
_addr_fields[] =3D {
>  	 * Output buffers must be fully bounded; input-only buffers are safe wi=
th
>  	 * addr-only checks.
>  	 */
>  	{ .lsb_idx =3D 1, .msb_idx =3D 0, .has_msb =3D true, .flag_idx =3D SE_C=
MD_ADDR_ALWAYS,
>  	  .size_idx =3D SE_CMD_ADDR_NO_SIZE },			/* container_hdr_addr */
>  };

[Severity: High]
Can this unbounded input buffer allow arbitrary out-of-bounds DMA reads?
The descriptor specifies SE_CMD_ADDR_NO_SIZE and a zero buf_size, which
bypasses end-bounds checks. If a malicious userspace process places the buf=
fer
at the very end of the shared memory window and crafts a header with a huge
size field, couldn't the firmware read beyond the mapped shared memory wind=
ow
into unmapped space and trigger AXI bus faults?

> [ ... ]
> @@ -138,7 +138,7 @@ static const struct se_cmd_addr_field ele_keystore_re=
prov_en_addr_fields[] =3D {
>  	 * memory the caller already owns. Output buffers must be fully bounded;
>  	 * input-only buffers are safe with addr-only checks.
>  	 */
>  	{ .lsb_idx =3D 1, .msb_idx =3D 0, .has_msb =3D true, .flag_idx =3D SE_C=
MD_ADDR_ALWAYS,
>  	  .size_idx =3D SE_CMD_ADDR_NO_SIZE },			/* signed_msg_addr */
>  };

[Severity: High]
This appears to be another instance where an unbounded input buffer might
allow arbitrary sized DMA reads by the firmware. Is there a way to safely
bound this input payload?

> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> index 0000000000000..0000000000000
> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c
> [ ... ]
> @@ -746,10 +746,10 @@ static void se_if_probe_cleanup(void *plat_dev)
>  	while (true) {
>  		dev_ctx =3D NULL;
> =20
>  		scoped_guard(mutex, &priv->modify_lock) {
>  			if (list_empty(&priv->dev_ctx_list))
>  				goto out_done;

[Severity: High]
Is there a devres initialization order issue here?
Because devres actions execute in reverse order (LIFO), modify_lock will be
destroyed before se_if_probe_cleanup() is invoked, since it was initialized
after devm_add_action_or_reset. When the cleanup function later attempts
to lock this destroyed mutex, could this lead to undefined behavior or
crashes during device unbind?

> [ ... ]
> @@ -1151,9 +1151,9 @@ int set_dev_ctx_as_command_receiver(struct se_if_de=
vice_ctx *dev_ctx, bool is_io
>  	if (se_clbk_hdl->dev_ctx)
>  		return -EBUSY;
> =20
>  	if (!dev_ctx->strg_hdl)
>  		return -EINVAL;
> =20
>  	if (is_ioctl)
>  		return -ENOMEM;

[Severity: High]
Does this check render the SE_IOCTL_ENABLE_CMD_RCV_STATUS ioctl broken?
When se_ioctl() invokes this function with is_ioctl set to true, it will
unconditionally return -ENOMEM here and the command receiver will never be
registered via the API.

> [ ... ]
> @@ -1532,9 +1532,9 @@ static int se_ioctl_get_mu_info(struct se_if_device=
_ctx *dev_ctx,
>  	struct se_if_node *if_node;
>  	int err =3D 0;
> =20
>  	if_node =3D container_of(priv->if_defs, typeof(*if_node), if_defs);
> =20
>  	if_info.se_if_id =3D 0;
>  	if_info.interrupt_idx =3D 0;
>  	if_info.tz =3D 0;
>  	if_info.did =3D 0;
>  	if_info.cmd_tag =3D priv->if_defs->cmd_tag;

[Severity: Medium]
Are these structural identification fields intentionally populated with
hardcoded zeroes? Setting se_if_id, interrupt_idx, tz, and did to 0 prevents
userspace from dynamically identifying the secure enclave's type or
configuration.

> [ ... ]
> @@ -1614,11 +1614,11 @@ static void cleanup_dev_ctx(struct se_if_device_c=
tx *dev_ctx, bool is_fclose)
>  				struct se_if_device_ctx *tx_ctx =3D is_fclose ? dev_ctx :
>  							dev_ctx->priv->priv_dev_ctx;
> =20
>  				if (dev_ctx->strg_hdl && se_close_storage(tx_ctx,
>  									  dev_ctx->strg_hdl))
>  					dev_err(dev_ctx->priv->dev, "failed to close storage.\n");
>  				if (dev_ctx->sess_hdl && se_close_session(tx_ctx,
>  									  dev_ctx->sess_hdl))
>  					dev_err(dev_ctx->priv->dev, "failed to close session.\n");
>  			}

[Severity: High]
Will firmware session handles leak if a process exits via a fatal signal?
If se_close_storage() encounters a pending SIGKILL, its wait_for_completion
aborts instantly and arms the fw_busy circuit breaker.=20

When se_close_session() runs immediately afterward, it sees fw_busy is set
and aborts the session close command without sending it. Does this permanen=
tly
leak the session handle on the secure enclave?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825-imx-se-if-=
v42-0-2e8efac0bb16@nxp.com?part=3D5
