Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EBB419312;
	Tue, 30 Jun 2026 13:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782826069; cv=none; b=csgP84dP4YpYvXLNi2xbn6JDaxWy6NC7vmnaVjEoFXkVEywSaPjJroDuTb6yO//HncRoGhXXU2Fd6ltZl+HC+pZX1I+vK+8GsffUonmBFghU3nCNqpVUaAwnIPrriMFB5wPm/D2FwB4SQIuU1jc/1q+S1IJhbyAnl03Io92pphk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782826069; c=relaxed/simple;
	bh=O4ZOIBqgTCTGCaauOcbP6nlKwtDthgcddUKMleoVxoU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IMF8U8lMw8/JQrQlgwEQ8zOrwDcaUX1OqJfC2o1X/O7a3W/w0K2xOoPCBnWkg18ttpAyaLUeJzBTHdMR1sPEzVSeTpSq8QxFNOO9oj+bVY9uPaGG2kdyJ/s/cYErDhAMXYKk3xhr9+sdtcUcMGCjKpnvjeBLkUzziTL9mvYSPqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NrKvkU6a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NrKvkU6a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EED71F00A3A;
	Tue, 30 Jun 2026 13:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782826067;
	bh=AYTh4JEcfVOC5woeIWj/5cORPnamgipv1avWKOLDEEY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NrKvkU6aILmS3bXQOuYI/cwoG2xS7Mm6woTvS+GCU/+b0i0OWioIXttI6wfq5izHn
	 u2xqHoVLxfM/2LB8RnrFnVAChiA2umCaqDWm8nVgB4s8Ya7bM4ZU6XDR2S79DVWKdv
	 Fm0unsfmZ2z7CQcvirkQXfenCJdjuVeqpLR61zX5ey9GaYwPnXY7Iz5rZHZbFEoQEc
	 zjXNIho4Gm1vTb7VAIX+bjrWNMgmPR6uh6Yt9yMiMmPxRSLZC0Xr6Hf+aFR/VklS4Y
	 W4RbqpnQssny9MvnM47uC/wBwOZiymRthULrQBH24zWX8C6OoV2JeNu8n2M89G65gm
	 7H+/msLxxp8Eg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v11 3/7] dt-bindings: net: qcom: document the
 ethqos device for SCMI-based systems
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: neil.armstrong@linaro.org, wsa+renesas@sang-engineering.com, linux-amlogic@lists.infradead.org, Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260629-qcom-sa8255p-emac-v11-3-1b7fb95b51f9@oss.qualcomm.com>
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
 <20260629-qcom-sa8255p-emac-v11-3-1b7fb95b51f9@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 13:27:46 +0000
Message-Id: <20260630132747.0EED71F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The SCMI PHY driver fails to apply its power domain performance st=
ate dynamically when `phy_set_mode` is called on an already powered-on PHY,=
 causing link speed to stall.
- [Medium] Device tree bindings missed update for `power-domains` maxItems =
constraints, allowing 2 power domains on hardware variants that only suppor=
t 1.
--

commit 53c301c3f426ecddb2b45080a9a52eeda51a523e
Author: Bartosz Golaszewski <brgl@kernel.org>

dt-bindings: net: qcom: document the ethqos device for SCMI-based systems

Describe the firmware-managed variant of the QCom DesignWare MAC. As the
properties here differ a lot from the HLOS-managed variant, lets put it
in a separate file. Since we need to update the maximum number of power
domains, let's update existing bindings referencing the top-level
snps,dwmac.yaml and limit their maxItems for power-domains to 1.

> diff --git a/Documentation/devicetree/bindings/net/qcom,sa8255p-ethqos.ya=
ml b/Documentation/devicetree/bindings/net/qcom,sa8255p-ethqos.yaml
> new file mode 100644
> index 0000000000000..5158481e5e5b0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/qcom,sa8255p-ethqos.yaml
[ ... ]
> +  phys:
> +    maxItems: 1
> +
> +  phy-names:
> +    items:
> +      - const: serdes

[Severity: High]
The SCMI PHY driver fails to apply its power domain performance state
dynamically when phy_set_mode is called on an already powered-on PHY. Will
this cause the link speed to stall?

If a link negotiates 2.5Gbps dynamically via phylink, but the PHY was
originally powered on in 1Gbps SGMII mode, the link speed stalls at 1000Mbps
because the PHY's SCMI performance state is not elevated to SPEED_2500.

The performance state is stored but not applied if the device is already
powered on:

drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c:qcom_dwmac_sgmii_phy_scmi_se=
t_mode() {
    ...
	priv->perf_state =3D (submode =3D=3D PHY_INTERFACE_MODE_2500BASEX) ?
			   SPEED_2500 : SPEED_1000;

	return 0;
}

The state is only sent to the GENPD core during power on, which executes too
early to capture runtime 2.5Gbps mode transitions:

drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c:qcom_dwmac_sgmii_phy_scmi_po=
wer_on() {
    ...
	ret =3D dev_pm_genpd_set_performance_state(dev, priv->perf_state);
    ...
}

This is triggered when phylink resolves the speed and invokes phy_set_mode_=
ext
on the already powered-on PHY:

drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c:ethqos_mac_finish_s=
erdes() {
    ...
		ret =3D phy_set_mode_ext(ethqos->serdes_phy, PHY_MODE_ETHERNET,
				       interface);
    ...
}

> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Docu=
mentation/devicetree/bindings/net/snps,dwmac.yaml
> index 2449311c6d28e..d3aff1df3070d 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
[ ... ]
> @@ -185,7 +186,8 @@ properties:
>            - const: ahb
> =20
>    power-domains:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2

[Severity: Medium]
When the common schema is relaxed to allow 2 power domains here, it affects
all dependent schemas that reference it. Could this unintentionally allow
maxItems: 2 in spacemit,k3-dwmac.yaml and nuvoton,ma35d1-dwmac.yaml?

These schemas reference snps,dwmac.yaml# in their allOf block but lack a
power-domains constraint override:

Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
allOf:
  - $ref: snps,dwmac.yaml#

Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
allOf:
  - $ref: snps,dwmac.yaml#

Since they only support 1 power domain, dt_binding_check might now
incorrectly pass device trees specifying two power domains for these
hardware variants.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-qcom-sa825=
5p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com?part=3D3
