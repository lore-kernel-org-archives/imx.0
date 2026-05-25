Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93DA30C144
	for <imx@lists.linux.dev>; Mon, 25 May 2026 07:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779692581; cv=none; b=qTZWJc5an+taGqpxRVSVQKEtn1aeu678x7c3y9k1a4m7u0gKEc+ZVwa1fSMvXcUfzxfwEp9ivYHSn8O1F9dHxBCfJg0h+k5COa3Gw9SOuGeuPtEaawrB2OK5dMuvXqKogKivxmf1RRrX6EOW39bVNSgNaX1AoFvbTO5te5VAJVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779692581; c=relaxed/simple;
	bh=oOB5SixJMqRWYz+JhEb8squHcyGqWgrgLqs5wFPH3N0=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HAWySVskuCdXQBmNcP7gvw0IGEIYv8bgH/HFxbkkbFlLHJH5wnlkqmeybuMvDAWxyDXA1/3Y9He4bHl6D3pdBA/30wmoSs8JHykKJZPemMEg8KDL6l0+TGTzMVur/RIW/6hCFhX+VEv6UteC7FalvHNMaAcmLquMo9xwHYBwDjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J9B5msuy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J9B5msuy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4BDF1F000E9;
	Mon, 25 May 2026 07:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779692575;
	bh=Kxsr4cPeTTFXO17yXqXp1NJF4FOGZDhLOIxDZqpSYLc=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=J9B5msuyDwBozTcfjL3s+UAnRr3ugrpOmfbP1SnYF/xsgA+9FbP/uxsRVn1PQxtne
	 DTmqkTMEvf3UZfZyWRfVcTMICqEsHpgItXIhhlhjmbMnTYqxDhOEP83lpzRl9qFuNf
	 dl676d038c4L/8p8hflAYXGlaXNYhmNiPa+XM4ihyH8w7iVaWFM3gR090RbQhc3YXR
	 T/sApC2X/mR+gSoiS4XXwiEueJ/Zt8pFWQUco+QEz4bpMrkL+HPUfxHowsUWz7rt3g
	 mGG+11a+/kdTSJSrTgxvMSOqmlcv2xmbnzdpdkZgkkt7/UloGM36x43kVCzx5+Wng8
	 1dxrQdoOMSJ5g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/7] firmware: imx: ele: Correct ele_fw_authenticate API
Reply-To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260525-ele-v1-v1-2-a9570c4bffc9@nxp.com>
References: <20260525-ele-v1-v1-2-a9570c4bffc9@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 07:02:55 +0000
Message-Id: <20260525070255.C4BDF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Dangling pointers left in the global callback handle on error =
paths lead to Use-After-Free heap corruption or a NULL pointer dereference =
when a delayed/spurious response arrives.
- [Critical] Uninitialized physical address used for IMEM export/import.
- [High] Silent physical address truncation in `ele_service_swap()`.
- [High] The `ele_msg_rcv()` function causes an infinite busy loop (CPU loc=
kup) if the calling task receives a signal.
--

commit f74ec8f682c5afa2812159200b4566d0c747b041
Author: Peng Fan <peng.fan@nxp.com>
Subject: firmware: imx: ele: Correct ele_fw_authenticate API

This commit corrects the ele_fw_authenticate API by enforcing that the upper
32 bits of both the container and image addresses are zero. It fails the
command if they are not, and correctly populates only the lower 32 bits in
the message data.

> diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/e=
le_base_msg.c
> index 23f68076b85ce..f6346f1545096 100644
> --- a/drivers/firmware/imx/ele_base_msg.c
> +++ b/drivers/firmware/imx/ele_base_msg.c
> @@ -208,6 +208,11 @@ int ele_fw_authenticate(struct se_if_priv *priv, phy=
s_addr_t contnr_addr,
>  	if (!priv)
>  		return -EINVAL;
> =20
> +	if (upper_32_bits(contnr_addr) || upper_32_bits(img_addr)) {
> +		dev_err(priv->dev, "Wrong address: %pap %pap\n", &contnr_addr, &img_ad=
dr);
> +		return -EINVAL;
> +	}
> +

[Severity: High]
This is a pre-existing issue, but while you are correctly adding bounds
checks here, does ele_service_swap() also need a similar fix?

It appears ele_service_swap() accepts a 64-bit phys_addr_t and silently
truncates it by assigning only lower_32_bits(addr) to the message, ignoring
the upper 32 bits. On 64-bit systems, could passing physical or dma address=
es
above 4gb instruct the firmware to export or import data to the wrong
physical memory area, leading to memory corruption?

[Severity: Critical]
This isn't a bug introduced by this patch, but regarding physical addresses,
is there an uninitialized address used for imem export/import?

In se_if_probe(), a buffer for the encrypted imem is allocated via
dmam_alloc_coherent(), which assigns the generated dma address to a local
variable imem_dma_addr. However, it seems this address is never stored back
into the load_fw->imem.phyaddr struct field, leaving it zero.

During suspend/resume, could se_save_imem_state() pass this zero address to
ele_service_swap(), instructing the secure enclave firmware to overwrite
physical address 0x0 with its state?

>  	struct se_api_msg *tx_msg __free(kfree)	=3D
>  		kzalloc(ELE_FW_AUTH_REQ_SZ, GFP_KERNEL);

[ ... ]

> @@ -224,8 +229,8 @@ int ele_fw_authenticate(struct se_if_priv *priv, phys=
_addr_t contnr_addr,
>  		return ret;
> =20
>  	tx_msg->data[0] =3D lower_32_bits(contnr_addr);
> -	tx_msg->data[1] =3D upper_32_bits(contnr_addr);
> -	tx_msg->data[2] =3D img_addr;
> +	tx_msg->data[1] =3D 0;
> +	tx_msg->data[2] =3D lower_32_bits(img_addr);
> =20
>  	ret =3D ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_FW_AUTH_REQ_SZ=
, rx_msg,
>  			       ELE_FW_AUTH_RSP_MSG_SZ);

[Severity: Critical]
This is a pre-existing issue, but since ele_msg_send_rcv() is called here,
could dangling pointers left in the global callback handle on error paths
lead to use-after-free heap corruption or a null pointer dereference?

In ele_msg_send_rcv(), rx_msg and dev_ctx are stored in
priv->waiting_rsp_clbk_hdl. If ele_msg_send() fails, the function returns
without clearing them, and the caller frees the heap-allocated rx_msg.

If a delayed or spurious response arrives later, could the asynchronous
se_if_rx_callback() use the stale handle to blindly copy payload data into
the freed rx_msg buffer?

Furthermore, if ele_msg_rcv() is interrupted by a signal, it sets dev_ctx to
null but leaves rx_msg, which could lead se_if_rx_callback() to dereference
a null pointer when accessing se_clbk_hdl->dev_ctx->devname.

[Severity: High]
This is another pre-existing issue, but does ele_msg_rcv() have the
potential to cause an infinite busy loop if the calling task receives a
signal?

It uses wait_for_completion_interruptible_timeout(), which returns
-ERESTARTSYS immediately if a signal is pending. In this case, the code
sets signal_rcvd =3D true and uses continue to restart the loop without
clearing the signal or returning.

Since the signal remains pending, the next call to the wait function returns
-ERESTARTSYS immediately again without sleeping. If the hardware never
responds, could this indefinitely hang the cpu core?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525-ele-v1-v1-=
0-a9570c4bffc9@nxp.com?part=3D2
