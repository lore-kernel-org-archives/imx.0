Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9059E2C21F1;
	Mon, 17 Aug 2026 08:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786956499; cv=none; b=SZZjKOI5rRJG+3U+5ly3B7OvcRpyXhbrMe8VZ1CCNc5JMqwht/SICaMCLgD1At3Q2FpPXh2h3Kj1RBsNmYu4S3R/nP8l76DCM6eOgQ4UaNCe0MMy9MQFOxxm6VP/con2cspLgJmGiQHEMpTP3Cg90TYUuEym3etH2gNZJN+aaFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786956499; c=relaxed/simple;
	bh=gkcqOf9utC2OlcK9S7Q81ZkxKZYy1s3q5yK0ZP93aUk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=maK7bPhM4jQlC8be/WFZ25eWOU6CMCqEDLtN8v6iz/2mEaSpZ7OEquueaBU2dZHj7kz0OP6W1BTH1xDqUlRJbGmCJQO5RCXKbyzvOKfs+EV+KW02ISr4qXyUrPqXTFOy53QzgFm0uVITDW4lbmBqYYdSwmutj9ZWdpiFZD1UJMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SlFyycTQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SlFyycTQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB1BE1F000E9;
	Mon, 17 Aug 2026 08:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786956498;
	bh=LEdWaAa8W3iAzBba6QVFkPtJZxKs0CSTBwkQFlE0iUw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SlFyycTQNcjtmQlDZNHiIVd/YGbBeLu9KfIDvfFOFRc4bEMrcJoM4kuRbGlJoIQwZ
	 GTopzfL5xrTXfJh/lgtvgs9RMfeM6kRvJNtebd1TuXHlV8xlFIwUoZA8xXPiCx1cBw
	 t+E0JNXg8ylGvGBPjopan9pBlvhLr/+d2I6C2h6QBuoHa+rd0wpDWguS76HQA5xEqs
	 1NpV1/rFhpp4t+s4sA7Fxj1dEiTfdkGyyCye7dM4MUVbZfSpTVR9RSkJQVwdGTSUnA
	 IhaTsPn1QQgpdwi2CmipzH5FQlAdgJpi+anSKSLw8eTKUZKwP3BxmoH+xNRfPdwEgK
	 8s4P9PiqXvKIw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v36 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGFua2FqIEd1cHRhIChPU1Mp?= <pankaj.gupta@oss.nxp.com>
Cc: conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260817-imx-se-if-v36-3-45c42847bfd8@oss.nxp.com>
References: <20260817-imx-se-if-v36-0-45c42847bfd8@oss.nxp.com>
 <20260817-imx-se-if-v36-3-45c42847bfd8@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 08:48:17 +0000
Message-Id: <20260817084817.DB1BE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] DMA Use-After-Free vulnerability in ele_get_info() when freeing a =
buffer after a command timeout.
- [High] Spurious failures and duplicate executions due to explicitly overw=
riting successful hardware transactions with -ERESTARTSYS.
- [High] Out-of-bounds read in se_if_rx_callback() due to trusting the firm=
ware-provided header->size.
- [Medium] Permanent probe failure instead of returning -EPROBE_DEFER when =
the SRAM pool is not yet available.
--

--- Patch [3]: [PATCH v36 3/7] firmware: imx: add driver for NXP EdgeLock E=
nclave ---
commit ba0b4841b861b1ed1d3d0d02b5e6c1bb39bdf404
Author: Pankaj Gupta <pankaj.gupta@nxp.com>
Subject: firmware: imx: add driver for NXP EdgeLock Enclave

Add MU-based communication interface for secure enclave. NXP hardware IP(s)
for secure-enclaves like Edgelock Enclave(ELE), are embedded in the SoC to
support the features like HSM, SHE & V2X, using message based communication
interface.

diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele=
_base_msg.c
--- /dev/null
+++ b/drivers/firmware/imx/ele_base_msg.c
@@ -0,0 +1,282 @@
[ ... ]
> +static void ele_get_info_cleanup(struct se_if_priv *priv, u32 *buf, dma_=
addr_t d_addr,
> +				 size_t size)
> +{
> +	if (priv->mem_pool)
> +		gen_pool_free(priv->mem_pool, (unsigned long)buf, size);

[Severity: High]
If ele_msg_send_rcv() times out in ele_get_info(), does releasing this DMA
buffer back to the system allocator while the enclave is still programmed to
write to it cause kernel memory corruption when the delayed firmware
transaction eventually completes?

> +	else
> +		dma_free_coherent(priv->dev, size, buf, d_addr);
> +}

[ ... ]

diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_c=
ommon.c
--- /dev/null
+++ b/drivers/firmware/imx/ele_common.c
@@ -0,0 +1,501 @@
[ ... ]
> +int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_s=
z,
> +		     void *rx_msg, int exp_rx_msg_sz)
> +{
[ ... ]
> +	if (priv->waiting_rsp_clbk_hdl.signal_rcvd) {
> +		/*
> +		 * Signal was deferred until the FW/kernel protocol resynchronized.
> +		 * On success report -ERESTARTSYS for the interrupted wait; the
> +		 * command is not re-sent. Keep real errors like -ETIMEDOUT.
> +		 */
> +		if (err > 0)
> +			err =3D -ERESTARTSYS;

[Severity: High]
Does explicitly overwriting a successful hardware response (err > 0) with
-ERESTARTSYS cause the VFS to restart the operation, leading to duplicate
executions of non-idempotent hardware commands and spurious failures in
kernel contexts like PM suspend?

> +		priv->waiting_rsp_clbk_hdl.signal_rcvd =3D false;
> +		dev_dbg(priv->dev, "Err[0x%x]:Interrupted by signal.", err);
> +	}

[ ... ]
> +void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
> +{
[ ... ]
> +	} else if (header->tag =3D=3D priv->if_defs->rsp_tag) {
[ ... ]
> +		se_clbk_hdl->rx_msg_sz =3D min(rx_msg_sz, exp_rx_msg_sz);
> +		memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);

[Severity: High]
If the mailbox controller driver passes a pointer to a small local buffer
on the IRQ stack for msg, but the untrusted firmware-provided header->size
specifies a large size, does this memcpy() read out-of-bounds past the msg
pointer capacity?

> +		complete(&se_clbk_hdl->done);
> +		spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);

[ ... ]

diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
--- /dev/null
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -0,0 +1,507 @@
[ ... ]
> +static int se_if_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	if (if_node->pool_name) {
> +		priv->mem_pool =3D of_gen_pool_get(dev->of_node, if_node->pool_name, 0=
);
> +		if (!priv->mem_pool)
> +			return dev_err_probe(dev, -ENOMEM,
> +					     "Unable to get sram pool =3D %s.",
> +					     if_node->pool_name);

[Severity: Medium]
Should this return -EPROBE_DEFER instead of permanently failing with -ENOMEM
when the SRAM pool is not yet available during boot?

> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817-imx-se-if-=
v36-0-45c42847bfd8@oss.nxp.com?part=3D3
