Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8183A7848;
	Mon, 24 Aug 2026 09:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787562829; cv=none; b=sf6ZNLHLty/w00eSQ9bn6opWLr8X0FMs1RVuh6OjM1/Oc+IbvTwZmwArikCNPNsAbEednIu3UsAaSqkP56kOzaZMykV/64hT/qJRyENCthLE21Oky7scvEGwiRMOXmTdKjDyvb9tf5lkcrL5Oh7jWsYVdKPR4yWm2v+vK/7Y9/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787562829; c=relaxed/simple;
	bh=wxiDlXFJ5j/a2y/lNJTyWuD1GHc3gCDmsYCqOY7Soqk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FCfSBUfLIJJh2rAYXiYChLbJG4dnHC/WkLC6+w59Z3uB7ykDjrae1msPLkg+ITDKzqa+mFlNnqS0wZI/eu+3v43Z87BdRWmkidz3QrbSI22RTfbQuMfX/6c0N7XpS5k61PMknbljjKvG/RAS7JshEt4DXCMt5yCTfSuqOiOkhwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HNF73RcL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HNF73RcL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26DF61F00A3A;
	Mon, 24 Aug 2026 09:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787562827;
	bh=KjFi+4HgDMRy36CKPR5MNE/3YO5RWO9T8Y3nnz36dMk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HNF73RcLQuboe4dPN/fOB2Y1IzJmU3km8TIP0+QX1bP+GBYdZy86iQfUFmFg6e8nR
	 FnC1yn2rquYO1guSRMfMd3Y8ft2p2ru8hx7dpAv/6qgiJ+anf3a0KXR7GtnCykif54
	 LfgJY15CKtBWKpn6nN7exLwbLphnxqS2/P9skeV7Q29CD9BqGK5g8inPjlN9kfcvrq
	 y8ap35vq8UoaKvbplEdTuYnbeHncs4GlEq7EjKRMdDbrfGql/iqQ3Q+M3J+IOiNc/c
	 tI/9xftU0PAW52MsUWuK6Aq+Th/m4tzXtG8vaWilHTzJ71Ccf74gmRMvCnVS8TciJh
	 8H6lJ39/J47pw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v41 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: robh@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260824-imx-se-if-v41-3-29cf129e4d86@nxp.com>
References: <20260824-imx-se-if-v41-0-29cf129e4d86@nxp.com>
 <20260824-imx-se-if-v41-3-29cf129e4d86@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 09:13:46 +0000
Message-Id: <20260824091347.26DF61F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Devres LIFO execution causes a Use-After-Free on `priv->se_if_cmd_=
lock` during unbind, and a memory leak on probe failure.
--

--- Patch [3]: [PATCH v41 3/7] firmware: imx: add driver for NXP EdgeLock E=
nclave ---
commit 49588215c50994b46eebe37520853007e8a9a892
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

firmware: imx: add driver for NXP EdgeLock Enclave

This commit adds the MU-based communication interface for the secure
enclave on i.MX SoC(s). It allows the secure enclave firmware to communicate
with Linux over dedicated messaging unit (MU) based interfaces.

> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/firmware/imx/se_ctrl.c

[ ... ]

> +static void se_if_probe_cleanup(void *plat_dev)
> +{
> +	struct platform_device *pdev =3D plat_dev;
> +	struct device *dev =3D &pdev->dev;
> +	struct se_if_priv *priv;
> +
> +	priv =3D dev_get_drvdata(dev);
> +	if (!priv)
> +		return;

[ ... ]

> +	kfree(priv);
> +}
> +
> +static int se_if_probe(struct platform_device *pdev)
> +{
> +	const struct se_soc_info *se_info;
> +	const struct se_if_node *if_node;
> +	struct se_fw_load_info *load_fw;
> +	struct device *dev =3D &pdev->dev;
> +	struct se_if_priv *priv;
> +	int ret;
> +
> +	if_node =3D device_get_match_data(dev);
> +	if (!if_node)
> +		return -EINVAL;
> +
> +	se_info =3D if_node->se_info;
> +
> +	priv =3D kzalloc_obj(*priv, GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->dev =3D dev;
> +	priv->if_defs =3D &if_node->if_defs;
> +	dev_set_drvdata(dev, priv);
> +
> +	ret =3D devm_mutex_init(dev, &priv->se_if_cmd_lock);

[Severity: High]
Does this code introduce a memory leak on the probe error path?

Since priv is allocated with kzalloc_obj() (which is not devm-managed),
if devm_mutex_init() fails, the function returns immediately without
freeing priv.

> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to init mutex: priv se_if_cmd_lock.\n");
> +	spin_lock_init(&priv->cmd_receiver_clbk_hdl.clbk_rx_lock);
> +	spin_lock_init(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock);
> +	atomic_set(&priv->fw_busy, 0);
> +	init_completion(&priv->waiting_rsp_clbk_hdl.done);
> +	init_completion(&priv->cmd_receiver_clbk_hdl.done);
> +
> +	ret =3D devm_add_action_or_reset(dev, se_if_probe_cleanup, pdev);

[Severity: High]
Could this devres action ordering lead to a use-after-free during device
unbind?

Because devres actions execute in reverse order of their registration
(LIFO), upon device unbind se_if_probe_cleanup() runs first and frees
priv. Subsequently, the devres action for devm_mutex_init() runs and
calls mutex_destroy(&priv->se_if_cmd_lock) on the already freed priv
pointer.

> +	if (ret)
> +		return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824-imx-se-if-=
v41-0-29cf129e4d86@nxp.com?part=3D3
