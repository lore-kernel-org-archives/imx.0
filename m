Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FF944470E;
	Fri,  4 Sep 2026 09:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788514798; cv=none; b=KwJ8TmiMfweSqVDiAflmGtYOOFTBG6NzRawqkg+H5zqiipAP0O4bWZyM2mJhNNE2GipWti9wCaylJXLloCjpuvSHrU5KkzK4HzfYsaJE+JoyHWt5mUltocvJ3iQMrHBlQ3iBkRJfQbuAZgpf5fswr7iHFTtcrOyPmnMiq9pH7PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788514798; c=relaxed/simple;
	bh=qmdV0V7qeGcUMiqCF3CZQgYKieXSl1qE6CmW+xYpXTM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JC+EEKHatP7BUxXDkGYdP/SIqSmZcx99l1Q5L+lO/LETHEYIllDCMN2SosjPrBOGAb+ulLKHvOqGaWLO05A1bfZfbDGbZhmRYrYBo4x4SU454AATjK1I6WVkAw9cT9N/l8eGCOJNNUB6n3gRTuHDt0x1gRURK5eSIPMw81IXogc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SA1e0iCe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SA1e0iCe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F5401F00A3D;
	Fri,  4 Sep 2026 09:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788514796;
	bh=MyLk/irzyTaMJ+/NAD/m58k8JTBQpRzOmCo1MTP68pM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SA1e0iCemcP2Q6QRJuf7uJcmtbVZ3YaRXdSQQrMDN0HBiv5rjU6V6I71pcskGWGj7
	 gfSVQjKbbjW02pW/IKy0oyWOGfIEpRa8CXEYBZIuV0nGnXp5XDjWwW3IwElNtDcJo8
	 ZjFn3WSz0564XW53kA1z3xbMiCbQ2HLCp5PF2yG/zxyK6oLLXukIaY8YkAW7oYoKUk
	 dDi1C8ZQTKI89tBveyxMI9DCWr0Epn9lX/ZrRFTGFBiqDsFF/7XR+Ufp3bfze8wBcw
	 J+b5PswYv7LQBBz7VM0WMTxannmEEanbP46iIXJw19Bnw3QStXwVIPgPh1MMZK0QPJ
	 PBliM0T91ae1g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v48 5/7] firmware: imx: adds miscdev
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260904-imx-se-if-v48-5-dad90eec7eaf@nxp.com>
References: <20260904-imx-se-if-v48-0-dad90eec7eaf@nxp.com>
 <20260904-imx-se-if-v48-5-dad90eec7eaf@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 09:39:55 +0000
Message-Id: <20260904093956.1F5401F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Permanent destruction of priv_dev_ctx's shared DMA buffer on late =
firmware response.
- [High] Leaked firmware session handles due to killable wait in `close()` =
aborting instantly on fatal signals.
- [High] Deadlock risk during PM suspend due to GFP_KERNEL allocation insid=
e a required GFP_NOIO context.
--

commit 8a8db094cff29d90b76f6889f2022ca7253f3ec8
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

firmware: imx: adds miscdev

Adds the driver for communication interface to NXP secure-enclave hardware
via a character driver. Handles ABI, initialization, shared memory, and
restricted command forwarding.

> diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/e=
le_base_msg.c
> --- a/drivers/firmware/imx/ele_base_msg.c
> +++ b/drivers/firmware/imx/ele_base_msg.c
[ ... ]
> @@ -121,9 +121,9 @@ int ele_get_info(struct se_if_priv *priv, struct ele_=
dev_info *s_info)
>  	get_info_len =3D ELE_GET_INFO_BUFF_SZ;
>  	if (priv->mem_pool) {
>  		ret =3D se_get_mem_pool_buf(priv->priv_dev_ctx, &get_info_data,
>  					  &get_info_addr, get_info_len);

[Severity: High]
Could this cause a system deadlock during PM suspend?

The caller ele_get_info allocates its message buffers using GFP_NOIO
specifically to prevent direct reclaim from triggering I/O to a suspended
storage device. However, it relies on se_get_mem_pool_buf here, which
does a standard kernel allocation.

[ ... ]
> diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele=
_common.c
> --- a/drivers/firmware/imx/ele_common.c
> +++ b/drivers/firmware/imx/ele_common.c
[ ... ]
> @@ -342,6 +342,7 @@ int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, str=
uct se_clbk_handle *se_clbk
>  				if (se_clbk_hdl->rx_msg) {
>  					/*
>  					 * The enclave may still DMA into this
>  					 * buffer (either a normal timeout or
>  					 * a teardown complete_all() wakeup).
>  					 * Quarantine the buffer and arm the
>  					 * circuit breaker unconditionally.
>  					 */
>  					se_clbk_hdl->rx_msg =3D NULL;
>  					se_mark_fw_busy(dev_ctx);
>  				}
>  				spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
>  			}
>  			break;

[Severity: High]
Does this instantly abort the wait and arm the circuit breaker if a fatal
signal like SIGKILL is pending?

By breaking out early, it immediately marks the firmware as busy.

[ ... ]
> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c
[ ... ]
> @@ -406,6 +406,12 @@ static void cleanup_se_shared_mem(struct se_if_devic=
e_ctx *dev_ctx, bool recla
>  	if (free_dma_buf) {
>  		dma_free_coherent(priv->dev, MAX_DATA_SIZE_PER_USER,
>  				  se_shared_mem_mgmt->non_secure_mem.ptr,
>  				  se_shared_mem_mgmt->non_secure_mem.dma_addr);
>  	}
> =20
>  	/*
>  	 * Drop the host-side tracking unconditionally. On the reclaim path the
>  	 * buffer has been freed. On the deliberate-leak path the buffer is
>  	 * abandoned on purpose, so clearing the pointer here guarantees a later
>  	 * cleanup pass (e.g. se_if_priv_release()) cannot double-free it.
>  	 */
>  	se_shared_mem_mgmt->non_secure_mem.ptr =3D NULL;
>  	se_shared_mem_mgmt->non_secure_mem.dma_addr =3D 0;
>  	se_shared_mem_mgmt->non_secure_mem.size =3D 0;

[Severity: High]
Are we unconditionally destroying the DMA buffer state here?

Even when reclaim is false, the size and pointers are zeroed out.
If this is called for priv_dev_ctx (which has no open/close cycle to
reallocate it), the persistent DMA buffer becomes permanently unusable.

[ ... ]
> @@ -1149,6 +1149,7 @@ static void se_clear_fw_busy(struct se_if_priv *pri=
v)
>  			/*
>  			 * Late response arrived after going_away is clear.
>  			 * fw_busy has already been cleared atomically above;
>  			 * reclaim the shared-memory slot now. For priv_dev_ctx
>  			 * this is the only reclaim site (no close() path). For
>  			 * userspace contexts cleanup_se_shared_mem() is a
>  			 * safe no-op if the close() path already reset pos.
>  			 */
>  			cleanup_se_shared_mem(dev_ctx, true);

[Severity: High]
Can this permanently break internal firmware communications for priv_dev_ct=
x?

If an internal command times out, priv_dev_ctx is set as the busy context.
When a late response arrives, se_clear_fw_busy runs and calls
cleanup_se_shared_mem with reclaim=3Dtrue.=20

Because cleanup_se_shared_mem zeros out the DMA pointer and size, the
permanent DMA buffer used by priv_dev_ctx is destroyed, breaking subsequent
operations like system suspend or firmware loading.

[ ... ]
> @@ -1331,6 +1331,10 @@ static void cleanup_dev_ctx(struct se_if_device_ct=
x *dev_ctx, bool is_fclose)
>  				struct se_if_device_ctx *tx_ctx =3D is_fclose ? dev_ctx :
>  							dev_ctx->priv->priv_dev_ctx;
> =20
>  				if (dev_ctx->strg_hdl && se_close_storage(tx_ctx,
>  									  dev_ctx->strg_hdl))
>  					dev_err(dev_ctx->priv->dev, "failed to close storage.\n");
>  				if (dev_ctx->sess_hdl && se_close_session(tx_ctx,
>  									  dev_ctx->sess_hdl))
>  					dev_err(dev_ctx->priv->dev, "failed to close session.\n");

[Severity: High]
Will this skip sending the session close command and leak the firmware sess=
ion
handle if the killable wait aborted instantly above?

Because ele_msg_send_rcv returns -EBUSY immediately if the circuit breaker
was armed by a SIGKILL interrupt, se_close_storage fails instantly. The
subsequent call to se_close_session is then also skipped due to the busy
firmware path.=20

An unprivileged user could trigger this leak by opening a session and
sending SIGKILL to their own process, permanently exhausting hardware encla=
ve
resources.

[ ... ]
> @@ -2145,6 +2145,8 @@ int se_get_mem_pool_buf(struct se_if_device_ctx *de=
v_ctx, void **buf,
>  	if (se_is_fw_busy_ctx(dev_ctx))
>  		return -EBUSY;
> =20
>  	b_desc =3D kzalloc_obj(*b_desc);
>  	if (!b_desc)
>  		return -ENOMEM;

[Severity: High]
Does this kzalloc_obj allocation violate the GFP_NOIO context required by
ele_get_info during suspend?

The kzalloc_obj macro implicitly uses GFP_KERNEL, which can trigger direct
memory reclaim. Since the storage device may already be suspended, flushing
dirty pages to it will lead to an unrecoverable system deadlock.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-imx-se-if-=
v48-0-dad90eec7eaf@nxp.com?part=3D5
