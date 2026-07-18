Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4805738F22D;
	Sat, 18 Jul 2026 14:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784386652; cv=none; b=L5sTUinpavyvyEFDPbjMebKvjZLIL7DIFE/4aaGE7QabLNCMYgzrfjJxuna98c5I+QN6QSK0g9DnFS6UzL13tIXY+zcgHNm3+NluYZMgISYAGeL+l9XVUQ8HSwhnezs4Fa7Ei/TftjiyXWZDCZ5I9McjX3DqEMkGWf1na6JC25M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784386652; c=relaxed/simple;
	bh=t3AWmIYz4f1gC0j4vk3tAzYRVOzLDls6VFDnabGNr9U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KsHP1ZMyyCeDrXlXJTg/sLxZ9EKDy9PRcwIY2ajjrcdW7XV8f5twUrpShkhfhjFsS+Wp1iy8dtJGIrPeiNkhhEuu9fXsFgPrxkO7Kr6MiB3EZygKSLzwk4wx2UlP5Gw0oS4gl2H8lCLDyR+wDjZ379sZYXnGgLIbqbXYUXu4kT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wjl9cwdg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wjl9cwdg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D5831F000E9;
	Sat, 18 Jul 2026 14:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784386651;
	bh=QEVqufp2DQrTfRNmaZIeHeIM1fWM/FLEoyMVYctm1oY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wjl9cwdgv6rEei8FRHZZydYs6MQr1vYf8RUprrPE2/ETlsnfnb/L8nXV/Aqr9KBWU
	 WGg4jkXpsyp/JEv/BXd53I5W8rfJ8Qs+aJOZDWhQTCkUkiDbOhBbve47C/pyc3agGq
	 YSXU3iaLL257CQHmvGFt7e3L9zzOtyws3pRbO2DXPMpdT2HS8tewbFMeP4K6zIk4+E
	 g9zS/spdjIl8FEMEnK0bozssywb1IFhidNLLzFkmHGJeYJNk5mGQjaclPzKriKZqn3
	 ebUkHyXyFd08u1cBaIkcfJHAPf50ZOpSDRx74M1q3Vkh/yvH84nsoWwZiIMVEyEZHl
	 RIw5j6d+Rzt/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: soc: imx-iomuxc-gpr: allow
 bridge@18 as child node
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: robh@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, dri-devel@lists.freedesktop.org, conor+dt@kernel.org
In-Reply-To: <20260718-arm_dts_ldb-v2-2-f5669571aa2b@nxp.com>
References: <20260718-arm_dts_ldb-v2-0-f5669571aa2b@nxp.com>
 <20260718-arm_dts_ldb-v2-2-f5669571aa2b@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Jul 2026 14:57:30 +0000
Message-Id: <20260718145730.8D5831F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing `ranges` property in `fsl,imx-iomuxc-gpr` schema will caus=
e kernel WARN_ON at boot.
--

--- Patch [2]: [PATCH v2 2/4] dt-bindings: soc: imx-iomuxc-gpr: allow bridg=
e@18 as child node ---
commit 5e999c2b583f7149956f10a90d92e24192451d5a
Author: Frank Li <Frank.Li@nxp.com>

dt-bindings: soc: imx-iomuxc-gpr: allow bridge@18 as child node

The legacy i.MX6SX SoC imx-iomuxc-gpr contains one LDB_CTRL register.
This patch updates the dt-bindings to allow the LVDS Display Bridge (LDB)
child node under imx-iomuxc-gpr to resolve CHECK_DTBS warnings.

> diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr=
.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml
> index 721a67e84c137..1879638918bab 100644
> --- a/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml
> +++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml
> @@ -47,10 +47,21 @@ properties:
>    reg:
>      maxItems: 1
> =20
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +

[Severity: High]
Will this omission of ranges cause a kernel WARN_ON at boot?

Because the syscon node includes the simple-mfd compatible, the kernel
function of_platform_default_populate() will attempt to create platform
devices for its children. For the bridge@18 child, of_device_alloc()
attempts to parse its reg property.

Since the parent lacks a ranges property, of_translate_address() fails and
returns OF_BAD_ADDR. This causes of_address_to_resource() to return
-EINVAL, which is passed directly to a WARN_ON() in of_device_alloc().

Because additionalProperties is set to false in this schema, users are
actively prevented from adding a valid ranges property to their device trees
to fix this.

Should the ranges property be added to this schema and explicitly permitted
so that device trees can provide the required address translation mapping?

[ ... ]

> @@ -87,4 +110,39 @@ examples:
>          };
>      };
> =20
> +  - |
> +    #include <dt-bindings/clock/imx6sx-clock.h>
> +
> +    syscon@20e4000 {
> +        compatible =3D "fsl,imx6sx-iomuxc-gpr", "fsl,imx6q-iomuxc-gpr", =
"syscon", "simple-mfd";
> +        reg =3D <0x020e4000 0x4000>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;
> +

[Severity: High]
Does this example also need a ranges property?

Without it, this example demonstrates an invalid configuration that will
trigger the boot warning described above when the device tree is processed.

> +        bridge@18 {
> +            compatible =3D "fsl,imx6sx-ldb";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260718-arm_dts_ld=
b-v2-0-f5669571aa2b@nxp.com?part=3D2
