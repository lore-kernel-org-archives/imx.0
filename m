Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E09A3F1660;
	Mon, 24 Aug 2026 09:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787563149; cv=none; b=IM568D1BwxFUTkrs1O4oWe2OAUT5MBChRdbsr3BSgcWI5GmzYcXc21aATWMQoXpIbg7r2Z0yZ5GPDNdOp1XNrYEFh5JS9uqBgj0sPrJDRG7AKiXKrGi2NJ16h2ydDR5+0x6JgsKK0iCwPxM4UKb/YbpWT+/qq0PlS8NqlPkXtIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787563149; c=relaxed/simple;
	bh=NL0yqA1dgQxmeXXXwXbu6p8BtL2/aCwBSjNaq6QT2LY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qSdMR+xzeTpHS6rAypbrD7i2sBfGWVM1XXMqhY4FG/Rp72jM+u9hroKuCRG1xG74kBQst4a4S16l/2kLXtRaIfh+5KNf5oeL9ZM7hc6+mOsKpWWQ/czDgcfaHPMbnXkrRtTNkmFnavJTLW8zGCboimQJZ35lhgJcgggcWfBKxP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BILPdnOO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BILPdnOO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63B871F000E9;
	Mon, 24 Aug 2026 09:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787563140;
	bh=auFA8mSQqPfJrP6NW8Ish4yx/Au3DSZqiFiq1xti/H4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BILPdnOOT90Aaf8b4fO7Ua5BoMtAG282f88MepClaqeJYtQu1YGL/MJzml4evDyj9
	 vbi3NAFL0xVWfzk4N1BYAD0+7U4w5LlF/S0Oc6eT/5DbjYYs219jtVypvMwljUFcBE
	 MncbBA5lPqOLcu/Vf26ZKZxMEf3vg43pOHl7MzuFwnNru9ORW63WDbrtbgyfVNvCu1
	 fqPMDtxIX5NE5ezMPr4/SzcszxLHtkn4q8aF0RHutQSJQyN9Go1D49dmv0ZWmJxw+u
	 vIYlLkNHNG97oMtBr+l3yCMtlybX69lq5c3v4zHjIQEygd+hoHXCYN05xrRH7tq9GU
	 D+Zm8hCTLY2sQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v41 5/7] firmware: imx: adds miscdev
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260824-imx-se-if-v41-5-29cf129e4d86@nxp.com>
References: <20260824-imx-se-if-v41-0-29cf129e4d86@nxp.com>
 <20260824-imx-se-if-v41-5-29cf129e4d86@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 09:19:00 +0000
Message-Id: <20260824091900.63B871F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Firmware can be tricked into reading out of bounds of the shared m=
emory window, potentially accessing arbitrary physical memory.
- [High] A TOCTOU race condition allows multiple contexts to issue ELE_STOR=
AGE_OPEN_REQ concurrently, breaking command receiver isolation and allowing=
 one process to intercept another's NVM traffic.
- [High] Incorrect teardown ordering allows `fw_busy_work` to be scheduled =
after it is canceled, leading to a use-after-free when `priv` is freed.
- [High] A 3-way deadlock occurs during driver unbind if a concurrent `clos=
e()` is called on a context that recently experienced a command timeout.
- [Medium] The SE_IOCTL_ENABLE_CMD_RCV_STATUS ioctl unconditionally fails w=
ith -ENOMEM.
- [Medium] Memory and device reference leak on early probe error paths.
--

--- Patch [5]: [PATCH v41 5/7] firmware: imx: adds miscdev ---
commit 6943d8e80841760dc256faf0183efc19b3d26073
Author: Pankaj Gupta <pankaj.gupta@nxp.com>
Subject: firmware: imx: adds miscdev

Adds the driver for communication interface to secure-enclave, that
enables exchanging messages with NXP secure enclave HW IP(s)
like EdgeLock Enclave, from User-Space Applications via character driver.

> diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele=
_common.c
> --- a/drivers/firmware/imx/ele_common.c
> +++ b/drivers/firmware/imx/ele_common.c
> @@ -66,0 +66,0 @@ int se_val_cmd_addrs(struct se_if_device_ctx *dev_ctx, =
struct se_api_msg *msg,
[ ... ]
> +		} else if (f->size_idx !=3D SE_CMD_ADDR_NO_SIZE) {
[ ... ]
> +		} else if (f->buf_size) {
> +			/* buf_size: literal byte count (FW-defined constant). */
> +			if ((u64)f->buf_size > end - addr)
> +				return -EACCES;
> +		}
> +	}
> +
> +	return 0;
> +}

[Severity: High]
Could a malicious userspace program trick the firmware into reading out of
bounds of the shared memory window?

The bounds check loop skips length verification entirely when size_idx is
SE_CMD_ADDR_NO_SIZE and buf_size is 0, only validating the start address.

For commands like ELE_OEM_AUTH_CONTAINER_REQ, this means userspace could
supply an address near the end of the authorized window, causing the enclave
firmware to read past the valid DMA window into unowned memory.

> @@ -618,0 +618,0 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, v=
oid *msg)
[ ... ]
> +		se_clbk_hdl =3D &priv->waiting_rsp_clbk_hdl;
> +		spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
> +		if (!se_clbk_hdl->rx_msg) {
> +			if (atomic_read(&priv->fw_busy))
> +				schedule_fw_busy_work =3D true;
> +			spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
> +
> +			if (schedule_fw_busy_work)
> +				schedule_work(&priv->fw_busy_work);

[Severity: High]
Is there a use-after-free risk if this callback runs during driver unbind?

If a late firmware response arrives while se_if_probe_cleanup() is running,
the callback might evaluate atomic_read(&priv->fw_busy) and prepare to
schedule the work. If cancel_work_sync() completes before schedule_work() is
called, the work will be queued after being canceled. When the unbind finis=
hes
and frees priv, the workqueue will execute se_fw_busy_work() and dereference
the freed priv pointer.

> diff --git a/drivers/firmware/imx/ele_fw_api.c b/drivers/firmware/imx/ele=
_fw_api.c
> --- a/drivers/firmware/imx/ele_fw_api.c
> +++ b/drivers/firmware/imx/ele_fw_api.c
> @@ -82,0 +82,0 @@ int ele_uapi_allowed_fw_cmd(struct se_if_device_ctx *de=
v_ctx, struct se_msg_hdr
[ ... ]
> +	case ELE_STORAGE_OPEN_REQ:
> +		/* Might be cleared as part of tear down. */
> +		if (dev_ctx->strg_hdl) {
> +			ret =3D -EEXIST;
> +			break;
> +		}
> +		/*
[ ... ]
> +		 */
> +		scoped_guard(mutex, &priv->modify_lock)
> +			if (priv->cmd_receiver_clbk_hdl.dev_ctx &&
> +			    priv->cmd_receiver_clbk_hdl.dev_ctx !=3D dev_ctx)
> +				ret =3D -EBUSY;

[Severity: High]
Does this create a time-of-check to time-of-use race condition that allows
multiple contexts to issue ELE_STORAGE_OPEN_REQ concurrently?

The exclusivity check is performed under a scoped modify_lock but dropped
before the command is actually sent. Two contexts could both pass this
validation because neither is registered yet.

> @@ -290,0 +290,0 @@ void fw_api_specific_ops(struct se_if_device_ctx *dev=
_ctx, struct se_api_msg *rx
[ ... ]
> +	case ELE_STORAGE_OPEN_REQ: {
> +		int rc;
> +
> +		/*
[ ... ]
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
> +		rc =3D set_dev_ctx_as_command_receiver(dev_ctx, false);
> +		if (rc)
> +			dev_err(priv->dev,
> +				"Failed to register %s as CMD-Receiver: %d\n",
> +				dev_ctx->devname, rc);
> +		break;
> +	}

[Severity: High]
Could this result in broken isolation if two contexts obtain valid storage
handles?

Following the race mentioned above, the second process will fail to register
as a command receiver here. However, since this failure is only logged,
success is still returned to userspace. Could this cause the NVM callbacks
for the second process's storage handle to be routed to the first process?

> diff --git a/drivers/firmware/imx/ele_msg_addr_field.c b/drivers/firmware=
/imx/ele_msg_addr_field.c
> --- a/drivers/firmware/imx/ele_msg_addr_field.c
> +++ b/drivers/firmware/imx/ele_msg_addr_field.c
> @@ -20,0 +20,0 @@ static const struct se_cmd_addr_field ele_get_info_addr=
_fields[] =3D {
[ ... ]
> +static const struct se_cmd_addr_field ele_oem_auth_cntr_addr_fields[] =
=3D {
[ ... ]
> +	{ .lsb_idx =3D 1, .msb_idx =3D 0, .has_msb =3D true, .flag_idx =3D SE_C=
MD_ADDR_ALWAYS,
> +	  .size_idx =3D SE_CMD_ADDR_NO_SIZE },			/* container_hdr_addr */
> +};

(Just noting the definition for context of the bounds check issue.)

> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c
> @@ -702,0 +702,0 @@ static void se_if_probe_cleanup(void *plat_dev)
[ ... ]
> +	scoped_guard(mutex, &priv->se_if_cmd_lock) {
> +		cancel_work_sync(&priv->fw_busy_work);
> +		if (priv->rx_chan) {
> +			mbox_free_channel(priv->rx_chan);
> +			priv->rx_chan =3D NULL;
> +		}

[Severity: High]
Can a 3-way deadlock occur here during driver unbind if a concurrent close()
is called on a context that recently experienced a command timeout?

The unbind thread holds se_if_cmd_lock and waits for the workqueue via
cancel_work_sync().

The workqueue executing se_clear_fw_busy() holds nothing but waits for
dev_ctx->fops_lock.

The close thread executing cleanup_dev_ctx() holds fops_lock, observes
fw_busy =3D=3D 0, and attempts to acquire se_if_cmd_lock by calling
se_close_storage().

This circular dependency seems like it could lock up the kernel unbind
process and userspace close().

[Severity: High]
Additionally, is the teardown ordering here safe?

By calling cancel_work_sync(&priv->fw_busy_work) before
mbox_free_channel(priv->rx_chan), the IRQ source remains active. This allows
the race condition mentioned earlier where the work could be re-armed after
being canceled.

> @@ -880,0 +880,0 @@ static int se_if_probe(struct platform_device *pdev)
[ ... ]
> +	priv =3D kzalloc_obj(*priv, GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->dev =3D dev;
> +	/*
[ ... ]
> +	 */
> +	get_device(priv->dev);
> +	kref_init(&priv->refcount);
> +	priv->if_defs =3D &if_node->if_defs;
> +	dev_set_drvdata(dev, priv);
> +
> +	ret =3D devm_mutex_init(dev, &priv->se_if_cmd_lock);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to init mutex: priv se_if_cmd_lock.\n");
> +	ret =3D devm_mutex_init(dev, &priv->modify_lock);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to init mutex: priv modify_lock.\n");
[ ... ]
> +	ret =3D devm_add_action_or_reset(dev, se_if_probe_cleanup, pdev);

[Severity: Medium]
Are there memory and device reference leaks on these early error paths?

If devm_mutex_init() fails, the function returns immediately. Because
devm_add_action_or_reset() has not been called yet, the cleanup function is
not registered, which leaves the priv allocation and the device reference
leaked.

> @@ -1012,0 +1012,0 @@ int set_dev_ctx_as_command_receiver(struct se_if_de=
vice_ctx *dev_ctx, bool is_io
[ ... ]
> +	if (!dev_ctx->strg_hdl)
> +		return -EINVAL;
> +
> +	if (is_ioctl)
> +		return -ENOMEM;

[Severity: Medium]
Does this make the SE_IOCTL_ENABLE_CMD_RCV_STATUS ioctl completely unusable?

Because se_ioctl() invokes this function with is_ioctl set to true, this
check will cause the ioctl to fail unconditionally with -ENOMEM.

> @@ -1844,0 +1844,0 @@ static long se_ioctl(struct file *fp, unsigned int =
cmd, unsigned long arg)
[ ... ]
> +		case SE_IOCTL_ENABLE_CMD_RCV_STATUS: {
> +			err =3D set_dev_ctx_as_command_receiver(dev_ctx, true);
> +			if (err)
> +				dev_err(priv->dev, "Failed[%ld] to register %s as CMD-Receiver.\n",
> +					err, dev_ctx->devname);
> +		break;
> +		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824-imx-se-if-=
v41-0-29cf129e4d86@nxp.com?part=3D5
