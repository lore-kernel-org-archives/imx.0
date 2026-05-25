Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E710A3E2AAF
	for <imx@lists.linux.dev>; Mon, 25 May 2026 08:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779698952; cv=none; b=EgwhXPPpaejCLydXnMF0YWu9nExNnMVP3SXx9OldJyi89j5u3gtQk2D50jAEjtn3FLjAxnlnSjjQl9ClKkA9O9BsjWffg3woT8ebzYL+8voPSbAycYo03tBg82JXim7y3e96e1wSrYpe08VfFEj2V2bz8B5nLDSim88LGxqXLpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779698952; c=relaxed/simple;
	bh=fId8kZ/bRZtUWTdlahE15y8vMLCTZ17gSG+fqAJi62I=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cjxBJ+6ngvdoKDxNo48d4E2QIy7ihBOgtC6mJ40ivDqmtDvbR0FzvNYziz22NHjsfmfibOG1V8SJTyR1a2LBRCW525iMaK8dc088wzoWJCM/F1qXCc4Y0VP6ku1JtutS6b9fwBRMIUTycDqeBzXotIkPw9XL1WcuT6N7d5UTVog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IYw8uzRw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IYw8uzRw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B83AC1F000E9;
	Mon, 25 May 2026 08:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779698950;
	bh=BETNYoFMp4abzaa8RYrJ0lAvyKFYfXGwYGr3M5ODIM0=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=IYw8uzRwrT+hN1H1v462BNP9shAaiZ2CE5vlyFnt8hC8sQxRddKfWFbT60AnudM3m
	 D/RRhOXk8KK3ODOy7popAX3FYcibGiggPqe+dXEqww6ToC4mULrfPMjlN7LUFCoo3i
	 d8QjhG42S3LnJJGQyLfVd1F6JJu3F2abYzoXYcmnub2OhfY1Gr6iur86WM6+eLZC2r
	 rIye0utDvJ/rOGYQMKyPQ6dqzUbs6hxDd00jR/W2/iYq1voEqEsuhTZ+p8HOpS6ru2
	 0Nmgi3kDQztmyUOrrsgjWbjX/R7ia8HJWWfXvGgXJpxwa8GiRTkxpdwn8q/2E5zdr4
	 2J+JgZNrUU16A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/7] firmware: imx: ele: Correct
 check_hdr_exception_for_sz
Reply-To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260525-ele-v1-v1-5-a9570c4bffc9@nxp.com>
References: <20260525-ele-v1-v1-5-a9570c4bffc9@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 08:49:10 +0000
Message-Id: <20260525084910.B83AC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Use-After-Free in `ele_msg_send_rcv()` if `ele_msg_send()` fai=
ls.
- [Critical] Unconditional NULL Pointer Dereference in `se_if_rx_callback()=
` on unsolicited firmware responses.
- [Critical] Heap Buffer Overflow in NVM command handler inside `se_if_rx_c=
allback()`.
- [Critical] Direct Dereference of User Space Pointers without `copy_from_u=
ser()` violating SMAP.
- [High] Unbounded Memory Allocation in `SE_IOCTL_CMD_SEND_RCV_RSP` via `cm=
d_snd_rcv_rsp_info.rx_buf_sz`.
- [High] Heap Out-of-Bounds Read and Information Leak due to exception-hand=
ling bypass in `se_if_rx_callback()`.
--

commit b7cffebfaeed965de6c2c0dd99ae2c4e1cc48a37
Author: Peng Fan <peng.fan@nxp.com>

firmware: imx: ele: Correct check_hdr_exception_for_sz
   =20
header.size is u8 type, "header.size >=3D 0" will always return true.
Actually the check condition should be ">=3D 2", because a valid response
includes at lease header(4bytes) and status(4bytes), total 2 ints.

And ELE_DEBUG_DUMP_RSP_SZ is counted using bytes, need to divide it by 4.

Fixes: 106ffe5d78ad8 ("firmware: imx: add driver for NXP EdgeLock Enclave")
Signed-off-by: Peng Fan <peng.fan@nxp.com>

> diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele=
_common.c
> index 8daf32eded43c..76bd3841acfcb 100644
> --- a/drivers/firmware/imx/ele_common.c
> +++ b/drivers/firmware/imx/ele_common.c
> @@ -164,7 +164,7 @@ static bool check_hdr_exception_for_sz(struct se_if_p=
riv *priv,
>  	 */
>  	if (header->command =3D=3D ELE_DEBUG_DUMP_REQ &&
>  	    header->ver =3D=3D priv->if_defs->base_api_ver &&
> -	    header->size >=3D 0 && header->size <=3D ELE_DEBUG_DUMP_RSP_SZ)
> +	    header->size >=3D 2 && header->size <=3D (ELE_DEBUG_DUMP_RSP_SZ / 4=
))
>  		return true;
> =20
>  	return false;

[Severity: High]
This is a pre-existing issue, but I noticed something concerning in how
check_hdr_exception_for_sz() is used. In se_if_rx_callback(), if this
function returns true, it skips the size constraint check:

drivers/firmware/imx/ele_common.c:se_if_rx_callback() {
    [ ... ]
		if (rx_msg_sz !=3D se_clbk_hdl->rx_msg_sz &&
		    !check_hdr_exception_for_sz(priv, header)) {
            [ ... ]
			se_clbk_hdl->rx_msg_sz =3D min(rx_msg_sz, se_clbk_hdl->rx_msg_sz);
		}
	}
    [ ... ]
	memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);
    [ ... ]
}

Does this bypass allow se_clbk_hdl->rx_msg_sz to retain an unvalidated,
potentially large user-provided value? If so, couldn't the memcpy()
read past the bounds of the hardware mailbox msg buffer and leak adjacent
kernel memory to userspace?

[Severity: Critical]
This is a pre-existing issue, but while looking at se_if_rx_callback(),
I also noticed what looks like an unconditional overwrite for NVM commands:

drivers/firmware/imx/ele_common.c:se_if_rx_callback() {
    [ ... ]
		if (rx_msg_sz > MAX_NVM_MSG_LEN) {
            [ ... ]
			se_clbk_hdl->rx_msg_sz =3D MAX_NVM_MSG_LEN;
		}
		se_clbk_hdl->rx_msg_sz =3D rx_msg_sz;
    [ ... ]
}

Does the assignment se_clbk_hdl->rx_msg_sz =3D rx_msg_sz entirely defeat the
MAX_NVM_MSG_LEN check? Since the rx_msg buffer is pre-allocated with
MAX_NVM_MSG_LEN, could a large payload from the firmware cause a heap
buffer overflow in the subsequent memcpy()?

[Severity: Critical]
This isn't a bug introduced by this patch, but there might be a NULL pointer
dereference in se_if_rx_callback() when receiving unsolicited messages.

drivers/firmware/imx/ele_common.c:se_if_rx_callback() {
    [ ... ]
	if (header->tag =3D=3D priv->if_defs->cmd_tag) {
		se_clbk_hdl =3D &priv->cmd_receiver_clbk_hdl;
		dev_dbg(dev, "Selecting cmd receiver:%s for mesg header:0x%x.",
			se_clbk_hdl->dev_ctx->devname,  *(u32 *)header);
    [ ... ]
}

If the driver is idle, won't se_clbk_hdl->dev_ctx be NULL? It looks like
dereferencing dev_ctx->devname here would cause an Oops if the firmware sen=
ds
an unexpected response or command.

[Severity: Critical]
This is a pre-existing issue, but I have a question about the ioctl handler
se_ioctl_cmd_snd_rcv_rsp_handler() in se_ctrl.c:

drivers/firmware/imx/se_ctrl.c:se_ioctl_cmd_snd_rcv_rsp_handler() {
    [ ... ]
	err =3D se_chk_tx_msg_hdr(priv, (struct se_msg_hdr *)cmd_snd_rcv_rsp_info.=
tx_buf);
    [ ... ]
	struct se_api_msg *tx_msg __free(kfree) =3D
		memdup_user(cmd_snd_rcv_rsp_info.tx_buf,
			    cmd_snd_rcv_rsp_info.tx_buf_sz);
    [ ... ]
}

Since cmd_snd_rcv_rsp_info.tx_buf is a user-space pointer, is it safe to
cast it and pass it to se_chk_tx_msg_hdr() before memdup_user() is called?
Wouldn't direct dereferencing of this pointer inside se_chk_tx_msg_hdr()
trigger an immediate panic on systems with SMAP enabled, or a page fault if
the pointer is invalid?

[Severity: High]
This isn't a bug introduced by this patch, but I spotted a potential unboun=
ded
allocation in the same ioctl handler:

drivers/firmware/imx/se_ctrl.c:se_ioctl_cmd_snd_rcv_rsp_handler() {
    [ ... ]
	struct se_api_msg *rx_msg __free(kfree) =3D
		kzalloc(cmd_snd_rcv_rsp_info.rx_buf_sz, GFP_KERNEL);
    [ ... ]
}

Does this code safely handle large or negative values for rx_buf_sz?
Since the size comes directly from the user, could a negative value wrap
to a massive size_t and trigger a kernel warning or memory exhaustion when
passed to kzalloc()?

[Severity: Critical]
This is a pre-existing issue, but there seems to be a possible use-after-fr=
ee
involving ele_msg_send_rcv() and se_ioctl_cmd_snd_rcv_rsp_handler():

drivers/firmware/imx/ele_common.c:ele_msg_send_rcv() {
    [ ... ]
	priv->waiting_rsp_clbk_hdl.dev_ctx =3D dev_ctx;
	priv->waiting_rsp_clbk_hdl.rx_msg_sz =3D exp_rx_msg_sz;
	priv->waiting_rsp_clbk_hdl.rx_msg =3D rx_msg;

	err =3D ele_msg_send(dev_ctx, tx_msg, tx_msg_sz);
	if (err < 0)
		return err;
    [ ... ]
}

If ele_msg_send() fails, ele_msg_send_rcv() returns immediately while
priv->waiting_rsp_clbk_hdl.dev_ctx remains non-NULL.

Back in se_ioctl_cmd_snd_rcv_rsp_handler():

drivers/firmware/imx/se_ctrl.c:se_ioctl_cmd_snd_rcv_rsp_handler() {
    [ ... ]
	struct se_api_msg *rx_msg __free(kfree) =3D
		kzalloc(cmd_snd_rcv_rsp_info.rx_buf_sz, GFP_KERNEL);
    [ ... ]
	err =3D ele_msg_send_rcv(dev_ctx, tx_msg, cmd_snd_rcv_rsp_info.tx_buf_sz,
			       rx_msg, cmd_snd_rcv_rsp_info.rx_buf_sz);
    [ ... ]
}

When the function returns, rx_msg is automatically freed. If a delayed
response later arrives from the firmware, wouldn't se_if_rx_callback()
see a valid dev_ctx and copy the payload into the already-freed rx_msg
pointer, causing a use-after-free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525-ele-v1-v1-=
0-a9570c4bffc9@nxp.com?part=3D5
