Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6343B372050;
	Thu, 30 Jul 2026 02:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785378688; cv=none; b=E5MNL1BquZKqo0wJ3lo0cT1eY504TvNTm1RfPwYIyQAo50RwgdAGBCRKk9EzPSNRQ68glm1gVR14DGgInLw0QToeAr80FPcDEWpK8I+3SfoYKTyUodOy99WYM6PQOp5e8Dvo2FbbBMhRXh5ygLoS5CwuTg8sR//7NOjjHcFIruk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785378688; c=relaxed/simple;
	bh=Q0Iv8mfT8nMsxUcMeAkUqdGgyxTM4IYCf7cQqDeWbLc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J17UwYtKvVZYDCrQue6aut04mudqyxToKe9G//CCqOUASaOGqfNaFF9peGki+lIvEBweUQQmZfy0RwBZCP/2IjS4CjsUJBL1fCZlCL7IueYOZrVIE20LtmVe9zhNkG9j75ii/mX8w4BG98e1OPQy6GdGoC5ml97xOlYbfkXLlk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q+V1z11j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q+V1z11j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B61E91F000E9;
	Thu, 30 Jul 2026 02:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785378686;
	bh=4LQYQLGFEB6/XxINfaIiWKpqn9+svLIRaaiIYE0suFQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q+V1z11jODkk9H8Vid1UEtAn2GJL/mFvy2e6Lm5G3jNUWkE7imq9tpjb/J6aIFZja
	 TUWU4Lui4TuP/Zd+OsvmZf/UyD3Gk9uNPpOvcMKuiy885JXsmMCkdb0Zj2GvmLATlq
	 Mnu5JT7dH6k09xsgHwdLIGcbbwfD0PC29634nBgl7Bk7pGCTkEIhjraNDgKl19qiuK
	 PDZct92P7RnVjfVw/KW5SVA6Kxt2fkIDgszKwqHzUmxtdByIiwXlrydS0Fi3Xfzj5G
	 rxFcviDfjaX4bDoqij4YLR1tToHuWcYZg2QoVDn06Ap+8GyjBP6XXxlMDQJcydSFRS
	 qjAjnydl+HTOg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v32 5/7] firmware: imx: adds miscdev
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: Frank.Li@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260730-imx-se-if-v32-5-95f56dff4ba9@nxp.com>
References: <20260730-imx-se-if-v32-0-95f56dff4ba9@nxp.com>
 <20260730-imx-se-if-v32-5-95f56dff4ba9@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 02:31:25 +0000
Message-Id: <20260730023125.B61E91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] Implicit padding in `struct se_ioctl_cmd_snd_rcv_rsp_info` causes =
an ABI mismatch between 32-bit userspace and 64-bit kernel.
- [High] The driver returns -EBUSY when file operations are interrupted by =
a signal, violating standard POSIX syscall semantics.
- [High] If a signal interrupts `se_if_fops_read()` after it successfully r=
eceives a message, the message is stranded and the firmware protocol perman=
ently deadlocks.
- [High] A successful firmware transaction is reported to userspace as inte=
rrupted (`-EINTR`) if a signal is pending, discarding the successful respon=
se payload.
- [High] A TOCTOU race between `ele_msg_send_rcv` and `se_if_probe_cleanup`=
 causes a lost wakeup, resulting in a 1.3-hour unbind hang.
- [High] Kernel crash in the error path of `init_misc_device_context` due t=
o accessing an uninitialized `dev_ctx->priv` pointer.
- [High] Unbounded DMA memory allocation in the device `open` path allows u=
nprivileged users to exhaust contiguous DMA memory.
- [High] The dynamically allocated `se_if_open_gate` structure can be acces=
sed after it is freed if a concurrent `open()` races with device teardown.
--

--- Patch [5]: [PATCH v32 5/7] firmware: imx: adds miscdev ---
commit b46f4f0d3fc0745184ba130cd15fbe6c57e10cbe
Author: Pankaj Gupta <pankaj.gupta@nxp.com>
Subject: firmware: imx: adds miscdev

This commit adds a misc character driver to communicate with NXP secure=20
enclave hardware. It enables userspace applications to exchange messages=20
with the enclave using an ioctl-based API, handling shared memory managemen=
t=20
and payload verification.

> diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele=
_common.c
> index 7254fc717e91d..7ea7cf0631ec0 100644
> --- a/drivers/firmware/imx/ele_common.c
> +++ b/drivers/firmware/imx/ele_common.c
[ ... ]
> @@ -188,10 +258,21 @@ int ele_msg_send_rcv(struct se_if_device_ctx *dev_c=
tx, void *tx_msg,
> =20
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
Could this lead to a TOCTOU race and a lost wakeup during unbind?

In ele_msg_send_rcv(), atomic_read(&priv->going_away) is checked locklessly=
=20
before calling reinit_completion(). Concurrently, se_if_probe_cleanup()=20
sets going_away to 1 and calls complete_all() to forcefully wake any waiter=
s:

se_if_probe_cleanup() {
    atomic_set(&priv->going_away, 1);
    ...
    complete_all(&priv->waiting_rsp_clbk_hdl.done);
}

Since se_if_probe_cleanup() does not acquire se_if_cmd_lock, it can execute
immediately after ele_msg_send_rcv() checks going_away. The reinit_completi=
on()
call here would then overwrite the forced wakeup. This leaves ele_msg_rcv()
waiting indefinitely, which can cause the device unbind process to hang.

>  	/* Publish rx_msg/rx_msg_sz under the lock read by se_if_rx_callback().=
 */
>  	spin_lock_irqsave(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
[ ... ]
> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> index a8974eef190b6..8698d77172465 100644
> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c
[ ... ]
> @@ -302,13 +618,51 @@ static int init_misc_device_context(struct se_if_pr=
iv *priv, int ch_id,
>  	if (!dev_ctx->devname)
>  		goto exit;
> =20
> +	mutex_init(&dev_ctx->fops_lock);
> +	lockdep_set_class(&dev_ctx->fops_lock, &se_priv_ctx_fops_key);
> +
>  	dev_ctx->priv =3D priv;
> +	kref_init(&dev_ctx->refcount);
> +	dev_ctx->cleanup_done =3D false;
>  	*new_dev_ctx =3D dev_ctx;
> +	set_se_rcv_msg_timeout(dev_ctx, SE_RCV_MSG_DEFAULT_TIMEOUT_MS);
> +
> +	ret =3D init_se_shared_mem(dev_ctx);
> +	if (ret < 0)
> +		goto exit;
> +
> +	gate =3D kzalloc_obj(*gate, GFP_KERNEL);
> +	if (!gate) {
> +		ret =3D -ENOMEM;
> +		goto exit;
> +	}
> +
> +	mutex_init(&gate->lock);
> +	kref_init(&gate->refcount);    /* device-owned reference */
> +	gate->priv =3D priv;
> +	gate->dying =3D false;
> +	priv->open_gate =3D gate;
> +
> +	/*
> +	 * The miscdevice storage is now owned by the open gate object.
> +	 * priv->priv_dev_ctx still keeps a pointer to that miscdevice.
> +	 */
> +	dev_ctx->miscdev =3D &gate->miscdev;
> +
> +	dev_ctx->miscdev->name =3D dev_ctx->devname;
> +	dev_ctx->miscdev->minor =3D MISC_DYNAMIC_MINOR;
> +	dev_ctx->miscdev->fops =3D se_if_fops;
> +	dev_ctx->miscdev->parent =3D priv->dev;
> =20
>  	return 0;
>  exit:
>  	*new_dev_ctx =3D NULL;
> =20
> +	if (gate) {
> +		priv->open_gate =3D NULL;
> +		se_if_open_gate_put(gate);
> +	}
> +	cleanup_se_shared_mem(dev_ctx, true);

[Severity: High]
Can this error path trigger a NULL pointer dereference?

If kasprintf() fails to allocate memory for dev_ctx->devname earlier in
init_misc_device_context(), the code jumps to the exit label. At this point=
,=20
dev_ctx->priv has not yet been assigned and is NULL.

This error path calls cleanup_se_shared_mem(dev_ctx, true), which does:

cleanup_se_shared_mem() {
    struct se_if_priv *priv =3D dev_ctx->priv;
    ...
    if (priv->mem_pool)
        ...
}

This will unconditionally dereference the uninitialized priv pointer,
causing an immediate kernel panic.

>  	kfree(dev_ctx->devname);
>  	kfree(dev_ctx);
>  	return dev_err_probe(priv->dev, ret, "%s", err_str);
[ ... ]
> +static int se_ioctl_cmd_snd_rcv_rsp_handler(struct se_if_device_ctx *dev=
_ctx,
> +					    void __user *uarg)
> +{
[ ... ]
> +	err =3D ele_msg_send_rcv(dev_ctx, tx_msg, cmd_snd_rcv_rsp_info.tx_buf_s=
z,
> +			       rx_msg, cmd_snd_rcv_rsp_info.rx_buf_sz);
> +	if (err < 0) {
> +		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
> +
> +		/*
> +		 * -ERESTARTSYS here means the wait was interrupted by a signal
> +		 * after the command had already been handed to (and possibly
> +		 * executed by) the firmware. Returning -ERESTARTSYS lets the VFS
> +		 * transparently restart the ioctl, which would re-run the command
> +		 * with the just cleaned-up (zeroed) shared input buffers. Report
> +		 * -EINTR instead so the syscall is not auto-restarted; userspace
> +		 * can decide whether to reissue it.
> +		 */
> +		if (err =3D=3D -ERESTARTSYS)
> +			err =3D -EINTR;

[Severity: High]
Is it safe to discard a successful firmware response when a signal is pendi=
ng?

If a successful firmware transaction was interrupted by a signal, the lower
layers might overwrite the success return code with -ERESTARTSYS (which is
translated to -EINTR here). When this happens, the successful response payl=
oad
is discarded in se_ioctl_cmd_snd_rcv_cleanup().

Because the kernel successfully retrieved the response and the firmware has
committed the action, returning -EINTR breaks idempotency for state-mutating
commands. Userspace receives -EINTR and might unsafely retry commands that
were actually successfully executed by the firmware. Should the kernel retu=
rn
the successful response to userspace instead?

> +
> +		return err;
> +	}
[ ... ]
> +/* Write a message to the MU. */
> +static ssize_t se_if_fops_write(struct file *fp, const char __user *buf,
> +				size_t size, loff_t *ppos)
> +{
> +	struct se_if_device_ctx *dev_ctx =3D fp->private_data;
> +	struct se_if_priv *priv;
> +	int err;
> +
> +	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {

[Severity: High]
Should this return -ERESTARTSYS instead of -EBUSY when interrupted?

When the interruptible lock acquisition fails due to a pending signal,
masking the error with -EBUSY breaks the standard POSIX syscall restart
mechanism. Userspace receives a hard error (EBUSY) instead of an
interrupt (EINTR), which prevents applications from properly handling
signals or transparently retrying the syscall.

> +		if (dev_ctx->cleanup_done)
> +			return -ENODEV;
[ ... ]
> +/*
> + * Read a message from the MU.
> + * Blocking until a message is available.
> + */
> +static ssize_t se_if_fops_read(struct file *fp, char __user *buf, size_t=
 size,
> +			       loff_t *ppos)
> +{
> +	struct se_if_device_ctx *dev_ctx =3D fp->private_data;
> +	u8 rx_msg_snap[MAX_NVM_MSG_LEN];
> +	struct se_if_priv *priv;
> +	unsigned long flags;
> +	size_t copy_len;
> +	int err;
> +
> +	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
> +		priv =3D dev_ctx->priv;
[ ... ]
> +	err =3D ele_msg_rcv(dev_ctx, &priv->cmd_receiver_clbk_hdl);
> +	if (err < 0) {
> +		if (err !=3D -ERESTARTSYS)
> +			dev_err(priv->dev,
> +				"%s: Er[0x%x]: Signal Interrupted. Current act-dev-ctx count: %d.",
> +				dev_ctx->devname, err, dev_ctx->priv->active_devctx_count);
> +		return err;
> +	}
> +
> +	/*
> +	 * Reacquire fops_lock before touching any dev_ctx state (pending lists,
> +	 * rx_msg) after the blocking wait. fops_lock was dropped before calling
> +	 * ele_msg_rcv(). If cleanup_dev_ctx() ran concurrently it could have
> +	 * freed the DMA buffers and the pending lists, leading to UAF and list
> +	 * corruption. Re-checking cleanup_done under fops_lock prevents that.
> +	 */
> +	if (mutex_lock_interruptible(&dev_ctx->fops_lock))
> +		return -ERESTARTSYS;

[Severity: High]
Does this risk permanently stranding the message if a signal arrives?

In se_if_fops_read(), the driver blocks in ele_msg_rcv() waiting for a
message from the firmware. When a message arrives, the completion is
consumed and the message is staged in the driver's internal buffer.

The driver then attempts to reacquire the fops_lock here using an
interruptible primitive. If a signal is pending at this exact moment, the
lock acquisition fails and returns -ERESTARTSYS.

Because the completion has already been consumed, the message is left
stranded in the buffer. When userspace retries the read() syscall, it will
block on ele_msg_rcv() again waiting for a new completion. Because the
firmware protocol is half-duplex, it will wait for userspace to process
the already delivered message, causing a permanent deadlock.

> +
> +	if (dev_ctx->cleanup_done) {
> +		mutex_unlock(&dev_ctx->fops_lock);
> +		return -ENODEV;
> +	}
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

[Severity: High]
Could this lead to a Use-After-Free if a concurrent open races with device
teardown?

During device unbind, se_if_probe_cleanup() calls misc_deregister(). While
misc_deregister() removes the device from the active misc device list, it
does not prevent a racing VFS open (which already found the miscdev but was
preempted before calling fops->open) from continuing.

If unbind completes, se_if_priv_release() drops the final reference to the
open_gate structure, freeing it. When the delayed open call resumes here,
it calculates the gate pointer using container_of() and calls
se_if_open_gate_get(gate). This reads from the freed gate->refcount,
causing a Use-After-Free.

> +		return -ENODEV;
> +
> +	if (mutex_lock_interruptible(&gate->lock)) {
> +		se_if_open_gate_put(gate);
> +		return -EBUSY;
> +	}
[ ... ]
> +	priv->dev_ctx_mono_count++;
> +	err =3D init_device_context(priv, priv->dev_ctx_mono_count, &dev_ctx);

[Severity: High]
Is there a limit on how much DMA memory can be allocated through this open
path?

When a user process opens the device file, se_if_fops_open() invokes
init_device_context(), which calls init_se_shared_mem(). This unconditional=
ly
allocates 128KB (MAX_DATA_SIZE_PER_USER) of DMA coherent memory using
dma_alloc_coherent() per device context.

Since there is no global limit on the number of dev_ctx instances, a single
process could rapidly open the device repeatedly. This could instantly cons=
ume
hundreds of megabytes of contiguous DMA memory, which can exhaust the pool
and prevent other drivers from functioning, leading to a Denial of Service.

> +	if (err) {
> +		dev_err(priv->dev, "Failed[0x%x] to create dev-ctx.", err);
> +		goto out_unlock_misc;
> +	}
[ ... ]
> diff --git a/include/uapi/linux/se_ioctl.h b/include/uapi/linux/se_ioctl.h
> new file mode 100644
> index 0000000000000..ea14cec05020d
> --- /dev/null
> +++ b/include/uapi/linux/se_ioctl.h
> @@ -0,0 +1,97 @@
[ ... ]
> +struct se_ioctl_cmd_snd_rcv_rsp_info {
> +	__u64 tx_buf;
> +	__u32 tx_buf_sz;
> +	__u64 rx_buf;
> +	__u32 rx_buf_sz;
> +};

[Severity: High]
Does this structure introduce an ABI mismatch between 32-bit userspace and
a 64-bit kernel?

The se_ioctl_cmd_snd_rcv_rsp_info struct places a __u64 immediately after
a __u32. On 64-bit architectures, this induces 4 bytes of padding before
the __u64 and at the end of the struct, resulting in a 32-byte struct. On
some 32-bit architectures, __u64 requires only 4-byte alignment, producing
a 24-byte struct.

Because the SE_IOCTL_CMD_SEND_RCV_RSP macro incorporates the struct's size,
the generated IOCTL number will differ between a 32-bit application and the
64-bit kernel. When compat_ptr_ioctl passes the 32-bit IOCTL command to
se_ioctl(), it will fail to match the 64-bit switch case, causing a -ENOTTY
error for 32-bit compat userspace applications.

> +
> +struct se_ioctl_get_soc_info {
> +	__u16 soc_id;
> +	__u16 soc_rev;
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-imx-se-if-=
v32-0-95f56dff4ba9@nxp.com?part=3D5
