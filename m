Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D1C4AA41E;
	Wed,  2 Sep 2026 16:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366595; cv=none; b=FTMWSQanoJ3yEUe5a2RoesjS401pYi93zjbx3HBgmFCffzVV1KGuqMRr4uaWP8dCyTpECZwkD118sKP5N4BHqP/9A1AXCKS+jwPQA+ysc1fxWkuYfKp5qkOumRg8q8uMc9cwmF6L0yM6EdJ0josj4V7kzztf1kDc622o2oM+hDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366595; c=relaxed/simple;
	bh=V2yYAWVwDw+DeO2G27fBN8d0Xp6JH7VcqSNC9O1alnQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oKsGIAfuYfH+BL6rTcBOkxyBaGuS7xvBi6G04T86kGJdTzr2lHsoes/giSWx2cDU5XDkW+1B6EE1iOAaXDZhGEsU9jGPfrSIXAmw1GlaR8kEJxFKWQgbPgZNuB/jLUudlqftjgN7F9QaFm0UjRwHcHj5ki6alvVlU1etKkLA+mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AzjSZo1Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AzjSZo1Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16E251F000E9;
	Wed,  2 Sep 2026 16:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788366593;
	bh=HbQcHxXwAY+y8yvyn3ntZJ63h9Rayqiqvrd6LRn63FQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AzjSZo1ZOsb/B5XgxDM10L87zyTHnLcbIlX/BidjFNNejlj4HvwpE1muW+XCsR9YB
	 m2eCLvPx2xI6CIUp6DtwtIM2bBd0TyG4sWJYrfWFBwaIsm1lyAQ7qvHwR6S0BX8Idv
	 koIeSQ5LAV2CbaxNq48LIsVdMh/yzFj0AuBsfTMiZ411QUY1nRHrBB11o3aCd46grK
	 PQx/FLclu5zU+mVcnsiD8ubbQQ2eiLEfTwFsFmNGvaAVMtWh4sBYoc+tS6dWEpG9fx
	 GWZEh0Puv1hJFAAa0y5PYlYFnwFHinr7KIHCtRe+Ay+tLlRvw9TCna/oUO47k1NoK8
	 0AFkl3I2DOBoA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v46 6/7] arm64: dts: imx8ulp: add secure enclave node
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: Frank.Li@kernel.org, robh@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260903-imx-se-if-v46-6-aefaab525034@nxp.com>
References: <20260903-imx-se-if-v46-0-aefaab525034@nxp.com>
 <20260903-imx-se-if-v46-6-aefaab525034@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 16:29:52 +0000
Message-Id: <20260902162953.16E251F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Schema violation: the 'secure-enclave' node lacks the mandatory =
'memory-region' property, causing dtbs_check failures for boards that do no=
t enable it.
- [Low] Commit message and code mismatch regarding the SRAM address label.
--

commit a07f75a4e7246d0362429146aa833aff2a0e76b4
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

arm64: dts: imx8ulp: add secure enclave node

This commit adds the EdgeLock Enclave (ELE) secure-enclave node to the
i.MX8ULP SoC dtsi. It adds a label to the SRAM node and introduces the
disabled hsm0 node.

> Add the EdgeLock Enclave (ELE) secure-enclave node to the i.MX8ULP SoC
> dtsi, together with a label for sram@2201f000 that the node references.

[Severity: Low]
The commit message mentions adding a label for sram@2201f000, but the diff
actually applies the 'sram0' label to sram@22010000. Is this a typo in the
commit message, or was the wrong SRAM node labeled?

> Keep the node disabled in the SoC dtsi so it does not impose a
> reserved-memory requirement on every board. Boards enable the enclave and
> provide its memory-region by including imx8ulp-firmware.dtsi.
>=20
> Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>=20
> ---
> arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot=
/dts/freescale/imx8ulp.dtsi
> index 777b89ed68490..ac8293f81c6b2 100644
> --- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi

[ ... ]

> @@ -154,7 +154,7 @@ sosc: clock-sosc {
>  		#clock-cells =3D <0>;
>  	};
> =20
> -	sram@22010000 {
> +	sram0: sram@22010000 {
>  		compatible =3D "mmio-sram";
>  		reg =3D <0x0 0x22010000 0x0 0x10000>;
> =20
> @@ -186,6 +186,14 @@ scmi_sensor: protocol@15 {
>  				#thermal-sensor-cells =3D <1>;
>  			};
>  		};
> +
> +		hsm0: secure-enclave {
> +			compatible =3D "fsl,imx8ulp-se-ele-hsm";
> +			mbox-names =3D "tx", "rx";
> +			mboxes =3D <&s4muap 0 0>, <&s4muap 1 0>;
> +			sram =3D <&sram0>;
> +			status =3D "disabled";
> +		};

[Severity: Medium]
Will this lack of a memory-region property cause dtbs_check validation
failures?

The fsl,imx-se.yaml binding unconditionally requires the memory-region
property for this compatible string. Because dt-schema evaluates all nodes,
even disabled ones, this will structurally conflict and cause dtbs_check to
fail for any board that includes this dtsi without also enabling the node a=
nd
providing the memory-region.

Is there a way to avoid imposing dtbs_check failures on boards that do not
configure this enclave?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903-imx-se-if-=
v46-0-aefaab525034@nxp.com?part=3D6
