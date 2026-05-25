Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6708202C46
	for <imx@lists.linux.dev>; Mon, 25 May 2026 07:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779694681; cv=none; b=e119bYow5uxvEL6PCEDC/rUkl6MqykZ4yi1om/2mU9RTHHH/HXE4EWE7Z9HNPO1GWMRLResBZCjtjpT0Wd73YKYscZFAOhI/VLVNOGKQTtJsdxeNFH414uvLi/+0Ab6sMaiquCde0hgvATa5sBH4dkA66ThXXAdv6GMn34Mbscs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779694681; c=relaxed/simple;
	bh=kSAe6SmPi9RLlogx0ULsOWTY3mnccU8lfkJWbH22d5g=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=L9JSlfQsS9iwFQ9lh85sQ/LboWZk1+Kfybnf0FF6bLWzUfv/qP44Vks7A17CN3q3v9iHpl9N3jfp3rplnDo9sMxt1hInT8LIHcNKWidkVQgnzqRgLlM6DT6uCz3y61lUbKnyQqugu4MiQamFZZ+45e94kmCgiYhVh67Y6Wi0TF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AMMnVimo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AMMnVimo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 813F61F000E9;
	Mon, 25 May 2026 07:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779694680;
	bh=sZt+MqA8xIHkBdDYTkjQ68N9ItlKu5zLtFLbLYe6kHs=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=AMMnVimoclyyLKGe9b1KW811Jn3y8sY7hiqaAE7ClhpF4lOTkiMJZFB90SHZfru+t
	 OX3MU5BIe44v2qseSde1BpUXtSDAwbcXvN4kOZzEZRGwd/wRon5pCasb2EOnZCbVkM
	 igRl3jFk4dRKtf3CE/7kPLLwX2p0etNqywyXaLbo96aJ3kgfNHn7bhahq4b3Pjo9DO
	 5KU1LKP9TfPQSMa3t32ew+Nl+Ye68z4tDkwgOoJsBWa6M6k+LNeGUmLKPXKsUSN68n
	 9uOr3eeChb2mHyjS1oQcrrHVJ+uN7QOoPyzVZ/Nwn+3xly10dLEqipsVqXnW9BoB0k
	 CEtcx1usUGccg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/7] firmware: imx: ele: Bypass memcpy when
 ele_get_info() fails
Reply-To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260525-ele-v1-v1-3-a9570c4bffc9@nxp.com>
References: <20260525-ele-v1-v1-3-a9570c4bffc9@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 07:37:59 +0000
Message-Id: <20260525073800.813F61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] `load_fw->imem.phyaddr` is never updated with the DMA address =
returned by `dmam_alloc_coherent()`. It remains 0, causing the firmware to =
write 64KB to physical address 0 on suspend, destroying system memory.
- [High] In error and timeout paths of `ele_msg_send_rcv()`, the driver fai=
ls to safely clean up the callback state, leaving dangling pointers in `pri=
v->waiting_rsp_clbk_hdl`. This leads to a Use-After-Free or NULL pointer de=
reference in the mailbox RX interrupt handler (`se_if_rx_callback`).
- [High] `ele_service_swap()` silently truncates the 64-bit `phys_addr_t` p=
arameter to 32 bits, which will cause memory corruption if the allocated bu=
ffer resides above 4GB.
--

commit 268976f0cb80c396ef876e24ed7b353994d79e47
Author: Peng Fan <peng.fan@nxp.com>

firmware: imx: ele: Bypass memcpy when ele_get_info() fails

When ele_get_info() fails, no sense to copy get_info_data to destination,
because get_info_data may contains garbage data, so bypass the copy.

> diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/e=
le_base_msg.c
> index f6346f1545096..05a518df38cd6 100644
> --- a/drivers/firmware/imx/ele_base_msg.c
> +++ b/drivers/firmware/imx/ele_base_msg.c
> @@ -95,6 +95,8 @@ int ele_get_info(struct se_if_priv *priv, struct ele_de=
v_info *s_info)
> =20
>  	ret =3D se_val_rsp_hdr_n_status(priv, rx_msg, ELE_GET_INFO_REQ,
>  				      ELE_GET_INFO_RSP_MSG_SZ, true);
> +	if (ret < 0)
> +		goto exit;
> =20
>  	memcpy(s_info, get_info_data, sizeof(*s_info));
>  exit:

[Severity: High]
This isn't a bug introduced by this patch, but doesn't ele_msg_send_rcv()
fail to safely clean up the callback state on error paths?

In drivers/firmware/imx/ele_common.c:

int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
                     int tx_msg_sz, void *rx_msg, int exp_rx_msg_sz)
{
    ...
	priv->waiting_rsp_clbk_hdl.dev_ctx =3D dev_ctx;
	priv->waiting_rsp_clbk_hdl.rx_msg_sz =3D exp_rx_msg_sz;
	priv->waiting_rsp_clbk_hdl.rx_msg =3D rx_msg;

	err =3D ele_msg_send(dev_ctx, tx_msg, tx_msg_sz);
	if (err < 0)
		return err;

If ele_msg_send() fails, it returns early but leaves
priv->waiting_rsp_clbk_hdl.rx_msg pointing to rx_msg, which is often a local
heap-allocated buffer freed upon return.

Also, if ele_msg_rcv() times out, waiting_rsp_clbk_hdl.dev_ctx is set to NU=
LL
but rx_msg is not cleared.

Could a delayed mailbox interrupt triggering se_if_rx_callback() result in a
use-after-free if memcpy() copies firmware data into this freed pointer?


[Severity: Critical]
This is a pre-existing issue, but does se_if_probe() neglect to save the DMA
address returned by dmam_alloc_coherent()?

In drivers/firmware/imx/se_ctrl.c:

static int se_if_probe(struct platform_device *pdev)
{
    ...
		if (load_fw->se_fw_img_nm->prim_fw_nm_in_rfs) {
			/* allocate buffer where SE store encrypted IMEM */
			imem_dma_addr =3D phys_to_dma(priv->dev, load_fw->imem.phyaddr);
			load_fw->imem.buf =3D dmam_alloc_coherent(priv->dev, ELE_IMEM_SIZE,
								&imem_dma_addr, GFP_KERNEL);

It seems load_fw->imem.phyaddr is never updated with imem_dma_addr. Since
load_fw points to a zero-initialized static variable, phyaddr remains 0.

During suspend, se_suspend() calls se_save_imem_state() which passes
imem->phyaddr (0) to ele_service_swap(). Does this cause the secure enclave
to export 64KB of IMEM data to physical address 0, corrupting system memory?


[Severity: High]
This is a pre-existing issue, but does ele_service_swap() silently truncate
the phys_addr_t parameter to 32 bits?

In drivers/firmware/imx/ele_base_msg.c:

int ele_service_swap(struct se_if_priv *priv,
		     phys_addr_t addr,
		     u32 addr_size, u16 flag)
{
    ...
	tx_msg->data[3] =3D lower_32_bits(addr);

Unlike ele_fw_authenticate(), this function doesn't seem to check if the
address exceeds 32 bits using upper_32_bits().

If dmam_alloc_coherent() provides a buffer above 4GB, will the firmware
perform DMA to the truncated 32-bit address and overwrite arbitrary memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525-ele-v1-v1-=
0-a9570c4bffc9@nxp.com?part=3D3
