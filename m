Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E6D38F255;
	Fri, 21 Aug 2026 07:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787298823; cv=none; b=daDNCA9jjRsFlgoP50wyUKR6X6wuzXLd3/HFR8dMRBykqqPch+Jmvt/9PdeKDTD6EKbOmYH4rW8rNLIHREocthhUY6d95nfbfM9z+15HmEfE7wIVQpLJaC0M3yYyMZkDtagTpTbk4rshNeIbk8SEdT6k/YOLVdMF2Rl5jRvgVMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787298823; c=relaxed/simple;
	bh=mCicz1VJivZDcdwBOEOOVwpt3jCgSM8nlaS0sH3pOR0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=n/p61gS4BPrWsqBEsccD6mtjA7ujNOpvVTuxgSu+I50UdCYmhXaOEYO/d/lFbOcG1ojMjVB1ey37s0l/vQGcDeIkvhpawY4S/3DzGmv/fE9SIkBr9IiIu+ILc5N4RdjnY5wlDxm267FpUrQeYNli3UVXCaz3E3d0hVLd8SbnROY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZoS20Pei; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZoS20Pei"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2DB71F000E9;
	Fri, 21 Aug 2026 07:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787298821;
	bh=v3/QCCHlpfDklX8hHuN1kEn6mRfd25Af89KT/XgQn8Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZoS20PeiM7WwAUV5DjZbucLeKC8SkFoAbejlylD0AK9/9tZKWpAMkZQyrvXR+0qZh
	 7U/sXD9NynWXFTix241BGeL+m0j4jQ3GZdOizZH0iPXisSZVqrOPzxYOnPG5fwlgF9
	 utmVPXo0zMkl62Noy1Q6GDRQzIwVM54ri76FMGz5wGM2eQdiTQ3S0O5KPJ1v4DYvlS
	 hUztHKxOWdsBmkw+Z2Iq8vbf1sgcXjYKIg0IgetdrV+ygEwbrm3qCbvEVbDb1mkIVD
	 dEfg9CiPytQ9Fx3I/W2sjZsivQ+gY2PZzedqwgFVdLf6NKudrewUVGDgpPBJlD30o6
	 Lf+nqMaBanXvg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v39 5/7] firmware: imx: adds miscdev
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260821-imx-se-if-v39-5-41e4257c2afc@nxp.com>
References: <20260821-imx-se-if-v39-0-41e4257c2afc@nxp.com>
 <20260821-imx-se-if-v39-5-41e4257c2afc@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 07:53:40 +0000
Message-Id: <20260821075340.B2DB71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] The command receiver bypasses session and storage handle ownership=
 checks, allowing it to close arbitrary handles belonging to other processe=
s.
- [High] Permitting the command receiver to issue `cmd_tag` messages via `w=
rite()` corrupts the synchronous IOCTL response channel.
- [High] The driver converts a successful firmware transaction into an `-EI=
NTR` error if a signal was received during the wait, leading to silent data=
 corruption and handle leaks.
- [High] Incomplete bounds validation for buffers with no explicit size all=
ows the firmware to read outside the shared memory window.
- [High] TOCTOU race in `ELE_STORAGE_OPEN_REQ` validation allows multiple c=
ommand receivers to open storage sessions, misrouting NVM callbacks.
- [Medium] The SE_IOCTL_ENABLE_CMD_RCV_STATUS ioctl always fails with -ENOM=
EM.
- [Low] Variable declarations immediately follow a switch case label, which=
 is invalid C syntax.
--

--- Patch [5]: [PATCH v39 5/7] firmware: imx: adds miscdev ---
commit 592c4b7b59033acb6e7acab4d619d7a526911c5e
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

firmware: imx: adds miscdev
   =20
This commit adds the character driver for the NXP EdgeLock Enclave (ELE).
It exposes ioctls for userspace applications to allocate shared memory, get
SoC info, and exchange messages with the enclave firmware.

Link: https://sashiko.dev/#/patchset/20260820-imx-se-if-v38-0-5df4a4cff736@=
nxp.com?part=3D5

> diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele=
_common.c
> --- a/drivers/firmware/imx/ele_common.c
> +++ b/drivers/firmware/imx/ele_common.c
> @@ -47,100 +47,150 @@ int se_val_cmd_addrs(struct se_if_device_ctx *dev_c=
tx, struct se_api_msg *msg,
>  		     u32 tx_msg_sz, const struct se_cmd_addr_field *fields,
>  		     size_t count)
>  {

[ ... ]

> +		if (f->size_idx =3D=3D SE_CMD_RCVR_ADDR_VAR_SIZE) {
> +			struct cmd_rcvr_data_info *crcvr_info =3D
> +							&dev_ctx->priv->crcvr_info;
> +			/*
> +			 * Export-response buffer: the size was supplied by FW
> +			 * in the preceding export command and stored per SE
> +			 * interface in cmd_rcvr_var_size.
> +			 */
> +			if ((u64)crcvr_info->cmd_rcvr_var_size > end - addr)
> +				return -EACCES;
> +		} else if (f->size_idx !=3D SE_CMD_ADDR_NO_SIZE) {
> +			u64 len;
> +
> +			if (f->size_idx >=3D payload_words)
> +				return -EINVAL;
> +
> +			/* size_mask =3D=3D 0 with a valid size_idx is a descriptor bug. */
> +			if (!f->size_mask)
> +				return -EINVAL;
> +
> +			/*
> +			 * Widen to u64 before shifting: size_shift is u8 and
> +			 * shifting a u32 by >=3D 32 is undefined behaviour.
> +			 */
> +			len =3D ((u64)msg->data[f->size_idx] >> f->size_shift) & f->size_mask;
> +			if (len > end - addr)
> +				return -EACCES;
> +		} else if (f->buf_size) {
> +			/* buf_size: literal byte count (FW-defined constant). */
> +			if ((u64)f->buf_size > end - addr)
> +				return -EACCES;
> +		}

[Severity: High]
If size_idx is SE_CMD_ADDR_NO_SIZE and buf_size is 0, the logic only checks
that the start address is within bounds (addr < base || addr >=3D end) earl=
ier
in the function.

Could a user supply a DMA address at the very end of the shared memory wind=
ow
(e.g., end - 1), causing the firmware to read the multi-byte container head=
er
out of bounds into adjacent physical memory?

>  	}
> =20
>  	return 0;
>  }

[ ... ]

> @@ -468,76 +468,86 @@ int ele_msg_send_rcv(struct se_if_device_ctx *dev_c=
tx, void *tx_msg,
>  		     int tx_msg_sz, void *rx_msg, int exp_rx_msg_sz)
>  {

[ ... ]

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
Does this sequence result in silent data corruption and handle leaks?

If a signal interrupts the wait in ele_msg_send_rcv() and the wait
continues killably, a successful firmware response (err > 0) gets
overridden to -ERESTARTSYS.

The ioctl handler (se_ioctl_cmd_snd_rcv_rsp_handler) then converts this to
-EINTR and returns without copying the successful response payload (rx_msg)
back to userspace.

Will userspace subsequently retry the operation with zeroed shared memory
buffers, leading to dropped response data or leaked firmware handles?

>  		priv->waiting_rsp_clbk_hdl.signal_rcvd =3D false;
>  		dev_dbg(priv->dev, "%s: Err[0x%x]:Interrupted by signal.",
>  			dev_ctx->devname, err);
>  	}
> =20
>  	ele_msg_send_rcv_cleanup(priv);
> =20
>  	return err;
>  }

[ ... ]

> @@ -552,74 +552,74 @@ void se_if_rx_callback(struct mbox_client *mbox_cl,=
 void *msg)
>  {

[ ... ]

>  	/* Incoming command: wake up the receiver if any. */
>  	if (header->tag =3D=3D priv->if_defs->cmd_tag) {
>  		se_clbk_hdl =3D &priv->cmd_receiver_clbk_hdl;
>  		spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);

[ ... ]

>  	} else if (header->tag =3D=3D priv->if_defs->rsp_tag) {
>  		bool exception_for_sz_mismatch =3D check_hdr_exception_for_sz(priv, he=
ader);
>  		u32 exp_rx_msg_sz =3D 0;
> =20
>  		/*
>  		 * rx_msg and rx_msg_sz are owned by the sender under clbk_rx_lock.
>  		 * Read both under the lock: drop a late response instead of copying
>  		 * into freed memory, and avoid a stale size. A late response also
>  		 * closes the firmware-busy circuit breaker.
>  		 */
>  		se_clbk_hdl =3D &priv->waiting_rsp_clbk_hdl;
>  		spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);

[Severity: High]
Can asynchronous writes corrupt synchronous ioctl responses?

The write() handler allows sending cmd_tag messages without waiting for a
response. When the firmware replies with a rsp_tag, se_if_rx_callback()
blindly assigns it to the single synchronous ioctl waiter
(priv->waiting_rsp_clbk_hdl).

If the command receiver writes a command while another process is blocked
in an ioctl, will the ioctl process wake up with the asynchronous response
data, corrupting its state?

>  		if (!se_clbk_hdl->rx_msg) {
>  			if (atomic_read(&priv->fw_busy))
>  				schedule_fw_busy_work =3D true;
>  			spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
> =20
>  			if (schedule_fw_busy_work)
>  				schedule_work(&priv->fw_busy_work);
> =20
>  			dev_info(dev, "ELE responded (late), recovery FW available.");
>  			return;
>  		}

> diff --git a/drivers/firmware/imx/ele_fw_api.c b/drivers/firmware/imx/ele=
_fw_api.c
> --- a/drivers/firmware/imx/ele_fw_api.c
> +++ b/drivers/firmware/imx/ele_fw_api.c
> @@ -0,0 +1,382 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2026 NXP
> + */
> +
> +#include "se_ctrl.h"
> +#include "ele_common.h"
> +#include "ele_fw_api.h"
> +
> +static int se_cmd_receiver_allowed_cmd(struct se_if_device_ctx *dev_ctx,
> +				       struct se_api_msg *msg, u32 tx_msg_sz)
> +{
> +	u8 cmd =3D msg->header.command;
> +
> +	switch (cmd) {
> +	case ELE_SESSION_CLOSE_REQ:
> +	case ELE_STORAGE_CLOSE_REQ:
> +		return 0;

[Severity: High]
Does this bypass the handle ownership checks for the command receiver?

In ele_uapi_allowed_fw_cmd(), if the caller is the command receiver,
the request is delegated here and unconditionally allowed.

This seems to bypass the main switch statement where dev_ctx->sess_hdl
and dev_ctx->strg_hdl are verified against msg->data[0]. Could a malicious
command receiver use this to close arbitrary handles belonging to other
processes?

> +	case ELE_STORAGE_MASTER_IMPORT_REQ:
> +		const struct se_cmd_addr_field *fields;
> +		size_t count;

[Severity: Low]
Is this variable declaration right after the case label valid C11 syntax?
Standard C requires a statement after a label, and a declaration is not
considered a statement. Does this cause a build failure?

> +
> +		fields =3D ele_fw_cmd_addr_fields(cmd, &count);
> +		return se_val_cmd_addrs(dev_ctx, msg, tx_msg_sz, fields, count);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}

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

[Severity: High]
Can concurrent callers race between this pre-check and the actual receiver
registration?

The modify_lock is dropped immediately after checking if a receiver is
already registered. Multiple callers could pass this check, send their
requests to firmware, and receive valid storage handles.

> +		if (rx_msg_sz < ELE_STORAGE_OPEN_RSP_SZ)
> +			ret =3D -EINVAL;
> +		break;

[ ... ]

> +void fw_api_specific_ops(struct se_if_device_ctx *dev_ctx, struct se_api=
_msg *rx_msg)
> +{
> +	struct se_msg_hdr *header =3D &rx_msg->header;
> +	struct se_if_priv *priv =3D dev_ctx->priv;
> +
> +	switch (header->command) {
> +	case ELE_SESSION_OPEN_REQ:
> +		dev_ctx->sess_hdl =3D rx_msg->data[1];
> +		break;
> +	case ELE_SESSION_CLOSE_REQ:
> +		dev_ctx->sess_hdl =3D 0;
> +		break;
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
> +		rc =3D set_dev_ctx_as_command_receiver(dev_ctx, false);
> +		if (rc)
> +			dev_err(priv->dev,
> +				"Failed to register %s as CMD-Receiver: %d\n",
> +				dev_ctx->devname, rc);
> +		break;
> +	}

[Severity: High]
If the set_dev_ctx_as_command_receiver() call fails due to the race
mentioned above, the error is merely logged and ignored.

Does this leave the second caller with a valid storage handle, while all
NVM callbacks are misrouted to the first caller? Should this failure path
be handled more robustly?

> diff --git a/drivers/firmware/imx/ele_msg_addr_field.c b/drivers/firmware=
/imx/ele_msg_addr_field.c
> --- a/drivers/firmware/imx/ele_msg_addr_field.c
> +++ b/drivers/firmware/imx/ele_msg_addr_field.c
> @@ -0,0 +1,635 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2026 NXP
> + */

[ ... ]

> +static const struct se_cmd_addr_field ele_oem_auth_cntr_addr_fields[] =
=3D {
> +	/*
> +	 * Container Header address: a 64-bit physical address split across two
> +	 * words. data[0] holds the 32-bit MSB and data[1] holds the 32-bit LSB
> +	 * (ELE API spec Table 27, word size =3D 0x3, so the command is header +
> +	 * MSB + LSB only). The message carries no length word for this buffer;
> +	 * the container size is variable and not communicated in the MU payloa=
d,
> +	 * and no static firmware-defined maximum is specified. Because this is=
 a
> +	 * read-only input buffer (the ELE ROM/FW copies the container header
> +	 * into its internal memory for authentication and does not write back
> +	 * through this address), enforcing only the start-address range check =
is
> +	 * acceptable: a rogue caller can at most cause firmware to read within
> +	 * the shared-memory window, which is memory the caller already owns.
> +	 * Output buffers must be fully bounded; input-only buffers are safe wi=
th
> +	 * addr-only checks.
> +	 */
> +	{ .lsb_idx =3D 1, .msb_idx =3D 0, .has_msb =3D true, .flag_idx =3D SE_C=
MD_ADDR_ALWAYS,
> +	  .size_idx =3D SE_CMD_ADDR_NO_SIZE },			/* container_hdr_addr */

[Severity: High]
Does omitting length constraints for the container header allow out-of-boun=
ds
reads? As noted above, since size_idx is SE_CMD_ADDR_NO_SIZE and buf_size
defaults to 0, no upper bound check is performed when the command is valida=
ted
in se_val_cmd_addrs().

> +};

> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c

[ ... ]

> @@ -1195,30 +1195,30 @@ int set_dev_ctx_as_command_receiver(struct se_if_=
device_ctx *dev_ctx, bool is_io
>  {
>  	struct se_if_priv *priv =3D dev_ctx->priv;
>  	struct se_api_msg *new_rx_msg =3D NULL;
>  	struct se_clbk_handle *se_clbk_hdl;
>  	unsigned long flags;
> =20
>  	se_clbk_hdl =3D &priv->cmd_receiver_clbk_hdl;
>  	guard(mutex)(&priv->modify_lock);
>  	if (se_clbk_hdl->dev_ctx =3D=3D dev_ctx)
>  		return 0;
> =20
>  	if (se_clbk_hdl->dev_ctx)
>  		return -EBUSY;
> =20
>  	if (!dev_ctx->strg_hdl)
>  		return -EINVAL;
> =20
>  	if (is_ioctl)
>  		return -ENOMEM;

[Severity: Medium]
Does this unconditionally reject the SE_IOCTL_ENABLE_CMD_RCV_STATUS ioctl?
When the ioctl calls this function with is_ioctl =3D true, it immediately
returns -ENOMEM before any allocations happen. Is this intentional, or does
it break the ioctl completely?

[ ... ]

> @@ -1505,30 +1505,30 @@ static int se_ioctl_cmd_snd_rcv_rsp_handler(struc=
t se_if_device_ctx *dev_ctx,
>  					    void __user *uarg)
>  {

[ ... ]

>  		/*
>  		 * -ERESTARTSYS here means the wait was interrupted by a signal
>  		 * after the command had already been handed to - and executed
>  		 * by - the firmware, with its response delivered into rx_msg
>  		 * (ele_msg_send_rcv() converts only a positive, i.e. successfully
>  		 * received, result to -ERESTARTSYS). If that response carried a
>  		 * freshly allocated session/storage handle, record it now via
>  		 * fw_api_specific_ops(): the handle is already live in firmware,
>  		 * so leaving it untracked would stop cleanup_dev_ctx() from ever
>  		 * closing it and leak the firmware resource. Validate the
>  		 * delivered response first, using its own declared length bounded
>  		 * by the caller's buffer, so a truncated or malformed reply is
>  		 * not acted upon.
>  		 */
>  		if (err =3D=3D -ERESTARTSYS) {
>  			u32 rsp_sz =3D rx_msg->header.size << 2;
> =20
>  			if (rsp_sz && rsp_sz <=3D cmd_snd_rcv_rsp_info.rx_buf_sz &&
>  			    !se_val_rsp_hdr_n_status(priv, rx_msg,
>  						     tx_msg->header.command, rsp_sz,
>  						     tx_msg->header.ver =3D=3D
>  						     priv->if_defs->base_api_ver)) {
>  				se_dev_ctx_cpy_out_data(dev_ctx);
>  				fw_api_specific_ops(dev_ctx, rx_msg);
>  			}
>  			/*
>  			 * Returning -ERESTARTSYS would let the VFS transparently restart
>  			 * the ioctl, which would re-run the command with the just
>  			 * cleaned-up (zeroed) shared input buffers. Report -EINTR instead
>  			 * so the syscall is not auto-restarted; userspace enters its
>  			 * signal handler and can decide whether to reissue the command.
>  			 */
>  			err =3D -EINTR;
>  		}

[Severity: High]
See the note about silent data corruption and handle leaks above; this is w=
here
the successful ioctl returns -EINTR without copying the response to the use=
r.

[ ... ]

> @@ -1807,30 +1807,30 @@ static ssize_t se_if_fops_write(struct file *fp, =
const char __user *buf,
>  				size_t size, loff_t *ppos)
>  {
>  	struct se_if_device_ctx *dev_ctx =3D fp->private_data;
>  	struct se_if_priv *priv;
>  	int err;
> =20
>  	scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &dev_ctx->fops_lock)=
 {
>  		if (dev_ctx->cleanup_done)
>  			return -ENODEV;
> =20
>  		priv =3D dev_ctx->priv;
> =20
>  		dev_dbg(priv->dev, "%s: write from buf (%p)%zu, ppos=3D%lld.", dev_ctx=
->devname,
>  			buf, size, ((ppos) ? *ppos : 0));
> =20
>  		if (dev_ctx !=3D priv->cmd_receiver_clbk_hdl.dev_ctx) {
>  			se_dev_ctx_shared_mem_cleanup(dev_ctx);
>  			return -EINVAL;
>  		}
> =20
>  		if (size < SE_MU_HDR_SZ || size > MAX_ALLOWED_TX_MSG_SZ) {
>  			dev_err(priv->dev, "%s: User buffer too small/large(%zu < %d)",
>  				dev_ctx->devname, size,
>  				size < SE_MU_HDR_SZ ? SE_MU_HDR_SZ :
>  								MAX_ALLOWED_TX_MSG_SZ);
>  			return -ENOSPC;
>  		}
> =20
>  		struct se_api_msg *tx_msg __free(kfree) =3D memdup_user(buf, size);
>  		if (IS_ERR(tx_msg))
>  			return PTR_ERR(tx_msg);
> =20
>  		err =3D se_chk_tx_msg_hdr(dev_ctx, &tx_msg->header, size, 0);
>  		if (err)
>  			return err;
> =20
>  		print_hex_dump_debug("from user ", DUMP_PREFIX_OFFSET, 4, 4,
>  				     tx_msg, size, false);
> =20
>  		err =3D ele_msg_send(dev_ctx, tx_msg, size);
> =20
>  		return err;

[Severity: High]
See the note about asynchronous writes corrupting synchronous ioctl respons=
es
above. This is the write handler that sends the command that generates the
conflicting response.

>  	}
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821-imx-se-if-=
v39-0-41e4257c2afc@nxp.com?part=3D5
