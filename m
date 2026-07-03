Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC0F37C92D;
	Fri,  3 Jul 2026 08:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783069016; cv=none; b=odT+PndneaZc94sPgGfaQrr2iatmUtYpRG66aDYzrjiG1dHTY9teQDf8xvK9/kGjOMUXMfiDokW3YvvrDkq259dUBDjV0oY4zyqddQCZNhFm/h7lNDchVLgAWQNiTjcm9Gq5OgR1PZXmknn90uWnOlr+paJDSYojPkJa5FDs2hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783069016; c=relaxed/simple;
	bh=Z5CytSAUPOMVeHdYH7UgTDHFRLQqdq4Oe+AOvYKVAck=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l+0zcoYDsVHNeJVrjkzSIaBFIjuCQ9yhp/K2GorBZuzpoHpaoodueqAfDdbnlhvWzit+QVZOexF31DC8PkDLC3oJakol3vS2xdtpwrDFgxWzeBcPcpsuqqxIU7lFQ7Ik1/XPU185I6NsjljnVsvfpg4oTFdU3Xoa5hN/EUT9b5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TFlahi9T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TFlahi9T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 053431F000E9;
	Fri,  3 Jul 2026 08:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783069015;
	bh=ZVHutPho44JIPnGrpI2vjRUFz7/vvSWKjKU2NoAfNEc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TFlahi9TNNVDOUQKlcjsO1bP+mPnHxaL+9+PrlxqfgoTS1KyuBRWRGo1lgRDHI1iZ
	 KxSpMr0COyzLgRSItDb87kBgx93na0d8+jdi8dc1X6Gf76hr2e45pKJK8zak6VADFV
	 pMm3cTRjG5f3NNE9sbI8DIUlti/lTLbACD4mcoWACPFhRML22NgNjN5QAxZ0AQpMTh
	 q7H8IMyLfbSk0Wt+qRmeMz2i2O2hRg28OKSXVyd04/qj/prFlc+4NLHD/YiWVpktfn
	 jypHMvS6d0wXnOpdw2kk+P0xuBEE6G+cc2vcv0WX4Px437rRD4ZcjnHaIb6d9aiwRh
	 MFNOCiijkPbQg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 09/15] arm64: dts: freescale: imx8mn-var-som: enable
 FlexSPI interface
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <858f10730612e0225b69257eef833c3b84052ded.1783067947.git.stefano.r@variscite.com>
References: <cover.1783067947.git.stefano.r@variscite.com>
 <858f10730612e0225b69257eef833c3b84052ded.1783067947.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 08:56:54 +0000
Message-Id: <20260703085655.053431F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The FlexSPI controller is enabled in the SOM `.dtsi` without a c=
orresponding flash memory child node, preventing flash access and forcing p=
inmux usage on all carrier boards.
--

commit c172727bc2bd192187db0f36d293f9c48809f6e4
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: freescale: imx8mn-var-som: enable FlexSPI interface

This commit enables the FlexSPI controller on the VAR-SOM-MX8MN and configu=
res
the corresponding pin multiplexing.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm=
64/boot/dts/freescale/imx8mn-var-som.dtsi
> index 0abc2d33e7118..259d9f36f8a32 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
> @@ -176,6 +176,12 @@ ethphy: ethernet-phy@4 {
>  	};
>  };
> =20
> +&flexspi {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_flexspi0>;
> +	status =3D "okay";
> +};

[Severity: Medium]
Is this missing a child node for the flash device (e.g., flash@0)?

If the QSPI flash is physically located on the SOM, the kernel won't be able
to probe or access it without the child node defined in this tree.

Alternatively, if the flash is intended to be located on the carrier board,
does globally enabling the controller and its pinmux in the SOM's .dtsi
prevent other carrier boards from repurposing these pins if they do not use
FlexSPI?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783067947.gi=
t.stefano.r@variscite.com?part=3D9
