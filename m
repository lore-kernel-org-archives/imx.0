Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CC743C055;
	Tue, 16 Jun 2026 12:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781611477; cv=none; b=BD9Mu80zFY0tYeQ86hfTfKTcRsfTgzCqEYViG+NkSJe/IBILZk+sfp3lAFAlHT+47qKQ0Hbk2qsz6+tS51wyt93oeThepLt9uqNKRADYTYJxCLI1Vt/9z26WBMfH+9M8E3gJ5hzIUxKRL5p5/mmaYyk5dJfbhghSBcuAPqFglrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781611477; c=relaxed/simple;
	bh=qtCJsWt+diNrt9quz63pcdbctAuzeEshzPX8VMGS9Ic=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bnfORe29SiP4xhXvUN4k9YjRc9r5BHNFOqA2JQzq1uJE/V8Wl+I+SXvK2lyswN43nPFYf9OkXUry+s4achl4r1QMNTLDZDkTeXV5PdK6dzYJfoFXOLsJ4EJzNVDDZ+lWB692D/im6tXsKhzFMO8tS6AKG3QgguLFCI8wyrnAd8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FhfV78xb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FhfV78xb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5908D1F00A3A;
	Tue, 16 Jun 2026 12:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781611476;
	bh=MkfMGUviCSwnkGdHwna3U3JKvUE4TyWVJnk7iv69b8I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FhfV78xbFF/83VhfyQ+c6GWAfiJdy5BcViZExt9Pjr5HgP3cp1drsknLmg+JItkJN
	 rfKHaWYfMSLO/bjJazF8PvDQinHAlVRzeyoQkkk/0hqQRcoB2T8DaEZ5vI9FOgkhzA
	 RolQQWK8BR//ZE8BMC7g04PV5pACZUUmEEd65veJ9rhEwkA3YXH6qspbVipYiFim2o
	 cLMuvGYcwF2/oEH50xxGiTvXqCHMj7EOmqns8nCY8cN0FyQI9HQCif0l0AsvkXwmbB
	 RQe33EYd2xFWLqugDlnMk/VHVDddgqABmxlfHh37w+r+tqZktrfGrBRh6sAWAP5mOS
	 hEQl05JGOkjpA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/9] nvmem: imx-ocotp-ele: Support the ELE API
Reply-To: sashiko-reviews@lists.linux.dev
To: "Frieder Schrempf" <frieder@fris.de>
Cc: robh@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-6-cb7f3698c3e6@kontron.de>
References: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-6-cb7f3698c3e6@kontron.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 12:04:36 +0000
Message-Id: <20260616120436.5908D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The dynamically allocated read buffer `p` is leaked when `imx_se_r=
ead_fuse()` returns an error in `imx_ocotp_reg_read()`.
- [High] Lack of unbind protection for the supplier Secure Enclave (`se_dev=
`) device leads to a potential Use-After-Free of its cached private data.
--

commit ce01a1e44e5619e1342b66aca8b1bf267d01e93e
Author: Frieder Schrempf <frieder.schrempf@kontron.de>

nvmem: imx-ocotp-ele: Support the ELE API

The fuses inside the Edgelock Secure Enclave are currently not accessed via
its API but through the FSB block which provides limited access to some
fuses. The ELE API allows us to access all fuses with read/write
permissions.

> diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
> index 9d3f94e35508f..92cc061b9b347 100644
> --- a/drivers/nvmem/imx-ocotp-ele.c
> +++ b/drivers/nvmem/imx-ocotp-ele.c

[ ... ]

> @@ -92,6 +97,19 @@ static int imx_ocotp_reg_read(void *context, unsigned =
int offset, void *val, siz
>  	buf =3D p;
> =20
>  	for (i =3D index; i < (index + count); i++) {
> +		/*
> +		 * All fuse registers can be read via ELE. If the SE device is
> +		 * available, always prefer it.
> +		 */
> +		if (priv->se_data) {
> +			ret =3D imx_se_read_fuse(priv->se_data, i, buf++);
> +			if (ret) {
> +				mutex_unlock(&priv->lock);
> +				return ret;

[Severity: High]
Does this error path leak the memory allocated for p earlier in the functio=
n?

The allocation happens here:

	p =3D kzalloc(num_bytes, GFP_KERNEL);
	if (!p)
		return -ENOMEM;

Returning directly here will bypass the kfree(p) at the end of the function.

> +			}
> +			continue;
> +		}
> +

[ ... ]

> @@ -152,16 +203,36 @@ static int imx_ele_ocotp_probe(struct platform_devi=
ce *pdev)
>  	if (IS_ERR(priv->base))
>  		return PTR_ERR(priv->base);
> =20
> +	np =3D of_parse_phandle(pdev->dev.of_node, "secure-enclave", 0);
> +	if (!np) {
> +		dev_info(&pdev->dev, "missing or invalid SE handle, using readonly FSB=
\n");
> +	} else {
> +		priv->se_dev =3D of_find_device_by_node(np);
> +		of_node_put(np);
> +		if (!priv->se_dev)
> +			return dev_err_probe(&pdev->dev, -ENODEV, "failed to find SE device\n=
");
> +
> +		ret =3D devm_add_action_or_reset(&pdev->dev, imx_ocotp_put_se_dev,
> +					       priv->se_dev);
> +		if (ret)
> +			return ret;
> +
> +		priv->se_data =3D platform_get_drvdata(priv->se_dev);

[Severity: High]
Is there anything preventing the SE driver from being unbound via sysfs aft=
er we
cache its private data in priv->se_data here?

If the SE driver is unbound, its devres allocations (which likely include t=
he
se_data) would be freed. Since we haven't established a device link
(e.g. using device_link_add) to enforce unbind ordering, we might be left
with a dangling pointer in priv->se_data.

Could this result in a use-after-free when imx_ocotp_reg_read() or
imx_ocotp_reg_write() later attempts to dereference priv->se_data?

> +		if (!priv->se_data)
> +			return dev_err_probe(&pdev->dev, -EPROBE_DEFER,
> +					     "SE device not ready\n");
> +	}
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616-upstreamin=
g-next-20260609-imx-ocotp-ele-v1-0-cb7f3698c3e6@kontron.de?part=3D6
