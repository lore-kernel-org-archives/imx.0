Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E103F3D5656;
	Tue,  8 Sep 2026 12:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788869149; cv=none; b=nDESkQS1fzJPvTkGOCPF+yGCWFzOKssl1aN/t6hRUn++lHUjGhM5vnQI2pHM5pf/rG1U/2T18fiP7VbKUx8Gyk/gG4g7xzMUQRqPuItXBIwOXaRNG0PHR0nxcoSqSHOtTNnJpRyyeA9Te4Vrpw/YsCM91xBCL+O+UqrMzxW4PIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788869149; c=relaxed/simple;
	bh=J0QWtQojSlALprMFrPXPpWiG5mBmKb/JAlBlmyHtaZ4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WqKS0Gagz4rUcGXvsjNTPfYbK9rZFDuQFdyH9mZwvbxqloUZ1OP0CpH3iU7N4b740tv/UikgutgzmHCAJmNJdxg/4fLUckKIZ6auy4X5pqMD4LpUL4l1za6yZi8XBF49Sybb7YwN2jKuQ2iy5ISB5NCT/FRO9kg4dTZQwZj0xqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a6xiCVks; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a6xiCVks"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 378D91F00A3A;
	Tue,  8 Sep 2026 12:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788869139;
	bh=2ojMZR/od4YfwFom3X3TwCJbl+TP8p0WoA6cxLf4L4w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a6xiCVksLF90JVPbXm5Fz5goXSylvbaKC2ZTbaL6GzDCkwQhyZiiVQe5ER/WsMRhJ
	 KidRdLrc4fXzIurQrq52nle5e+oWf+DxwCZMnTFzscy/5jLeYKrSSw+L6AtaNxHbGc
	 4xoVUt40NobwxRQoijew+mnBir423ldq3ZEsIjh0UcE+NNyhbkL+wPzEgwxkLNi9I2
	 dAqpt58lOcwEHrlME4WnZqrk7gVv2GaMsDT59b2zu5yEchHKifdGFTi/+XFi6KVoG/
	 ni4nbXzinZzBuztS2a+cYTiJBZtzC/T4Osp7xGGSaD1JBmrfeDNNWAJHE0+rEyR+2h
	 0wViYTX/SUKcg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v49 5/7] firmware: imx: adds miscdev
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: imx@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260908-imx-se-if-v49-5-a59529118839@nxp.com>
References: <20260908-imx-se-if-v49-0-a59529118839@nxp.com>
 <20260908-imx-se-if-v49-5-a59529118839@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 12:05:38 +0000
Message-Id: <20260908120539.378D91F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Moving `atomic_set(&fbusy_info->fw_busy, 0)` to the end of `se_cle=
ar_fw_busy()` causes all session and storage handle cleanup requests to fai=
l, permanently leaking firmware resources.
- [High] Missing upper-bound checks for variable-length input DMA buffers i=
n ELE_OEM_AUTH_CONTAINER_REQ and ELE_KEYSTORE_REPROV_ENABLE_REQ allow malic=
ious userspace to trigger out-of-bounds physical memory reads, potentially =
crashing the secure enclave or system.
--

commit b1854f8ad905b9bef822cde3f1cab2d887c816c2
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

firmware: imx: adds miscdev

This commit introduces a character device driver to facilitate communication
with the NXP secure enclave (EdgeLock Enclave) from user-space applications.
It manages the shared memory buffers, enforces command whitelisting, and
handles device context cleanup.

> diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele=
_common.c
> --- a/drivers/firmware/imx/ele_common.c
> +++ b/drivers/firmware/imx/ele_common.c
[ ... ]
> @@ -66,13 +66,13 @@ int se_val_cmd_addrs(struct se_if_device_ctx *dev_ctx=
, struct se_api_msg *msg,
[ ... ]
> +		if (f->size_idx =3D=3D SE_CMD_RCVR_ADDR_VAR_SIZE) {
[ ... ]
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
Does this code fail to enforce an upper bound when f->size_idx is
SE_CMD_ADDR_NO_SIZE and f->buf_size is 0?

If a malicious caller provides a DMA address very close to the end of the
window (e.g., end - 1), it seems the firmware might read past the allocated
shared memory boundary. Could this lead to an out-of-bounds physical memory
read over the DMA bus?

[ ... ]
> @@ -529,13 +529,13 @@ int ele_msg_send_rcv(struct se_if_device_ctx *dev_c=
tx, void *tx_msg,
[ ... ]
> +	if (atomic_read(&fbusy_info->fw_busy)) {
> +		spin_unlock_irqrestore(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags=
);
> +		dev_dbg(priv->dev, "%s: ELE became unresponsive.\n", dev_ctx->devname);
> +		return -EBUSY;
> +	}

[ ... ]
> diff --git a/drivers/firmware/imx/ele_msg_addr_field.c b/drivers/firmware=
/imx/ele_msg_addr_field.c
> --- a/drivers/firmware/imx/ele_msg_addr_field.c
> +++ b/drivers/firmware/imx/ele_msg_addr_field.c
> @@ -20,13 +20,13 @@ static const struct se_cmd_addr_field ele_get_info_ad=
dr_fields[] =3D {
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
> +};

[Severity: High]
Is the assumption in this comment correct?

Even for an input-only buffer, if there is no length bound checked here, a
rogue caller could supply a valid start address immediately preceding an
unmapped or restricted physical memory region. The firmware reading the
variable-length container header could then cross the boundary, triggering a
bus error, IOMMU fault, or SError that might crash the system or enclave.

[ ... ]
> @@ -125,13 +125,13 @@ static const struct se_cmd_addr_field ele_pub_key_e=
xport_addr_fields[] =3D {
[ ... ]
> +static const struct se_cmd_addr_field ele_keystore_reprov_en_addr_fields=
[] =3D {
> +	/*
> +	 * Signed message address: a 64-bit physical address split across two
> +	 * words. data[0] holds the 32-bit MSB and data[1] holds the 32-bit LSB
> +	 * (ELE API spec Table 202, word size =3D 0x3, so the command is header=
 +
> +	 * MSB + LSB only). The address points to the start of the complete
> +	 * signed message block (header + 12-byte payload from Table 204 +
> +	 * signature); the total block size depends on the signing format and is
> +	 * not carried anywhere in the MU payload words. No static
> +	 * firmware-defined maximum for the full block is specified. Because th=
is
> +	 * is a read-only input buffer (firmware reads and verifies the signed
> +	 * block, does not write back through this address), enforcing only the
> +	 * start-address range check is acceptable: a rogue caller can at most
> +	 * cause firmware to read within the shared-memory window, which is
> +	 * memory the caller already owns. Output buffers must be fully bounded;
> +	 * input-only buffers are safe with addr-only checks.
> +	 */
> +	{ .lsb_idx =3D 1, .msb_idx =3D 0, .has_msb =3D true, .flag_idx =3D SE_C=
MD_ADDR_ALWAYS,
> +	  .size_idx =3D SE_CMD_ADDR_NO_SIZE },			/* signed_msg_addr */
> +};

[Severity: High]
Similar to the container header check in ele_oem_auth_cntr_addr_fields, cou=
ld
this lack of an upper bound size check allow malicious userspace to trigger
out-of-bounds physical memory reads by the firmware during reprovisioning
operations?

[ ... ]
> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c
> @@ -1070,13 +1070,13 @@ static int se_if_misc_register(struct se_if_priv =
*priv)
[ ... ]
> +static void se_clear_fw_busy(struct se_if_priv *priv)
> +{
[ ... ]
> +			} else if (dev_ctx->cleanup_done) {
> +				/*
> +				 * Userspace fd already closed while fw_busy was
> +				 * armed (e.g. SIGKILL). FW has now responded;
> +				 * close deferred handles and free the DMA buf.
> +				 */
> +				if (dev_ctx->strg_hdl &&
> +				    se_close_storage(priv->priv_dev_ctx,
> +						     dev_ctx->strg_hdl))
> +					dev_err(priv->dev,
> +						"%s: failed to close deferred storage handle\n",
> +						dev_ctx->devname);
> +				if (dev_ctx->sess_hdl &&
> +				    se_close_session(priv->priv_dev_ctx,
> +						     dev_ctx->sess_hdl))
> +					dev_err(priv->dev,
> +						"%s: failed to close deferred session handle\n",
> +						dev_ctx->devname);
> +				dev_ctx->strg_hdl =3D 0;
> +				dev_ctx->sess_hdl =3D 0;
> +				cleanup_se_shared_mem(dev_ctx, true);
> +			} else {
[ ... ]
> +	spin_lock_irqsave(&fbusy_info->fw_busy_lock, flags);
> +	atomic_set(&fbusy_info->fw_busy, 0);
> +	spin_unlock_irqrestore(&fbusy_info->fw_busy_lock, flags);
> +	kref_put(&dev_ctx->refcount, se_if_dev_ctx_release);
> +}

[Severity: High]
Will this cleanup path accidentally leak the handles it intends to close?

In se_clear_fw_busy(), atomic_set(&fbusy_info->fw_busy, 0) is deferred until
the very end of the function. However, the calls to se_close_storage() and
se_close_session() both rely on ele_msg_send_rcv().

Because ele_msg_send_rcv() checks atomic_read(&fbusy_info->fw_busy) and
returns -EBUSY immediately if it is set (as quoted earlier from
drivers/firmware/imx/ele_common.c), won't these close requests be rejected
without ever reaching the firmware? This could allow a userspace process
repeatedly killed by SIGKILL to exhaust the secure enclave's handles.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908-imx-se-if-=
v49-0-a59529118839@nxp.com?part=3D5
