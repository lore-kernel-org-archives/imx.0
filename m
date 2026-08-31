Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE74E3C1D4B;
	Mon, 31 Aug 2026 07:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788159910; cv=none; b=YWGB8yDAXXzrrqE7qQLmfwj1Ligas33BHsIarG5ABVaSx6W0AspFD5WngqByo6q33a2xDKBDTPhbRgFuXWKUrS9QtcoUptQGf/e0uA3ifyFvWFcujz0HwHLX3eTiwTEiEPUS4E75mbQxJPgqWsz/jv2ZqftqdEv2T3xUlYaa9xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788159910; c=relaxed/simple;
	bh=pEzNLqXbkcwLJ0QzRw7XQfXAjJdyUVj46E1YUOFm6Qk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kx6PvxS1eloPlx162ZpT94+R8xjw/gV1NSvAo82s3b3eabSbLO0LR+3t52UER3xnMf3ZSq2P8qot+MJb+SBZXg2NCeOJRMEbxVlUzfAVlxQeSnbapWBB4rJm8E1hgiC+LfXYht4PGjqxbLAWHdzu1tBGY1HX3lhDZJL1xiVpjFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CyatiT7s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CyatiT7s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 252E01F000E9;
	Mon, 31 Aug 2026 07:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788159908;
	bh=eEhwD/oSdXmLWFZVRp4ZlUbeQpSsvWT5KUNmvelvgq8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CyatiT7s+Zwn2nqIP0PfR5x3RgNQU3CRskSspnfp+UbefnwtAcw6FH+EVpzS0zopX
	 zIN6ehxckvjlv6Td9uL1/H+PAYPZQ/7MiO/YnWDLSbcN8gLBtRdVt5oSY4XuZKiKXD
	 9Hq1WVDgytCF8ecC2FzqSSGH2LMde/7SInJ0fHtaubtxAuVQmx3Mgg8lF4HHK0iaCW
	 vrcgzD53szf2kPQN76RSw8xQmiYBKQfz4EEoY2O9cYhJ7R0w+wy74SxpkS/9n6pj9g
	 uUlNo337yeJSgewYDDoNrWvyPmZW3ehQJbcU7HT/QFpdkZxxa2mhGI9cQkxjbKSLv6
	 fiGvlCMUdIk1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v43 5/7] firmware: imx: adds miscdev
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: robh@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260831-imx-se-if-v43-5-a3deadbda4ef@nxp.com>
References: <20260831-imx-se-if-v43-0-a3deadbda4ef@nxp.com>
 <20260831-imx-se-if-v43-5-a3deadbda4ef@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 07:05:07 +0000
Message-Id: <20260831070508.252E01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] The SE_IOCTL_ENABLE_CMD_RCV_STATUS ioctl fails to actually registe=
r and arm the command receiver, effectively breaking the ioctl's functional=
ity.
- [High] Bypassing the user-provided buffer size when validating the firmwa=
re response causes out-of-bounds reads on the rx_msg allocation and fails t=
o capture the handle.
- [High] The `priv->modify_lock` and `priv->se_if_cmd_lock` mutexes are acc=
essed after being destroyed by devres on device unbind, leading to a Use-Af=
ter-Free of mutex state.
- [High] Hardware out-of-bounds read via missing DMA buffer size boundary c=
hecks for variable-length input buffers.
- [High] Unbounded DMA coherent memory allocation in `se_if_fops_open()` al=
lows userspace to exhaust CMA/DMA pools.
- [Medium] The `se_if_probe` function leaks the `priv` structure and a `str=
uct device` reference if `devm_mutex_init` fails.
--

commit b9f90d072db22d668c690d048d2cb3e33090c742
Author: Pankaj Gupta <pankaj.gupta@nxp.com>
Subject: firmware: imx: adds miscdev

This commit adds a character driver to enable exchanging messages with the
NXP secure enclave hardware from userspace. It introduces ABI definitions
and base API checks to block arbitrary command exchanges.

> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c
[ ... ]
> +		switch (cmd) {
> +		case SE_IOCTL_ENABLE_CMD_RCV_STATUS: {
> +			guard(mutex)(&priv->modify_lock);
> +			err =3D check_cmd_rcvr_status(dev_ctx);
> +			if (err)
> +				dev_err(priv->dev, "Failed[%ld] to register %s as CMD-Receiver.\n",
> +					err, dev_ctx->devname);
> +		break;
> +		}

[Severity: High]
Is it intentional that se_ioctl() only checks the status here but does not
actually perform the registration?=20

It appears set_dev_ctx_as_command_receiver() is never called, causing the
ioctl to fail its intended purpose and always return -ENXIO if not already
registered.

[ ... ]
> +static int se_ioctl_cmd_snd_rcv_rsp_handler(struct se_if_device_ctx *dev=
_ctx,
> +					    void __user *uarg)
> +{
[ ... ]
> +	rsp_status_err =3D
> +		se_val_rsp_hdr_n_status(priv, rx_msg, tx_msg->header.command,
> +					rx_msg->header.size << 2,
> +					tx_msg->header.ver =3D=3D priv->if_defs->base_api_ver);

[Severity: High]
Could passing the firmware-declared size (rx_msg->header.size << 2) instead=
 of
the caller's allocated size (rx_buf_sz) lead to out-of-bounds reads?=20

If a user submits an intentionally small rx_buf_sz, the subsequent validati=
on
in se_val_rsp_hdr_n_status() and fw_api_specific_ops() might read past the
bounds of the allocated rx_msg buffer when accessing data[0] or data[1].

[ ... ]
> +static int se_if_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	ret =3D devm_mutex_init(dev, &priv->se_if_cmd_lock);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to init mutex: priv se_if_cmd_lock.\n");
> +	ret =3D devm_mutex_init(dev, &priv->modify_lock);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to init mutex: priv modify_lock.\n");

[Severity: High]
Does binding the lifecycle of these mutexes to device unbind create a=20
use-after-free risk?=20

Since priv is refcounted and can outlive device unbind (e.g., if a file=20
descriptor remains open), closing the file later calls dlink_n_cleanup_dev_=
ctx()
and cleanup_dev_ctx(), which will attempt to acquire these destroyed mutexe=
s.

[ ... ]
> +static int se_if_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	priv =3D kzalloc_obj(*priv);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->dev =3D dev;
> +	/*
> +	 * Pin the parent device for the lifetime of priv. A file descriptor may
> +	 * stay open after the device is unbound; close() then still passes
> +	 * priv->dev to dma_free_coherent()/dev_warn(). Without this reference
> +	 * the struct device could be freed while priv->dev still points at it,
> +	 * so the reference is dropped in se_if_priv_release() via put_device().
> +	 */
> +	get_device(priv->dev);
> +	kref_init(&priv->refcount);
> +	priv->if_defs =3D &if_node->if_defs;
> +	dev_set_drvdata(dev, priv);
> +
[ ... ]
> +	ret =3D devm_mutex_init(dev, &priv->se_if_cmd_lock);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to init mutex: priv se_if_cmd_lock.\n");

[Severity: Medium]
If devm_mutex_init() fails, does this function return directly without
cleaning up?=20

It appears this would leak the priv structure and leave the device reference
unreleased, since devm_add_action_or_reset() has not been registered yet.

[ ... ]
> +static int se_if_fops_open(struct inode *nd, struct file *fp)
> +{
[ ... ]
> +	priv->dev_ctx_mono_count++;
> +	err =3D init_device_context(priv, priv->dev_ctx_mono_count, &dev_ctx);
> +	if (err) {
> +		dev_err(priv->dev, "Failed to create dev-ctx.\n");
> +		goto out_unlock_misc;
> +	}

> +static int init_se_shared_mem(struct se_if_device_ctx *dev_ctx)
> +{
[ ... ]
> +	se_shared_mem_mgmt->non_secure_mem.ptr =3D
> +			dma_alloc_coherent(priv->dev, MAX_DATA_SIZE_PER_USER,
> +					   &se_shared_mem_mgmt->non_secure_mem.dma_addr,
> +					   GFP_KERNEL);

[Severity: High]
Does this code allow unbounded DMA coherent memory allocation?=20

If a userspace process repeatedly calls open() in a loop, it seems it would=
=20
allocate 128KB each time without any limit, which could quickly exhaust=20
contiguous DMA memory.

> diff --git a/drivers/firmware/imx/ele_msg_addr_field.c b/drivers/firmware=
/imx/ele_msg_addr_field.c
> --- a/drivers/firmware/imx/ele_msg_addr_field.c
> +++ b/drivers/firmware/imx/ele_msg_addr_field.c
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
Can the lack of size validation here allow the firmware to read past the bo=
unds
of the allocated DMA buffer?=20

If a user submits a command with an address pointing to the very end of the
shared memory window, the firmware might read unmapped or unowned memory,
potentially causing an IOMMU fault.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-imx-se-if-=
v43-0-a3deadbda4ef@nxp.com?part=3D5
