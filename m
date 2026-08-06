Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAD0448B84;
	Thu,  6 Aug 2026 11:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786015646; cv=none; b=kFKMwcKIjNbO/3SkeWd3hvsZK9smHZzypRkvjNaEZUA1LnJTBFIIYk1y0KqJgWCWqLf05P6XSbtZLQjPAvUiTz9KxPOEtNY+ZZ16gNO5x7x6EsyhGI2TrMHqNKeSRBDSqOYtlikddsEv6tAihTVc3QIBBVya1WuLzml5k6ffkSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786015646; c=relaxed/simple;
	bh=4t3lOL5zceQLkFGOq0ZDF8HAJPN3MR9VLcVx8TBU0Ys=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YPqc3+Zk4p1Sfbj5d7Ee4Xn7s3BsoU066fITQL+T3ChKmdmw+GGZZMJI4YLJPPDsHC9CdpmnX6b0lyvoZNHVYo4xbRhvKPt0KnH7O2LoWpe57Xys8PK+2J9IQi1gEKM7L/6wbiXo5EUwVLaWCpIdGDvmxGl0MyMdAV5S7/W6Q+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IH3sxusF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IH3sxusF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89B351F000E9;
	Thu,  6 Aug 2026 11:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786015644;
	bh=obUbvbDJQpsu0FL/dBaUt+UxsmHRG5s3wWQlipHsa9U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IH3sxusFSSIHa/wEPvE7QrzPdgI/LO1bTJgdmIOYrilssB4BzPzUA5cQNre79fra3
	 xVg1w5rTBw62MzlL25Yc5/jg0+r2EEFB1xQDgQQleQ6eOfi3c5EqhgOUZbmXEU58XN
	 iilk11ya4691RNWnyj+igAEYuqPlGpc6jbwxmS+fyab3IwNyCTQFzIVgcEtBwiKERk
	 L7PWQvEIVLU+NY1wqm2mvzi6jHbJ5hiQpPbEpE+h1wYx3q8ANS9xELxNnd6Ud3fUKC
	 Tb1uZvy5DioXKOg+eguHC+Wkm6zckt4ziLuEEdZGDbuO+9SrkHJpg9cwxHZFaaQVE7
	 lag3Bwhgh+O7A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v35 5/7] firmware: imx: adds miscdev
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260806-imx-se-if-v35-5-11b25bb308ef@nxp.com>
References: <20260806-imx-se-if-v35-0-11b25bb308ef@nxp.com>
 <20260806-imx-se-if-v35-5-11b25bb308ef@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 11:27:24 +0000
Message-Id: <20260806112724.89B351F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Critical] The driver allows userspace to embed arbitrary DMA addresses i=
n permitted firmware commands, enabling arbitrary physical memory overwrite.
- [High] The `se_if_open_gate` structure can be accessed after it is freed =
if an `open()` system call races with driver unbind.
- [High] A concurrent `close()` racing with driver unbind causes a Use-Afte=
r-Free on the mailbox channel `priv->tx_chan` due to premature unlinking.
- [High] Firmware session and storage handles can be permanently leaked if =
response validation or userspace memory copies fail, bypassing the tracking=
 of allocated handles.
- [High] Signal interruption converts an interruptible wait into an unkilla=
ble uninterruptible wait for up to 5000 seconds.
--

--- Patch [5]: [PATCH v35 5/7] firmware: imx: adds miscdev ---
commit a678d58783e842f1a853a0ba674864702cf30910
Author: Pankaj Gupta <pankaj.gupta@nxp.com>
Subject: firmware: imx: adds miscdev

This commit adds a character driver to communicate with the NXP secure
enclave hardware. It provides an ioctl interface for userspace applications
to send commands, manage shared memory, and restricts invalid or disallowed
firmware commands.

Closes: https://sashiko.dev/#/patchset/20260805-imx-se-if-v34-0-7e4713d14e0=
a@nxp.com?part=3D5

> diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/e=
le_base_msg.c
> --- a/drivers/firmware/imx/ele_base_msg.c
> +++ b/drivers/firmware/imx/ele_base_msg.c
> @@ -15,13 +15,57 @@
> =20
>  #define FW_DBG_DUMP_FIXED_STR		"ELE"
> =20
> +int ele_uapi_allowed_base_cmd(struct se_if_priv *priv,
> +			      struct se_msg_hdr *header)
> +{
> +	switch (header->command) {
> +	case ELE_PING_REQ: return 0;
> +	case ELE_DEBUG_DUMP_REQ: return 0;
> +	case ELE_OEM_AUTH_CONTAINER_REQ: return 0;
> +	case ELE_OEM_VERIFY_IMAGE_REQ: return 0;
> +	case ELE_OEM_REL_CONTAINER_REQ: return 0;
> +	case ELE_FW_LIFE_CYCLE_REQ: return 0;
> +	case ELE_READ_FUSE_REQ: return 0;
> +	case ELE_GET_FW_VERS_REQ: return 0;
> +	case ELE_RETURN_LIFE_CYCLE_REQ: return 0;
> +	case ELE_GET_EVENT_REQ: return 0;
> +	case ELE_COMMIT_REQ: return 0;
> +	case ELE_GEN_KEY_BLOB_REQ: return 0;
> +	case ELE_GET_FW_STATUS_REQ: return 0;
> +	case ELE_XIP_DECRYPT_REQ: return 0;
> +	case ELE_WRITE_FUSE: return 0;
> +	case ELE_GET_INFO_REQ: return 0;
> +	case ELE_DEV_ATTEST_REQ: return 0;
> +	case ELE_WRITE_SHADOW_FUSE_REQ: return 0;
> +	case ELE_READ_SHADOW_FUSE_REQ: return 0;
> +	default:
> +		return -EACCES;
> +	}
> +}

[Severity: Critical]
Does this allowlist permit userspace to embed arbitrary DMA addresses witho=
ut
kernel validation?

Commands like ELE_GET_INFO_REQ accept physical DMA addresses directly in
their payloads. Because se_chk_tx_msg_hdr() only validates the command head=
er
against this list and performs no payload sanitization, could an unprivileg=
ed
user embed arbitrary physical addresses (e.g., kernel text) leading to the
hardware enclave overwriting arbitrary memory?

> diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele=
_common.c
> --- a/drivers/firmware/imx/ele_common.c
> +++ b/drivers/firmware/imx/ele_common.c
[ ... ]
> @@ -71,7 +122,7 @@ int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, stru=
ct se_clbk_handle *se_clbk
> +		if (ret =3D=3D -ERESTARTSYS) {
> +			/*
> +			 * Record that a signal was observed, then continue waiting non-
> +			 * interruptibly until the response arrives or the timeout
> +			 * expires. The caller can surface the interruption to userspace
> +			 * after the protocol transaction is brought back to a
> +			 * synchronized state.
> +			 */
> +			if (is_rsp_wait_with_timeout &&
> +			    READ_ONCE(se_clbk_hdl->rx_msg)) {
> +				WRITE_ONCE(se_clbk_hdl->signal_rcvd, true);
> +				wait_uninterruptible =3D true;
> +				continue;
> +			}
> +			break;
> +		}

[Severity: High]
Can this loop trap a process in an unkillable state for a very long time?

If a process is interrupted by a signal while waiting in ele_msg_rcv(), the
code converts the interruptible wait into an uninterruptible one by setting
wait_uninterruptible =3D true. Given that SE_RCV_MSG_LONG_TIMEOUT_MS is 5000
seconds, this could leave the task unkillable for over an hour, potentially
triggering the kernel's hung task watchdog.

> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c
[ ... ]
> +static void dlink_n_cleanup_dev_ctx(struct se_if_device_ctx *dev_ctx, bo=
ol is_fclose)
> +{
> +	struct se_if_priv *priv =3D dev_ctx->priv;
> +
> +	if (is_fclose) {
> +		scoped_guard(mutex, &priv->modify_lock)
> +			dlink_dev_ctx(dev_ctx);
> +	}
> +
> +	cleanup_dev_ctx(dev_ctx, is_fclose);
> +}

[Severity: High]
Does unlinking dev_ctx before executing cleanup_dev_ctx() open a race
condition during driver unbind?

In se_if_probe_cleanup(), the unbind thread iterates over priv->dev_ctx_list
to gracefully close contexts. By unlinking the context here before the
cleanup completes, the unbind thread won't see it, won't block on fops_lock,
and might call mbox_free_channel(priv->tx_chan) prematurely. This could cau=
se
the concurrent close thread to send on a freed channel in ele_msg_send().

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
> +
> +	/* Copy data from the buffer */
> +	print_hex_dump_debug("to user ", DUMP_PREFIX_OFFSET, 4, 4, rx_msg,
> +			     cmd_snd_rcv_rsp_info.rx_buf_sz, false);
> +
> +	if (copy_to_user(u64_to_user_ptr(cmd_snd_rcv_rsp_info.rx_buf), rx_msg,
> +			 cmd_snd_rcv_rsp_info.rx_buf_sz)) {
> +		dev_err(priv->dev, "%s: Failed to copy to user.", dev_ctx->devname);
> +		err =3D -EFAULT;
> +	}
> +
> +	cleanup_err =3D se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rc=
v_rsp_info);
> +
> +	if (cleanup_err && !err)
> +		err =3D cleanup_err;
> +
> +	if (!err && !rsp_status_err)
> +		fw_api_specific_ops(dev_ctx, rx_msg);

[Severity: High]
Could this error handling sequence leak firmware session or storage handles?

If the firmware successfully executes an ELE_SESSION_OPEN_REQ, it allocates=
 a
handle. However, if a user submits an intentionally truncated rx_buf_sz
(causing se_val_rsp_hdr_n_status() to fail) or a bad user pointer (causing
copy_to_user() to fail), the function skips calling fw_api_specific_ops().
This leaves the handle untracked by the kernel, preventing cleanup and
leaking hardware resources.

[ ... ]
> +/* Open a character device. */
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
Is there a use-after-free risk if open() races with driver unbind?

When the module unbinds, se_if_probe_cleanup() calls misc_deregister(),
which does not fully synchronize with active open() calls. If the unbind
thread drops the final reference to priv in se_if_priv_release(),
se_if_open_gate_put() frees the gate object. A concurrent se_if_fops_open()
might then attempt to access the refcount of this already freed gate pointe=
r.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-imx-se-if-=
v35-0-11b25bb308ef@nxp.com?part=3D5
