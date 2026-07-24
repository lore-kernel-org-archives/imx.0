Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864BE3DAAB7;
	Fri, 24 Jul 2026 08:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784881954; cv=none; b=Zg17JiAqyZpMS2+GCNvXr9jNY88rt3/IZPwl98qytTh8sCZbOJrHaRQdAFivdzMSBKgG+OVA8Rafp6bt3A0CcHjWiZoAK/uajqQXjs+ZXmH2nNAz95TxUbs4E7dAQloImZIRmDXOOKSTEQvVSkP6qCgDnP41iprCqWIXHfLn8eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784881954; c=relaxed/simple;
	bh=eyEtlvTpQvAfOmtpJI0xVtVEAGECO4j5XNwijN4FtIg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EoOKRQHWBP6McFuursm/fkx3dAAZpXgUhDbjD5PNKOAY85CE868DC23Ih7C1JkU2tEkCRzjBLxg9soYV0N8acby3zJvxERQ/asQ5d3gMwAhL73VfDVUvynWfJUrhHbqVzPX7G4m3Qn82P2WaWhAifQO3VY8aMRylZJz7XORdcjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U/NFjYJy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U/NFjYJy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA7CC1F000E9;
	Fri, 24 Jul 2026 08:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784881942;
	bh=l5P7Kue/qGZ00niO5VskJ8z5T4ZzrtYEYN7imiQThDU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U/NFjYJyjAjvuidRk+CtilyP+moRZO+9jRO2XvBV9pgcchAdFgO978OVOrvDO5cY1
	 waWNrapRQZc1mIw/dY+Wiuk0r/qzy0MkwsBxLzoTUpWz4CquKwqLieQ3oPIhEA0Qdf
	 DfEHeAegRCte0wdk+tyvVnNRVw0E9ICPoEmVl0//eSafOZuOULzq2XvRmWmr+IRh/U
	 wj/QoF6D6wakojrhBbj+cEmUnrLt0fAf5tRM3QxtQotIcPftVRGDFupC3mtCJoB19E
	 z626FABv32xS4IooXOcm4qhl8bytLPLiqVto/rvn/fKD5XwxZWMlFQ0T3CBpbibffB
	 R3vOn8b3fxkWw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v30 5/7] firmware: drivers: imx: adds miscdev
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260724-imx-se-if-v30-5-ce8ba256692c@nxp.com>
References: <20260724-imx-se-if-v30-0-ce8ba256692c@nxp.com>
 <20260724-imx-se-if-v30-5-ce8ba256692c@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 08:32:21 +0000
Message-Id: <20260724083221.CA7CC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [Critical] Driver unbind forcefully wakes waiting ioctls and clears firmw=
are busy state, causing DMA Use-After-Free by the hardware.
- [High] Late mailbox interrupts can schedule `fw_busy_work` after it has b=
een canceled, leading to a Use-After-Free of `priv` when the workqueue exec=
utes.
- [High] Unbind deadlock/hang due to concurrent ioctl threads blocked on `s=
e_if_cmd_lock` bypassing the `complete_all()` wake-up.
- [Medium] The 128KB DMA shared memory buffer allocated for the internal `p=
riv_dev_ctx` is permanently leaked on device unbind.

Pre-existing issues:
- [High] Concurrency race between se_if_rx_callback and se_if_fops_read on =
the shared command receiver buffer (rx_msg) leading to data corruption.
- [High] Dangling pointer priv->dev is passed to dma_free_coherent() and de=
v_warn() if a file descriptor is closed after device unbind.
--

--- Patch [5]: [PATCH v30 5/7] firmware: drivers: imx: adds miscdev ---
commit c7550c8a49060a4114eb071db0048e14879f71ab
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

    firmware: drivers: imx: adds miscdev

This commit adds a miscdev character driver for the i.MX secure enclave to
allow user-space applications to exchange messages with NXP secure enclave
hardware. It implements ABI documentation, device contexts, and command
header validation to restrict unsupported operations.

> diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele=
_common.c
> --- a/drivers/firmware/imx/ele_common.c
> +++ b/drivers/firmware/imx/ele_common.c
[ ... ]
> @@ -219,6 +219,9 @@ int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx=
, void *tx_msg, int tx_msg_
>  		return err;
>  	}
> =20
>  	guard(mutex)(&priv->se_if_cmd_lock);
> =20
>  	if (atomic_read(&priv->fw_busy)) {
>  		dev_dbg(priv->dev, "%s: ELE became unresponsive.\n", dev_ctx->devname);
>  		return -EBUSY;
>  	}
>  	reinit_completion(&priv->waiting_rsp_clbk_hdl.done);
>  	spin_lock_irqsave(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);

[Severity: High]
Does this create an unbind deadlock if multiple ioctls are running concurre=
ntly?

When se_if_probe_cleanup() runs, it calls complete_all() to wake up the blo=
cked
waiter in ele_msg_rcv(). However, concurrent firmware transactions are seri=
alized
by priv->se_if_cmd_lock.

If Thread A holds se_if_cmd_lock and is blocked in ele_msg_rcv(), and Threa=
d B is
blocked waiting to acquire se_if_cmd_lock, Thread B will miss the complete_=
all()
signal. Once Thread A finishes and releases the lock, Thread B will acquire=
 it,
call reinit_completion() here, and wait for the full timeout. Meanwhile, the
unbind thread will block indefinitely trying to acquire dev_ctx->fops_lock
(which Thread B already holds from se_ioctl).

[ ... ]
> @@ -311,6 +314,10 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, =
void *msg)
>  		/*
>  		 * Clamp the copy length to the pre-allocated receiver buffer (MAX_NVM=
_MSG_LEN).
>  		 */
>  		se_clbk_hdl->rx_msg_sz =3D min_t(u32, rx_msg_sz, MAX_NVM_MSG_LEN);
>  		devname =3D se_clbk_hdl->dev_ctx->devname;
>  		memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);
>  		complete(&se_clbk_hdl->done);
>  		spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);

[Severity: High]
This is a pre-existing issue, but can this lead to data corruption when
userspace is actively reading the response?

When se_if_fops_read() wakes up, it acquires clbk_rx_lock to snapshot the
pointers, then drops the lock and calls copy_to_user(). If the firmware sen=
ds
another command message while copy_to_user() is running, se_if_rx_callback()
will blindly overwrite the shared rx_msg buffer here via memcpy() since it
doesn't check if the buffer is currently being consumed.

[ ... ]
> @@ -354,6 +361,9 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, v=
oid *msg)
>  		se_clbk_hdl =3D &priv->waiting_rsp_clbk_hdl;
>  		spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
>  		if (!se_clbk_hdl->rx_msg) {
>  			if (atomic_read(&priv->fw_busy))
>  				schedule_fw_busy_work =3D true;
>  			spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
> =20
>  			if (schedule_fw_busy_work)
>  				schedule_work(&priv->fw_busy_work);

[Severity: High]
Can a late mailbox interrupt cause a Use-After-Free of priv by scheduling t=
his
work after the driver has been unbound?

In se_if_probe_cleanup(), cancel_work_sync(&priv->fw_busy_work) is called
before the mailbox channels are freed (mbox_free_channel). If a late mailbox
message arrives right before or during the unbind process, this callback can
evaluate the condition and schedule the work after it was supposedly cancel=
ed,
leading to the workqueue accessing freed memory when the unbind completes.

> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c
[ ... ]
> @@ -410,6 +410,9 @@ static void cleanup_se_shared_mem(struct se_if_device=
_ctx *dev_ctx)
>  	 * happen before the DMA backing memory is released to avoid a leak.
>  	 */
>  	se_dev_ctx_shared_mem_cleanup(dev_ctx);
> =20
>  	dma_free_coherent(priv->dev, MAX_DATA_SIZE_PER_USER,
>  			  se_shared_mem_mgmt->non_secure_mem.ptr,
>  			  se_shared_mem_mgmt->non_secure_mem.dma_addr);

[Severity: High]
This is a pre-existing issue, but could this pass a dangling priv->dev
pointer to dma_free_coherent() if a file descriptor is closed after unbind?

The driver stores a pointer to the platform device in priv->dev in se_if_pr=
obe()
but does not pin it with get_device(). When the device is unbound, the
miscdevice is deregistered, dropping the VFS reference to the parent device.
If userspace still holds an open file descriptor, priv is kept alive, but t=
he
underlying struct device might be freed. When close() is finally called, th=
is
uses the dangling pointer.

[ ... ]
> @@ -650,6 +653,10 @@ static void se_if_priv_release(struct kref *kref)
> =20
>  	/* Free priv_dev_ctx if it exists */
>  	if (priv->priv_dev_ctx) {
>  		/*
>  		 * miscdev storage belongs to open_gate, not directly to
>  		 * priv_dev_ctx. The gate should already have been detached
>  		 * from priv during teardown.
>  		 */
>  		cleanup_dev_ctx(priv->priv_dev_ctx, false);
> =20
>  		kfree(priv->priv_dev_ctx->devname);
>  		kfree(priv->priv_dev_ctx);
>  		priv->priv_dev_ctx =3D NULL;
>  	}

[Severity: Medium]
Does this leak the 128KB DMA buffer allocated for priv_dev_ctx during unbin=
d?

When se_if_probe_cleanup() runs, it sets priv->priv_dev_ctx->cleanup_done =
=3D true.
When se_if_priv_release() later calls cleanup_dev_ctx(priv->priv_dev_ctx, f=
alse),
cleanup_dev_ctx() skips freeing the DMA memory via cleanup_se_shared_mem()
because it sees cleanup_done is already true. The context struct is freed, =
but
the DMA memory is permanently leaked.

[ ... ]
> @@ -685,6 +692,10 @@ static void se_clear_fw_busy(struct se_if_priv *priv)
> =20
>  	dev_ctx =3D priv->fw_busy_dev_ctx;
>  	priv->fw_busy_dev_ctx =3D NULL;
>  	atomic_set(&priv->fw_busy, 0);
>  	spin_unlock_irqrestore(&priv->fw_busy_lock, flags);
> =20
>  	if (!dev_ctx)
>  		return;
> =20
>  	scoped_guard(mutex, &dev_ctx->fops_lock) {
>  		if (dev_ctx->cleanup_done)
>  			cleanup_se_shared_mem(dev_ctx);
>  	}

[Severity: Critical]
Is it safe to clear the circuit breaker and unconditionally free the DMA me=
mory
for legitimately timed-out contexts here?

During teardown, se_if_probe_cleanup() forcefully wakes up any waiting ioct=
ls
using complete_all(). The woken thread in ele_msg_rcv() observes a positive
remaining timeout, thinks it succeeded, and thus skips setting the fw_busy
circuit breaker. It then proceeds to free the DMA memory.

Furthermore, se_clear_fw_busy() is called at the end of unbind, uncondition=
ally
clearing the busy flag and freeing DMA memory for any context that timed out
previously. In both cases, the hardware enclave might still be executing and
actively DMA-writing to that freed physical memory, causing memory corrupti=
on.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-imx-se-if-=
v30-0-ce8ba256692c@nxp.com?part=3D5
