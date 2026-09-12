Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C443421EFB;
	Sat, 12 Sep 2026 11:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789213699; cv=none; b=N2aVqA6CoJKIoCr+QtcW/ytWb2nBqZ3X5yDo4Df0UsWqyAVL5USoHYpXE8M39CvurgZDcSsE/5355hOcl7YO687nG2/MoJ4ceeBzqHu/63byJ8lb3me1xh+WNcAuNix6IF7CG+VaVEzwirar5kHlWSe84X9wkS+jJ1bZsS44DM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789213699; c=relaxed/simple;
	bh=KIi3rvpXWeCBH3O8NqW0q6sXyZ2cBmgSpwI9gjmj0AQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VnF7a7IOUDhwYG+wQLTrc+Bu8e2ltc0pyVtObMEThYaKEr3OtmyO9dcC07U65zK1bKUoDmn1PJQfnLz7+gXI34/bK7kqts0zwF0gUwIEcZ5l726NnOo4/7dS2lD7fWRUaG2486Ft64TWO3tOvWi5VQc0u8Di1Sh7PZkzXaD2uzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cmv5JNl3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cmv5JNl3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED4711F00893;
	Sat, 12 Sep 2026 11:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789213697;
	bh=b1KpVEkASw22RDmvhTjORoZ9qkuFy01mXmTUHf7F8Lc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cmv5JNl3SgWMQRzNiEsa8p8ZrGZ/KQZQDRaCt1LeFw9qmN9BsNO47m3OVdvPXW9WM
	 lIyCA5YabPjS3U/zDmyefB8ym4Aq8QDAj/EC6EFCilZo2Gt+lyxokuYFcEh1j/TZp6
	 aYp+ALBpT8P40b1wWvCKw6zL/FV7N4fFKUkeN6JCNl8cetedCktTTRYos3LtClYKts
	 aEoyXOeGaLLIDL4KgwmeP1pYllFE4Ta3j/MobFCYW1+UIDtewo8YhXXd3iui3Ev0kF
	 NmDeooJrjYiPsttPYOVv5URWvODACxggqdgdbArjefKgZ7GiK/mqvwnPjemx1PQAdv
	 J7zhtchjoqD/A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v50 5/7] firmware: imx: adds miscdev
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: conor+dt@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260912-imx-se-if-v50-5-80834ef510d3@nxp.com>
References: <20260912-imx-se-if-v50-0-80834ef510d3@nxp.com>
 <20260912-imx-se-if-v50-5-80834ef510d3@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 11:48:16 +0000
Message-Id: <20260912114816.ED4711F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing DMA address validation for explicitly allowed base comma=
nds.
- [Low] NULL pointer passed to dev_err() in se_clear_fw_busy() after devnam=
e is freed.
--

commit 370e05357b53f6daf029676404a43be1e6253abf
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

firmware: imx: adds miscdev
   =20
Adds the driver for communication interface to secure-enclave, that
enables exchanging messages with NXP secure enclave HW IP(s)
like EdgeLock Enclave, from User-Space Applications via character driver.
   =20
> diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/e=
le_base_msg.c
> index 650153d39f460..b60665120db2f 100644
> --- a/drivers/firmware/imx/ele_base_msg.c
> +++ b/drivers/firmware/imx/ele_base_msg.c
> @@ -15,13 +15,66 @@
> =20
>  #define FW_DBG_DUMP_FIXED_STR		"ELE"
> =20
> -static void ele_get_info_cleanup(struct se_if_priv *priv, u32 *buf, dma_=
addr_t d_addr,
> -				 size_t size)
> +int ele_uapi_allowed_base_cmd(struct se_if_device_ctx *dev_ctx,
> +			      struct se_msg_hdr *header, u32 tx_msg_sz)
>  {
> -	if (priv->mem_pool)
> -		gen_pool_free(priv->mem_pool, (unsigned long)buf, size);
> -	else
> -		dma_free_coherent(priv->dev, size, buf, d_addr);
> +	struct se_api_msg *msg =3D container_of(header, struct se_api_msg, head=
er);
> +	const struct se_cmd_addr_field *fields;
> +	size_t count;
> +
> +	/*
> +	 * Identify the command first. Only commands in this allow-list may be
> +	 * issued from userspace; everything else is rejected. Once a command is
> +	 * known to be supported, decide whether it needs a DMA-address boundary
> +	 * check and, if so, run it before returning.
> +	 */
> +	switch (header->command) {
> +	case ELE_PING_REQ:
> +	case ELE_DEBUG_DUMP_REQ:
> +	case ELE_OEM_VERIFY_IMAGE_REQ:
> +	case ELE_OEM_REL_CONTAINER_REQ:
> +	case ELE_FW_LIFE_CYCLE_REQ:
> +	case ELE_READ_FUSE_REQ:
> +	case ELE_GET_FW_VERS_REQ:
> +	case ELE_RETURN_LIFE_CYCLE_REQ:
> +	case ELE_GET_EVENT_REQ:
> +	case ELE_COMMIT_REQ:
> +	case ELE_GET_FW_STATUS_REQ:
> +	case ELE_WRITE_FUSE:
> +	case ELE_WRITE_SHADOW_FUSE_REQ:
> +	case ELE_READ_SHADOW_FUSE_REQ:
> +		return 0;

[Severity: Medium]
Could this allow userspace to bypass DMA address validation?=20

If any of these allowed base commands (such as ELE_OEM_VERIFY_IMAGE_REQ) em=
bed=20
DMA addresses in their payloads, returning 0 immediately bypasses the=20
se_val_cmd_addrs() check. If this is the case, a malicious userspace=20
application could supply arbitrary physical addresses, leading to arbitrary=
=20
memory read/write by the firmware.

[ ... ]

> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> index b5d3421c09878..3b1209325633e 100644
> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c
[ ... ]
> +static void se_clear_fw_busy(struct se_if_priv *priv)
> +{
[ ... ]
> +			if (dev_ctx =3D=3D priv->priv_dev_ctx) {
> +				/*
> +				 * Internal context: probe-time static DMA buf;
> +				 * se_if_probe_cleanup reclaims it explicitly.
> +				 * Just reset logical pos and return gen_pool
> +				 * loan buffers for reuse.
> +				 */
> +				if (priv->mem_pool)
> +					se_cleanup_mem_pool_buf(dev_ctx, true);
> +				se_dev_ctx_shared_mem_cleanup(dev_ctx);
> +			} else if (dev_ctx->cleanup_done) {
> +				/*
> +				 * Userspace fd already closed while fw_busy was
> +				 * armed (e.g. SIGKILL). FW has now responded;
> +				 * close deferred handles and free the DMA buf.
> +				 */
> +				if (dev_ctx->strg_hdl &&
> +				    se_close_storage(priv->priv_dev_ctx,
> +						     dev_ctx->strg_hdl))
> +					dev_err(priv->dev,
> +						"%s: failed to close deferred storage handle\n",
> +						dev_ctx->devname);

[Severity: Low]
Is dev_ctx->devname safe to use here?

When a userspace transaction times out, the fw_busy circuit breaker is arme=
d. If=20
the user then closes the file descriptor, cleanup_dev_ctx() is called and i=
t=20
frees dev_ctx->devname and sets it to NULL (along with setting cleanup_done=
 to=20
true).=20

When the firmware responds late, se_clear_fw_busy() runs. Since cleanup_don=
e is=20
true, it tries to close deferred handles here, and if that fails, it passes=
 the=20
now-NULL dev_ctx->devname to dev_err(), resulting in "(null)" instead of th=
e=20
device name.

> +				if (dev_ctx->sess_hdl &&
> +				    se_close_session(priv->priv_dev_ctx,
> +						     dev_ctx->sess_hdl))
> +					dev_err(priv->dev,
> +						"%s: failed to close deferred session handle\n",
> +						dev_ctx->devname);

[Severity: Low]
Does this also pass a NULL dev_ctx->devname to dev_err()?

Just like the storage handle check above, if closing the session fails,=20
dev_ctx->devname is NULL here because cleanup_dev_ctx() has already freed i=
t.

[ ... ]
> +static void cleanup_dev_ctx(struct se_if_device_ctx *dev_ctx, bool is_fc=
lose)
> +{
[ ... ]
> +			/*
> +			 * fw_busy is caused by one timed-out synchronous transaction.
> +			 * Only that transaction's dev_ctx may still have coherent
> +			 * memory referenced by FW. Do not skip cleanup for unrelated
> +			 * contexts while fw_busy is set.
> +			 */
> +			if (se_is_fw_busy_ctx(dev_ctx))
> +				dev_warn(dev_ctx->priv->dev,
> +					 "%s: deferring shared memory cleanup while FW is busy\n",
> +					 dev_ctx->devname);
> +			else
> +				cleanup_se_shared_mem(dev_ctx, true);
> +
> +			kfree(dev_ctx->devname);
> +			dev_ctx->devname =3D NULL;
> +			dev_ctx->cleanup_done =3D true;
> +		}
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260912-imx-se-if-=
v50-0-80834ef510d3@nxp.com?part=3D5
