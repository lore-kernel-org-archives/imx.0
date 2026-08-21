Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E4C48F85E;
	Fri, 21 Aug 2026 13:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787318620; cv=none; b=LiWxnlke4c0P0fmssp/Y/U9eE7u6idM0Wo/JDsi7X4GcpLDLg6VgGUWxHlUwiTK9eanAOw4yk55Y3W2ihiKBWciqJNXHwGVMEVJuHpaUGcvdgObfMYtIWyT+xXvfDS2bsa03VphOl0MximZahIZVax/udqHoAziqB1gNLPUNnKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787318620; c=relaxed/simple;
	bh=eIN7qQx0gCoZyXciN+J32cP2bAGhSqnSq8ru7Ag/TJU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DPJFdWNPFeFA/kGjy0ON5LXTzEd4jS9n0MzNwRLHgVkedcMXMG6+5WynkeVQtvOgTK+qa2p/1QYmbzFHfHvIBcXKNoOgyIxhS6J85AkbDufQy6RbN0dWKIVbGMxf3GsGjvWU5w2rVygVfZ2ff8461wYwAP8yaQcRXNdFn6kU3jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jyoskVxD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jyoskVxD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 672201F000E9;
	Fri, 21 Aug 2026 13:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787318608;
	bh=FkZ1DBbehygR0DUnqE/5kLPx2SnF7CPjHsuBDNe8M6k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jyoskVxDSnsPKlByUsfs7YymYJWTIakwEPZZjGbVJLhR6tXbq6cg+OScxYlfO8vxw
	 mg1h848LYIeTr3JmulnEMaZ1oZ2RL+k1XHi4oXaM2gr5k2FRl6K8+CfnA68cnh7NDT
	 jTNmDczsZb3sNJwaClHUsx5Ns0QanF4DwG5VlEBAqPBm68fKl9eVoUVhnTRobuPB/J
	 Ay9nZCT5KrfFzQzrqfHu5D/9gb1z7wTHthAaHt7ArJ0nTtESbYaD06PJUkCq1W4mxs
	 DZvSF4rMTIQCTDAYgRm4oTo4t2M+QhbPleOCYFtI90q+lGOubdpaLR8+tuNnNIflMb
	 NbO19KE15c5Uw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v40 5/7] firmware: imx: adds miscdev
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260822-imx-se-if-v40-5-74fbce2f2f95@nxp.com>
References: <20260822-imx-se-if-v40-0-74fbce2f2f95@nxp.com>
 <20260822-imx-se-if-v40-5-74fbce2f2f95@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 13:23:27 +0000
Message-Id: <20260821132328.672201F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] API Contract Violation: SE_IOCTL_ENABLE_CMD_RCV_STATUS ioctl uncon=
ditionally fails with -ENOMEM.
- [High] Race Condition / Security Isolation: TOCTOU race in ELE_STORAGE_OP=
EN_REQ allows bypassing receiver uniqueness.
- [High] Race Condition / Use-After-Free: `se_if_fops_read` accesses `dev_c=
tx->devname` without `fops_lock` during error handling.
- [Low] Code Quality / Documentation Mismatch: Missing `__func__` in error =
logs.
--

--- Patch [5]: [PATCH v40 5/7] firmware: imx: adds miscdev ---
commit 823b871a16858b528f46321987d0641124095c4f
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

firmware: imx: adds miscdev

This commit adds a miscdev interface to exchange messages with NXP secure
enclaves from userspace. It provides an ioctl interface and file operations
for memory management, getting info, and command/response handling.

Closes: https://sashiko.dev/#/patchset/20260821-imx-se-if-v39-0-41e4257c2af=
c@nxp.com?part=3D5

> - Fix dev_err format specifier from %ld to %d for the err variable and
>   add __func__ to CMD-Receiver registration failure messages.

[Severity: Low]
The commit message states that __func__ was added to the CMD-Receiver
registration failure messages. Looking at the code in fw_api_specific_ops(),
the dev_err() call for registration failure doesn't appear to include
__func__. Did this change get missed in the final version of the patch?

> diff --git a/drivers/firmware/imx/ele_fw_api.c b/drivers/firmware/imx/ele=
_fw_api.c
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
> +		 * already registered as the command receiver.
[ ... ]
> +		scoped_guard(mutex, &priv->modify_lock)
> +			if (priv->cmd_receiver_clbk_hdl.dev_ctx &&
> +			    priv->cmd_receiver_clbk_hdl.dev_ctx !=3D dev_ctx)
> +				ret =3D -EBUSY;
> +		if (rx_msg_sz < ELE_STORAGE_OPEN_RSP_SZ)
> +			ret =3D -EINVAL;
> +		break;

[Severity: High]
Could this check be vulnerable to a race condition? Since the global
se_if_cmd_lock is not held during this validation, two concurrent threads
issuing an ELE_STORAGE_OPEN_REQ could potentially both pass this check.

If that happens, thread A would acquire the lock, send its command, and
register as the receiver. Thread B would then acquire the lock, send its
command, allocate a second handle, but fail registration in
fw_api_specific_ops(). Because that failure is only logged and ignored,
does thread B successfully open storage but have its callbacks silently
routed to thread A?

> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c
[ ... ]
> +int set_dev_ctx_as_command_receiver(struct se_if_device_ctx *dev_ctx, bo=
ol is_ioctl)
> +{
> +	struct se_if_priv *priv =3D dev_ctx->priv;
> +	struct se_api_msg *new_rx_msg =3D NULL;
> +	struct se_clbk_handle *se_clbk_hdl;
> +	unsigned long flags;
> +
> +	se_clbk_hdl =3D &priv->cmd_receiver_clbk_hdl;
> +	guard(mutex)(&priv->modify_lock);
> +	if (se_clbk_hdl->dev_ctx =3D=3D dev_ctx)
> +		return 0;
> +
> +	if (se_clbk_hdl->dev_ctx)
> +		return -EBUSY;
> +
> +	if (!dev_ctx->strg_hdl)
> +		return -EINVAL;
> +
> +	if (is_ioctl)
> +		return -ENOMEM;

[Severity: High]
Is this intended to unconditionally fail the ioctl with an out-of-memory
error?

When the SE_IOCTL_ENABLE_CMD_RCV_STATUS ioctl is invoked in se_ioctl(), it
calls this function with is_ioctl set to true, which will immediately return
-ENOMEM. Does this make it impossible for userspace to register as a
command receiver via the documented ioctl?

[ ... ]
> +static ssize_t se_if_fops_read(struct file *fp, char __user *buf, size_t=
 size,
> +			       loff_t *ppos)
> +{
> +	struct se_if_device_ctx *dev_ctx =3D fp->private_data;
[ ... ]
> +	err =3D ele_msg_rcv(dev_ctx, &priv->cmd_receiver_clbk_hdl);
> +	if (err < 0) {
> +		if (err !=3D -ERESTARTSYS)
> +			dev_err(priv->dev,
> +				"%s: Er[0x%x]: Signal Interrupted. Current act-dev-ctx count: %d.",
> +				dev_ctx->devname, err, dev_ctx->priv->active_devctx_count);
> +		return err;
> +	}

[Severity: High]
Could accessing dev_ctx->devname here lead to a use-after-free?

The fops_lock is explicitly dropped before calling ele_msg_rcv() above. If
a concurrent unbind occurs and tears down the context, cleanup_dev_ctx()
could run, acquire fops_lock, and free dev_ctx->devname. If ele_msg_rcv()
then returns an error, this error path will execute without fops_lock and
dereference the potentially freed dev_ctx->devname pointer.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260822-imx-se-if-=
v40-0-74fbce2f2f95@nxp.com?part=3D5
