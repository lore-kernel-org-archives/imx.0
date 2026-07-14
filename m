Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DB548B362;
	Tue, 14 Jul 2026 15:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784043750; cv=none; b=pIbQm6WkPtABjayqGNwSlH3NQBgAa//rZnbHt8CsrpkZTalh9ydEXS22kuz/FVjeQyOaLj/9qctWRebUQvSn9HBI6RApFbvLNuimldvfVfhrDQuC0pkiNCQ/XngJOBopcFdOrB+ocps0g4Vdcv93OG8hXBg7AKhBE+Awt4SIAbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784043750; c=relaxed/simple;
	bh=ecpEtpd2R9T2OwxwM3wgPDhySyowjD4lLBTDHj/Um1Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DmjvtLkTwnwq+jRRkRT+9NRXm6xlkRmydAPt/LMRexPpsnB7nOnYAtWhC5a4l0oPLSn8g9ZbG6zB6fW4KxJJ1qiV7dIu+ynKGfe6QdDQCwUQMMQI6l9XJqzImeCSaEY8HPI1oxAfdVRF7FUlI3qVEI7cFfr0iv6dvb9p+v1w6co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JaB+BSn1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JaB+BSn1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 110201F000E9;
	Tue, 14 Jul 2026 15:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784043748;
	bh=KzLzlZEIQWdOfOHHccHzIxsuh8r8/GLHQufn8tqIl00=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JaB+BSn1vjJemZtx4BVnFEQqoC1yNc7sTpqpG+DByqrYclrLj47X5LIhBkfbKxNdT
	 5pTP8eIIiVNMIrJ8JA3tDDPe7TJIVyQCB7esrAWnFnTT6mUl29wpgGJlmQZ9cExfjW
	 QjY+Y/t/IN8398nR7LPPLvLrv6Fi2zqRmi818N8dPFhneBqIxieSEDmPu6c+TAO64U
	 OgooZn4VQ7GGQDGLb5e4I0A/eRTqLXm5/yENf/xSoPDzeEgeulUjP/a3GfIhMk7IfJ
	 ZjsDGSdMdaWiyuCHpTCbtWwCT/T77m2moMDTVCDu1ZNtPmgT0KXWzmEXHiTE8atouf
	 hddsmjqFKX6Cw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v13 10/10] net: stmmac: qcom-ethqos: add
 support for sa8255p
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, linux-sunxi@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260713-qcom-sa8255p-emac-v13-10-119f8699ef8e@oss.qualcomm.com>
References: <20260713-qcom-sa8255p-emac-v13-0-119f8699ef8e@oss.qualcomm.com>
 <20260713-qcom-sa8255p-emac-v13-10-119f8699ef8e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 15:42:26 +0000
Message-Id: <20260714154227.110201F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] ethqos_scmi_setup omits manual invocation of ethqos_clks_config(),=
 which prevents MAC wrapper configuration during probe and leads to a DMA r=
eset timeout.
--

--- Patch [10]: [PATCH net-next v13 10/10] net: stmmac: qcom-ethqos: add su=
pport for sa8255p ---
commit b7db35b4f8018859d3fc8937c25d0cfcf6c421f1
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

net: stmmac: qcom-ethqos: add support for sa8255p

Extend the driver to support the sa8255p model, which uses SCMI power
domains. This adds a new emac data variant and a separate setup callback.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 3af1608fc21cc..d34f20f868138 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c

[ ... ]

> @@ -756,6 +788,63 @@ static int ethqos_hlos_setup(struct qcom_ethqos *eth=
qos,
>  	return 0;
>  }
> =20
> +static const char *const ethqos_scmi_pd_names[] =3D { "core", "mdio" };
> +
> +static int ethqos_scmi_setup(struct qcom_ethqos *ethqos,
> +			     struct plat_stmmacenet_data *plat_dat)
> +{

[ ... ]

> +	/*
> +	 * Run on every runtime resume, which stmmac performs after the power
> +	 * domains are on but before serdes_powerup() and the DMA reset, so the
> +	 * wrapper is always configured ahead of the reset.
> +	 */
> +	plat_dat->clks_config =3D ethqos_clks_config;

[Severity: High]
Does this code need to explicitly call ethqos_clks_config() during probe?

The stmmac core brings the device out of suspend using pm_runtime_set_activ=
e()
during probe, which only updates the PM status but does not invoke the
runtime_resume callback. Without manually calling ethqos_clks_config() here,
will the wrapper clocks remain disabled and cause a DMA reset timeout?

> +	plat_dat->clk_ptp_rate =3D ethqos->data->ptp_clk_rate;
> +
> +	switch (ethqos->phy_mode) {
> +	case PHY_INTERFACE_MODE_2500BASEX:

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713-qcom-sa825=
5p-emac-v13-0-119f8699ef8e@oss.qualcomm.com?part=3D10
