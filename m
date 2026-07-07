Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7CE3246F4;
	Tue,  7 Jul 2026 14:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783433503; cv=none; b=UwVc8Gwxfi6vlvelHzIac/Px6f+yBlqStMbsBO2QFFGf/YlYdUnT3J3sqniITMTZC4ZnNeh70yCUiHYFFvt4dYvqekg9zhx+/u+y+bL+x8vtTh4f6M1XqZBcy+zaVum47Ed9J3D2fom8Ttj/1z5rWeOmKkGuaAYky7dVjcjRT3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783433503; c=relaxed/simple;
	bh=zT8Y3SjC2nqXNS/CG/GpMNUJVHow+swr01D5EcTbkdQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JxO/bVhR7B3sT9yv1DVAcpNeUFrr5BcPy0JDgy865eoAe/B9h+deV52ZT7vITYox4v0v5DNmo8nOnvBWHJAQssl0u3DX2U8crArw7z1xpnjy3S81+P4LGSSwAVWvNEqw7XgQdpYleqXn+7TzbkIcVNIIZxpGE3n0V+thtLVtRSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mEFfCV8p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mEFfCV8p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA8C11F000E9;
	Tue,  7 Jul 2026 14:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783433501;
	bh=cJaCu3Jw52AiZ+LxMPFERxVwD1Nes7fUxaczBwh3T6s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mEFfCV8plDwefkSgToR9MrKDDNLnMPJFSrntnFY54/pwPAgoVIHUA54P4xMazqHqL
	 GrZzFzDALdf3oQnX0cZF2w01B4UvkfWga+5bS/kCdIwWw3n+l5Uw93Gq/Y21w6zxLN
	 3hXbHqZJeu0gp7640gZhay46cbj5zyWjMjuvGlxnI+MMcbUBGcObSLmVQhJG1BWJVY
	 oqC6Tzg419k08v/VC4vbm8kxt5/j4bSpR8gKvT1u3Dn4EWjZT9PZuiScgWHjfsgpmX
	 qcoPppoIii8VsSraIIy9xbIbeFc54EVDU9Fhh8vJ/sZVkaOUuECkhYNaPCCFid3ajg
	 O5PkbJ6fnEQMw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v12 7/7] net: stmmac: qcom-ethqos: add support
 for sa8255p
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: Frank.Li@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev, wsa+renesas@sang-engineering.com, robh@kernel.org, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260706-qcom-sa8255p-emac-v12-7-e3ab1ecf2901@oss.qualcomm.com>
References: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
 <20260706-qcom-sa8255p-emac-v12-7-e3ab1ecf2901@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 14:11:40 +0000
Message-Id: <20260707141140.CA8C11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing rejection of unsupported RGMII PHY modes in ethqos_scmi_=
setup()
--

commit c343cb8d359e16483f354f89b27f2cd9e3505850
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

net: stmmac: qcom-ethqos: add support for sa8255p

This commit extends the qcom-ethqos driver to support the sa8255p model,
which handles power management in firmware over SCMI. It adds a new emac
data variant and a separate setup callback.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index f379570f80680..47175670a3263 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
[ ... ]
> @@ -749,6 +775,62 @@ static int ethqos_hlos_setup(struct qcom_ethqos *eth=
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
> +	switch (ethqos->phy_mode) {
> +	case PHY_INTERFACE_MODE_2500BASEX:
> +	case PHY_INTERFACE_MODE_SGMII:
> +		plat_dat->fix_mac_speed =3D ethqos_fix_mac_speed_sgmii;
> +		break;
> +	default:
> +		break;

[Severity: Medium]
Will this silently ignore RGMII and other unsupported PHY modes without
returning an error?

If a misconfigured device tree specifies an unsupported mode like RGMII for=
 an
SCMI-based variant, qcom_ethqos_probe() allows it globally, but this setup
function in dwmac-qcom-ethqos.c will silently fall through the default case
without configuring plat_dat->fix_mac_speed or returning -EINVAL.

Could this leave the interface in a broken state that is difficult to debug,
rather than failing probe explicitly?

> +	}
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-qcom-sa825=
5p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com?part=3D7
