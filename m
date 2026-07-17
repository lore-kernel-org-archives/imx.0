Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2493F4843;
	Fri, 17 Jul 2026 11:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784286791; cv=none; b=YtzRo24GGHPm3AX9I4J63uRZvzjIM+nc+fvlJBxLQbURJ3UXrswOkbme0AnpR+lvLXqOJAiStDPHsLVOa6WiDshwx7A5GKNMc42DlA3s1diYn/uEDtF/YAMDwyUZqniDxeVwEeUIAixs0VqpCGkskEcDdtbfNGFyHX1boC22wBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784286791; c=relaxed/simple;
	bh=Zh7K8ihZVjX2yaDXYiD58vc35AgTFneQV7oz1Ow5xFs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tTDvBILVZwvPoS3C+xYGxc4w+v55a0ZiztXby7KaLq+Sn9fogudprexi6N2jzUMWt7guvaTDp4u+gSY5E3d/ZXxo1LG9x1FqY5RrhjIimv+AXPVAHJqJVUDoB4IljR5Ktd0gHkvcweSG3N6Q70DhG0glibvaXC6La3Mx7q9hTRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lBrUxfx9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lBrUxfx9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 260351F000E9;
	Fri, 17 Jul 2026 11:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784286777;
	bh=CU/+RUOVHG6i2g5jeJDMiF9ta3gOMJEjtwjS0T+4bus=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lBrUxfx9DpAWootO+P2bZ9IT56KzGQVFap7pjrVoFTSMRTxsoK4nWO4TGK/4A6Hus
	 wNsrI2T6exkYcm/sVVkCZhNa3n1Le/hA4l+DKthWKJ5CDFRNshOQvoOtR0Il7nqaOR
	 WL77Odr1D/Q3tX+nyC6bM9GfnO+xQ2xn7+cRBSMPpWYrhZnLgi1iwPiQR5lw4WXo1s
	 DhJseQtHfcV/tLL/ycuKU5+3bt1o7ILKSeFuwoDeMvqZwVmHBmGKjVO7IB/7SU721b
	 nP5WAHoZEVbCsKMzUGUFarSW/sY1Xwk5J0tUVEiJJbZbvxsRWCQbtJONe6BZrmdC9y
	 JWIP3U+cbjGSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v28 5/7] firmware: drivers: imx: adds miscdev
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: conor+dt@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260717-imx-se-if-v28-5-0a9659c7e69d@nxp.com>
References: <20260717-imx-se-if-v28-0-0a9659c7e69d@nxp.com>
 <20260717-imx-se-if-v28-5-0a9659c7e69d@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 11:12:55 +0000
Message-Id: <20260717111257.260351F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 13 potential issue=
(s) to consider:

New issues:
- [Critical] ele_get_info() uses an uninitialized variable for memory size =
and fails to check for allocation failure.
- [High] Unconditional and lockless clearing of rx_msg_sz in se_if_fops_rea=
d causes state corruption and message loss.
- [High] Returning -ERESTARTSYS after a successful firmware transaction cau=
ses non-idempotent commands to be re-executed and discards successful respo=
nses.
- [High] se_if_fops_read() performs shared memory cleanup without holding t=
he fops_lock, leading to double-free and list corruption.
- [High] Mailbox channels are freed before the misc device is deregistered =
due to inverted devres ordering, allowing use-after-free on channels.
- [High] TOCTOU race between se_if_fops_open and se_if_probe_cleanup allows=
 a device context to escape teardown and access freed hardware resources.
- [High] init_misc_device_context() leaks DMA memory on error paths and fal=
sely reports success if gate allocation fails.
- [High] The DMA coherent memory allocated for priv_dev_ctx is never freed =
during driver teardown.
- [High] ele_get_info_cleanup() frees gen_pool memory immediately on timeou=
t, allowing the firmware to corrupt reallocated memory.
- [High] Data race and memory corruption in shared memory allocator get_sha=
red_mem_slot() for priv_dev_ctx.
- [High] TOCTOU race in se_if_fops_read allows dereferencing a freed rx_msg=
 buffer.
- [High] The misc device is registered before driver probe completes, expos=
ing uninitialized state.

Pre-existing issues:
- [High] User IOCTL interrupted by a signal can trigger the hung-task watch=
dog due to an excessive 5000-second uninterruptible sleep.
--

--- Patch [5]: [PATCH v28 5/7] firmware: drivers: imx: adds miscdev ---
commit 65c691a4b86b3b1a94b7ed63800d73fff3355b12
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

firmware: drivers: imx: adds miscdev

Adds the driver for communication interface to secure-enclave, enabling
userspace applications via a character driver. It implements the ABI for
shared memory management, command sending, and file operations.

> diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/e=
le_base_msg.c
> --- a/drivers/firmware/imx/ele_base_msg.c
> +++ b/drivers/firmware/imx/ele_base_msg.c
> @@ -32,6 +32,9 @@ static void ele_get_info_cleanup(struct se_if_priv *pri=
v, u32 *buf, dma_addr_t d
>  				 size_t size)
>  {
>  	if (priv->mem_pool)
>  		gen_pool_free(priv->mem_pool, (unsigned long)buf, size);

[Severity: High]
Does this unconditionally free the DMA buffer when priv->mem_pool is true,
even if the firmware is still busy processing a timed-out command?
   =20
If the enclave command times out, the firmware might still perform delayed
DMA writes to this buffer. Releasing it immediately allows the memory to be
reallocated while the hardware is still accessing it, potentially leading
to memory corruption.
=20
[ ... ]

> @@ -74,9 +74,9 @@ int ele_get_info(struct se_if_priv *priv, struct ele_de=
v_info *s_info)
> =20
>  	if (priv->mem_pool) {
>  		get_info_data =3D gen_pool_dma_alloc(priv->mem_pool,
>  						   ELE_GET_INFO_BUFF_SZ,
>  						   &get_info_addr);
>  	} else {

[Severity: Critical]
Does this leave get_info_len uninitialized and skip checking if get_info_da=
ta
is NULL when priv->mem_pool is true?

If gen_pool_dma_alloc() fails, the code continues and calls memcpy() on a
NULL pointer.=20

Further down, it passes the uninitialized get_info_len to
ele_get_info_cleanup(), which would cause gen_pool_free() to corrupt the
allocator state by freeing a random size.

[ ... ]

> diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele=
_common.c
> --- a/drivers/firmware/imx/ele_common.c
> +++ b/drivers/firmware/imx/ele_common.c
> @@ -107,6 +107,10 @@ int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, st=
ruct se_clbk_handle *se_clbk
>  		if (wait_uninterruptible)
>  			ret =3D wait_for_completion_timeout(&se_clbk_hdl->done,
>  							  remaining_jiffies);

[Severity: High]
This is a pre-existing issue, but can this trigger the hung-task watchdog
when a user IOCTL is interrupted by a signal?
   =20
The userspace contexts are assigned a timeout of 5,000,000 ms in
init_device_context().=20

If wait_for_completion_interruptible_timeout() returns -ERESTARTSYS, it
switches to wait_uninterruptible for the remainder of that 5000-second
timeout. If the hardware does not respond, this uninterruptible sleep will
exceed the 120-second kernel hung-task threshold and panic the system.
=20
[ ... ]

> @@ -216,6 +216,8 @@ int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx=
, void *tx_msg,
>  		     int tx_msg_sz, void *rx_msg, int exp_rx_msg_sz)
>  {
[ ... ]
> +		if (err > 0)
> +			err =3D -ERESTARTSYS;

[Severity: High]
Does returning -ERESTARTSYS here discard a successful firmware response
and cause non-idempotent commands to be re-executed?

If a signal is received but the firmware transaction still completes
successfully, the success code (bytes received) appears to be overwritten
with -ERESTARTSYS near the end of this function.=20

This would cause the kernel to auto-restart the IOCTL, re-executing the
command on the hardware, which could corrupt state for operations like key
generation or lifecycle changes.
=20
[ ... ]

> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c
> @@ -487,14 +487,18 @@ static int init_misc_device_context(struct se_if_pr=
iv *priv, int ch_id,
>  	gate =3D kzalloc_obj(*gate, GFP_KERNEL);
>  	if (!gate)
>  		goto exit;
> =20
>  [ ... ]
>  exit:
>  	*new_dev_ctx =3D NULL;
>  	if (gate) {
>  		priv->open_gate =3D NULL;
>  		se_if_open_gate_put(gate);
>  	}
>  	kfree(dev_ctx->devname);
>  	kfree(dev_ctx);
>  	return dev_err_probe(priv->dev, ret, "%s", err_str);
>  }

[Severity: High]
Can this leak DMA memory and falsely report success if the gate allocation
fails?
   =20
If kzalloc_obj() for gate fails, the code jumps to the exit label where
ret is still 0 (from the successful init_se_shared_mem() call).

The function returns 0, leading se_if_probe() to interpret it as a
success, but the 128KB DMA buffer allocated for the shared memory is
never cleaned up. Subsequent driver operations might then trigger a NULL
pointer dereference since priv_dev_ctx is NULL.

[ ... ]

> @@ -531,10 +531,9 @@ static void se_if_priv_release(struct kref *kref)
>  	if (priv->priv_dev_ctx) {
>  		kfree(priv->priv_dev_ctx->devname);
>  		kfree(priv->priv_dev_ctx);
>  		priv->priv_dev_ctx =3D NULL;
>  	}

[Severity: High]
Is the DMA coherent memory allocated for priv_dev_ctx leaked here?
   =20
During probe, init_misc_device_context() allocates 128KB of DMA shared
memory for priv_dev_ctx. When se_if_priv_release() frees the structure,
it seems to skip calling cleanup_se_shared_mem(), permanently leaking
this memory whenever the module is unloaded or probe fails.
=20
[ ... ]

> @@ -993,6 +993,8 @@ int get_shared_mem_slot(struct se_if_device_ctx *dev_=
ctx,
>  	/* Allocate space in shared memory. 8 bytes aligned. */
>  	pos =3D shared_mem->pos;
>  	shared_mem->pos +=3D aligned_len;

[Severity: High]
Can this lockless increment of shared_mem->pos cause a data race and
memory corruption when called for the internal priv_dev_ctx?
   =20
The userspace IOCTLs protect this via dev_ctx->fops_lock, but kernel
threads calling ele_get_info() on priv->priv_dev_ctx do not acquire this
lock.=20

If a concurrent operation (like se_load_firmware) happens at the
same time as ele_get_info, both threads could modify pos simultaneously,
causing overlapping DMA memory allocations and payload corruption.
=20
[ ... ]

> @@ -1180,6 +1180,9 @@ static ssize_t se_if_fops_read(struct file *fp, cha=
r __user *buf, size_t size,
>  		if (dev_ctx !=3D priv->cmd_receiver_clbk_hdl.dev_ctx) {
>  			priv->cmd_receiver_clbk_hdl.rx_msg_sz =3D 0;
>  			se_dev_ctx_shared_mem_cleanup(dev_ctx);
>  			return -EINVAL;
>  		}

[Severity: High]
Does this allow unprivileged processes to locklessly corrupt the command
receiver's state?
   =20
If the calling dev_ctx is not the registered command receiver,
rx_msg_sz is cleared without holding clbk_rx_lock. This allows any
process capable of calling read() to disrupt the NVM daemon's state.

[ ... ]

> @@ -1222,6 +1222,8 @@ static ssize_t se_if_fops_read(struct file *fp, cha=
r __user *buf, size_t size,
>  	spin_unlock_irqrestore(&priv->cmd_receiver_clbk_hdl.clbk_rx_lock, flags=
);
> =20
>  	/* We may need to copy the output data to user before
>  	 * delivering the completion message.
>  	 */
>  	err =3D se_dev_ctx_cpy_out_data(dev_ctx);
>  	if (err < 0)
>  		goto exit_mutex_unlock;
> =20
>  	/* Copy data from the buffer */
>  	print_hex_dump_debug("to user ", DUMP_PREFIX_OFFSET, 4, 4,
>  			     priv->cmd_receiver_clbk_hdl.rx_msg,
>  			     priv->cmd_receiver_clbk_hdl.rx_msg_sz,
>  			     false);
> =20
>  	copy_len =3D min(size, priv->cmd_receiver_clbk_hdl.rx_msg_sz);
> =20
>  	if (copy_to_user(buf, priv->cmd_receiver_clbk_hdl.rx_msg, copy_len))

[Severity: High]
Can this lead to a use-after-free of the rx_msg buffer?
   =20
The rx_msg pointer is validated while holding clbk_rx_lock, but the lock
is dropped before passing rx_msg to copy_to_user().=20

If driver unbind runs concurrently, unset_dev_ctx_as_command_receiver()
will acquire the lock, set rx_msg to NULL, and immediately free the buffer.
The read() path will then copy freed kernel memory to userspace.
=20
[ ... ]

> @@ -1248,6 +1248,8 @@ exit_mutex_unlock:
>  	mutex_unlock(&dev_ctx->fops_lock);
> =20
>  exit:
>  	spin_lock_irqsave(&priv->cmd_receiver_clbk_hdl.clbk_rx_lock, flags);
>  	priv->cmd_receiver_clbk_hdl.rx_msg_sz =3D 0;
>  	spin_unlock_irqrestore(&priv->cmd_receiver_clbk_hdl.clbk_rx_lock, flags=
);
>  	se_dev_ctx_shared_mem_cleanup(dev_ctx);

[Severity: High]
Does this unconditionally clear rx_msg_sz and perform lockless shared memory
cleanup on the exit path?
   =20
If ele_msg_rcv() is interrupted by a signal, rx_msg_sz is cleared, which
will permanently drop a concurrently arriving message by overwriting its
size with 0.=20
   =20
Additionally, se_dev_ctx_shared_mem_cleanup() modifies the pending lists
and frees their entries without holding fops_lock. If se_if_fops_close()
runs concurrently (e.g. process termination), it can cause list corruption
and double-frees.

[ ... ]

> @@ -1282,10 +1282,11 @@ static int se_if_fops_open(struct inode *nd, stru=
ct file *fp)
>  	priv =3D gate->priv;
>  	mutex_unlock(&gate->lock);
> =20
>  	misc_dev_ctx =3D priv->priv_dev_ctx;
> =20
>  	if (mutex_lock_interruptible(&misc_dev_ctx->fops_lock)) {
>  		err =3D -EBUSY;
>  		goto out_put_priv;
>  	}
> =20
>  	if (misc_dev_ctx->cleanup_done) {
>  		err =3D -ENODEV;
>  		goto out_unlock_misc;
>  	}
> =20
>  	priv->dev_ctx_mono_count++;
>  	err =3D init_device_context(priv, priv->dev_ctx_mono_count, &dev_ctx);

[Severity: High]
Is there a race condition here that allows a new context to escape teardown?
   =20
By dropping gate->lock before creating and adding the new device context
to priv->dev_ctx_list, se_if_probe_cleanup() can concurrently drain all
existing contexts.=20

After teardown finishes, this function will append the newly allocated
context to the list and return a valid fd to userspace. This would allow
userspace to access hardware resources like mailbox channels that have
already been destroyed by devres.

[ ... ]

> @@ -1546,6 +1546,9 @@ static int se_if_probe(struct platform_device *pdev)
> =20
>  	ret =3D devm_add_action_or_reset(dev, se_if_probe_cleanup, pdev);
>  	if (ret)
>  		return ret;
> =20
>  	/* Mailbox client configuration */
>  	priv->se_mb_cl.dev		=3D dev;
>  	priv->se_mb_cl.tx_block		=3D false;
>  	priv->se_mb_cl.knows_txdone	=3D false;
>  	priv->se_mb_cl.rx_callback	=3D se_if_rx_callback;
> =20
>  	ret =3D se_if_request_channel(dev, &priv->tx_chan, &priv->se_mb_cl, MBO=
X_TX_NAME);

[Severity: High]
Will devres free the mailbox channels before deregistering the misc device?
   =20
Because se_if_probe_cleanup is registered as a devres action before the
mailbox channels are requested, it will run after the channels are freed
(LIFO order).=20

During this window, the character device is still active. If userspace
issues a write() or IOCTL, the driver will use the freed channel pointers,
resulting in a use-after-free.

[ ... ]

> @@ -1588,6 +1588,11 @@ static int se_if_probe(struct platform_device *pde=
v)
>  	ret =3D init_misc_device_context(priv, 0, &priv->priv_dev_ctx, &se_if_f=
ops);
>  	if (ret)
>  		return dev_err_probe(dev, ret,
>  				     "Failed[0x%x] to create device contexts.",
>  				     ret);
> =20
>  	if (if_node->if_defs.se_if_type =3D=3D SE_TYPE_ID_HSM) {
>  		ret =3D get_se_soc_info(priv, se_info);
>  		if (ret)
>  			return dev_err_probe(dev, ret, "Failed to fetch SoC Info.");
>  	}
> =20
>  	/* By default, there is no pending FW to be loaded.*/
>  	if (se_info->se_fw_img_nm.seco_fw_nm_in_rfs) {
>  		load_fw =3D get_load_fw_instance(priv);
>  		mutex_init(&load_fw->load_fw_lock);

[Severity: High]
Is the misc device exposed to userspace before critical state is initialize=
d?
   =20
init_misc_device_context() registers the misc device, making it instantly
available. However, load_fw->load_fw_lock and var_se_info.soc_rev are
initialized later in the probe sequence.=20

A fast userspace process could open the device and trigger
se_load_firmware() via an IOCTL, which would attempt to lock the
uninitialized load_fw_lock, causing a panic.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-imx-se-if-=
v28-0-0a9659c7e69d@nxp.com?part=3D5
