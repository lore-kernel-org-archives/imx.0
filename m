Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896C81F4285
	for <imx@lists.linux.dev>; Tue, 21 Jan 2025 15:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737472902; cv=none; b=JkOZ01vQmXDU2eL8CiYB10BEPq1nHgSnMnF6KXkJ90MjhCJf0Y9WBYW8BhBwT782Q5cx3MVCVl7GtZL6m4jx9f63X7HmuyjkeS81+tp/+G7QYRaIsj27qzS85CtlLkBBvKvAO6vVTR66Z/sQNDI3l3yl9nVQPPDmL0Iv5RtlgmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737472902; c=relaxed/simple;
	bh=Bmn+V8U4QXfbsM+cp71lUo+mrbLtMiv71iUgeGIc6xg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WO3Olvd5KjCUKu09DYEh0hpKpZj8d7uzQ47eCLl+Qs3m18JQ9ZuaWhOdjp8ctLjCEsqChOk45MI9+bl75u9/Ay4gR+DeH2hcTW83n68H6EiNuV/IOtMjVpfvFxA1tfruYZVRpzubtWNpfYYrhgEUAhdhDmg8BCAT1aJ/Olwg4FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=m6WNkdbe; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=rYLGUiTT reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="m6WNkdbe";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="rYLGUiTT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1737472899; x=1769008899;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l4hYFP3h1arKjsKD8T0roDJ/zeXY7qh2kU6N067sKV4=;
  b=m6WNkdbe0Qw9ql/9ouPyt4Yj61W52iSem2dqOfrc90JPaGldLX37JIVf
   p+tW6xB47OO0JRmoOiHYcl7ISK6zkeg5bXC+3qcO1FQsSh9ssXLx05EPo
   HCnCb92i7/LtXfR3bZkTZeKGe8rm+8rajUIUHeGVQJC/LwmXEStPEi6c1
   LRwaGtRK0VXK1G3JqMvIFKezVekSm6/c0hwTL3ZzWI98ghEwJNiZJWnnU
   2GoFr8QQvHCp3FfoXDKqyj5qMTrg+hhqzW/wfcaee5tu5/+7MFzQnuu+L
   KMZZlKvMunKmOO2Jlw/I7n2niEJNBDMUhUEu4qbXhsgBr+zMu9kydLJ5h
   Q==;
X-CSE-ConnectionGUID: idrnqf/XQxSG0q2Y7GGVLQ==
X-CSE-MsgGUID: 8avWz3ObTRGrv5U6kV+0JQ==
X-IronPort-AV: E=Sophos;i="6.13,222,1732575600"; 
   d="scan'208";a="41203460"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 21 Jan 2025 16:21:32 +0100
X-CheckPoint: {678FBB7C-3-3C670366-E45AD810}
X-MAIL-CPID: 6F83F60AB13049F24B231DC59BAA06AE_4
X-Control-Analysis: str=0001.0A682F28.678FBB7C.0049,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 665BA1636A2;
	Tue, 21 Jan 2025 16:21:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1737472887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l4hYFP3h1arKjsKD8T0roDJ/zeXY7qh2kU6N067sKV4=;
	b=rYLGUiTTKR4sqmzLaX1K1ImmcDKWQlwAgG//JEbok+dvVDPU5MrjCwzeUzM7C7WouN4G3l
	AhWVZPipJWRYoNXuPBU0zwROLSHrERRX7QJ+MK67R5hw0x35W3kOOHG42V6xcLpybnG7nX
	Imiy2HnPS7aWX0whI1n1knBaMNy15/xL2bAqhKdv80TKbfdntsfJh3e6pG/JsRozY41NP1
	i7qMBILzhFxTvxALT5rlJQJlf8sry8UXzSBHktpreutj+0OUXnMYf/QrizeNB0abmeG1Lw
	rKSHWpY3qor5OJmQYf5oct3Pkfb67ROmGcsaHrj5he880XWdfjfNJQgykphX8Q==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v6 2/2] nvmem: imx-ocotp-ele: Support accessing controller for i.MX9
Date: Tue, 21 Jan 2025 16:21:25 +0100
Message-ID: <8513553.T7Z3S40VBb@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250121-imx-ocotp-v6-2-76dab40e13db@nxp.com>
References: <20250121-imx-ocotp-v6-0-76dab40e13db@nxp.com> <20250121-imx-ocotp-v6-2-76dab40e13db@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi,

Am Dienstag, 21. Januar 2025, 16:05:32 CET schrieb Peng Fan (OSS):
> From: Peng Fan <peng.fan@nxp.com>
>=20
> i.MX9 OCOTP supports a specific peripheral or function being fused
> which means disabled, so
>  - Introduce ocotp_access_gates to be container of efuse gate info
>  - Iterate all nodes to check accessing permission. If not
>    allowed to be accessed, detach the node
>=20
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/nvmem/Kconfig         |   3 +
>  drivers/nvmem/imx-ocotp-ele.c | 172 ++++++++++++++++++++++++++++++++++++=
+++++-
>  2 files changed, 174 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index 8671b7c974b933e147154bb40b5d41b5730518d2..77cc496fd5e0e1afd753534b5=
6fe1f5ef3e3ec55 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -93,6 +93,9 @@ config NVMEM_IMX_OCOTP_ELE
>  	  This is a driver for the On-Chip OTP Controller (OCOTP)
>  	  available on i.MX SoCs which has ELE.
> =20
> +	  If built as modules, any other driver relying on this working
> +	  as access controller also needs to be a module as well.
> +
>  config NVMEM_IMX_OCOTP_SCU
>  	tristate "i.MX8 SCU On-Chip OTP Controller support"
>  	depends on IMX_SCU
> diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
> index ca6dd71d8a2e29888c6e556aaea116c1a967cb5f..5ea6d959ce38760eeed44a989=
992fb35c462c0b4 100644
> --- a/drivers/nvmem/imx-ocotp-ele.c
> +++ b/drivers/nvmem/imx-ocotp-ele.c
> @@ -5,6 +5,8 @@
>   * Copyright 2023 NXP
>   */
> =20
> +#include <dt-bindings/nvmem/fsl,imx93-ocotp.h>
> +#include <dt-bindings/nvmem/fsl,imx95-ocotp.h>
>  #include <linux/device.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
> @@ -27,6 +29,7 @@ struct ocotp_map_entry {
>  };
> =20
>  struct ocotp_devtype_data {
> +	const struct ocotp_access_gates *access_gates;
>  	u32 reg_off;
>  	char *name;
>  	u32 size;
> @@ -36,6 +39,20 @@ struct ocotp_devtype_data {
>  	struct ocotp_map_entry entry[];
>  };
> =20
> +#define OCOTP_MAX_NUM_GATE_WORDS 4
> +
> +struct access_gate {
> +	u32 word;
> +	u32 mask;
> +};
> +
> +struct ocotp_access_gates {
> +	u32 num_words;
> +	u32 words[OCOTP_MAX_NUM_GATE_WORDS];
> +	u32 num_gates;
> +	struct access_gate *gates;
> +};
> +
>  struct imx_ocotp_priv {
>  	struct device *dev;
>  	void __iomem *base;
> @@ -131,6 +148,82 @@ static void imx_ocotp_fixup_dt_cell_info(struct nvme=
m_device *nvmem,
>  	cell->read_post_process =3D imx_ocotp_cell_pp;
>  }
> =20
> +static int imx_ele_ocotp_check_access(struct imx_ocotp_priv *priv, u32 i=
d)
> +{
> +	const struct ocotp_access_gates *access_gates =3D priv->data->access_ga=
tes;
> +	void __iomem *reg =3D priv->base + priv->data->reg_off;
> +	u32 word, mask, val;
> +
> +	if (id >=3D access_gates->num_gates) {
> +		dev_err(priv->config.dev, "Index %d too large\n", id);
> +		return -EACCES;
> +	}
> +
> +	word =3D access_gates->gates[id].word;
> +	mask =3D access_gates->gates[id].mask;
> +
> +	reg =3D priv->base + priv->data->reg_off + (word << 2);
> +	val =3D readl(reg);
> +
> +	dev_dbg(priv->config.dev, "id:%d word:%d mask:0x%08x\n", id, word, mask=
);
> +	/* true means not allow access */
> +	if (val & mask)
> +		return -EACCES;
> +
> +	return 0;
> +}
> +
> +static int imx_ele_ocotp_grant_access(struct imx_ocotp_priv *priv, struc=
t device_node *parent)
> +{
> +	struct device *dev =3D priv->config.dev;
> +
> +	for_each_available_child_of_node_scoped(parent, child) {
> +		struct of_phandle_args args;
> +		u32 id, idx =3D 0;
> +
> +		while (!of_parse_phandle_with_args(child, "access-controllers",
> +						   "#access-controller-cells",
> +						   idx++, &args)) {
> +			of_node_put(args.np);
> +			if (args.np !=3D dev->of_node)
> +				continue;
> +
> +			/* Only support one cell */
> +			if (args.args_count !=3D 1) {
> +				dev_err(dev, "wrong args count\n");
> +				continue;
> +			}
> +
> +			id =3D args.args[0];
> +
> +			dev_dbg(dev, "Checking node: %pOF gate: %d\n", child, id);
> +
> +			if (imx_ele_ocotp_check_access(priv, id)) {
> +				of_detach_node(child);
> +				dev_info(dev, "%pOF: Not granted, device driver will not be probed\n=
",
> +					 child);
> +			}
> +		}
> +
> +		imx_ele_ocotp_grant_access(priv, child);
> +	}
> +
> +	return 0;
> +}
> +
> +static int imx_ele_ocotp_access_control(struct imx_ocotp_priv *priv)
> +{
> +	struct device_node *root __free(device_node) =3D of_find_node_by_path("=
/");
> +
> +	if (!priv->data->access_gates)
> +		return 0;
> +
> +	/* This should never happen */
> +	WARN_ON(!root);

Even if you warning something is wrong, aka root =3D=3D NULL, you are still
using it on imx_ele_ocotp_grant_access(). Just return early.

if (WARN_ON(!))
	return -EINVAL;

Best regards
Alexander

> +
> +	return imx_ele_ocotp_grant_access(priv, root);
> +}
> +
>  static int imx_ele_ocotp_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
> @@ -161,14 +254,45 @@ static int imx_ele_ocotp_probe(struct platform_devi=
ce *pdev)
>  	priv->config.fixup_dt_cell_info =3D imx_ocotp_fixup_dt_cell_info;
>  	mutex_init(&priv->lock);
> =20
> +	platform_set_drvdata(pdev, priv);
> +
>  	nvmem =3D devm_nvmem_register(dev, &priv->config);
>  	if (IS_ERR(nvmem))
>  		return PTR_ERR(nvmem);
> =20
> -	return 0;
> +
> +	return imx_ele_ocotp_access_control(priv);
>  }



=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


