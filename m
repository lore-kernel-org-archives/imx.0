Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B1D473C66;
	Wed,  5 Aug 2026 16:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785946681; cv=none; b=FKlMiFg8TWvqqv4grnVd6e0X4ktrfMMB2GRLmmYL06BY3o2Jk2Zmq1TRliTdec/QtvzkpzoaT+7vyyg4j7h7St+x59iSGtiTQ1IrDPqdyJvCUp8QkwjF0ZHGu0+ewS2qk5EeJpjJvrnZ7IcrwN1d2hlpj8hs4zpOxel7eD8J7/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785946681; c=relaxed/simple;
	bh=P1erpxzu1B0GasMwTd8OhT5OxYe6HwoKFPUFLwNUTY8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sU9tHjk50SkO+5MfSntPwI4Xv0U1hid98t/lsZyTSL0sfKost/9+uIf68YHMutU7ZlztzAXhjpcrIziVw2tZpub7wDH/tHLF30kB2hsGxFMSvh/F1+L3ejtvtvYa6fVFcRogit/xca4Ca9V5NMzRyIWuNvKYY0f0YFgDaIaXQt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S458iHWu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S458iHWu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08C341F000E9;
	Wed,  5 Aug 2026 16:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785946679;
	bh=mXgT7oupGeQEHmBQ5i1I6mP5nlGQ0mfW8sCYrFr42x0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S458iHWu2X6hgRarJODFCO3fHMJ//HhsmfiqqViR00RNB8ExUntU0IZAf5TAmXb2X
	 hbme5mg3HWy+izyrdhZDSm798ocKmnai0jtGrZlRNeC/WPFjF2hVpBas7EIGcvP9Em
	 cpozY9ESy58TZtBQe454IYD9srbt/slGcZPUm8YLUpHOPb2icnFS31UoiFYCIEnI0J
	 iAoBBwOxnPs44ehbjjHflRbR40Efrtpbc9NxReGZKMu8HS/oCEnC0YQv+q3Q9Daayg
	 4Tq07WB7wcpmnHDdaHabd92vZNCYXZpszB+h8Da1NHcFemrDhQhsIdh/pHWzlxhk3a
	 Yb6ZbRzVh7WWw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v34 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: imx@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org
In-Reply-To: <20260805-imx-se-if-v34-3-7e4713d14e0a@nxp.com>
References: <20260805-imx-se-if-v34-0-7e4713d14e0a@nxp.com>
 <20260805-imx-se-if-v34-3-7e4713d14e0a@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 16:17:58 +0000
Message-Id: <20260805161759.08C341F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] The DMA buffer passed to the enclave firmware is freed uncondi=
tionally on timeout, creating a window where delayed firmware operations wi=
ll corrupt memory.
- [Medium] The core messaging function `ele_msg_send_rcv` incorrectly retur=
ns `-ERESTARTSYS` when a firmware command completes successfully, but a sig=
nal was received during the wait. This causes non-idempotent operations to =
be incorrectly reported as interrupted and potentially re-executed.
--

--- Patch [3]: [PATCH v34 3/7] firmware: imx: add driver for NXP EdgeLock E=
nclave ---
commit 33c1a4b0c7dcc5a0ad9f6bb5fbdd591b9371ef2d
Author: Pankaj Gupta <pankaj.gupta@nxp.com>
Subject: firmware: imx: add driver for NXP EdgeLock Enclave

Add MU-based communication interface for secure enclave. The secure enclave
FW communicates with Linux over single or multiple dedicated messaging
unit(MU) based interface(s). Exists on i.MX SoC(s) like i.MX8ULP, i.MX93,
i.MX95 etc.

Closes: https://sashiko.dev/#/patchset/20260121-imx-se-if-v32-0-c5222df51cc=
2@nxp.com?part=3D3

> diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/e=
le_base_msg.c
> index 0000000000000..724f6e913ce79
> --- /dev/null
> +++ b/drivers/firmware/imx/ele_base_msg.c

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
> +
> +int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
> +{

[ ... ]

> +	ret =3D ele_msg_send_rcv(priv, tx_msg, ELE_GET_INFO_REQ_MSG_SZ, rx_msg,
> +			       ELE_GET_INFO_RSP_MSG_SZ);
> +	if (ret < 0) {
> +		ele_get_info_cleanup(priv, get_info_data, get_info_addr, get_info_len);

[Severity: Critical]
If ele_msg_send_rcv() times out and returns -ETIMEDOUT, does this unconditi=
onally
free the DMA buffer while the firmware might still be active?

If the firmware is merely slow and responds after the timeout, it could wri=
te
up to 160 bytes into this physical memory after it has been returned to the
page allocator or gen_pool, potentially causing memory corruption.=20

Should we avoid freeing this buffer if the firmware transaction has not bee=
n safely
aborted?

> +		return ret;
> +	}

> diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele=
_common.c
> index 0000000000000..bc08ea2dcd87d
> --- /dev/null
> +++ b/drivers/firmware/imx/ele_common.c

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

[Severity: Medium]
If a signal is received but the firmware successfully completes the command
(err > 0), replacing the result with -ERESTARTSYS discards the hardware
response data.=20

Could this cause issues if the operation is exposed to userspace later? The
VFS would restart the syscall and re-execute the firmware operation, which
might not be idempotent.=20

Is it intentional to discard a successful response here?

> +		priv->waiting_rsp_clbk_hdl.signal_rcvd =3D false;
> +		dev_dbg(priv->dev, "Err[0x%x]:Interrupted by signal.", err);
> +	}
> +
> +	ele_msg_send_rcv_cleanup(priv);
> +
> +	return err;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-imx-se-if-=
v34-0-7e4713d14e0a@nxp.com?part=3D3
