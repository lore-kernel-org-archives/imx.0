Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F2847DF9B;
	Thu,  2 Jul 2026 10:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782986656; cv=none; b=kxGr3G/agvsvoCYJa0hEFmTVLgp6i+WLenApdyshOCQGCLxWxF1BFUNG/qm6zwey3XYF5HWs2NaONu6g2BZ7RjIv/DU9ssBp7r1yw0RrInQxSIMJ7EmQMicJi6XrM8Qxr9g2/i7HLkdtHAmEVpCUoaXonEfG97Ka6mj9NgaoNVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782986656; c=relaxed/simple;
	bh=ZRGpjkJ93shwUISXhW252f+zLVenavzxC/zBbhFez3M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=I3yi3B9etvA65cy6QnIYz0J7yxXHSlBHje3e2rJp+o26y6gnT68nrV+GjzAE5kL0wISyYMeyIQ4cUEgNMjUGrbqO56gAigytHvtTlvul+v2swtZRDlR76oFvbvhb8coMLxbgweBSz9vtyiSIJDudglq5D1XDzJkIlnuS6fWHHmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VglY5scX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VglY5scX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A19D91F000E9;
	Thu,  2 Jul 2026 10:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782986654;
	bh=WQaF7rTVqSHSrYtPJmSms0JLoNisFqAbqetnMdl8guc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VglY5scXrhUwu5Ctk7gRV/tq5ZU0TfCwD2O7TfS5BM6ts9Udc6RZRJZjtn9KCZ4ih
	 INWV/34XL6T0LZlqLPwbHioTL1QKi4MerLyi1mgewI8cOr5GkpAtFM375KnW7o/Wyj
	 eAWSWCkE5j0Z6ZW7Iqig9VoB5Y8Ne9WYzC9WTRoBMiz9Dl2omB1YmRf6gq+BUDo7Y7
	 iDInsWXxP2X7/DCviDH2H9PcY43MJQtHfSOuM5I6wC/ayafe9ad2K+vNE5bQM8bq3a
	 1i6DZTZVCMjWFfSOdtc2ySSVEY3VkZTMqx5r5tuA3iy3aBDS9XYXf5Tv0bsR35N+Ml
	 sUdVXaxEjoZ2A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 17/18] arm64: dts: ti: k3-v3link: Add overlay for
 IMX219+UB953 serializer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yemike Abhilash Chandra" <y-abhilashchandra@ti.com>
Cc: imx@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260702093123.1048575-18-y-abhilashchandra@ti.com>
References: <20260702093123.1048575-1-y-abhilashchandra@ti.com>
 <20260702093123.1048575-18-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 10:04:12 +0000
Message-Id: <20260702100413.A19D91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The device tree overlay extends `port@0` of the deserializer but f=
ails to override its `status =3D "disabled"` property to `"okay"`.
- [Medium] The Makefile edits replace the generic V3Link fusion board DTB t=
argets with camera-specific IMX219 targets, removing the ability to build t=
he base fusion board device tree.
- [Medium] Fixed regulators for the IMX219 sensor are defined in the root n=
ode with generic names, which will cause collisions if multiple cameras are=
 connected.
- [Low] The clock node name `imx219-xclk-00` does not conform to the `fixed=
-clock` binding schema.
--

commit a4f2bcb00cd6e7f16649b1b005247013f5bca8a0
Author: Jianzhong Xu <xuj@ti.com>

arm64: dts: ti: k3-v3link: Add overlay for IMX219+UB953 serializer

Arducam V3Link camera solution is shipped with an UB953 serializer
and an IMX219 sensor. Add an overlay for interfacing the UB953 serilaizer
and IMX219 sensor with the RX0 port on the UB960 deserializer.

Link: https://docs.arducam.com/V3Link-Camera-Solution/V3Link-Camera-Solutio=
n-on-TI-Platform/Introduction/

> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Mak=
efile
> index 824acb0d8ee3c..c8e29fdbe37f5 100644
> --- a/arch/arm64/boot/dts/ti/Makefile
> +++ b/arch/arm64/boot/dts/ti/Makefile
[ ... ]
> @@ -318,16 +321,18 @@ k3-am68-sk-base-board-pcie1-ep-dtbs :=3D k3-am68-sk=
-base-board.dtb \
>  	k3-am68-sk-base-board-pcie1-ep.dtbo
>  k3-am68-sk-fpdlink-fusion-dtbs :=3D k3-am68-sk-base-board.dtb \
>  	k3-j721e-sk-fpdlink-fusion.dtbo
> -k3-am68-sk-v3link-fusion-dtbs :=3D k3-am68-sk-base-board.dtb \
> -	k3-am68-sk-v3link-fusion.dtbo
> +k3-am68-sk-v3link-fusion-imx219-dtbs :=3D k3-am68-sk-base-board.dtb \
> +	k3-am68-sk-v3link-fusion.dtbo \
> +	k3-v3link-imx219-0-0.dtbo

[Severity: Medium]
Does replacing these generic V3Link fusion board DTB targets instead of
appending new ones break the ability to build the base fusion board device
tree?=20

It appears users relying on the generic fusion board DTB to attach different
types of camera modules will no longer have those generic targets generated.

[ ... ]
> diff --git a/arch/arm64/boot/dts/ti/k3-v3link-imx219-0-0.dtso b/arch/arm6=
4/boot/dts/ti/k3-v3link-imx219-0-0.dtso
> new file mode 100644
> index 0000000000000..049438f9fc898
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-v3link-imx219-0-0.dtso
> @@ -0,0 +1,127 @@
[ ... ]
> +&{/} {
> +	clk_imx219_fixed_00: imx219-xclk-00 {

[Severity: Low]
Does the node name imx219-xclk-00 conform to the fixed-clock binding schema?
It looks like this might trigger a dtbs_check warning and should perhaps be
named clock-imx219-00 instead.

> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <24000000>;
> +	};
> +
> +	reg_2p8v: regulator-2p8v {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "2P8V";

[Severity: Medium]
Will these generic regulator node and string names cause collisions if mult=
iple
cameras are connected?

If another similar overlay is applied for a second port, would it merge the
identical node names or fail to register due to a duplicate regulator-name?
Could these include port-specific suffixes like regulator-imx219-0-0-2p8v?

> +		regulator-min-microvolt =3D <2800000>;
> +		regulator-max-microvolt =3D <2800000>;
> +		regulator-always-on;
> +	};
[ ... ]
> +&deserializer_0_ports {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +
> +	/* FPDLink RX 0 */
> +	port@0 {
> +		reg =3D <0>;
> +
> +		ub960_fpd3_1_in: endpoint {
> +			remote-endpoint =3D <&ub953_1_out>;
> +		};
> +	};

[Severity: High]
Does this port@0 extension need to include a status =3D "okay" property?

If the base board overlay k3-am68-sk-v3link-fusion.dtso initialized port@0
with status =3D "disabled", would the OF graph API skip endpoints because t=
he
parent port remains disabled in the final DTB?

> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702093123.1048=
575-1-y-abhilashchandra@ti.com?part=3D17
