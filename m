Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A37389460;
	Mon, 18 May 2026 06:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779085942; cv=none; b=tQYC6DsWeoKtOjIhbzudE9QhPMdoTkWaWkqmWcbMYHCR+6uHyZPz+zBKw1jPteHYKBFnu2MgYIZjrUQhen5/CB0nE4DzmyEokG7XQGutfCkk1IqJbXWrdnuT67YvLNKhOISOxaBL+8WLlEHOSPtWbRBqy0MwG8GB2nINZrnHTHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779085942; c=relaxed/simple;
	bh=0D59t6CjDv8lPZhBPra8aK4GgZlN83YWo4X2cORBpx4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=A9ECVTrCSvB2ELm0ukuu7Hc4Q8vCcGeoF05ZtieEesRQq1lbrgYqfAdQpIYIGnLhTm8+sEPVPO+pxJv+wob29Cf/pNNRTlW7C87SQbUlvG/PpulI2aFKZWAXFutqo4+ihVL7GFdies1PPrnxfNBbWKb/hCEXBiO1bid5GBl3uHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iqZ62jGE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iqZ62jGE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5730CC2BCB7;
	Mon, 18 May 2026 06:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779085941;
	bh=0D59t6CjDv8lPZhBPra8aK4GgZlN83YWo4X2cORBpx4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=iqZ62jGEnUyWlfUzv7npRhgxx9nPLrZWoA+yz36rxHydidvdniCofKikaiSoiGx/K
	 GYZOuoe8M/5NLmuxv4edp/lbB56JcNs+fjMDZVRmdCrrerSGo6LmM4jbUNMmoKhm9u
	 gz7lrDCS/BRqZgtIdRYorOOvei9RSdu+s//ZUUAxKNQ9Dl89gT27t6dP3i7MI00jgD
	 L/A6wD4a13oj79HEUmyaB7zWoSb0xpC2HuBuEjX8U9wgpvGOnSWPk3RQ5ZHZpq2flU
	 P4WcCyykw5YFhu9l6qJQoKCN0aQZzLd5ykpe83jdpszMImfYm5AzOd2iiLGGOhZXP1
	 8dIpTEkzQIPTg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: Add usbphynop and usbotg pinctrl for
 S32G platforms
Reply-To: sashiko-reviews@lists.linux.dev
To: "Khristine Andreea Barbulescu" <khristineandreea.barbulescu@oss.nxp.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260518061522.2884441-2-khristineandreea.barbulescu@oss.nxp.com>
References: <20260518061522.2884441-2-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 06:32:20 +0000
Message-Id: <20260518063221.5730CC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The `&usbotg` node uses the undocumented `fsl,usbphy` property, =
which will cause `dtbs_check` validation to fail.
- [Low] Device tree node names use underscores instead of hyphens and do no=
t follow generic naming conventions.
--

commit 009a8765a0c4d65ac0ce298f231d2203b966088a
Author: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.c=
om>
arm64: dts: Add usbphynop and usbotg pinctrl for S32G platforms

This commit adds a usb-nop-xceiv node and pinctrl configurations for the
usbotg interface on S32G2 and S32G3 platforms. It enables the USB controller
to reference the generic PHY and configures pin multiplexing.

> diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi b/arch/arm64=
/boot/dts/freescale/s32gxxxa-evb.dtsi
> --- a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi

[ ... ]

> +/ {
> +	usbphynop: usbphynop {

This isn't a bug, but does the usbphynop node name follow the devicetree
specification's generic names recommendation? Would a standard class name l=
ike
phy or usb-phy be more appropriate?

> +		compatible =3D "usb-nop-xceiv";
> +		#phy-cells =3D <0>;
> +	};
> +};
> +

[ ... ]

> +
> +	usbotg_pins: usbotg_pins {
> +		usbotg_grp0 {

Are these underscores in the node names intentional?=20

The devicetree specification mandates using hyphens instead of underscores
for node names, and compiling with dtc warnings enabled will produce warnin=
gs
here. Should these be named usbotg-pins and usbotg-grp0, along with the
other usbotg_grp nodes?

> +			pinmux =3D <0x3802>, <0x3812>,
> +				<0x3822>, <0x3832>,

[ ... ]

> +&usbotg {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&usbotg_pins>;
> +	fsl,usbphy =3D <&usbphynop>;

Will this fsl,usbphy property cause dtbs_check validation to fail?

The S32G platforms use the nxp,s32g2-usb compatible string, which is valida=
ted
by Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml. That schema
specifies unevaluatedProperties: false and does not define the legacy
fsl,usbphy property.

Would using the standard phys property (phys =3D <&usbphynop>;) work instea=
d,
as it is automatically parsed as a fallback by the ci_hdrc_imx driver?

> +	status =3D "okay";
> +};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518061522.2884=
441-2-khristineandreea.barbulescu@oss.nxp.com?part=3D1
