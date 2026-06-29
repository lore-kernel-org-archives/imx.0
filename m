Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAF53C6A51;
	Mon, 29 Jun 2026 07:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782717584; cv=none; b=ofiial0rrmKvMpgFZ5X/YyJJwK1TouB7uMHhCc0+ot6DT8Hx4IvBNfgiRqNKfXc2FG6M/1XlNhH/Ke0n3xEZdTAHpkMs6Kb/0eSjikm2fgF7FUgV8ifb/XIOidLguTPTCpAh5qwNazxpE1RD4E3UwAymPLkgEv5mkkLGiZxxxNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782717584; c=relaxed/simple;
	bh=1FKRVsBmlFd2Zs83Q6UNFb+gURlxyAz0RIeUeZ13Pqs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PgV6CZMOr5/BvUvbJUYLUirenDyVj4l5gLsSEqreKZEgYA7aMmC8FEoGTDCLERjQ2E34bLN7qGFYlDNdQ1fdaTfsMFShU1MtLWtdGsj1lzZWf/G4QTE0dio3gxDV/jASXdWeLnXhjVNC/kRjGMAMs3HOrOFwfUgsQPKXk7AZD4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eAQ3ksLI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eAQ3ksLI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28AEF1F00A3A;
	Mon, 29 Jun 2026 07:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782717578;
	bh=1f7ZQet23WlchLsx+rUJlRQbdoS7RqRZ0v9Ap3w/jTw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eAQ3ksLI8XIptrL2iGNnJGy2JSWmR8zx7v2+GrR2CL7e3JeNhAVcd3wESTnQ+b3Gk
	 De0WBuv3ol36C6bEy6OwJI8fXkGNyJ6yywNSUBBfSVefCrw1nX7m5ganrOnp/cqRrs
	 upNwltYaBL5HJFnoo0683Q1y85G7ZGm/xhcm+/cnbFMHe1rwl8Qv+AgKoPmbt10rKv
	 Q1xAG4PCW1rNCF/fSiuIJUjMah9ui0bz7Jyf6B7fI6/GHOK+/ZsawGfmg9Si20r0qA
	 McXgOvux9Y8zpgdqJL+vM+liItljMw6uiFLg6oVL/X0OllW1N+kon2FuYasFDxYyHz
	 L6OG1X4ftEBdA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v26 4/7] firmware: imx: device context dedicated to priv
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260629-imx-se-if-v26-4-146446285744@nxp.com>
References: <20260629-imx-se-if-v26-0-146446285744@nxp.com>
 <20260629-imx-se-if-v26-4-146446285744@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 07:19:24 +0000
Message-Id: <20260629071938.28AEF1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but `ele_msg_send_rc=
v` leaves `priv->waiting_rsp_clbk_hdl.rx_msg` dangling if `ele_msg_send` fa=
ils, risking a Use-After-Free memory corruption.
- [High] This problem wasn't introduced by this patch, but there is a silen=
t truncation of a 64-bit physical address in `ele_service_swap()`.
- [High] This problem wasn't introduced by this patch, but there is a doubl=
e free of `dmam_alloc_coherent` memory during devres teardown.
--

commit 9576b0c1969c96e947c2d66ab7fdb7aa48c35c5d
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

firmware: imx: device context dedicated to priv
   =20
This commit adds a private device context (priv_dev_ctx) to the se_if_priv
structure. This prepares the driver to enable a misc-device context-based
send-receive path for communicating with the firmware.

> diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/e=
le_base_msg.c
> index 54d79c3d75af6..66bae4c7d4648 100644
> --- a/drivers/firmware/imx/ele_base_msg.c
> +++ b/drivers/firmware/imx/ele_base_msg.c
[ ... ]
> @@ -156,7 +156,7 @@ int ele_service_swap(struct se_if_priv *priv,
>  	if (!tx_msg->data[4])
>  		return -EINVAL;
> =20
> -	ret =3D ele_msg_send_rcv(priv, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
> +	ret =3D ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_SERVICE_SWAP_R=
EQ_MSG_SZ,
>  			       rx_msg, ELE_SERVICE_SWAP_RSP_MSG_SZ);
>  	if (ret < 0)
>  		return ret;

[Severity: High]
This isn't a bug introduced by this patch, but does ele_service_swap() sile=
ntly
truncate 64-bit physical addresses?

If the physical address allocated for addr is above the 4GB boundary,
tx_msg->data[3] only takes the lower 32 bits without validation:

    tx_msg->data[3] =3D lower_32_bits(addr);

Since the upper 32 bits are ignored without checking if they are zero, could
this result in the firmware accessing an incorrect physical address?

> diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele=
_common.c
> index ba606f4e8be83..b37ea1f14f75f 100644
> --- a/drivers/firmware/imx/ele_common.c
> +++ b/drivers/firmware/imx/ele_common.c
[ ... ]
> @@ -135,33 +136,37 @@ int ele_msg_send(struct se_if_priv *priv,
>  }
> =20
>  /* API used for send/receive blocking call. */
> -int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_s=
z,
> -		     void *rx_msg, int exp_rx_msg_sz)
> +int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
> +		     int tx_msg_sz, void *rx_msg, int exp_rx_msg_sz)
>  {
> +	struct se_if_priv *priv =3D dev_ctx->priv;
>  	int err;
> =20
>  	guard(mutex)(&priv->se_if_cmd_lock);
> =20
>  	if (atomic_read(&priv->fw_busy)) {
> -		dev_dbg(priv->dev, "ELE became unresponsive.\n");
> +		dev_dbg(priv->dev, "%s: ELE became unresponsive.\n", dev_ctx->devname);
>  		return -EBUSY;
>  	}
>  	reinit_completion(&priv->waiting_rsp_clbk_hdl.done);
> +	priv->waiting_rsp_clbk_hdl.dev_ctx =3D dev_ctx;
>  	priv->waiting_rsp_clbk_hdl.rx_msg_sz =3D exp_rx_msg_sz;
>  	priv->waiting_rsp_clbk_hdl.rx_msg =3D rx_msg;
> =20
> -	err =3D ele_msg_send(priv, tx_msg, tx_msg_sz);
> +	err =3D ele_msg_send(dev_ctx, tx_msg, tx_msg_sz);
>  	if (err < 0)
>  		return err;

[Severity: High]
This isn't a bug introduced by this patch, but does this early error return
leave a dangling pointer in rx_msg?

If ele_msg_send() fails, ele_msg_send_rcv() returns early without clearing
priv->waiting_rsp_clbk_hdl.rx_msg. Because this caller-provided buffer is o=
ften
freed upon an error return, the pointer left behind points to freed memory.

Later, an unsolicited or delayed firmware response handled by
se_if_rx_callback() will see the non-null pointer:

    spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
    if (!se_clbk_hdl->rx_msg) {
        ...
    }
    ...
    memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);

Can this cause a use-after-free memory corruption when data is copied into
the freed buffer?

> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> index 9a2c3c6111462..a4823f485f88a 100644
> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c
[ ... ]
> @@ -262,6 +292,12 @@ static void se_if_probe_cleanup(void *plat_dev)
>  	 */
>  	of_reserved_mem_device_release(dev);
>  	dev_set_drvdata(dev, NULL);
> +
> +	if (priv->priv_dev_ctx) {
> +		kfree(priv->priv_dev_ctx->devname);
> +		kfree(priv->priv_dev_ctx);
> +		priv->priv_dev_ctx =3D NULL;
> +	}
>  	kfree(priv);
>  }

[Severity: High]
This isn't a bug introduced by this patch, but does se_if_probe_cleanup()
double-free memory allocated by dmam_alloc_coherent()?

In this function, memory allocated by dmam_alloc_coherent is explicitly fre=
ed:

    if (load_fw && load_fw->imem.buf) {
        dmam_free_coherent(dev, ELE_IMEM_SIZE, load_fw->imem.buf,
                           load_fw->imem.phyaddr);
        load_fw->imem.buf =3D NULL;
    }

Since dmam_alloc_coherent registers its own devres release action, this act=
ion
runs on driver unbind and frees the memory. Because devres actions run in
LIFO order, the release action runs before se_if_probe_cleanup() and frees
the memory without nulling the pointer.

When se_if_probe_cleanup() eventually runs, does it observe a non-null
pointer and call dmam_free_coherent() on already freed memory, resulting in
a double free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-imx-se-if-=
v26-0-146446285744@nxp.com?part=3D4
