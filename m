Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBA7238C16;
	Wed, 19 Aug 2026 06:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787120851; cv=none; b=clZmbBb1K2LR6iZQaxmlfZd0iqMFji25jQkhS60RVGlnzmwMdnnP5JjDDlueBaA6vv+pBWKAqVTMMRqUVbjBaxVmHP1JUnVf714j6W9tBdU9KFjpACYeVVh0WuZDjkw5wlMDa/A2g+zcGRoXr060W9TIemBNrusXd5BtOteBweg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787120851; c=relaxed/simple;
	bh=STRGXaQTrHvk5BHiPYv+haA0XnIpxWJ3RWcB+WWn5TM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P9RouH7ovSAS2Da8nKOzbYvWfDWVX3YeJxcLOY7VoBBAtEhQf2TMgD9bUTUKh0osDd5r4/Fosk3EJHCmv4+NviUl19tt/HUq5SiVqEKGodzm/eqX9l9UwaBK1K2oltySuXBu+eiN5HH49FbQIrcGyC4VE8tK0w1hOSKGKioyPV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JOx2AxvC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JOx2AxvC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 129E21F000E9;
	Wed, 19 Aug 2026 06:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787120849;
	bh=HBgob6fjskPYc6eHZE7f2Iy4cBQY7sxw+BiMpmcQa84=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JOx2AxvCvzH0llisTGoHXso1NK1/Ngx7Qa73qn2gBFM92nZ+FKwVS8d64NDpaWiSg
	 6/U1Ypr6LS71rERwXcMbZ+D1Pva+uDy6hZ/SppWrw222/yFH7dn2rUQZzDH94gZI+i
	 J9OHJWunUdJ+L7DdTYR0iUXgnK3hEIhLrKflLilYNGCsz7D4YkrE6QosMyDNe4UJE0
	 6KT8mhs0SDoI4i7B6m/Iyte8pyxfQLw1Ytt0xof1qj7LOx3PKynml75D/xi9QrMQ2b
	 d0jE7jVVeusVf2tE2/mXqfOe+yshFhKXi37n9RhRjzBiA0BkrZynjkbc1fRo/afzSH
	 p1nasmL91qIFA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v37 5/7] firmware: imx: adds miscdev
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pankaj Gupta" <pankaj.gupta@nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260819-imx-se-if-v37-5-5ef5de9ff1dc@nxp.com>
References: <20260819-imx-se-if-v37-0-5ef5de9ff1dc@nxp.com>
 <20260819-imx-se-if-v37-5-5ef5de9ff1dc@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 06:27:28 +0000
Message-Id: <20260819062729.129E21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [High] Race condition between ELE_STORAGE_OPEN_REQ pre-check and command =
receiver registration allows hijacking NVM traffic.
- [High] Global static variables used to store firmware-requested DMA buffe=
r sizes can be overwritten by concurrent operations, leading to out-of-boun=
ds DMA.
- [High] Flawed DMA address validation for input-only buffers with unbounde=
d sizes allows out-of-bounds DMA reads.
- [High] A malicious command receiver can bypass the DMA end-bound check fo=
r storage export responses by supplying a small size to read(), causing the=
 expected buffer size to be zero-padded.
- [High] Internal device context (priv_dev_ctx) permanently leaks shared me=
mory on firmware timeout.
- [High] The fix for the unbind race condition (using !rx_delivered instead=
 of !completion_done()) was only applied to the -ERESTARTSYS path, leaving =
the timeout and deadline paths vulnerable to the exact same DMA-after-free.
- [High] Use-After-Free of the devname string pointer in se_if_rx_callback(=
) due to accessing it after dropping clbk_rx_lock.
- [High] The command receiver bypasses strict session ownership checks, all=
owing it to maliciously spoof handles and close arbitrary sessions belongin=
g to other processes.
- [High] The driver unconditionally allocates 128KB of coherent DMA memory =
every time a user opens the misc device, without tracking total allocations=
 or limiting the number of open file descriptors.
- [Medium] Self-deadlock in fw_api_specific_ops() via recursive acquisition=
 of priv->modify_lock.
--

--- Patch [5]: [PATCH v37 5/7] firmware: imx: adds miscdev ---
commit 6bbd6617ac10e062e148f028c3c0f9417699688c
Author: Pankaj Gupta <pankaj.gupta@nxp.com>
Subject: firmware: imx: adds miscdev

Adds the driver for communication interface to secure-enclave, that
enables exchanging messages with NXP secure enclave HW IP(s)
like EdgeLock Enclave, from:
- User-Space Applications via character driver.

ABI documentation for the NXP secure-enclave driver.

Link: https://github.com/nxp-imx/imx-secure-enclave.git
Link: https://github.com/nxp-imx/imx-smw.git

> diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele=
_common.c
> index b662063c3b1c2..e1c53b3c7036c 100644
> --- a/drivers/firmware/imx/ele_common.c
> +++ b/drivers/firmware/imx/ele_common.c

[ ... ]

> @@ -110,6 +110,9 @@ int se_val_cmd_addrs(struct se_if_device_ctx *dev_ctx=
, struct se_api_msg *msg,
>  		/* Zero marks an absent optional buffer. */
>  		if (!addr)
>  			continue;
> =20
>  		if (addr < base || addr >=3D end)
>  			return -EACCES;
> =20
>  		/*
>  		 * When the message also carries this buffer's length, the whole

[Severity: High]
Does this validation allow out-of-bounds DMA reads? For input-only buffers
like ELE_OEM_AUTH_CONTAINER_REQ in ele_common.c, the size_idx is set to
SE_CMD_ADDR_NO_SIZE and buf_size to 0. This bypasses the end-boundary
check entirely. Could an attacker place the start address near the end of
the shared memory window and provide a large embedded length in the payload,
forcing the firmware to read past the DMA window into adjacent physical
memory?

>  		 * buffer [addr, addr + len) must fit inside the window, not just
>  		 * its start. addr is already >=3D base and < end here, so end - addr
>  		 * is a positive value and the comparison cannot overflow.
>  		 */

[ ... ]

> @@ -133,6 +133,6 @@ int se_val_cmd_addrs(struct se_if_device_ctx *dev_ctx=
, struct se_api_msg *msg,
>  		} else if (f->buf_size) {
>  			/* buf_size: literal byte count
>  			 *           (FW-defined constant or saved at runtime).
>  			 */
>  			if ((u64)f->buf_size > end - addr)
>  				return -EACCES;
>  		}

[Severity: High]
Could this be bypassed if buf_size is dynamically set to zero? If a malicio=
us
command receiver provides a small size to se_if_fops_read() in se_ctrl.c, t=
he
message could be truncated, leaving rx_msg_snap zero-padded.
fw_api_specific_ops() would then read data[1] as 0 and pass it to
ele_set_sz_in_field_addr(), setting buf_size to 0. This would bypass the
end-bound check entirely in se_val_cmd_addrs(), potentially allowing
out-of-bounds DMA.

>  	}
> =20
>  	return 0;
>  }

[ ... ]

> @@ -230,8 +230,8 @@ int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, str=
uct se_clbk_handle *se_clbk
>  			if (time_after_eq(now, deadline_jiffies)) {
>  				/* Deadline hit: fence hung FW, like the ret=3D=3D0 path. */
>  				spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
>  				se_clbk_hdl->rx_msg =3D NULL;
>  				if (!completion_done(&se_clbk_hdl->done))
>  					se_mark_fw_busy(dev_ctx);
>  				spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);

[Severity: High]
Is it possible for this path to suffer from the same DMA-after-free
regression that was fixed in the signal interruption path? The time_after_eq
deadline hit path and the ret =3D=3D 0 timeout path in ele_msg_rcv() still =
use
completion_done() instead of checking rx_delivered. If a timeout races with
teardown, could the circuit breaker fail to arm, causing the DMA buffer to
be freed while firmware is still writing to it?

>  				ret =3D -ETIMEDOUT;
>  				break;
>  			}

[ ... ]

> diff --git a/drivers/firmware/imx/ele_fw_api.c b/drivers/firmware/imx/ele=
_fw_api.c
> new file mode 100644
> index 0000000000000..0c4c6f7de0205
> --- /dev/null
> +++ b/drivers/firmware/imx/ele_fw_api.c
> @@ -0,0 +1,361 @@

[ ... ]

> +static int se_cmd_receiver_allowed_cmd(struct se_if_device_ctx *dev_ctx,
> +				       struct se_api_msg *msg, u32 tx_msg_sz)
> +{
> +	u8 cmd =3D msg->header.command;
> +
> +	switch (cmd) {
> +	case ELE_SESSION_CLOSE_REQ:
> +	case ELE_STORAGE_CLOSE_REQ:
> +		return 0;

[Severity: High]
Does this allow the command receiver to bypass strict session ownership
checks? By returning 0 unconditionally for ELE_SESSION_CLOSE_REQ and
ELE_STORAGE_CLOSE_REQ in se_cmd_receiver_allowed_cmd(), it seems a malicious
command receiver could spoof handles and close arbitrary sessions belonging
to other processes.

> +	case ELE_STORAGE_MASTER_IMPORT_REQ:
> +		const struct se_cmd_addr_field *fields;
> +		size_t count;

[ ... ]

> +	case ELE_STORAGE_OPEN_REQ:
> +		/* Might be cleared as part of tear down. */
> +		if (dev_ctx->strg_hdl) {
> +			ret =3D -EEXIST;
> +			break;
> +		}
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

[Severity: High]
Is there a race condition here since modify_lock is dropped before the
command is sent to firmware? Could another process hijack the command
receiver slot via SE_IOCTL_ENABLE_CMD_RCV during this window, causing the
NVM traffic for this storage session to be routed to the attacker instead?

> +		if (rx_msg_sz < ELE_STORAGE_OPEN_RSP_SZ)
> +			ret =3D -EINVAL;
> +		break;

[ ... ]

> +	case ELE_STORAGE_OPEN_REQ: {
> +		int rc =3D 0;
> +
> +		/*
> +		 * Record the storage handle before registering as command
> +		 * receiver. FW has already allocated the handle; if we assigned
> +		 * it only after a successful registration, a failing
> +		 * set_dev_ctx_as_command_receiver() (e.g. -EBUSY) would leave
> +		 * strg_hdl at 0 while the ioctl still returns success to
> +		 * userspace. The kernel would then never close the handle on
> +		 * teardown, leaking it in FW. Storing it first guarantees
> +		 * cleanup_dev_ctx() closes it regardless of registration.
> +		 */
> +		dev_ctx->strg_hdl =3D rx_msg->data[1];
> +
> +		rc =3D set_dev_ctx_as_command_receiver(dev_ctx);
> +		if (rc)
> +			dev_err(priv->dev,
> +				"Failed to register %s as CMD-Receiver: %d\n",
> +				dev_ctx->devname, rc);

[Severity: High]
If set_dev_ctx_as_command_receiver() fails and returns -EBUSY, the error is
logged but execution continues in fw_api_specific_ops(). Could this leave
the storage handle assigned to the caller while the actual NVM traffic gets
routed to an attacker who won the race to become the command receiver?

> +		break;
> +	}

[ ... ]

> diff --git a/drivers/firmware/imx/ele_msg_addr_field.c b/drivers/firmware=
/imx/ele_msg_addr_field.c
> new file mode 100644
> index 0000000000000..1da6583b6c312
> --- /dev/null
> +++ b/drivers/firmware/imx/ele_msg_addr_field.c
> @@ -0,0 +1,654 @@

[ ... ]

> +void ele_set_sz_in_field_addr(u8 cmd, u32 size)
> +{
> +	switch (cmd) {
> +	case ELE_STORAGE_MASTER_EXPORT_REQ:
> +		ele_storage_master_export_addr_fields[0].buf_size =3D size;
> +		break;

[Severity: High]
Is it safe to mutate the buf_size of a global static array here? If multiple
sessions or devices handle concurrent export commands, could this create a
data race in ele_set_sz_in_field_addr() where one operation overwrites the
expected buffer size of another, potentially leading to out-of-bounds DMA?

> +	case ELE_STORAGE_CHUNK_EXPORT_REQ:
> +		ele_storage_chunk_export_addr_fields[0].buf_size =3D size;
> +		break;
> +	}
> +}

[ ... ]

> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> index a8974eef190b6..56a4e53be37b8 100644
> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c

[ ... ]

> +static int init_se_shared_mem(struct se_if_device_ctx *dev_ctx)
> +{
> +	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt =3D &dev_ctx->se_sha=
red_mem_mgmt;
> +	struct se_if_priv *priv =3D dev_ctx->priv;
> +
> +	INIT_LIST_HEAD(&se_shared_mem_mgmt->pending_out);
> +	INIT_LIST_HEAD(&se_shared_mem_mgmt->pending_in);
> +
> +	if (priv->mem_pool)
> +		INIT_LIST_HEAD(&se_shared_mem_mgmt->mem_pool_buf_list);
> +
> +	se_shared_mem_mgmt->non_secure_mem.ptr =3D
> +			dma_alloc_coherent(priv->dev, MAX_DATA_SIZE_PER_USER,
> +					   &se_shared_mem_mgmt->non_secure_mem.dma_addr,
> +					   GFP_KERNEL);

[Severity: High]
Does this unconditionally allocate 128KB of contiguous DMA memory every time
a user opens the device? Without tracking total allocations or limiting the
number of open file descriptors in se_if_fops_open(), could a malicious user
open the device in a loop and quickly exhaust the CMA/DMA memory pools,
causing a system-wide denial of service?

> +	if (!se_shared_mem_mgmt->non_secure_mem.ptr)
> +		return -ENOMEM;

[ ... ]

> @@ -540,6 +540,6 @@ void se_if_rx_callback(...)
>  		se_clbk_hdl->rx_msg_sz =3D min_t(u32, rx_msg_sz, MAX_NVM_MSG_LEN);
>  		devname =3D se_clbk_hdl->dev_ctx->devname;
>  		memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);
>  		complete(&se_clbk_hdl->done);
>  		spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
>  		if (sz_mismatch)
>  			dev_err(dev,
>  				"%s: CMD-RCVER NVM: hdr(0x%x) with different sz(%d !=3D %d).\n",
>  				devname, *(u32 *)header,

[Severity: High]
Is it safe to dereference devname after releasing the clbk_rx_lock? Since
complete() is called before the lock is dropped in se_if_rx_callback(),
could a user process wake up, close the file descriptor, and free dev_ctx
and its devname before dev_err() is executed, resulting in a use-after-free?
This also appears to happen in the rsp_tag path below.

>  				(header->size << 2), rx_msg_sz);
>  	} else if (header->tag =3D=3D priv->if_defs->rsp_tag) {

[ ... ]

> +static void se_clear_fw_busy(struct se_if_priv *priv)
> +{
> +	struct se_if_device_ctx *dev_ctx =3D NULL;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&priv->fw_busy_lock, flags);
> +	dev_ctx =3D priv->fw_busy_dev_ctx;
> +	priv->fw_busy_dev_ctx =3D NULL;
> +	atomic_set(&priv->fw_busy, 0);
> +	spin_unlock_irqrestore(&priv->fw_busy_lock, flags);
> +
> +	if (!dev_ctx)
> +		return;

[ ... ]

> +	scoped_guard(mutex, &dev_ctx->fops_lock) {
> +		if (atomic_read(&priv->going_away)) {
> +			/*
> +			 * Fatal, but deliberately non-panic: the enclave is
> +			 * unresponsive at unbind with a transaction still in
> +			 * flight. Both the coherent staging buffer and any
> +			 * gen_pool buffers this context owns are abandoned
> +			 * (host descriptors freed, DMA-visible memory leaked)
> +			 * to avoid a DMA-after-free while the enclave may still
> +			 * be writing. Emit one headline error here rather than
> +			 * per-buffer so the count of faulted contexts is clear.
> +			 * Do not use WARN/BUG: this path is recoverable and
> +			 * panic_on_warn kernels must not be brought down by it.
> +			 */
> +			dev_err(priv->dev,
> +				"%s: FATAL: enclave stuck at unbind, DMA leaked.\n",
> +				dev_ctx->devname);
> +			cleanup_se_shared_mem(dev_ctx, false);
> +		} else if (dev_ctx->cleanup_done) {
> +			cleanup_se_shared_mem(dev_ctx, true);
> +		}
> +	}

[Severity: High]
Could this permanently leak the 128KB shared memory slot for priv_dev_ctx
if a firmware timeout occurs? Since priv_dev_ctx->cleanup_done is false
until module unload, se_clear_fw_busy() skips the cleanup pass when a late
response arrives. Because se_dev_ctx_shared_mem_cleanup() won't reset pos
while the context is marked busy, the allocation is never reclaimed.

> +
> +	kref_put(&dev_ctx->refcount, se_if_dev_ctx_release);
> +}

[ ... ]

> +static ssize_t se_if_fops_read(struct file *fp, char __user *buf, size_t=
 size,
> +			       loff_t *ppos)
> +{
> +	struct se_if_device_ctx *dev_ctx =3D fp->private_data;
> +	u8 rx_msg_snap[MAX_NVM_MSG_LEN] =3D {};

[ ... ]

> +		/* We may need to copy the output data to user before
> +		 * delivering the completion message.
> +		 */
> +		err =3D se_dev_ctx_cpy_out_data(dev_ctx);
> +		if (err < 0) {
> +			se_dev_ctx_shared_mem_cleanup(dev_ctx);
> +			mutex_unlock(&dev_ctx->fops_lock);
> +			return err;
> +		}
> +		/* Copy data from the buffer using the snapshot taken under the lock. =
*/
> +		print_hex_dump_debug("to user ", DUMP_PREFIX_OFFSET, 4, 4,
> +				     rx_msg_snap, copy_len, false);
> +
> +		fw_api_specific_ops(dev_ctx, (struct se_api_msg *)rx_msg_snap);
> +		err =3D copy_len;

[Severity: Medium]
Can this lead to a self-deadlock? se_if_fops_read() holds priv->modify_lock
when it calls fw_api_specific_ops(). If the firmware sends a command like
ELE_STORAGE_OPEN_REQ or ELE_STORAGE_CLOSE_REQ, fw_api_specific_ops() will
attempt to re-acquire priv->modify_lock either directly or via
set_dev_ctx_as_command_receiver(), causing a deadlock.

> +		if (copy_to_user(buf, rx_msg_snap, copy_len))
> +			err =3D -EFAULT;
> +
> +		se_dev_ctx_shared_mem_cleanup(dev_ctx);
> +		mutex_unlock(&dev_ctx->fops_lock);
> +	}
> +
> +	return err;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819-imx-se-if-=
v37-0-5ef5de9ff1dc@nxp.com?part=3D5
