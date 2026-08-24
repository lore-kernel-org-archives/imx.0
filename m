Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2B946D2A6;
	Mon, 24 Aug 2026 17:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787593546; cv=none; b=LjBzjLyC876oS3dZEQ3nNg9egzWFSSYkQitJ5RqgvC8g4XXwNnZ/CfzGpt++hrEIdAxhQzKmSkZh4d20MIej/Sd8QoQgQoMuMPviHkdcSM6Ytn7pR6CprILKPXexG7htlrpF3GhB1DAWSIytbmhhxv0Z3MQMeol9v8DSW+2+dHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787593546; c=relaxed/simple;
	bh=LKiOL478NKsQbT5ZUR+gCyl1eWTCliTekRzQQbOicEg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JLZB5uOJs/ajrAuCkky7p0Gq4bRG+5s6Si/Ftd4vd6zz4gANKVm30wqZuq3dsmn/B5fLMNGCZu2Usm3jVqk2NUhLgJ9ebxNelh06xlQ8tSbWbWlpDSWWCqtHROZGVL2u8YkRL3+TU4vsxSoX1S5E82gRFQKFNuqgSJcXmI7kx6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VYNs92Cj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VYNs92Cj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 248361F000E9;
	Mon, 24 Aug 2026 17:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787593534;
	bh=2CbcEWhLwmEmAvWqIrak4bZQeJgSW8I7FCfj/szHEEA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VYNs92Cj2I31Qn4uhjmSufz5MD2GTYlUICpuIH9hlwQJz+JhN1gLM/khndue8KTEd
	 LFObZ6s5MxXgj8gVLm9d0ORxZ/w3MT5VMCvLBAI/guaFWAoxLI2U9iSXUkfXUTflui
	 DDSCMKkdwQa4agjhr4ECk2k5GSEoYwgL8VWwFEftAIcIKriVQjttQz/imGfAC4nRox
	 O7agx0QyWql2O/93PAbsFqTD+5AZIWoPFld8lKtU3n1o6MRLUxQzM3lZamK4V+m1tw
	 b95vIiq4E2WACzACykEl2KhZuxOa+bFpWkZwQVEOylyxVwFyKsLJ5Y17J0kQ2l2ZvK
	 GiCtucmmi0Nxw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v42 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260825-imx-se-if-v42-3-2e8efac0bb16@nxp.com>
References: <20260825-imx-se-if-v42-0-2e8efac0bb16@nxp.com>
 <20260825-imx-se-if-v42-3-2e8efac0bb16@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 17:45:33 +0000
Message-Id: <20260824174534.248361F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Overriding a successfully completed hardware transaction with `-ER=
ESTARTSYS` corrupts system state.
- [High] DMA buffer payload structures lack proper endianness annotations a=
nd are accessed via unaligned stack pointers.
- [Medium] The driver ignores the return value of `dma_set_mask_and_coheren=
t()`.
--

--- Patch [3]: [PATCH v42 3/7] firmware: imx: add driver for NXP EdgeLock E=
nclave ---
commit 24008c54c68410ac80c730096b66d2a0342cea55
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

firmware: imx: add driver for NXP EdgeLock Enclave

This adds a driver for the NXP EdgeLock Enclave (ELE) which exposes a MU-ba=
sed
communication interface for secure enclaves on i.MX SoC(s). The secure encl=
ave
firmware communicates with Linux over single or multiple dedicated messaging
unit (MU) interfaces.

> diff --git a/drivers/firmware/imx/ele_base_msg.h b/drivers/firmware/imx/e=
le_base_msg.h
> new file mode 100644
> index 0000000000000..02525d5e28739
> --- /dev/null
> +++ b/drivers/firmware/imx/ele_base_msg.h

[ ... ]

> +struct dev_info {
> +	u8  cmd;
> +	u8  ver;
> +	u16 length;
> +	u16 soc_id;
> +	u16 soc_rev;
> +	u16 lmda_val;
> +	u8  ssm_state;
> +	u8  dev_atts_api_ver;

[Severity: High]
Should these hardware payload fields use __le16 instead of host-endian u16?

On big-endian systems, reading these fields without endianness conversions
might result in incorrect values.

> diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele=
_common.c
> new file mode 100644
> index 0000000000000..74cdac45231ce
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

[Severity: High]
Is it safe to override a successful hardware response with -ERESTARTSYS?

If ele_msg_send_rcv() successfully sends a command to the hardware but a
signal arrives during the wait, the function waits for the hardware to
finish, retrieves the response, and then overrides the success code.

The VFS or userspace application will interpret -ERESTARTSYS as an
instruction to restart the syscall. Could this result in non-idempotent
hardware commands (such as firmware authentication or fuse writing) being
executed multiple times and corrupting device state?

> +		priv->waiting_rsp_clbk_hdl.signal_rcvd =3D false;
> +		dev_dbg(priv->dev, "Err[0x%x]:Interrupted by signal.\n", err);
> +	}
> +
> +	ele_msg_send_rcv_cleanup(priv);
> +
> +	return err;
> +}

> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> new file mode 100644
> index 0000000000000..9e3f81a9a2728
> --- /dev/null
> +++ b/drivers/firmware/imx/se_ctrl.c

[ ... ]

> +static int get_se_soc_info(struct se_if_priv *priv, const struct se_soc_=
info *se_info)
> +{
> +	struct se_fw_load_info *load_fw =3D get_load_fw_instance(priv);
> +	u8 data[MAX_SOC_INFO_DATA_SZ];
> +	struct ele_dev_info *s_info;
> +	int err;

[ ... ]

> +	err =3D ele_fetch_soc_info(priv, &data);
> +	if (err < 0)
> +		return dev_err_probe(priv->dev, err, "Failed to fetch SoC Info.\n");
> +
> +	s_info =3D (struct ele_dev_info *)data;
> +
> +	if (!var_se_info.soc_rev)
> +		var_se_info.soc_rev =3D s_info->d_info.soc_rev;

[Severity: High]
Can casting a byte-aligned stack array to a structure pointer cause issues
here?

The u8 array data is cast to struct ele_dev_info * and then dereferenced.
On architectures with strict alignment requirements, could this unaligned
access cause an exception?

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

[Severity: Medium]
Should the return value of dma_set_mask_and_coherent() be checked?

If DMA mask configuration fails, the driver proceeds with DMA allocations
anyway. Could this lead to truncated DMA addresses or failure of device
communication if the system cannot accommodate the 32-bit mask?

> +
> +	/*
> +	 * Initialize load_fw_lock before registering the misc device.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825-imx-se-if-=
v42-0-2e8efac0bb16@nxp.com?part=3D3
