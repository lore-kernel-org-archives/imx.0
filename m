Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C05F3F39E4;
	Wed,  5 Aug 2026 16:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785947474; cv=none; b=CWRp48CkhHOsmqClBfr4h6W1b2M+ZksqP1Q52JWPlf0n+2rBWlK7Uewd4/GKxRLHwUtniJA7LASc8K13+ophkmm64UB8MHudn6P4OceyeN0NqDr1SJLBNj9JONuT5v9+E9bmfIIWZNlMVOoSVB07pu+5x/W2nN4KQmPUY6k+Mds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785947474; c=relaxed/simple;
	bh=6dy7d4S1NMSxoM0VtbqU0A0Hyv/WAJMC+eb1feeCcZU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=INgcS/PfMpiV37w2VReg7sPt/Azpp8LqpUF6eRGP0Gp7kWMCGPvIx+88XGMt8FuTAA6W4Q7qJUihGYq1TVNwf8t8hdihlib5DBvhVXNGpev4/nbz4umma+N89hoTvU4IvAhywkbT/Dani1rcogqZr4voF3CDywJM+o6pfGXP9b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dA/77CAN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dA/77CAN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45A721F000E9;
	Wed,  5 Aug 2026 16:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785947470;
	bh=/JQSKSkS2RJhLrkyOnVLGmxtgq7YezWhIvaL4ohITsM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dA/77CANPyXnYOfrGEhX063Ux/1ZW3RjWzk9spamUJgapMYSWaWcjh62c7MCVJDBx
	 jH7/6m8iP2G5nFMbjygyQhuj5STyLy43MKPbsAksZiUn+Qh8SQeO1cO92NSvXclRsf
	 Vm8UalBsiC04dYGDx6i0wX9eo7/trn3eZibsukqEU8Sr3+gnQFty5NawwuJhx/bKbe
	 HXzQL7b6tyKcmU0Os5gICvs61ciNGoS4qqV7Rz0hlOOd4vvRFP93VNkVk+bL4PJP+7
	 qFkekEo4cvNBvCkRQoukikppvZBZFO7tBDGLU6l2sWNPAdzEcmfyoR1kQad2G63iJX
	 7BVqILS6ivZ6g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v34 6/7] arm64: dts: imx8ulp: add secure enclave node
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: imx@lists.linux.dev, conor+dt@kernel.org, Frank.Li@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260805-imx-se-if-v34-6-7e4713d14e0a@nxp.com>
References: <20260805-imx-se-if-v34-0-7e4713d14e0a@nxp.com>
 <20260805-imx-se-if-v34-6-7e4713d14e0a@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 16:31:09 +0000
Message-Id: <20260805163110.45A721F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing strictly required property `memory-region` in the disabl=
ed `secure-enclave` node will trigger `dt-validate` schema errors.
--

--- Patch [6]: [PATCH v34 6/7] arm64: dts: imx8ulp: add secure enclave node=
 ---
commit 0fca804b5890d1b30a2a6c7de7313c46555323fc
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

arm64: dts: imx8ulp: add secure enclave node

Add the EdgeLock Enclave (ELE) secure-enclave node to the i.MX8ULP SoC dtsi.
The node is kept disabled so it does not impose a reserved-memory requireme=
nt
on every board.

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
Will this node definition trigger dt-validate schema errors during make
dtbs_check?

Looking at Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml, the
schema unconditionally requires the memory-region property for this compati=
ble:

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

Since dt-validate checks all nodes regardless of their status =3D "disabled"
property, omitting memory-region here means any board devicetree that inclu=
des
imx8ulp.dtsi but leaves this node disabled will fail validation.

>  	};
> =20
>  	cm33: remoteproc-cm33 {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-imx-se-if-=
v34-0-7e4713d14e0a@nxp.com?part=3D6
