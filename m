Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B043D093A;
	Fri, 24 Jul 2026 08:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784881746; cv=none; b=Rg4avI1yMRXoakG9mHEBsGxFhVz7FOKXqwfCbaWWOjeeBXhq3+Ht+kLUqFYPOLHhVUZQqUAOOHT0p2UmmV4ceMFRSZ2G8OwWUQUxQPjeA9xWWxRRBdYEYUyKoUPSkLDQw7MKvsIyQGyrXKlwMaDvNqNlEcGQ+QtM+dN8C9b2790=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784881746; c=relaxed/simple;
	bh=UzfHW+7eg63/Ee+aZBsrqKv8mMrJmJGEK3t6BoU+An4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sO1GOG4i7/j/IoTYoUQCRnAAa0eoLM/fGtXn5GrmSGXntF9yZeYy9sHJuZVzo1kHWxZMM1+ERj48+ofmk0Azm/3VkjkwisZrXlLRAw4Ey774aP/7aLrnxmXd1quEeyB42XnlW23YnTTMVagaAqmeUkYT0CCKu+8NObY+/an3WWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iIdW5+GF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iIdW5+GF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57B341F00A3D;
	Fri, 24 Jul 2026 08:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784881737;
	bh=bXE7DBup7MBmHmH7M+91K94KmMrS1YDaP+am9XdYoAQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iIdW5+GFanHTGEuNqXDUXeDYyU8YV8Dn/YU+UpxeRwBOFI+ZoEm6mMDpB0NQUnJ4K
	 GglSU+fTCsxU+jZa7UoymMVl1cGhnG375F/xIKKxXChrHYpaXz+wgIqC/yA5zyePpq
	 Abb+JKAxIptyDpvFgDvnc20FQc87Xo/JbuSyJU0VZ72BfSkWb9Ul37GN9i7BCOw7SM
	 eQTrxvn2xaLBB154oVKyeqmJz9X2/Hwg47mvWXMM/+VqpKns0Hrbh++ocI82TeP7zz
	 +bnYuVyL5z7TLt5cUg3ojM6+4DhWc6/BIbya2ya8Dm6E61H24wmtgW9R9NXuqGTv5O
	 RiIGBwbWuMpSg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v30 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: imx@lists.linux.dev, conor+dt@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260724-imx-se-if-v30-3-ce8ba256692c@nxp.com>
References: <20260724-imx-se-if-v30-0-ce8ba256692c@nxp.com>
 <20260724-imx-se-if-v30-3-ce8ba256692c@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 08:28:56 +0000
Message-Id: <20260724082857.57B341F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Critical] DMA Use-After-Free: buffers are freed on timeout while the fir=
mware may still be executing and writing to them, leading to silent memory =
corruption.
- [High] Returning -ERESTARTSYS after a hardware transaction has successful=
ly completed causes non-idempotent commands to be re-executed and drops the=
ir results.
- [High] The `fw_busy` circuit breaker is bypassed when `ele_msg_rcv` times=
 out via the `time_after_eq` check, leading to protocol desynchronization.
- [High] Data race in `ele_msg_send_rcv()` when setting up `rx_msg` allows =
spurious firmware responses to corrupt state and desynchronize the protocol.
- [Medium] `ele_get_info()` uses `gen_pool_dma_alloc()` to allocate an SRAM=
 DMA buffer without zero-initializing it, potentially leaking sensitive dat=
a.
--

--- Patch [3]: [PATCH v30 3/7] firmware: imx: add driver for NXP EdgeLock E=
nclave ---
commit e6e24144537ee5a010fb1fa57fe8270006013954
Author: Pankaj Gupta <pankaj.gupta@nxp.com>
Subject: firmware: imx: add driver for NXP EdgeLock Enclave

This commit adds a MU-based communication interface for the NXP EdgeLock
secure enclave. The driver supports communication with the secure enclave
firmware over messaging units on SoCs like i.MX8ULP and i.MX93.

Closes: https://sashiko.dev/#/patchset/20260721-imx-se-if-v29-0-04a362f4fcc=
a@nxp.com?part=3D3

> Documented as intentional, no code change (drivers/firmware/imx/ele_commo=
n.c):
> - [Medium] "Unsafe syscall restart on completed non-idempotent hardware
>   operations" in ele_msg_send_rcv():
>   This is intentional protocol-synchronization behavior, not a
>   re-execution bug. A signal is deliberately not acted on while a firmware
>   message exchange is in progress; ele_msg_rcv() defers it until the
>   response path completes and the FW/kernel protocol state is synchronized
>   again, so Linux and firmware never diverge on message ownership. Only
>   after synchronization is the interrupted wait surfaced to userspace via
>   -ERESTARTSYS. The command/response ABI must treat this as an interrupted
>   operation after synchronization; it is not permission for the kernel
>   driver to re-send the command, so the enclave never receives it twice.
>   Clarified with an expanded code comment.

[Severity: High]
Is this understanding of -ERESTARTSYS accurate?

Returning -ERESTARTSYS to userspace after a hardware transaction has
successfully completed causes the kernel's architecture-specific signal
handling to automatically restart the system call. This transparently forces
the userspace application to re-execute the exact same command.

For non-idempotent operations, won't the hardware execute the command twice,
discarding the successful result of the first execution?

> diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/e=
le_base_msg.c
> new file mode 100644
> index 0000000000000..a2ede9c01691d
> --- /dev/null
> +++ b/drivers/firmware/imx/ele_base_msg.c
> @@ -0,0 +1,277 @@
[ ... ]
> +static void ele_get_info_cleanup(struct se_if_priv *priv, u32 *buf, dma_=
addr_t d_addr,
> +				 size_t size)
> +{
> +	if (priv->mem_pool)
> +		gen_pool_free(priv->mem_pool, (unsigned long)buf, size);
> +	else
> +		dma_free_coherent(priv->dev, size, buf, d_addr);
> +}

[Severity: Critical]
Is there a risk of a DMA use-after-free here?

If ele_msg_send_rcv() times out, this cleanup function is called immediately
to free the DMA buffer. However, the unresponsive hardware is not reset and
might still complete the operation slightly later, performing a DMA write to
the freed physical address.

Can this corrupt unrelated kernel memory or cause an IOMMU fault if the
memory has been reallocated to another subsystem?

[ ... ]
> +int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
> +{
[ ... ]
> +	if (priv->mem_pool)
> +		get_info_data =3D gen_pool_dma_alloc(priv->mem_pool,
> +						   ELE_GET_INFO_BUFF_SZ,
> +						   &get_info_addr);

[Severity: Medium]
Does this allocation need to be zero-initialized?

Memory allocated from an SRAM pool via gen_pool_dma_alloc() is not
guaranteed to be zeroed. If the firmware returns a success status but only
partially writes the ele_dev_info structure, the subsequent memcpy() will
copy the uninitialized SRAM contents into s_info:

	memcpy(s_info, get_info_data, sizeof(*s_info));

Could this leak sensitive data from previous hardware operations to
userspace when these fields are exposed?

[ ... ]
> diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele=
_common.c
> new file mode 100644
> index 0000000000000..f9be8b8556ad8
> --- /dev/null
> +++ b/drivers/firmware/imx/ele_common.c
> @@ -0,0 +1,480 @@
[ ... ]
> +int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_=
hdl)
> +{
[ ... ]
> +	do {
> +		if (is_rsp_wait_with_timeout) {
> +			if (time_after_eq(jiffies, deadline_jiffies)) {
> +				ret =3D -ETIMEDOUT;
> +				break;
> +			}
> +			remaining_jiffies =3D deadline_jiffies - jiffies;
> +		}

[Severity: High]
Are we bypassing the fw_busy circuit breaker here?

When a signal interrupts the wait, the loop iterates again. If the deadline
has already passed, this path breaks out of the loop and returns -ETIMEDOUT
without executing the block below that sets atomic_set(&priv->fw_busy, 1).

If the circuit breaker is not tripped, will the driver incorrectly allow new
commands to be sent while the firmware is still processing the old one,
potentially copying a late response into the buffer of the new command?

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

[Severity: High]
Is there a data race when setting up these variables locklessly?

The commit message notes that the read side in se_if_rx_callback() was moved
inside the clbk_rx_lock. However, if the write side here is lockless, the
compiler or CPU can reorder these updates.

If a concurrent or delayed hardware interrupt triggers se_if_rx_callback(),
could it acquire the lock and observe a non-NULL rx_msg with a stale
rx_msg_sz of 0 from a previous transaction's cleanup? This would cause the
interrupt handler to copy 0 bytes and call complete(), leading the kernel to
process an unwritten buffer.

[ ... ]
> +	err =3D ele_msg_rcv(priv, &priv->waiting_rsp_clbk_hdl);
> +
> +	if (priv->waiting_rsp_clbk_hdl.signal_rcvd) {
> +		/*
> +		 * Signal was deferred until the FW/kernel protocol resynchronized.
> +		 * On success report -ERESTARTSYS for the interrupted wait; the
> +		 * command is not re-sent. Keep real errors like -ETIMEDOUT.
> +		 */
> +		if (err > 0)
> +			err =3D -ERESTARTSYS;

[Severity: High]
Does discarding a successful hardware response and returning -ERESTARTSYS
here cause unintended re-execution?

As noted regarding the commit message, the kernel will automatically restart
the system call when returning to userspace. If the hardware successfully
completed a non-idempotent operation, won't this discard the result and
force the system call to be re-executed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-imx-se-if-=
v30-0-ce8ba256692c@nxp.com?part=3D3
