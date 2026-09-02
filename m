Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0E647209B;
	Wed,  2 Sep 2026 11:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788348155; cv=none; b=Aj72dRixa9ujYohkx2o5GrEbAhcJ/SVLJA/UCBrePp6FudO3C9ZNnxWm7AfHtPfAhAubzuKOFTnGcub6qqcR/mRRt30eQOGBc2NwqiXkPlyx6Gype0k7g0UsZb6Bw7NtisLwk4u3EqtJ5YmNmzRsfZT1sIrln371Yl3DAQKIuLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788348155; c=relaxed/simple;
	bh=FTrJZbLrZyeEm/x5IyivajCsFzOsHn8OIcoz1ZiFQVo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FsTG+Od/SfN6yvN1F7fzMhcmc0/ZWURZ4lbIbzfxbbEXdYXFuLlk03Q3sonJ0RAqvfloPXoSie5xyfGBieia6ylMmnGpXS5ZStDCThZKVel8dt3xOxgN4rH03ELKjN9HTnZo2FSPqV9OzfdLilFWucRSTNTACN7G0gPeDQYafPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y5AqqC8r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y5AqqC8r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C49181F000E9;
	Wed,  2 Sep 2026 11:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788348154;
	bh=n5iiXKXhw5Cofvi72d47GN06W0py6RVJEUhtZYEn0zE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y5AqqC8rl6JVhiL4pts7upG+sz02dFAvFF3S30eHrr01QSmKMZh8tk5RJyL77mUPT
	 Hs/iwgLigmXKahWGsTD51syifVHgYiw7/dYDPOqkDy3h/bsOFzmi55oV3cOY0LCWam
	 SZnsx5L9p4RA3aZ7DShrZEEEwMM2z6/phJQNxBSLRApJSV2RhbCA4eNX+8l/3Z1ap+
	 n3Wx3wcymrilvGD1DILgLMoZCvN9z8V+wf1lJEXq9RUjSASHLkEMITqUugKkav1SHd
	 VsKxMSEZPmTGq3wgLVZ/wkw1UVYmRsNsjl9zhgFCoYIncyv9WNxTPCNLD+f89ASzO4
	 mYEEGkT6VX+kA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v45 5/7] firmware: imx: adds miscdev
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: devicetree@vger.kernel.org, robh@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260902-imx-se-if-v45-5-6e400879d8ec@nxp.com>
References: <20260902-imx-se-if-v45-0-6e400879d8ec@nxp.com>
 <20260902-imx-se-if-v45-5-6e400879d8ec@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 11:22:33 +0000
Message-Id: <20260902112233.C49181F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] se_if_fops_write() sends messages to the MU without acquiring the =
global se_if_cmd_lock, leading to concurrent mailbox accesses.
- [High] A Time-of-Check to Time-of-Use (TOCTOU) race condition in ELE_STOR=
AGE_OPEN_REQ allows concurrent ioctls to bypass the command-receiver exclus=
ivity check.
- [High] A slab out-of-bounds read occurs in se_ioctl_cmd_snd_rcv_rsp_handl=
er() due to passing an unvalidated firmware-declared size to downstream pro=
cessors.
- [Medium] Unconditional destruction of a conditionally initialized mutex (=
load_fw_lock) causes a lockdep warning.
--

commit b30bba3cfa7b6a992952bef3da531322ea19e58d
Author: Pankaj Gupta <pankaj.gupta@nxp.com>
Subject: firmware: imx: adds miscdev

This commit adds the driver for a communication interface to the NXP
secure-enclave. It enables exchanging messages with HW IP(s) like
EdgeLock Enclave via a character device for userspace applications.

Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260902-imx-se-if-v44-0-104658bf941=
a@nxp.com?part=3D5

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
Does this check fully prevent concurrent ioctls from bypassing the
command-receiver exclusivity?

The exclusivity check is performed under modify_lock, but the global
se_if_cmd_lock isn't acquired until later in ele_msg_send_rcv().
Two concurrent threads can both observe the receiver as NULL and proceed,
allowing multiple threads to concurrently dispatch the open request to the
firmware.

The second thread will fail to register but the error is ignored because
fw_api_specific_ops() returns void, leaving it with an active FW storage
session whose NVM callbacks will be silently misrouted to the first thread's
context.

> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> index 0792e5152436b..5c77dabbc4e40 100644
> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c
[ ... ]
> @@ -383,28 +874,54 @@ static int se_if_probe(struct platform_device *pdev)
[ ... ]
> -	/*
> -	 * Initialize load_fw_lock before registering the misc device.
> -	 * A userspace process could open the device and trigger se_load_firmwa=
re()
> -	 * via IOCTL immediately after misc_register(), so the mutex must be re=
ady
> -	 * before the device becomes visible.
> -	 */
>  	if (se_info->se_fw_img_nm.seco_fw_nm_in_rfs) {
>  		load_fw =3D get_load_fw_instance(priv);
> -		ret =3D devm_mutex_init(dev, &load_fw->load_fw_lock);
> -		if (ret)
> -			return dev_err_probe(dev, ret,
> -					     "Failed to init mutex: load_fw_lock.\n");
> +		mutex_init(&load_fw->load_fw_lock);
>  		load_fw->se_fw_img_nm =3D &se_info->se_fw_img_nm;
>  		load_fw->is_fw_tobe_loaded =3D true;
>  	}
[ ... ]
> +static void se_if_priv_release(struct kref *kref)
> +{
[ ... ]
> +	put_device(priv->dev);
> +	mutex_destroy(&priv->load_fw.load_fw_lock);

[Severity: Medium]
Does this unconditional destruction cause lockdep warnings on systems witho=
ut
a firmware image?

In se_if_probe(), mutex_init(&load_fw->load_fw_lock) is executed
conditionally. If the SoC configuration does not specify a firmware image,
the mutex remains uninitialized memory, which triggers a lockdep warning
when mutex_destroy() is called here on module unload or device unbind.

[ ... ]
> +static int se_ioctl_cmd_snd_rcv_rsp_handler(struct se_if_device_ctx *dev=
_ctx,
> +					    void __user *uarg)
> +{
[ ... ]
> +	struct se_api_msg *rx_msg __free(kfree) =3D
> +		kzalloc(cmd_snd_rcv_rsp_info.rx_buf_sz, GFP_KERNEL);
> +	if (!rx_msg) {
> +		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
> +		return -ENOMEM;
> +	}
[ ... ]
> +	rsp_status_err =3D
> +		se_val_rsp_hdr_n_status(priv, rx_msg, tx_msg->header.command,
> +					rx_msg->header.size << 2, tx_msg->header.ver);
> +
> +	if (!rsp_status_err) {
> +		/*
> +		 * The response is well formed and fully fits the caller's
> +		 * buffer, so any FW-allocated session/storage handle it carries
> +		 * (data[1]) has been delivered. Record it now, before the
> +		 * copy-out steps below. The FW has already committed the handle;
> +		 * running fw_api_specific_ops() only after a successful
> +		 * se_dev_ctx_cpy_out_data()/copy_to_user() would leave the
> +		 * handle untracked - and so never closed on teardown, leaking it
> +		 * in FW - whenever the caller supplied a bad output pointer.
> +		 */
> +		fw_api_specific_ops(dev_ctx, rx_msg, false);

[Severity: High]
Can this lead to an out-of-bounds read if the userspace-supplied buffer is
smaller than the firmware response?

rx_msg is allocated using cmd_snd_rcv_rsp_info.rx_buf_sz, but the
firmware-declared size (rx_msg->header.size << 2) is passed to
se_val_rsp_hdr_n_status() and subsequently used in fw_api_specific_ops().

This trusts the firmware-declared size instead of the clamped received size,
allowing out-of-bounds reads into msg->data[0] and rx_msg->data[1] to leak
kernel heap memory into persistent handles.

[ ... ]
> +static ssize_t se_if_fops_write(struct file *fp, const char __user *buf,
> +				size_t size, loff_t *ppos)
> +{
> +	struct se_if_device_ctx *dev_ctx =3D fp->private_data;
> +	struct se_if_priv *priv;
> +	int err;
> +
> +	scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &dev_ctx->fops_lock)=
 {
> +		if (dev_ctx->cleanup_done)
> +			return -ENODEV;
[ ... ]
> +		err =3D ele_msg_send(dev_ctx, tx_msg, size);
> +
> +		return err;
> +	}
> +}

[Severity: High]
Does this expose the shared mailbox to concurrent writes?

The function acquires the per-context fops_lock but fails to acquire the
global se_if_cmd_lock before calling ele_msg_send(), which invokes
mbox_send_message() on the shared priv->tx_chan.

Because fops_lock is per file descriptor, multiple processes can call write=
()
concurrently and dispatch messages simultaneously to the same channel, which
can corrupt the hardware mailbox state.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-imx-se-if-=
v45-0-6e400879d8ec@nxp.com?part=3D5
