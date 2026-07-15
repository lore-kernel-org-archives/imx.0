Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05133AF641;
	Wed, 15 Jul 2026 17:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784137017; cv=none; b=egi+hGZ9s8EXdNzHiuw5rAhRZ0egHDhl2UFvInjnQXMo9WOEp2KUoYsSo+0XFUk09WPE+ei/be/Hc3UZAfp0a42KJrUk7WIQ9ShKvFm+GNjfia+uJNdaAM57LJ0zvhs5232yl92Rvb67iZyTXtcIZCNxtGCJEVeaA8/VIuIMzMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784137017; c=relaxed/simple;
	bh=fkccXmV066dwIIsp5/8k1sv0Ve/vlxRF2YHa3ptljdE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C23hFWcr8AVt7Xmf1xTAzVWD7/DquIIl+0lIUXzDprcIe3yFrN6UH6/NcA5M5yLWGNzuygUUmT13IeiYX5LLydO6r60CMhYL+W8N+uAyZ+BVR179MfLg8zuqUj055bFG8j+J74cShUAp3ALe4VqgW6bfofOMiHU9HW7+j1IovlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c1+EPynP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c1+EPynP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFC1F1F00A3E;
	Wed, 15 Jul 2026 17:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784137015;
	bh=p9ZcXMbPmnMurJbgB+suJk5o45o7JAG7j+HEXybVjIo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c1+EPynP/wfksbGRtBW7lnloqo6IdFZTnmaJusJkfXVjZSEM3t/8OLCQQs9ijfwsk
	 0gQAkG8mOx4RtbwgBSiZ3jFB4PD1yKw9y+Nu2ZMrta440dZmBfiCEiwdMZzLQTwbYK
	 zbQzu2x7QdZmIp/HfuvFI5bhVAc0z+V7zBZ8CNg5kDeeqaqvPNHMQQP+oxDhUiAtx+
	 Z+GkyZehQnkrPaHqyIND+flZltu8KhJTIfSqiovbxtVfi7Wmvbcy6d4d38PqIR89pU
	 MHMF9iXnL2NGNeib08qoAHb3+wAHc+ILjzYugHZLTXLZZv+R8UwEyQN6A5A83DOOw9
	 DvYYq/ANG+iOg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v27 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: Frank.Li@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260715-imx-se-if-v27-3-bb7c45952f06@nxp.com>
References: <20260715-imx-se-if-v27-0-bb7c45952f06@nxp.com>
 <20260715-imx-se-if-v27-3-bb7c45952f06@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 17:36:54 +0000
Message-Id: <20260715173654.DFC1F1F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 12 potential issue=
(s) to consider:
- [Critical] The `tx_msg` buffer can be freed while a dangling pointer rema=
ins in the mailbox core's transmit queue, leading to a Use-After-Free read.
- [High] A mathematically valid message checksum of `0` is treated as a fat=
al error, causing spontaneous failures in `ele_service_swap()`.
- [High] Global static variable `var_se_info.soc_rev` bypasses SoC device r=
egistration and per-device IMEM initialization on re-probes or secondary MU=
s.
- [High] Overriding successful firmware transaction results with `-ERESTART=
SYS` causes non-idempotent commands to be executed twice.
- [High] DMA buffers are freed locally on timeout while the hardware firmwa=
re transaction is still active, causing background memory corruption.
- [High] The IMEM size returned by the firmware during export is not valida=
ted against the allocated buffer size, causing an out-of-bounds DMA read du=
ring resume.
- [High] The driver fails to set a 32-bit coherent DMA mask, despite the ha=
rdware requiring 32-bit physical addresses for key firmware commands.
- [Medium] Mixing `goto`-based error handling with scope-based `__free()` a=
nd `guard()` declarations within the same function.
- [Medium] `ele_msg_rcv()` hardcodes a check against the wrong callback han=
dle for deferred signals, breaking abstraction.
- [Medium] Missing NULL check for dynamically allocated attributes in `get_=
se_soc_info()`.
- [Medium] Data race on global variable `var_se_info` during concurrent dev=
ice probes.
- [Low] Residual error check for `se_fill_cmd_msg_hdr` remains in `ele_serv=
ice_swap` despite the changelog explicitly claiming its removal.
--

--- Patch [3]: [PATCH v27 3/7] firmware: imx: add driver for NXP EdgeLock E=
nclave ---
commit 625c1bf0423b041b8486ca353501df5a7d5c4833
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

firmware: imx: add driver for NXP EdgeLock Enclave

This commit adds a new driver for the NXP EdgeLock Enclave (ELE) on i.MX
SoCs. It handles messaging unit communication, firmware loading, and
provides a base API for the secure enclave.

> diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/e=
le_base_msg.c
> --- a/drivers/firmware/imx/ele_base_msg.c
> +++ b/drivers/firmware/imx/ele_base_msg.c
> @@ -0,0 +1,272 @@
[ ... ]
> +int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
> +{
[ ... ]
> +	struct se_api_msg *tx_msg __free(kfree) =3D
> +		kzalloc(ELE_GET_INFO_REQ_MSG_SZ, GFP_KERNEL);
[ ... ]
> +	ret =3D ele_msg_send_rcv(priv, tx_msg, ELE_GET_INFO_REQ_MSG_SZ, rx_msg,
> +			       ELE_GET_INFO_RSP_MSG_SZ);
> +	if (ret < 0)
> +		goto exit;
[ ... ]
> +exit:
> +	if (priv->mem_pool)
> +		gen_pool_free(priv->mem_pool, (unsigned long)get_info_data,
> +			      ELE_GET_INFO_BUFF_SZ);
> +	else
> +		dma_free_coherent(priv->dev, ELE_GET_INFO_BUFF_SZ,
> +				  get_info_data, get_info_addr);
> +
> +	return ret;
> +}

[Severity: Medium]
Is it safe to mix goto-based error handling with scope-based __free()
declarations in this function?

The subsystem cleanup guidelines state that functions should either use
scope-based cleanup exclusively or goto-based cleanup exclusively to avoid
ownership and double-free issues during refactoring.

[Severity: Critical]
If ele_msg_send_rcv() times out, tx_msg is automatically freed by
__free(kfree) upon returning.

However, mbox_send_message() places the tx_msg pointer into its transmit
queue. Could this leave a dangling pointer in the mailbox core that will
trigger a use-after-free when the mailbox interrupt eventually processes it?

[Severity: High]
If ele_msg_send_rcv() times out, this code frees the DMA buffer
get_info_data via dma_free_coherent() on the exit path.

Since the hardware firmware transaction might still be active in the
background, could the firmware subsequently write to this freed memory and
corrupt the kernel heap or cause IOMMU faults?

[ ... ]
> +int ele_service_swap(struct se_if_priv *priv,
> +		     dma_addr_t addr,
> +		     u32 addr_size, u16 flag)
> +{
[ ... ]
> +	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
> +			    ELE_SERVICE_SWAP_REQ, ELE_SERVICE_SWAP_REQ_MSG_SZ, true);
> +	if (ret)
> +		return ret;

[Severity: Low]
Since se_fill_cmd_msg_hdr() was modified to return void, is this error
check on ret leftover dead code from a previous refactoring?

> +
> +	tx_msg->data[0] =3D flag;
> +	tx_msg->data[1] =3D addr_size;
> +	tx_msg->data[2] =3D ELE_NONE_VAL;
> +	tx_msg->data[3] =3D lower_32_bits(addr);
> +	tx_msg->data[4] =3D se_get_msg_chksum((u32 *)&tx_msg[0],
> +					    ELE_SERVICE_SWAP_REQ_MSG_SZ);
> +	if (!tx_msg->data[4])
> +		return -EINVAL;

[Severity: High]
Can the payload XOR checksum naturally evaluate to 0?

The se_get_msg_chksum() function computes a simple XOR across the payload
words. If the randomly assigned DMA address results in a checksum of 0, this
check would falsely treat it as an error and reject a valid command.

> diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele=
_common.c
> --- a/drivers/firmware/imx/ele_common.c
> +++ b/drivers/firmware/imx/ele_common.c
> @@ -0,0 +1,448 @@
[ ... ]
> +int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_=
hdl)
> +{
[ ... ]
> +		if (ret =3D=3D -ERESTARTSYS) {
[ ... ]
> +			if (priv->waiting_rsp_clbk_hdl.rx_msg) {
> +				WRITE_ONCE(se_clbk_hdl->signal_rcvd, true);
> +				wait_uninterruptible =3D true;
> +				continue;
> +			}
> +			break;
> +		}

[Severity: Medium]
Does this hardcode the check against priv->waiting_rsp_clbk_hdl.rx_msg
instead of checking the passed parameter se_clbk_hdl->rx_msg?

If a different callback handle is passed, this could fail to handle the
-ERESTARTSYS signal properly since it ignores the function parameter.

[ ... ]
> +int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_s=
z,
> +		     void *rx_msg, int exp_rx_msg_sz)
> +{
> +	unsigned long flags;
> +	int err;
> +
> +	guard(mutex)(&priv->se_if_cmd_lock);
[ ... ]
> +	err =3D ele_msg_send(priv, tx_msg, tx_msg_sz);
> +	if (err < 0)
> +		goto clear_waiter;
[ ... ]
> +clear_waiter:
> +	spin_lock_irqsave(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);

[Severity: Medium]
Does mixing guard() scope-based resource management with the goto
clear_waiter label violate the subsystem cleanup rules?

The guidelines recommend converting all resources to scope-based cleanup or
none to avoid ownership confusion and early-exit bugs.

[ ... ]
> +	if (priv->waiting_rsp_clbk_hdl.signal_rcvd) {
[ ... ]
> +		if (err > 0)
> +			err =3D -ERESTARTSYS;
> +		priv->waiting_rsp_clbk_hdl.signal_rcvd =3D false;
> +		dev_err(priv->dev, "Err[0x%x]:Interrupted by signal.", err);
> +	}

[Severity: High]
If the hardware successfully processes the command and returns a positive
result, does overriding the return value to -ERESTARTSYS force userspace to
re-execute the command?

For non-idempotent hardware operations, this could cause the operation to be
executed twice.

[ ... ]
> +int se_save_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem)
> +{
[ ... ]
> +	ret =3D ele_service_swap(priv, imem->daddr, ELE_IMEM_SIZE, ELE_IMEM_EXP=
ORT);
> +	if (ret < 0) {
> +		dev_err(priv->dev, "Failed to export IMEM.");
> +		imem->size =3D 0;
> +	} else {
> +		dev_dbg(priv->dev,
> +			"Exported %d bytes of encrypted IMEM.",
> +			ret);
> +		imem->size =3D ret;
> +	}

[Severity: High]
Does the size returned by the firmware during ELE_IMEM_EXPORT need to be
validated against ELE_IMEM_SIZE?

If the firmware returns an unexpectedly large size, it is saved directly to
imem->size. During a later resume, this unvalidated size is passed to
ELE_IMEM_IMPORT, which could cause the firmware to read past the end of the
allocated DMA buffer.

> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c
> @@ -0,0 +1,410 @@
[ ... ]
> +static int get_se_soc_info(struct se_if_priv *priv, const struct se_soc_=
info *se_info)
> +{
[ ... ]
> +	/*
> +	 * This function should be called once.
> +	 * Check if the se_soc_rev is zero to continue.
> +	 */
> +	if (var_se_info.soc_rev)
> +		return err;
> +
> +	err =3D ele_fetch_soc_info(priv, &data);
> +	if (err < 0)
> +		return dev_err_probe(priv->dev, err, "Failed to fetch SoC Info.");
> +	s_info =3D (void *)data;
> +	var_se_info.soc_rev =3D s_info->d_info.soc_rev;
> +	load_fw->imem.state =3D s_info->d_addn_info.imem_state;

[Severity: High]
If this driver probes multiple Messaging Unit instances, does returning ear=
ly
based on the static global var_se_info.soc_rev prevent secondary instances
from initializing properly?

The early return skips setting the instance's load_fw->imem.state and
registering the soc_device attributes for the secondary device.

[Severity: Medium]
Could concurrent probes on multi-MU platforms cause a data race here?

The static global var_se_info.soc_rev is read and written without any
synchronization, which could lead to redundant queries or corrupted state.

[ ... ]
> +	if (FIELD_GET(DEV_GETINFO_MIN_VER_MASK, var_se_info.soc_rev))
> +		attr->revision =3D devm_kasprintf(priv->dev, GFP_KERNEL, "%x.%x",
> +						FIELD_GET(DEV_GETINFO_MIN_VER_MASK,
> +							  var_se_info.soc_rev),
> +						FIELD_GET(DEV_GETINFO_MAJ_VER_MASK,
> +							  var_se_info.soc_rev));
> +	else
> +		attr->revision =3D devm_kasprintf(priv->dev, GFP_KERNEL, "%x",
> +						FIELD_GET(DEV_GETINFO_MAJ_VER_MASK,
> +							  var_se_info.soc_rev));
> +
> +	attr->soc_id =3D se_info->soc_name;
> +
> +	err =3D of_property_read_string(of_root, "model", &attr->machine);
> +	if (err)
> +		return -EINVAL;
> +
> +	attr->family =3D "Freescale i.MX";
> +
> +	attr->serial_number =3D devm_kasprintf(priv->dev,
> +					     GFP_KERNEL, "%016llX",
> +					     GET_SERIAL_NUM_FROM_UID(s_info->d_info.uid,
> +								     MAX_UID_SIZE >> 2));
> +
> +	sdev =3D soc_device_register(attr);

[Severity: Medium]
Do these devm_kasprintf() calls need NULL checks?

If the system is under memory pressure, they could fail and return NULL,
which would be silently passed along to soc_device_register().

[ ... ]
> +static int se_if_probe(struct platform_device *pdev)
> +{
[ ... ]
> +		if (load_fw->se_fw_img_nm->prim_fw_nm_in_rfs) {
> +			/* allocate buffer where SE store encrypted IMEM */
> +			load_fw->imem.buf =3D dmam_alloc_coherent(priv->dev, ELE_IMEM_SIZE,
> +								&load_fw->imem.daddr,
> +								GFP_KERNEL);

[Severity: High]
Since the hardware firmware interfaces strictly require 32-bit DMA addresses
(as verified by upper_32_bits() checks in ele_service_swap), should this
driver restrict the device's coherent DMA mask?

Calling dmam_alloc_coherent() without first setting
dma_set_coherent_mask(..., DMA_BIT_MASK(32)) could fail deterministically
on 64-bit systems mapping memory above 4GB.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-imx-se-if-=
v27-0-bb7c45952f06@nxp.com?part=3D3
