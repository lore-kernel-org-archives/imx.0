Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8996E443315;
	Wed, 29 Jul 2026 10:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785319912; cv=none; b=IxdLoyZ77xmcBlWMAFfmkAiQt7XqJP+TuYShRQhdAo7mIkBO9RO+bswDCq10wgeWYkx4pjowSULaB784B3vCaXiXlIiILdDOi53t2n7ZyLFjiF5kfxKeVonC0viOdREbbamQJupXO4s7/s2z19puljx0kMnezjrpU1Bx5NLE9R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785319912; c=relaxed/simple;
	bh=oiemHj56VtLB+ORjIE0sCzjpI1W6K234NwTe54ZQwR0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hZG3Pht4b6F8wSfUb9BInEdYkXGdGlP5N4aGxCAJlcigc2Dn/If62A6SRZcEVaOpvtUiQOv9X3G2tPXhvXl9FaVM0A2sZEFJr0wiLCjW13OxcJji89FAW7gIB3LJyKEDlQ4J6OjrhRWqBlhxwO/d6sFOrRLX2YU1BvTIhix6FEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L7N55UcZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L7N55UcZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 103571F000E9;
	Wed, 29 Jul 2026 10:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785319911;
	bh=VCwkeStOBq8QOwOlSuI805jpM0UddO0M+c7s1xJRf2Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L7N55UcZ7g3eAvBB79qnycJjj6lnVa2IZTXRg1Q0WgI9qu2wPDyOI/Fa/oPXc9HTG
	 VpCCcdP6xzk/Vx4VIcSujZ7KYbOPYhdlspYpSeuIufMogHPFBvn+DdPXCNgWia6Iwd
	 uetSM+RDBX4oHZIqhLqouuIJGJD0eXmExiiGFHQanGBR3VygZRt5XFLVy62fdwCe+Y
	 c/Q3Sd4LIDjtN617M0rFVZCcFB8iWA3Qx6ZNFXffCF3r6W8Kt0N6XPD9tcZfjkiCOL
	 Il0RmAzEcQzm8Na0eSQtCmY9S/7NvZhR1aR69zO8PF2b8lROnRtAxNauTo2Ry5xe5o
	 MHtmG23IPbGVw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v31 5/7] firmware: imx: adds miscdev
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: Frank.Li@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260729-imx-se-if-v31-5-e59af7adb784@nxp.com>
References: <20260729-imx-se-if-v31-0-e59af7adb784@nxp.com>
 <20260729-imx-se-if-v31-5-e59af7adb784@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 10:11:50 +0000
Message-Id: <20260729101151.103571F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

New issues:
- [Critical] Kernel panic due to traversing an uninitialized list head (`me=
m_pool_buf_list`) during device context cleanup.
- [Critical] The driver allows user-space to construct raw command payloads=
 and embed unvalidated DMA addresses, leading to a Confused Deputy vulnerab=
ility.
- [High] Firmware commands sent to the command receiver can overwrite unpro=
cessed commands, leading to lost events and spurious `-ENODEV` failures.
- [High] The SE_IOCTL_CMD_SEND_RCV_RSP ioctl incorrectly returns a positive=
 integer to userspace when the firmware command fails or the response valid=
ation fails, masking the failure and skipping subsequent cleanup error chec=
ks.
- [High] A TOCTOU race between `ele_msg_send_rcv()` checking the `going_awa=
y` flag and `se_if_probe_cleanup()` forcing a wakeup causes a lost wakeup d=
uring unbind, leading to a permanent deadlock.
- [High] A slab-out-of-bounds read occurs in `se_val_rsp_hdr_n_status` when=
 handling specific debug commands with a small `rx_buf_sz`.

Pre-existing issues:
- [High] Internal kernel hardware operations (like IMEM save/restore during=
 suspend/resume) fail spuriously if a signal is pending, breaking PM transi=
tions.
--

--- Patch [5]: [PATCH v31 5/7] firmware: imx: adds miscdev ---
commit 81281c9d3b1f75f8ca39e2d84326a1eb70748f81
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

firmware: imx: adds miscdev
   =20
This commit adds the character driver to enable communication with the NXP
secure enclave hardware from user-space applications. It introduces ioctls
for shared memory management and exchanging messages with the firmware.
Several checks are implemented on incoming message headers to block
restricted commands.

> diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele=
_common.c
> --- a/drivers/firmware/imx/ele_common.c
> +++ b/drivers/firmware/imx/ele_common.c
> @@ -246,6 +246,14 @@ int ele_msg_send_rcv(struct se_if_device_ctx *dev_ct=
x, void *tx_msg,
>  	guard(mutex)(&priv->se_if_cmd_lock);
> =20
> +	/*
> +	 * Teardown has begun: do not arm a new transaction. A thread that was
> +	 * blocked on se_if_cmd_lock while se_if_probe_cleanup() ran its
> +	 * complete_all() would otherwise miss that wake-up, re-arm the
> +	 * completion below and wait the full timeout, while unbind blocks
> +	 * indefinitely on this thread's fops_lock. Bail out instead.
> +	 */
> +	if (atomic_read(&priv->going_away))
> +		return -ENODEV;
> +
>  	if (atomic_read(&priv->fw_busy)) {
>  		dev_dbg(priv->dev, "%s: ELE became unresponsive.\n", dev_ctx->devname);
>  		return -EBUSY;
>  	}
> +
>  	reinit_completion(&priv->waiting_rsp_clbk_hdl.done);

[Severity: High]
Is there a TOCTOU race condition here with se_if_probe_cleanup()? If
se_if_probe_cleanup() sets going_away =3D 1 and calls complete_all() without
acquiring se_if_cmd_lock, could it execute complete_all() right after this
atomic_read() check but before reinit_completion() is called? Would this
erase the forced teardown wakeup and cause a permanent deadlock?

[ ... ]

> @@ -279,6 +284,14 @@ int ele_msg_send_rcv(struct se_if_device_ctx *dev_ct=
x, void *tx_msg,
>  	if (priv->waiting_rsp_clbk_hdl.signal_rcvd) {
>  		/*
>  		 * Signal was deferred until the FW/kernel protocol resynchronized.
>  		 * On success report -ERESTARTSYS for the interrupted wait; the
>  		 * command is not re-sent. Keep real errors like -ETIMEDOUT.
>  		 */
>  		if (err > 0)
>  			err =3D -ERESTARTSYS;
>  		priv->waiting_rsp_clbk_hdl.signal_rcvd =3D false;

[Severity: High]
This isn't a bug introduced by this patch, but does this explicit override
of a successful hardware interaction with -ERESTARTSYS break Power Manageme=
nt
transitions? If a signal is pending during system suspend, could this cause
internal kernel hardware operations like se_save_imem_state() to fail
spuriously and permanently lose the enclave IMEM state required for proper
resume?

[ ... ]

> @@ -323,9 +395,13 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, =
void *msg)
>  		/*
>  		 * Clamp the copy length to the pre-allocated receiver buffer (MAX_NVM=
_MSG_LEN).
>  		 */
>  		se_clbk_hdl->rx_msg_sz =3D min_t(u32, rx_msg_sz, MAX_NVM_MSG_LEN);
>  		devname =3D se_clbk_hdl->dev_ctx->devname;
>  		memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);
>  		complete(&se_clbk_hdl->done);

[Severity: High]
Does this unconditionally overwrite the shared rx_msg buffer and call
complete() upon receiving a firmware command? If the firmware issues a
second command before the userspace daemon executes a read() to consume the
first one, could the first command's payload be completely overwritten,
resulting in a spurious -ENODEV failure?

> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c
> @@ -284,11 +292,308 @@ static int get_se_soc_info(struct se_if_priv *priv=
, const struct se_soc_info *se
> +static int init_se_shared_mem(struct se_if_device_ctx *dev_ctx)
> +{
> +	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt =3D &dev_ctx->se_sha=
red_mem_mgmt;
> +	struct se_if_priv *priv =3D dev_ctx->priv;
> +
> +	INIT_LIST_HEAD(&se_shared_mem_mgmt->pending_out);
> +	INIT_LIST_HEAD(&se_shared_mem_mgmt->pending_in);
> +
> +	if (priv->mem_pool)
> +		INIT_LIST_HEAD(&se_shared_mem_mgmt->mem_pool_buf_list);

[Severity: Critical]
If priv->mem_pool is NULL, the mem_pool_buf_list remains zero-initialized.
Will se_cleanup_mem_pool_buf() later unconditionally traverse this
uninitialized list head via list_for_each_entry_safe() and cause a kernel
panic when the file descriptor is closed?

[ ... ]

> +static int se_ioctl_cmd_snd_rcv_rsp_handler(struct se_if_device_ctx *dev=
_ctx,
> +					    void __user *uarg)
> +{
[ ... ]
> +	struct se_api_msg *tx_msg __free(kfree) =3D
> +		memdup_user(u64_to_user_ptr(cmd_snd_rcv_rsp_info.tx_buf),
> +			    cmd_snd_rcv_rsp_info.tx_buf_sz);
> +	if (IS_ERR(tx_msg)) {
> +		err =3D PTR_ERR(tx_msg);
> +		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
> +		return err;
> +	}

[Severity: Critical]
Does this allow user-space to construct raw command payloads and embed
unvalidated DMA addresses? Since these addresses are not validated to ensure
they point to memory allocated via SE_IOCTL_SETUP_IOBUF before calling
ele_msg_send(), could a malicious application embed spoofed physical
addresses (like kernel page tables) and instruct the hardware to access
them?

[ ... ]

> +	struct se_api_msg *rx_msg __free(kfree) =3D
> +		kzalloc(cmd_snd_rcv_rsp_info.rx_buf_sz, GFP_KERNEL);
> +	if (!rx_msg) {
> +		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
> +		return -ENOMEM;
> +	}

[Severity: High]
Can this lead to a slab-out-of-bounds read in se_val_rsp_hdr_n_status()?
If rx_buf_sz is small (e.g., 4 bytes) but the firmware returns a header size
larger than SE_MU_HDR_WORD_SZ for debug commands, will
check_hdr_exception_for_sz() bypass the mismatch check and cause
se_val_rsp_hdr_n_status() to read past the 4-byte allocated rx_msg buffer?

[ ... ]

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
Does this mask the failure when the firmware command fails? If
se_val_rsp_hdr_n_status() sets a negative error code in rsp_status_err,
it skips se_dev_ctx_cpy_out_data(), but the positive message size from
ele_msg_send_rcv() stored in err isn't updated. Could this cause the ioctl
to return a positive value to userspace, falsely indicating success?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-imx-se-if-=
v31-0-e59af7adb784@nxp.com?part=3D5
