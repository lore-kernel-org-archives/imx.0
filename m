Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1A7383310;
	Tue,  7 Jul 2026 14:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783433499; cv=none; b=f3sCzK+XkTQvNNZwdELUo8SaqcnEDsRbjjULKDYB7+yJEO/9QUQqAxfpus1bMk5rolxo8WJ7BBkez3WKxmYDP+miZjkkR26gLW+p5DbWxfhsTT9s7WqJLUkQg4/LWHKXp2/R3DlxeQ7IvIQh35ztuPhCbeBPrMAv9ZWf71meJIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783433499; c=relaxed/simple;
	bh=qKAmug+HfAmeMQQjw4jr6547Icst8f/y+UIGjYKsPiY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lLybrSHaJXgMw49DJIoTkevyvu7+F5xIVUKYcN2JPbbPRXQlpmCx/WDbv48G3Ck80tLFAuFfg3TZqiK76/9aIHBhTKHYlu516qNgQEGuUH9rO5XX2b/02AtCBgOigPLD4GS9nDNGaWBtYzHC9YvFUPrVK8BBWwsBC2cU0GbOW3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VVQLAHYL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VVQLAHYL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 943421F000E9;
	Tue,  7 Jul 2026 14:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783433496;
	bh=nm0y0ggHgyoSIFEw/puAOvt8d3BgJyeQmpoK6IqR2TI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VVQLAHYLitZPOD6hz4ljD9bztAdGMzeyKCguU8ZNikNhGPg/habFh1ZqwmeiwAm8A
	 gU+/FtTNIcwYgbJQDC2+cChk9FmDTdehA+USeLYIoz2r2lc2pkmquvse91dTDknMRT
	 8Kj+AwMDNQLdjDlBUVQuSdfjqZ+yNBeH0ubpaOgUMbhdsnoAjIsPmNpV5OS/YlMmAd
	 LZtemV3Qiu7TEAdUkDca8k4xKnSkj5+QKj5Ne3I4R+nFp8Mja4joPmjyUp/+abd5VU
	 uCVFtFKt9LvjIkE88bSpbok8vCiS8p6uIpoDtAKr2su1iMfuq+Zo5hA0LEAWTKeNl3
	 IpNDONfZMLOVg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v12 1/7] dt-bindings: phy: document the serdes
 PHY on sa8255p
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, robh@kernel.org, linux-sunxi@lists.linux.dev, neil.armstrong@linaro.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260706-qcom-sa8255p-emac-v12-1-e3ab1ecf2901@oss.qualcomm.com>
References: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
 <20260706-qcom-sa8255p-emac-v12-1-e3ab1ecf2901@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 14:11:35 +0000
Message-Id: <20260707141135.943421F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `power-domain-names` property lacks a string value constraint, =
allowing arbitrary strings to pass validation.
--

commit da2d01b0c5abee156fdc9bf1e261e5789a2c6fb7
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

dt-bindings: phy: document the serdes PHY on sa8255p

Describe the SGMII/SerDes PHY present on the Qualcomm sa8255p platforms.
This is essentially the same hardware as sa8775p rev3 but the PHY is
managed by firmware over SCMI.

> diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgm=
ii-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmi=
i-phy.yaml
> new file mode 100644
> index 0000000000000..9e846e3815555
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.=
yaml
[ ... ]
> +  power-domains:
> +    maxItems: 1
> +
> +  power-domain-names:
> +    maxItems: 1

[Severity: Low]
Does this property need a string value constraint?=20

The current schema limits the array length but allows arbitrary strings to =
pass
schema validation. Should it include an items list with a const value, such=
 as
const: serdes, to match the usage in the example?

> +
> +  "#phy-cells":
> +    const: 0

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-qcom-sa825=
5p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com?part=3D1
