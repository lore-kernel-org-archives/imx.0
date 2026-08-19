Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5FE3D0934;
	Wed, 19 Aug 2026 06:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787120612; cv=none; b=odUAc4hJ507RZ4nniElfN0fT9q02WGI/9GwNkd/ozrbBFV9ndbaB3RiETuwOzJm1SPPYY7+KmtS0F1cmluZFnq7UfqW/eMo4U9Xnq7N0OxbP1OZS7YeXuJDJnWZcuxjGVY9nDDbeDUS2nK0M83iypoSlQN6r3dBXwBqK6LU261c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787120612; c=relaxed/simple;
	bh=Ko2cQhwj+olD1QsWHlWVESrDfWuxx6ICgVr3xIca24A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c/u/af/X6aSeDfAFTPcxBvJdgg2Gy7Z0zvycFyAOGxnq7JBNnaw7oT+sgcqHcb+h0JnDiVr5aprj4vVDIE1HfektdzPuXDH95LaaA22X++8ajjN+Ny2tMUGQJ1HmVoYzSsOBNaEcletCTQ0UMkznI5pEg/udZG+TomlhKhJ9p5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tlxettyq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tlxettyq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23D8B1F000E9;
	Wed, 19 Aug 2026 06:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787120608;
	bh=Qb6MfEehRvLREsQpfPaUzToQe23i7mKbztMwSk9WxDA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TlxettyqRXgBumGop3xchUXoeHPQzGtLTW15lu0jHGHu0Njqp7Vtl6USPIFJUWfrq
	 840di8yuxjPgWblMST8JvAjkCaAZol7ATInyG5J7DrGddE1y/dA6ONqUybfyhxbqR6
	 Ikmo07Mn7XStFKyEsh91QA+CjAJ+k8tINy4CqLJs+XiR/k9VMJUHfQzMvbfMdXu27B
	 r/gFvILHA7z2esXDUVbnihwgj+1hmOHa4Rvlh0VCGBjxZ/QyurOeWD+16mXx1c5cEQ
	 1ZVtBCaY3uQzWyk6qU2+JoEcb5sRW1G3FeFdyhAWcG3nev6qfmwc13ZoopZaA07sEp
	 7UukUUPJwHc+A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v37 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pankaj Gupta" <pankaj.gupta@nxp.com>
Cc: imx@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260819-imx-se-if-v37-3-5ef5de9ff1dc@nxp.com>
References: <20260819-imx-se-if-v37-0-5ef5de9ff1dc@nxp.com>
 <20260819-imx-se-if-v37-3-5ef5de9ff1dc@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 06:23:27 +0000
Message-Id: <20260819062328.23D8B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] DMA Use-After-Free Vulnerability due to premature buffer clean=
up on timeout.
- [High] Improper error handling overriding successful firmware commands wi=
th `-ERESTARTSYS`, causing duplicate execution.
- [Medium] `se_resume` unconditionally returns 0 even if `se_restore_imem_s=
tate` fails, violating the API contract.
--

--- Patch [3]: [PATCH v37 3/7] firmware: imx: add driver for NXP EdgeLock E=
nclave ---
commit 12b954054edf722eadc852286283752fad83199e
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

firmware: imx: add driver for NXP EdgeLock Enclave

Add MU-based communication interface for secure enclave to support
features like HSM, SHE & V2X.

> diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/e=
le_base_msg.c
> --- a/drivers/firmware/imx/ele_base_msg.c
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
> +	dma_addr_t get_info_addr =3D 0;
> +	void *get_info_data =3D NULL;
> +	u32 get_info_len;
> +	int ret =3D 0;

[ ... ]

> +	ret =3D ele_msg_send_rcv(priv, tx_msg, ELE_GET_INFO_REQ_MSG_SZ, rx_msg,
> +			       ELE_GET_INFO_RSP_MSG_SZ);
> +	if (ret < 0) {
> +		ele_get_info_cleanup(priv, get_info_data, get_info_addr, get_info_len);

[Severity: Critical]
If ele_msg_send_rcv() times out and returns -ETIMEDOUT, is it safe to
unconditionally free the DMA buffer here by calling ele_get_info_cleanup()?

Since the secure enclave firmware executes asynchronously and doesn't know
the host timed out, could it eventually finish the delayed operation and
perform a DMA write to this freed physical address? Does this memory need
to be quarantined or leaked when the firmware is marked busy to prevent
potential memory corruption?

> +		return ret;
> +	}
> +
> +	ret =3D se_val_rsp_hdr_n_status(priv, rx_msg, ELE_GET_INFO_REQ,
> +				      ELE_GET_INFO_RSP_MSG_SZ, true);

[ ... ]

> diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele=
_common.c
> --- a/drivers/firmware/imx/ele_common.c
> +++ b/drivers/firmware/imx/ele_common.c

[ ... ]

> +int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_s=
z,
> +		     void *rx_msg, int exp_rx_msg_sz)
> +{
> +	unsigned long flags;
> +	int err;

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
The comment mentions that the command is not re-sent, but if this function
returns -ERESTARTSYS to the VFS layer, won't the syscall be rewound and
re-executed from the beginning?

Since there is no tracking state to prevent it, will this cause the driver
to blindly resend the exact same command to the firmware? Could this lead
to duplicate execution of non-idempotent operations or resource leaks when
a successful command result is discarded and then re-run?

> +		priv->waiting_rsp_clbk_hdl.signal_rcvd =3D false;
> +		dev_dbg(priv->dev, "Err[0x%x]:Interrupted by signal.", err);
> +	}
> +
> +	ele_msg_send_rcv_cleanup(priv);
> +
> +	return err;
> +}

[ ... ]

> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c

[ ... ]

> +static int se_resume(struct device *dev)
> +{
> +	struct se_if_priv *priv =3D dev_get_drvdata(dev);
> +	struct se_fw_load_info *load_fw;
> +	int ret =3D 0;
> +
> +	load_fw =3D get_load_fw_instance(priv);
> +
> +	if (load_fw->imem_mgmt) {
> +		ret =3D se_restore_imem_state(priv, &load_fw->imem);
> +		if (ret)
> +			dev_warn(dev, "Failure restoring IMEM state[0x%x]", ret);
> +	}
> +
> +	return 0;

[Severity: Medium]
Is it intentional to unconditionally return 0 from se_resume() even when
se_restore_imem_state() fails?

The implementation of se_restore_imem_state() returns -EIO on failure with
the stated intent that the PM subsystem knows the enclave is non-functional
after resume.=20

By discarding the error code here, does this mask the failure from the PM
core and falsely inform it that the device resumed successfully?

> +}
> +
> +DEFINE_SIMPLE_DEV_PM_OPS(se_pm, se_suspend, se_resume);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819-imx-se-if-=
v37-0-5ef5de9ff1dc@nxp.com?part=3D3
