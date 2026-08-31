Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5648F2D9EDB;
	Mon, 31 Aug 2026 07:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788159940; cv=none; b=eg3zVOt8B3K7GRYHhNGbtfuAKbbELroGi2Z8Gl+ym1fIP4vVNx9gxZC3/dKxLN5cccs8DFkDKaJnYJy/WtUt43vaOZ93IA24zPYN3CuyuoR9RDjhaEyXYJsysMr/zGgQ0JOXxLL6A/Gu7SwU062pqtXro6fgG8vVXheikbHE8W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788159940; c=relaxed/simple;
	bh=6kEBMVpoCiAmQRPI7AciJtGk2/3rkUW36q9tJAwZrDQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XSya0NYC21QoUycgylHuoEYqf8A+XcwHs1l5sZpn77U5kCxnG77Pdaqk4IeBu3XWhMnhrw19dKC5Lbi4JTAu/CH/8O46NJ5UPi7aaVdRjtQXIwI2CY6fs7gZikUJ5kLJY4G/QekFZa8Yh/MhFj5ISAE3V4Kp4uzaE/MEbcBo5sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NeBCRDFJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NeBCRDFJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2F4E1F000E9;
	Mon, 31 Aug 2026 07:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788159939;
	bh=cCDQv/g3VmOszUQYR6q7FLVvlu2TE0dDdvXyBERzFnw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NeBCRDFJiBMQFIKUwRLGlsMSYLE2kW64zilLcP+iXn3mohxtOpwPlhIa0ryAm5fnd
	 a2RKkpvnho53gXFhjtOh4FUhnukiIKntusg4FxvcDfS0YuzlFthiZvlHpTQ0e+Vv3w
	 pT9WAVKi+FsVLgjs/W0AQWXJR2X4oEWi7GYPS1qWdHlUyoKrRf2PANpPiM2U4982C7
	 tmpb1U6zWHxerhiif2ywUa8N1N9pmLED3OwMeAEP2+FQ5bR5qmZ5F4imbyEHQU+Ms/
	 TyBZwvEDHyRsWH2H5NvE+S+0pRuvrXnkzGjgfTCeGYLjC3hCgj36NMovRh9Ij6CtGy
	 tshFOBcC9cQGQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v43 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: Frank.Li@kernel.org, robh@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260831-imx-se-if-v43-3-a3deadbda4ef@nxp.com>
References: <20260831-imx-se-if-v43-0-a3deadbda4ef@nxp.com>
 <20260831-imx-se-if-v43-3-a3deadbda4ef@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 07:05:38 +0000
Message-Id: <20260831070538.F2F4E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Converting a successful firmware transaction to `-ERESTARTSYS` (an=
d subsequently `-EINTR`) causes loss of response data and duplicate executi=
on of non-idempotent commands.
- [High] Missing return value check for `dma_set_mask_and_coherent()` allow=
s silent DMA address truncation.
- [Medium] Buffer over-read in `se_if_rx_callback` due to trusting unauthen=
ticated message size.
--

commit a66c01dd1d5f945431fe3bf45a2b25282c5a4077
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

firmware: imx: add driver for NXP EdgeLock Enclave

Add MU-based communication interface for secure enclave.

> diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele=
_common.c
> --- /dev/null
> +++ b/drivers/firmware/imx/ele_common.c

[ ... ]

> +int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_s=
z,
> +		     void *rx_msg, int exp_rx_msg_sz)
> +{

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
Does this conversion of a successful hardware transaction to -ERESTARTSYS=20
cause the loss of response data?

If userspace retries the operation as expected for an interrupted system
call, wouldn't it re-execute a command the hardware has already processed,
breaking exactly-once semantics and state synchronization?

> +		priv->waiting_rsp_clbk_hdl.signal_rcvd =3D false;
> +		dev_dbg(priv->dev, "Err[0x%x]:Interrupted by signal.\n", err);
> +	}
> +
> +	ele_msg_send_rcv_cleanup(priv);
> +
> +	return err;
> +}

[ ... ]

> +void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
> +{
> +	struct se_clbk_handle *se_clbk_hdl;
> +	struct device *dev =3D mbox_cl->dev;
> +	struct se_msg_hdr *header;
> +	bool sz_mismatch =3D false;
> +	struct se_if_priv *priv;
> +	unsigned long flags;
> +	u32 rx_msg_sz;
> +
> +	priv =3D dev_get_drvdata(dev);
> +	if (!priv)
> +		return;
> +
> +	/* The function can be called with NULL msg */
> +	if (IS_ERR_OR_NULL(msg)) {
> +		dev_err(dev, "Message is invalid\n");
> +		return;
> +	}
> +
> +	header =3D msg;
> +	rx_msg_sz =3D header->size << 2;

[ ... ]

> +	} else if (header->tag =3D=3D priv->if_defs->rsp_tag) {

[ ... ]

> +		se_clbk_hdl->rx_msg_sz =3D min(rx_msg_sz, exp_rx_msg_sz);
> +		memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);

[Severity: Medium]
Can this untrusted header size calculation cause an out-of-bounds read?

The rx_msg_sz is calculated directly from the unauthenticated message heade=
r.
If the underlying mailbox driver provides a pointer to a smaller fixed-size
payload, couldn't the memcpy read past the end of the msg buffer?

> +		complete(&se_clbk_hdl->done);
> +		spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);

[ ... ]

> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> --- /dev/null
> +++ b/drivers/firmware/imx/se_ctrl.c

[ ... ]

> +static int se_if_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	if (if_node->reserved_dma_ranges) {
> +		ret =3D of_reserved_mem_device_init(dev);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "Failed to init reserved memory region.\n");
> +	}
> +
> +	dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));

[Severity: High]
Could omitting the return value check for dma_set_mask_and_coherent() allow
silent DMA address truncation?

If the DMA mask is not successfully set, the system might provide 64-bit DMA
addresses. Because the hardware appears to only support 32-bit DMA addresse=
s,
wouldn't truncation to 32 bits instruct the secure enclave to access the wr=
ong
physical memory addresses and cause memory corruption?

> +
> +	/*
> +	 * Initialize load_fw_lock before registering the misc device.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-imx-se-if-=
v43-0-a3deadbda4ef@nxp.com?part=3D3
