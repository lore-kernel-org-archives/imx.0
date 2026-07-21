Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBA13624D9;
	Tue, 21 Jul 2026 10:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784631291; cv=none; b=J0F8aevj20GecyOfVNnN4z5HG+o9/wJ7kOO+2V1HbULf2LgOO9DE9kqCP3HNbzVhpjfwMZoX1x3thFQ1xJxk8D2jijFzNQy0XPnKg9K4RAEWMOCWOVP4FeDKMeiNeozI+zTt+eG5AOeNHeS15L1moSFSCW1/QxSFNbX/7D84cBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784631291; c=relaxed/simple;
	bh=sz0egGzOVPj+uS6k2morK+W263/clQzaukYPzMIkAS4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O6yoBXnRmlPqInK6+IQ8fXr6xa6cDtCJrfuWbK7zbqyDJ+ybVNUmzTuvKh3p3AbBfY8kc2v7enwXBqzZy75MoYDv50HHUqKVo9rIUXfbmG4XNEj895NHb2VlIOkKnvwEhlDOsgNc0TjQ7LoeXdiMlaY4jvu0WMBvG8rWzITIZmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pipi6217; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pipi6217"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 200D91F000E9;
	Tue, 21 Jul 2026 10:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784631289;
	bh=BiK+bSwwIpWN5fZSYzm12KTo1U79oz9ynqq3VcDtpQY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Pipi62173DoLKqHgDcCk30r+cBQZm7MgMxumA6Sty0M+ntriVbQ5qDOxmow44Xrur
	 J9eFM8bBSKXteevImdVak0J8gmcxXzQRNYJnsKps/PyQwMtX6tF+yJqQmFocXr+kIW
	 t9b+NkbMgzTALrRCoNFr3d3dTBnr8A+rlch8NVZS+golP+ppUNAQu3M6juyZ4cxPJD
	 QAYxisLuL3VBkI+w7nVuLspvt1VPwtOrhCopO0aEFI/wvY1SueuzHAwh1FKw89F3dA
	 Tosw2kxAqhy3SaPR1h+stR4MRpOGGCivHe7xKAWUAYmSpBuDf3o8gYHZr0c7IWV0PA
	 xb2UPmI3a9jZA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v29 5/7] firmware: drivers: imx: adds miscdev
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260721-imx-se-if-v29-5-04a362f4fcca@nxp.com>
References: <20260721-imx-se-if-v29-0-04a362f4fcca@nxp.com>
 <20260721-imx-se-if-v29-5-04a362f4fcca@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 10:54:48 +0000
Message-Id: <20260721105449.200D91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [Critical] Arbitrary physical memory read/write vulnerability (Confused D=
eputy) via SE_IOCTL_CMD_SEND_RCV_RSP.
- [High] Use-After-Free of `gate` and `miscdev` due to race between unbind =
and VFS `open`.
- [High] Unbind deadlock/hang for up to 5000 seconds due to incorrect order=
ing of `complete_all` and `fops_lock` acquisition.
- [High] Overwriting a successful firmware transaction with `-ERESTARTSYS` =
leads to double execution with zeroed DMA buffers.
- [High] NULL pointer dereference in `se_if_rx_callback` due to clearing `d=
rvdata` while the mailbox channel is active.
- [High] Out-of-bounds read in `se_if_rx_callback` by trusting unvalidated =
firmware payload length.
- [High] Premature freeing of `gen_pool` DMA buffer on timeout risks silent=
 memory corruption.
- [Medium] Lockdep false positive 'possible recursive locking detected' on =
`fops_lock`.
- [Medium] Early device exposure to userspace before probe initialization i=
s complete.
- [Low] Implicit compiler padding in UAPI structure `se_ioctl_cmd_snd_rcv_r=
sp_info`.
--

--- Patch [5]: [PATCH v29 5/7] firmware: drivers: imx: adds miscdev ---
commit a4962df1c1e6848f6dea7cc1ccb64c5abd9c4213
Author: Pankaj Gupta <pankaj.gupta@nxp.com>
Subject: firmware: drivers: imx: adds miscdev

This patch adds the driver for a communication interface to the NXP
secure-enclave. It exposes a character device to userspace for exchanging
messages with hardware IPs like EdgeLock Enclave. It also implements
command validation, shared memory management, and power/reset command
restrictions.

> diff --git a/include/uapi/linux/se_ioctl.h b/include/uapi/linux/se_ioctl.h
> new file mode 100644
> index 0000000000000..ea14cec05020d
> --- /dev/null
> +++ b/include/uapi/linux/se_ioctl.h
> @@ -0,0 +1,97 @@
[ ... ]
> +struct se_ioctl_cmd_snd_rcv_rsp_info {
> +	__u64 tx_buf;
> +	__u32 tx_buf_sz;
> +	__u64 rx_buf;
> +	__u32 rx_buf_sz;
> +};

[Severity: Low]
Will this struct have implicit compiler padding after the 32-bit fields,
potentially causing UAPI size differences across architectures?

> diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/e=
le_base_msg.c
> index 524ebc0f697e6..28b835f2880fb 100644
> --- a/drivers/firmware/imx/ele_base_msg.c
> +++ b/drivers/firmware/imx/ele_base_msg.c
> @@ -15,24 +15,65 @@
[ ... ]
> +static void ele_get_info_cleanup(struct se_if_priv *priv, u32 *buf, dma_=
addr_t d_addr,
> +				 size_t size)
> +{
[ ... ]
> +	if (priv->mem_pool)
> +		gen_pool_free(priv->mem_pool, (unsigned long)buf, size);
> +	else if (!se_is_fw_busy_ctx(priv->priv_dev_ctx))
> +		se_dev_ctx_shared_mem_cleanup(priv->priv_dev_ctx);
> +}

[Severity: High]
Could the gen_pool_free() path free memory while the hardware is still busy?
The standard allocation path uses a se_is_fw_busy_ctx() guard to prevent
freeing memory the hardware might still write to, but that guard is missing
here, risking silent memory corruption if a timeout occurred.

> diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele=
_common.c
> index a350e83a274a1..fbb6e584341a1 100644
> --- a/drivers/firmware/imx/ele_common.c
> +++ b/drivers/firmware/imx/ele_common.c
> @@ -226,6 +281,7 @@ static bool check_hdr_exception_for_sz(struct se_if_p=
riv *priv,
>  void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
>  {
>  	struct se_clbk_handle *se_clbk_hdl;
> +	bool schedule_fw_busy_work =3D false;
>  	struct device *dev =3D mbox_cl->dev;
>  	struct se_msg_hdr *header;
>  	bool sz_mismatch =3D false;
> @@ -305,9 +361,13 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, =
void *msg)
[ ... ]
>  	priv =3D dev_get_drvdata(dev);
> =20
>  	/* The function can be called with NULL msg */
>  	if (IS_ERR_OR_NULL(msg)) {
[ ... ]
>  	header =3D msg;
>  	rx_msg_sz =3D header->size << 2;
> =20
>  	/* Incoming command: wake up the receiver if any. */
>  	if (header->tag =3D=3D priv->if_defs->cmd_tag) {

[Severity: High]
Can priv be NULL here if the callback fires during driver unbind?
In se_if_probe_cleanup(), dev_set_drvdata() clears the private data pointer
before devres frees the active mailbox channels. A late interrupt would
dereference the NULL pointer.

> [ ... ]
>  		se_clbk_hdl->rx_msg_sz =3D rx_msg_sz;
>  		memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);
>  		complete(&se_clbk_hdl->done);

[Severity: High]
Does this blindly trust the firmware-provided header->size for the copy?
If the mailbox driver's msg buffer is smaller than rx_msg_sz, this could
result in an out-of-bounds read that copies arbitrary kernel memory into
the response buffer returned to userspace.

> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> index cd4d27dd98ce1..3c14964830a6d 100644
> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c
> @@ -243,11 +250,269 @@ static int get_se_soc_info(struct se_if_priv *priv=
, const struct se_soc_info *se
[ ... ]
> +static int load_firmware(struct se_if_priv *priv, const u8 *se_img_file_=
to_load)
> +{
[ ... ]
> +	/*
> +	 * Serialize access to priv_dev_ctx shared memory to prevent pos
> +	 * corruption if two driver-internal callers run concurrently (e.g.
> +	 * ele_get_info() racing with load_firmware()).
> +	 */
> +	scoped_guard(mutex, &priv->priv_dev_ctx->fops_lock) {
> +		se_fw_buf_len =3D fw->size;

[Severity: Medium]
Could this trigger a lockdep warning for recursive locking? The ioctl path
already holds a fops_lock, and taking the internal context's lock of the
same class here is valid hierarchical locking but might be flagged as a
deadlock by static analysis.

> @@ -261,18 +526,909 @@ static int init_misc_device_context(struct se_if_p=
riv *priv, int ch_id,
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
> +		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
> +
> +		return err;
> +	}

[Severity: Critical]
Does this allow arbitrary physical memory read/write vulnerabilities? Since
the earlier se_chk_tx_msg_hdr() check only verifies the UAPI command header,
user-controlled payloads containing embedded physical DMA addresses are sent
directly to the hardware here without validation. An attacker could forge
addresses to overwrite kernel memory.

[Severity: High]
If ele_msg_send_rcv() successfully completed a transaction on the hardware
but was interrupted by a signal, it overwrites the success with -ERESTARTSY=
S.
Does returning that negative error here cause issues? This triggers the
se_ioctl_cmd_snd_rcv_cleanup() handler which zeros the shared DMA input
buffers. The VFS will then restart the ioctl and execute a second time with
all-zero input parameters.

> +static int se_if_fops_open(struct inode *nd, struct file *fp)
> +{
> +	struct miscdevice *miscdev =3D fp->private_data;
> +	struct se_if_open_gate *gate;
> +	struct se_if_device_ctx *misc_dev_ctx;
> +	struct se_if_device_ctx *dev_ctx;
> +	struct se_if_priv *priv;
> +	int err =3D 0;
> +
> +	gate =3D container_of(miscdev, struct se_if_open_gate, miscdev);
> +
> +	if (!se_if_open_gate_get(gate))
> +		return -ENODEV;

[Severity: High]
Is there a use-after-free race here against module removal?
During unbind, se_if_probe_cleanup() calls misc_deregister() and frees
the gate structure. This does not synchronize with concurrent open() calls
that have already resolved the device in the VFS, leading to a dereference
of the freed miscdev and gate when the delayed fops->open runs.

> @@ -310,6 +1467,67 @@ static void se_if_probe_cleanup(void *plat_dev)
[ ... ]
> +	while (true) {
> +		dev_ctx =3D NULL;
> +
> +		scoped_guard(mutex, &priv->modify_lock) {
> +			if (list_empty(&priv->dev_ctx_list))
> +				goto out_done;
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
> +	 * A timed-out synchronous command may have retained a dev_ctx through
> +	 * priv->fw_busy_dev_ctx even after the fd was closed and the context w=
as
> +	 * removed from dev_ctx_list. If no late response arrived, release that
> +	 * retained context during driver teardown.
> +	 *
> +	 * se_clear_fw_busy() is idempotent and internally checks
> +	 * priv->fw_busy_dev_ctx under fw_busy_lock.
> +	 */
> +	complete_all(&priv->waiting_rsp_clbk_hdl.done);

[Severity: High]
Will this cause a deadlock during driver unbind?
If an ioctl thread is blocked waiting for the done completion, it currently
holds dev_ctx->fops_lock. Calling cleanup_dev_ctx() here attempts to acquire
that same lock and blocks indefinitely, because the complete_all() intended
to wake the ioctl thread is placed after this loop.

> @@ -418,13 +1653,12 @@ static int se_if_probe(struct platform_device *pde=
v)
[ ... ]
> -	ret =3D init_misc_device_context(priv, 0, &priv->priv_dev_ctx);
> +	ret =3D init_misc_device_context(priv, 0, &priv->priv_dev_ctx, &se_if_f=
ops);
>  	if (ret)
>  		return dev_err_probe(dev, ret,
>  				     "Failed[0x%x] to create device contexts.",
>  				     ret);
> =20
> -	/* By default, there is no pending FW to be loaded.*/
>  	if (se_info->imem_state_mgmt) {
>  		load_fw =3D get_load_fw_instance(priv);
> =20
[ ... ]
>  	if (if_node->if_defs.se_if_type =3D=3D SE_TYPE_ID_HSM) {
>  		ret =3D get_se_soc_info(priv, se_info);

[Severity: Medium]
Could exposing the miscdevice to userspace this early lead to TOCTOU races?
The device is registered before get_se_soc_info() is queried or the IMEM
DMA buffer is allocated, allowing userspace to open the device and interact
with uninitialized state.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-imx-se-if-=
v29-0-04a362f4fcca@nxp.com?part=3D5
