Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50C82D7398;
	Fri, 21 Aug 2026 15:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787326042; cv=none; b=JnBpHzjSHGw9sJKjkMLQOAm9TJK3cm/899xdZCnffW4HIfvKUPsWwgv5LD6ZjN0KQn+ixlwgHh3CXGEUCymPV/a+t63J8MU4MzqhZXArazrHUrWrduou1zJ2F8e/OUmnL1+NBoqqihLLghm2c/dD/0+8Y7PS1lzi7RiHPtc0hIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787326042; c=relaxed/simple;
	bh=TupuwdvvxEsbS1wFHF0rJwKKe2e91Q3drvO1LcGxE9s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eHXQKTnippffc1TClQyRzsWZ5luGvNnJG2AaEOrOnB1/lh/C8iGanNLKZGkyc4z7YADbgax0652KVG/pVy6Kzccw0eAIFlE0RxGvF2aJGdlV992OocVnDTrgD6TkLApvda6PptdqBVa1UvHUcTQPUbFYhrANs+E6sCFuXsa7aow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IKXf65x0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IKXf65x0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41E1D1F000E9;
	Fri, 21 Aug 2026 15:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787326040;
	bh=LFmoWs50goC2h7HSIsoTGwYdG5uN4AfpUPNwy67rdDc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IKXf65x0umGpMgZOj2aGA2rYdapdI/J8zTRMiXrqJ27Ko6p5sUfV90x7o/khIcEfw
	 l9cDDjh0aJYf9LAQJF5cV+b6dCDA8fE/cpZO9BKJYaGdukIUL5V96iYg21swWHZ6Uo
	 oThDB4Cili5kI9oqJMxcAsCw6qkubrJefM/c5ZTbnEW6NkzCwUOkKQ/dgMPzH88iat
	 qAl46dTPHj6u3YZDVu0R/23IAHJbT2TDtWbf3N5ymGpkE84W3yN+6i4DP8qMze0Sgx
	 G7FsT9b9sDcmHBBvG9wssJ6eLGYy3aXuvs8AeR5OW/znsC8muyA2j4d17Q0aFXxptf
	 Bc+GfXER6iVCA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: imx8qm-ss-conn: Add USB HSIC related
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Franz Schnyder" <fra.schnyder@gmail.com>
Cc: robh@kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260821-add-apalis-imx8-usbhsic-v1-1-fb93d73ead44@toradex.com>
References: <20260821-add-apalis-imx8-usbhsic-v1-0-fb93d73ead44@toradex.com>
 <20260821-add-apalis-imx8-usbhsic-v1-1-fb93d73ead44@toradex.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 15:27:19 +0000
Message-Id: <20260821152720.41E1D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Invalid and spurious use of the `#stream-id-cells =3D <1>;` propert=
y on a USB controller node.
--

--- Patch [1]: [PATCH 1/2] arm64: dts: imx8qm-ss-conn: Add USB HSIC related=
 nodes ---
commit 3f8b073ab02e59ddadf748e8d5c304f634b67d3b
Author: Franz Schnyder <franz.schnyder@toradex.com>

arm64: dts: imx8qm-ss-conn: Add USB HSIC related nodes
   =20
This commit adds the required nodes to support the iMX8QM/QP USB HSIC host
controller.

[ ... ]
> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi b/arch/arm=
64/boot/dts/freescale/imx8qm-ss-conn.dtsi
> index ccf9f510e0f88..168f89eebeedb 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
> @@ -4,6 +4,32 @@
>   *	Dong Aisheng <aisheng.dong@nxp.com>
>   */
> =20
> +&conn_subsys {
> +	usbh1: usb@5b0e0000 {
> +		compatible =3D "fsl,imx7ulp-usb", "fsl,imx6ul-usb", "fsl,imx27-usb";
> +		reg =3D <0x5b0e0000 0x200>;
> +		interrupt-parent =3D <&gic>;
> +		interrupts =3D <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
> +		phy_type =3D "hsic";
> +		dr_mode =3D "host";
> +		fsl,usbphy =3D <&usbphynop2>;
> +		fsl,usbmisc =3D <&usbmisc2 0>;
> +		clocks =3D <&usb2_lpcg IMX_LPCG_CLK_6>;
> +		ahb-burst-config =3D <0x0>;
> +		tx-burst-size-dword =3D <0x10>;
> +		rx-burst-size-dword =3D <0x10>;
> +		#stream-id-cells =3D <1>;

[Severity: Low]
Does this code introduce a dt-bindings validation failure?=20

The usbh1 node defines #stream-id-cells =3D <1>;, which is a legacy ARM SMMU
property meant for master buses. The chipidea,usb2 dt-bindings specify
unevaluatedProperties: false and do not include #stream-id-cells, resulting
in a dtbs_check validation failure.

> +		power-domains =3D <&pd IMX_SC_R_USB_1>;
> +		status =3D "disabled";
> +	};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821-add-apalis=
-imx8-usbhsic-v1-0-fb93d73ead44@toradex.com?part=3D1
