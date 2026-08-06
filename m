Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9DE4570C7;
	Thu,  6 Aug 2026 11:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786014819; cv=none; b=DyFUT8CmqULPiDzvkh3d7z7SJgPQ8X1GfE3rjenbY6BtGvju928A+jmNAyMDRvUjUskkI+CDnJTNzIJs/VpfyAetT9Jyfl9w1beSysLLpbBhI//r/EehuoHhFUjbutLiDfSjKtH0cuq3C5VO7WYfXk/weHGWr+11P51VpZO9u40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786014819; c=relaxed/simple;
	bh=j8F7xFEomXtVut2J/WkP+WL64rh2z/0xdkTredfEliA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iR7ZZQ+KMo+CRjVCzo3NPNy24slVfrjhphlgeEf1P+0dmDDe2bVVAO5wS+q/GMr3zZc+k4gpPrnPLXUku5LO4oXMEgp8KIn9CkjKV5AmLYK/hgtkY5G90r63QIRWhpJLkJQGHV843LwFv8Qefong7AKm61pL229SeWRBfCMY2nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wy5waHCo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wy5waHCo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 982571F000E9;
	Thu,  6 Aug 2026 11:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786014809;
	bh=OcWrdYamQJ1FYepYcGOAA3gVhOI3VohuGRMzxJWsJR8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wy5waHCoUhlOr9XLoyxBM+EQmIreRgrvU22bBwKnYBqZi0x1xTd1na1Nc/AfRRxXE
	 dJYJ+IQsFJrPyPA/Ij7we6EibJ7Z7ZlBhsPRPYlWHRg1qNN2ZQAS1ldBSB6gW1JeIL
	 /egNijRmCj2ItnTpu0EtEpKsT9vcwZvaEOaLUhxMQEPvuRX2ulDgaXuQBhoxFzXTS6
	 NFo87I+lIzeCFkHPg5icK3butmQ/9cz7GRrnOIcEsGYc40rCz9QZkAGX4LdkVCIuHE
	 BwXd1iNqthDGa0nig4Entm2jzlYuP+ZE596rzmaztfDW4STQMkppD0BIQy1HmTdgfT
	 l85r4t/NWkkGA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v35 6/7] arm64: dts: imx8ulp: add secure enclave node
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: devicetree@vger.kernel.org, robh@kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260806-imx-se-if-v35-6-11b25bb308ef@nxp.com>
References: <20260806-imx-se-if-v35-0-11b25bb308ef@nxp.com>
 <20260806-imx-se-if-v35-6-11b25bb308ef@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 11:13:27 +0000
Message-Id: <20260806111328.982571F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The newly added `hsm0` node lacks the mandatory `memory-region` =
property, causing a `dtbs_check` validation failure. Additionally, the file=
 `imx8ulp-firmware.dtsi` referenced in the commit message is missing from t=
he patch series.
--

--- Patch [6]: [PATCH v35 6/7] arm64: dts: imx8ulp: add secure enclave node=
 ---
commit c890c3315c7900443e29c20509319084f32b21c7
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

arm64: dts: imx8ulp: add secure enclave node

Add the EdgeLock Enclave (ELE) secure-enclave node to the i.MX8ULP SoC
dtsi. The node is kept disabled so it does not impose a reserved-memory
requirement on every board, and the commit message notes that boards can
provide the memory-region by including imx8ulp-firmware.dtsi.

> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot=
/dts/freescale/imx8ulp.dtsi
> index c6d1bb9edf388..38233dd74ee33 100644
> --- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi

[ ... ]

> @@ -185,6 +185,14 @@ scmi_sensor: protocol@15 {
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
Will adding this node without a memory-region property cause a dtbs_check
validation failure?

According to Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml, the
schema unconditionally enforces the memory-region requirement for this
compatible string:

  - if:
      properties:
        compatible:
          contains:
            enum:
              - fsl,imx8ulp-se-ele-hsm
              - fsl,imx93-se-ele-hsm
    then:
      required:
        - memory-region

Even though the node is disabled, it seems any board including this dtsi
will fail device tree schema validation due to the missing required propert=
y.

Additionally, the commit message states:

> Boards enable the enclave and provide its memory-region by including
> imx8ulp-firmware.dtsi.

Is there a missing patch in this series? The imx8ulp-firmware.dtsi file
mentioned in the commit message does not appear to be included in this patch
or currently present in the tree.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-imx-se-if-=
v35-0-11b25bb308ef@nxp.com?part=3D6
