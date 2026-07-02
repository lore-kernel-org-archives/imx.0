Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56AA3E8C67;
	Thu,  2 Jul 2026 09:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985523; cv=none; b=OvA2xobGD/eCEh7tZBqSevKXnVL4qccMVNQuHhgsdXrDZ0B5R2c7zzuP70J1o+EMluvXivf/Lb/2BD0ayBym4mDnaCLdMVb4X7QGZXR8DbJ06rmC73OgcuqgV5uFnza/iHy9P3MYKa7wLDTJtJd78d2WETtoLbnvHN3t0WaFuMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985523; c=relaxed/simple;
	bh=FXQ0J1sUaKEYDNwY9Eaio4lIKbY83SkOjHdb2kkmq/4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q60XvQ2L+OE4+OT4/VdqtKOrhnTZJd4lPVNFP+paBGT59ffjH0yrqL8pi5NYCov3rsXwxgwvbyvuCflW2QakltmwyEXjXfgN/EkysJtIpooMF0VNcaE+NYy+YgTlHi5CP6A/EzXG++pXVgQ4Pak+CK4+q2XvZsbCBoxHqvwWttQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cZzBFjMd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cZzBFjMd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CD0A1F000E9;
	Thu,  2 Jul 2026 09:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782985521;
	bh=4DzRso8YGT4LeBfgQmKZde/DEc5L2unI6guTuPGWCgM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cZzBFjMdF/p2CXWnCzuvLucc+w7OSOo3IRkR0NgzsFcqwji4w98XzgJa0L4vTNw1l
	 KB0BqnuLS50O69WVDWy3e4LiRLEV0d6GKf8eFsA2vE8MSk2IKtYXc8+dZNZZCozLZd
	 X7za/L4pgOH+93rtd0CQZICEDxRzLRjsFRGzihFBhf4Rquu3KGiFlI/QQ2HL6dei2q
	 jq8m40v+xAgzu4xcUkxLdG+xnfnqSf7NDHX7Geg2yFUDWxuXKCwgmlVFZ54B+4/Bjm
	 3yGfcvIhmx4UxgRGKw+TM9MHYngZKDtVH/OzGDBd0eFhl9jlmFp+HZYilgbPDVtbEK
	 35Gfm1F1pysJw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/18] arm64: dts: ti: k3-j721s2: Add overlay for fusion
 application daughter board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yemike Abhilash Chandra" <y-abhilashchandra@ti.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260702093123.1048575-9-y-abhilashchandra@ti.com>
References: <20260702093123.1048575-1-y-abhilashchandra@ti.com>
 <20260702093123.1048575-9-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 09:45:20 +0000
Message-Id: <20260702094521.1CD0A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The commit message claims the overlay can be reused for J742S2, =
but the required device tree combination target is missing from the Makefil=
e.
- [Low] The `csi2_phy0` endpoint definition is missing the `bus-type =3D <4=
>;` property, while the identical `csi2_phy1` endpoint explicitly defines i=
t.
--

commit 38600625d6a88602aa3dc77a7657b2be15b2c563
Author: Vaishnav Achath <vaishnav.a@ti.com>

arm64: dts: ti: k3-j721s2: Add overlay for fusion application daughter board

This patch adds an overlay for the Fusion application daughter board to
connect multiple FPDLink-III based sensors to TI EVMs. The commit message
notes that CSI2RX connectivity on J784S4 and J742S2 is the same as J721S2,
allowing the overlay to be reused.

Link: https://svtronics.com/product/fusion-application-daughter-board-evm57=
7pfusion-v1-0/?srsltid=3DAfmBOooMsRAd5ibFOGJaKbjsC3j9-loTPK2wWqsqPq2Adj55g1=
nPluxX

> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Mak=
efile
> index 350a8b5ad275c..9dd25a21d738e 100644
> --- a/arch/arm64/boot/dts/ti/Makefile
> +++ b/arch/arm64/boot/dts/ti/Makefile
[ ... ]
> @@ -333,6 +336,8 @@ k3-j722s-evm-csi2-quad-tevi-ov5640-dtbs :=3D k3-j722s=
-evm.dtb \
>  	k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
>  k3-j742s2-evm-usb0-type-a-dtbs :=3D k3-j742s2-evm.dtb \
>  	k3-j784s4-j742s2-evm-usb0-type-a.dtbo
> +k3-j784s4-evm-fpdlink-fusion-dtbs :=3D k3-j784s4-evm.dtb \
> +	k3-j721s2-evm-fusion.dtbo

[Severity: Medium]
The commit message mentions the overlay can be reused for J742S2, but should
a build target for k3-j742s2-evm-fpdlink-fusion.dtbs also be added here?

>  k3-j784s4-evm-pcie0-pcie1-ep-dtbs :=3D k3-j784s4-evm.dtb \
>  	k3-j784s4-evm-pcie0-pcie1-ep.dtbo
>  k3-j784s4-evm-quad-port-eth-exp1-dtbs :=3D k3-j784s4-evm.dtb \
[ ... ]
> @@ -400,11 +405,13 @@ dtb- +=3D k3-am625-beagleplay-csi2-ov5640.dtb \
>  	k3-j721e-evm-pcie0-ep.dtb \
>  	k3-j721e-evm-pcie1-ep.dtb \
>  	k3-j721e-sk-csi2-dual-imx219.dtb \
> +	k3-j721s2-evm-fpdlink-fusion.dtb \
>  	k3-j721s2-evm-pcie1-ep.dtb \
>  	k3-j721s2-evm-usb0-type-a.dtb \
>  	k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb \
>  	k3-j722s-evm-csi2-quad-tevi-ov5640.dtb \
>  	k3-j742s2-evm-usb0-type-a.dtb \
> +	k3-j784s4-evm-fpdlink-fusion.dtb \

[Severity: Medium]
Does k3-j742s2-evm-fpdlink-fusion.dtb need to be appended to this list so
the J742S2 combination device tree gets built?

>  	k3-j784s4-evm-pcie0-pcie1-ep.dtb \
>  	k3-j784s4-evm-quad-port-eth-exp1.dtb \
>  	k3-j784s4-evm-usb0-type-a.dtb \
> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-evm-fusion.dtso b/arch/arm6=
4/boot/dts/ti/k3-j721s2-evm-fusion.dtso
> new file mode 100644
> index 0000000000000..f200cdaa1bab1
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-evm-fusion.dtso
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

[Severity: Low]
This isn't a bug, but should this endpoint explicitly define bus-type =3D <=
4>
to remain consistent with how csi2_phy1 configures it below?

> +				clock-lanes =3D <0>;
> +				data-lanes =3D <1 2 3 4>;
> +				link-frequencies =3D /bits/ 64 <800000000>;
> +
> +			};
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
575-1-y-abhilashchandra@ti.com?part=3D8
