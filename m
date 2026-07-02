Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0277B3368A2;
	Thu,  2 Jul 2026 09:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985627; cv=none; b=R+oUsjdzRay2Cy79nMPF7UboAASiMIW9s352Bml+Dg6gmt5F/6luP6vx6PvW+2dYnYFmp6wKgrTdreNH6Vop0WmKE+dLJ6EL1VpPiRriU7BKPU5Cf6RPi9n6FRNuDoH0uI0uOu+6b5LyF7jFdpKcw/un5Svhbh7KDBaOkYTV94w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985627; c=relaxed/simple;
	bh=6iXVgONTwhgqMxN2GVHdDi0p5yvbCUmSkOnHLUnT3aY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=vBCGFfmIOo7YyoB6/AULajghyH2bcVzM3EGtd+0cgInG0twdN1wUNcVnsc4OYkC5uiJgGRo/EgVo2ObhUme311NhrXJlZvuNceWbRTmP5o1KjKXtR0TSD/7q9HW+RxQ//6rgTEnDRogvWcMCMHuIHRgzQQvWub8s96U6ufJZjmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fYp5wMzP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fYp5wMzP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8035E1F000E9;
	Thu,  2 Jul 2026 09:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782985625;
	bh=J5pD3h5SfTHnJUVBHbQSpp/4MpRN45lwjHDR+azgb6U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fYp5wMzPUwhK5ZDh4JZKTsd9M9Z9IAqcuRHgj4lIhOcNuu5aVrPZr0iYOH0CfbZ3o
	 gQYwTM1M9xlzUQrGtsXsALfBvGudiTew0Kr+8jbNRl88LjqWKOISvKR8lbPn4OpRXg
	 5VCrTbkbU4K90HRPlYVeblTfweltNL7oqeLHSloFWtw1m/E/lHhQ9Gp04pKaFXX0Cj
	 V9TJ7TUBDTKUg+cfC7WWW8iZkNXgMNjSrwyFpxEPuyVcHgD0gzHbNIfNOeuDa+LP6p
	 E65L+sjoAqwEdYlH0fu9njheVBge8Dq2QSQ16SaCXeaFP7Qld5FAELJscTqzkmSsX/
	 zSHUvXO6kHNDA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/18] arm64: dts: ti: k3-j721e: Add overlay for fusion
 application daughter board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yemike Abhilash Chandra" <y-abhilashchandra@ti.com>
Cc: Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260702093123.1048575-8-y-abhilashchandra@ti.com>
References: <20260702093123.1048575-1-y-abhilashchandra@ti.com>
 <20260702093123.1048575-8-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 09:47:05 +0000
Message-Id: <20260702094705.8035E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing `bus-type` property in `csi2_phy0` endpoint for `cdns_csi2r=
x0`.
--

commit c46b85eb404e26671d904b1552f797a50e25e19d
Author: Vaishnav Achath <vaishnav.a@ti.com>

arm64: dts: ti: k3-j721e: Add overlay for fusion application daughter board

This patch adds a device tree overlay for the Fusion application daughter
board, which connects multiple FPDLink-III based sensors to TI EVMs. It
configures two DS90UB960 deserializers that aggregate input from up to 8
sensors over the two CSI RX ports on the J721E.

[1]: https://svtronics.com/product/fusion-application-daughter-board-evm577=
pfusion-v1-0/?srsltid=3DAfmBOooMsRAd5ibFOGJaKbjsC3j9-loTPK2wWqsqPq2Adj55g1n=
PluxX

> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-evm-fusion.dtso b/arch/arm64=
/boot/dts/ti/k3-j721e-evm-fusion.dtso
> new file mode 100644
> index 0000000000000..0df2e48a4089c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-evm-fusion.dtso
[ ... ]
> +&cdns_csi2rx0 {
> +	ports {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		csi0_port0: port@0 {
> +			reg =3D <0>;
> +			status =3D "okay";
> +
> +			csi2_phy0: endpoint {
> +				remote-endpoint =3D <&ds90ub960_0_csi_out>;
> +				clock-lanes =3D <0>;
> +				data-lanes =3D <1 2 3 4>;
> +				link-frequencies =3D /bits/ 64 <800000000>;
> +
> +			};

[Severity: Low]
Does the csi2_phy0 endpoint need an explicit bus-type property?

While device tree parsing will likely fall back to V4L2_MBUS_CSI2_DPHY
automatically because clock-lanes and data-lanes are present, the
bus-type =3D <4>; property is missing here.

This creates a minor inconsistency with the identically structured
csi2_phy1 endpoint just below it, which explicitly defines the bus type.

> +		};
> +	};
> +};
> +
> +&cdns_csi2rx1 {
> +	ports {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		csi1_port0: port@0 {
> +			reg =3D <0>;
> +			status =3D "okay";
> +
> +			csi2_phy1: endpoint {
> +				remote-endpoint =3D <&ds90ub960_1_csi_out>;
> +				bus-type =3D <4>; /* CSI2 DPHY */
> +				clock-lanes =3D <0>;
> +				data-lanes =3D <1 2 3 4>;
> +				link-frequencies =3D /bits/ 64 <800000000>;
> +			};
> +		};
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702093123.1048=
575-1-y-abhilashchandra@ti.com?part=3D7
