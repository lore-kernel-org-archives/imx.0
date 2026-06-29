Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D9B3C873B;
	Mon, 29 Jun 2026 07:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782717569; cv=none; b=bk963ax6lJ1PP/ctFi7jweSURoTU10+Ow1V8TYufvgGTbOKrcopC7Um8wtkdmzPYR1L65ESJVj/GySUQZMt+Fas6vS2BdtPY4QfiSLwc89bW+6/EwKJ4J+8SC+bgWZq8dNwmgSM90hD2ZQW/K7twuahQTm0/G1m6YBe/nEmfU6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782717569; c=relaxed/simple;
	bh=sdgcBQiRRDb/Sfxuh9Bsxvfpko/UJ/Kv6NzOy0ZI2WI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fE1k0M2tJY7LylgFDLWrHGhSxJodvjSJXodaLMCPx1rFH6yS896qRQwvaMtjMR7UP18Xho+NDNoKijhUTFqF3Cb3KKRkLZvXDAVn807ZmMSIMDzvbnI2xSkQwLT94kA3966s7hk893ZAEJZ/JrQ4gLIk+W4BdwWp7joxPj7HSxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66AE51F000E9;
	Mon, 29 Jun 2026 07:19:24 +0000 (UTC)
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v26 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260629-imx-se-if-v26-3-146446285744@nxp.com>
References: <20260629-imx-se-if-v26-0-146446285744@nxp.com>
 <20260629-imx-se-if-v26-3-146446285744@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 07:19:02 +0000
Message-Id: <20260629071924.66AE51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 11 potential issue=
(s) to consider:
- [Critical] The physical/DMA address of the encrypted IMEM buffer (`load_f=
w->imem.phyaddr`) is never initialized after allocation, causing the firmwa=
re to write exported IMEM state to physical address 0.
- [High] If `ele_msg_send()` fails, `ele_msg_send_rcv()` returns early with=
out clearing `priv->waiting_rsp_clbk_hdl.rx_msg`, leaving a dangling pointe=
r that can be written to by the interrupt handler.
- [High] If a firmware response timeout occurs, `tx_msg` is freed by the ca=
ller while its pointer is still queued asynchronously in the mailbox framew=
ork.
- [High] Global static state `var_se_info` is shared across all instances o=
f the device, leading to memory leaks and state corruption when multiple MU=
 instances probe.
- [High] `ele_service_swap()` silently truncates the 64-bit physical addres=
s to 32 bits, and the driver fails to configure a 32-bit DMA mask.
- [High] The SoC device registered via `soc_device_register()` is never unr=
egistered on driver removal, leading to a memory leak and sysfs UAF.
- [High] `se_if_probe_cleanup()` manually calls `dmam_free_coherent()` on d=
evres-managed memory, causing a double-free and passing an invalid handle.
- [High] Hardcoded `MAX_SCHEDULE_TIMEOUT` is applied to active command rece=
ivers, bypassing the timeout budget and causing an unkillable deadlock.
- [Medium] Mixing `goto`-based cleanup with `__free()` attribute declaratio=
ns in the same function.
- [Medium] The response buffer pointer `rx_msg` is cleared locklessly on th=
e success path, allowing a Write-After-Free if a spurious response arrives.
- [Low] In the resume handler, the return value of `se_restore_imem_state()=
` is not assigned to the `ret` variable, silently swallowing hardware resto=
re errors.
--

commit 6df55de736269bcb35dff3283a274cacbfb24e1f
Author: Pankaj Gupta <pankaj.gupta@nxp.com>
Subject: firmware: imx: add driver for NXP EdgeLock Enclave

This commit adds a messaging unit (MU) based communication interface for the
NXP EdgeLock Enclave (ELE). It exposes APIs via file descriptors for
configuring shared memory and exchanging messages.

> diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/e=
le_base_msg.c
> index 0000000000000..54d79c3d75af6
> --- /dev/null
> +++ b/drivers/firmware/imx/ele_base_msg.c
[ ... ]
> +int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
> +{
[ ... ]
> +	struct se_api_msg *tx_msg __free(kfree) =3D
> +		kzalloc(ELE_GET_INFO_REQ_MSG_SZ, GFP_KERNEL);
> +	if (!tx_msg)
> +		return -ENOMEM;
> +
> +	struct se_api_msg *rx_msg __free(kfree) =3D
> +		kzalloc(ELE_GET_INFO_RSP_MSG_SZ, GFP_KERNEL);
> +	if (!rx_msg)
> +		return -ENOMEM;
[ ... ]
> +	ret =3D se_val_rsp_hdr_n_status(priv, rx_msg, ELE_GET_INFO_REQ,
> +				      ELE_GET_INFO_RSP_MSG_SZ, true);
> +	if (ret < 0)
> +		goto exit;
> +
> +	memcpy(s_info, get_info_data, sizeof(*s_info));
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
Does this mix goto-based cleanup with __free() variable declarations?

Looking at ele_get_info(), tx_msg and rx_msg use the __free(kfree) scoped
cleanup macro, but the error paths use a goto exit label to manage the
cleanup of get_info_data. The cleanup subsystem guidelines prohibit mixing
these two error handling paradigms in the same function scope because it
obscures ownership semantics and can lead to double-frees or leaks.

[ ... ]
> +int ele_service_swap(struct se_if_priv *priv,
> +		     phys_addr_t addr,
> +		     u32 addr_size, u16 flag)
> +{
[ ... ]
> +	tx_msg->data[0] =3D flag;
> +	tx_msg->data[1] =3D addr_size;
> +	tx_msg->data[2] =3D ELE_NONE_VAL;
> +	tx_msg->data[3] =3D lower_32_bits(addr);
> +	tx_msg->data[4] =3D se_get_msg_chksum((u32 *)&tx_msg[0],
> +					    ELE_SERVICE_SWAP_REQ_MSG_SZ);

[Severity: High]
Does this silently truncate the 64-bit physical address to 32 bits?

If upper_32_bits(addr) is non-zero, this passes only the lower 32 bits to
the firmware without validation. When combined with dmam_alloc_coherent()
calls that lack a restricted 32-bit DMA mask, the memory could be allocated
above 4GB, causing the firmware to write the enclave state to the wrong
address.

> diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele=
_common.c
> index 0000000000000..ba606f4e8be83
> --- /dev/null
> +++ b/drivers/firmware/imx/ele_common.c
[ ... ]
> +int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_=
hdl)
> +{
> +	bool wait_uninterruptible =3D false;
> +	unsigned long remaining_jiffies;
> +	unsigned long flags;
> +	int ret;
> +
> +	remaining_jiffies =3D MAX_SCHEDULE_TIMEOUT;
> +	do {
> +		if (wait_uninterruptible)
> +			ret =3D wait_for_completion_timeout(&se_clbk_hdl->done,
> +							  remaining_jiffies);

[Severity: High]
Does this hardcoded MAX_SCHEDULE_TIMEOUT bypass the timeout budget?

If userspace sends a command and the firmware never responds, the task will
block indefinitely in D-state. Since this holds the global se_if_cmd_lock
mutex, it could completely freeze the driver.

[ ... ]
> +int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_s=
z,
> +		     void *rx_msg, int exp_rx_msg_sz)
> +{
> +	int err;
> +
> +	guard(mutex)(&priv->se_if_cmd_lock);
> +
> +	if (atomic_read(&priv->fw_busy)) {
> +		dev_dbg(priv->dev, "ELE became unresponsive.\n");
> +		return -EBUSY;
> +	}
> +	reinit_completion(&priv->waiting_rsp_clbk_hdl.done);
> +	priv->waiting_rsp_clbk_hdl.rx_msg_sz =3D exp_rx_msg_sz;
> +	priv->waiting_rsp_clbk_hdl.rx_msg =3D rx_msg;
> +
> +	err =3D ele_msg_send(priv, tx_msg, tx_msg_sz);
> +	if (err < 0)
> +		return err;

[Severity: High]
If ele_msg_send() fails and returns early, is rx_msg left in a dangling
state?

Because priv->waiting_rsp_clbk_hdl.rx_msg is set before the call to
ele_msg_send(), an error here leaves the pointer populated. If the caller
then frees the buffer and a spurious response arrives, the interrupt handler
might memcpy into the freed memory, causing a write-after-free.

> +
> +	err =3D ele_msg_rcv(priv, &priv->waiting_rsp_clbk_hdl);

[Severity: High]
If ele_msg_rcv() times out and returns -ETIMEDOUT, does this leave the
pending message in the mailbox framework?

The caller frees tx_msg upon error, but since the mailbox client is configu=
red
with tx_block =3D false, the pointer might still be queued in the mailbox
framework. When the hardware eventually processes it, the controller driver
could dereference the freed memory.

> +
> +	if (priv->waiting_rsp_clbk_hdl.signal_rcvd) {
> +		err =3D -EINTR;
> +		priv->waiting_rsp_clbk_hdl.signal_rcvd =3D false;
> +		dev_err(priv->dev, "Err[0x%x]:Interrupted by signal.", err);
> +	}
> +	priv->waiting_rsp_clbk_hdl.rx_msg =3D NULL;
> +
> +	return err;
> +}

[Severity: Medium]
Is it safe to clear rx_msg here without holding clbk_rx_lock?

If a spurious response arrives immediately after a successful reception,
se_if_rx_callback() on another CPU might acquire the spinlock and see the
non-NULL pointer before this lockless assignment propagates, potentially
writing to the buffer after it has been freed by the caller.

[ ... ]
> +int se_save_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem)
> +{
[ ... ]
> +	/*
> +	 * EXPORT command will save encrypted IMEM to given address,
> +	 * so later in resume, IMEM can be restored from the given
> +	 * address.
> +	 *
> +	 * Size must be at least 64 kB.
> +	 */
> +	ret =3D ele_service_swap(priv, imem->phyaddr, ELE_IMEM_SIZE, ELE_IMEM_E=
XPORT);

[Severity: Critical]
Can this pass an uninitialized physical address to the firmware?

Looking at se_if_probe(), the DMA address allocated is stored in a local
variable (imem_dma_addr) but is never assigned to load_fw->imem.phyaddr. As=
 a
result, this passes 0 to ele_service_swap(). Writing 64KB to physical addre=
ss
0 could corrupt critical system memory or exception vectors upon suspend.

> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> index 0000000000000..9a2c3c6111462
> --- /dev/null
> +++ b/drivers/firmware/imx/se_ctrl.c
[ ... ]
> +struct se_if_node {
> +	struct se_soc_info *se_info;
> +	u8 *pool_name;
> +	bool reserved_dma_ranges;
> +	struct se_if_defines if_defs;
> +};
> +
> +/* common for all the SoC. */
> +static struct se_var_info var_se_info;

[Severity: High]
Is it intentional that var_se_info is a global static variable rather than
per-device state?

If multiple MU instances probe, they will all share and overwrite this
singleton state. During unbind, se_if_probe_cleanup() could call
dmam_free_coherent() using a specific device's devres context on a shared
buffer pointer, causing memory leaks or devres mismatch corruption.

[ ... ]
> +static int get_se_soc_info(struct se_if_priv *priv, const struct se_soc_=
info *se_info)
> +{
[ ... ]
> +	attr->serial_number =3D devm_kasprintf(priv->dev,
> +					     GFP_KERNEL, "%016llX",
> +					     GET_SERIAL_NUM_FROM_UID(s_info->d_info.uid,
> +								     MAX_UID_SIZE >> 2));
> +
> +	sdev =3D soc_device_register(attr);
> +	if (IS_ERR(sdev))
> +		return PTR_ERR(sdev);
> +
> +	return 0;
> +}

[Severity: High]
Does this permanently discard the handle needed to unregister the SoC devic=
e?

The returned soc_device handle is not saved. When the driver unbinds, devres
frees the attr memory, but because soc_device_unregister() is never called,
the device node remains active in sysfs. Any userspace process reading the
lingering attributes will access freed memory.

[ ... ]
> +static void se_if_probe_cleanup(void *plat_dev)
> +{
> +	struct platform_device *pdev =3D plat_dev;
> +	struct se_fw_load_info *load_fw;
> +	struct device *dev =3D &pdev->dev;
> +	struct se_if_priv *priv;
[ ... ]
> +	/*
> +	 * free the buffer in se remove, previously allocated
> +	 * in se probe to store encrypted IMEM
> +	 */
> +	if (load_fw && load_fw->imem.buf) {
> +		dmam_free_coherent(dev, ELE_IMEM_SIZE, load_fw->imem.buf,
> +				   load_fw->imem.phyaddr);
> +		load_fw->imem.buf =3D NULL;
> +	}

[Severity: High]
Does this explicitly free memory that is already managed by devres?

Because dmam_alloc_coherent() allocates devres-managed memory, the kernel
will automatically free it on teardown. Calling dmam_free_coherent() here
causes a double-free. Furthermore, since imem.phyaddr was never populated,
this passes an invalid DMA handle to the allocator.

[ ... ]
> +static int se_if_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	if (se_info->se_fw_img_nm.seco_fw_nm_in_rfs) {
> +		load_fw =3D get_load_fw_instance(priv);
> +		load_fw->se_fw_img_nm =3D &se_info->se_fw_img_nm;
> +		load_fw->is_fw_tobe_loaded =3D true;
> +
> +		if (load_fw->se_fw_img_nm->prim_fw_nm_in_rfs) {
> +			/* allocate buffer where SE store encrypted IMEM */
> +			imem_dma_addr =3D phys_to_dma(priv->dev, load_fw->imem.phyaddr);
> +			load_fw->imem.buf =3D dmam_alloc_coherent(priv->dev, ELE_IMEM_SIZE,
> +								&imem_dma_addr, GFP_KERNEL);

[Severity: Critical]
Is the allocated DMA address supposed to be saved in load_fw->imem.phyaddr?

The resulting imem_dma_addr is stored locally but never written back to
load_fw->imem.phyaddr. It remains 0, which is later passed to the firmware
in se_save_imem_state().

[Severity: High]
Is the device's DMA mask configured to 32-bits before this allocation?

Since ele_service_swap() silently truncates physical addresses to 32 bits,
allocating memory without enforcing a 32-bit DMA mask could result in buffe=
rs
above 4GB, which the firmware will truncate and then write to the wrong
address.

[ ... ]
> +static int se_resume(struct device *dev)
> +{
> +	struct se_if_priv *priv =3D dev_get_drvdata(dev);
> +	struct se_fw_load_info *load_fw;
> +	int ret =3D 0;
> +
> +	load_fw =3D get_load_fw_instance(priv);
> +
> +	if (load_fw->imem_mgmt) {
> +		se_restore_imem_state(priv, &load_fw->imem);
> +		if (ret)
> +			dev_err(dev, "Failure restoring IMEM state[0x%x]", ret);
> +	}
> +
> +	return 0;
> +}

[Severity: Low]
Does this accidentally swallow the return value of se_restore_imem_state()?

The function call does not assign its result to ret. Because ret is
initialized to 0, the subsequent error check if (ret) will always fail,
masking any hardware restore failures.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-imx-se-if-=
v26-0-146446285744@nxp.com?part=3D3
