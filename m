Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAFE37A85A;
	Thu, 30 Jul 2026 02:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785379506; cv=none; b=m3QNzyY7xrEK/vylWrfnI/rrjTka95tRt9eqTU5f5YKYEidUXVWGfJzdoEl92cSTM1dne/kY70qiDcTPNcaqqVCTFiORvvwAQ8+lJvIOwmixMZe7aUS5pJbRxG59ST7XgF/Rzv3X9do3qVK3OTRDsKKQdtd5T59ObFF+HgM6TAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785379506; c=relaxed/simple;
	bh=KxweY5QazvchqS4xRFGU9jjXJLeCYRh7hVVlntO6MvA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Rj+rc4D4f88AWOR/6vaWcwNq6NIy+C8NHLjiOcXdB9/HdGtw4LPEXhWDa41r1TD2ae6cLdcSKB1KXDsQBFF8I2MO3vgGrxS1HJUtWJaoPsX5bAbRJwACUAZC5zv6MyJJqr71p4QHQYFygMFxtVK84KvoLaS7sk0fycBJ0Wmyi60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BJKAiKxK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BJKAiKxK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 078AD1F000E9;
	Thu, 30 Jul 2026 02:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785379505;
	bh=YHikEDKMXzM4BJgO7EOlTW1Sq4J46aU+vGdZdSQplWo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BJKAiKxKyArjHcun7cRAgla2vAltWL9PwTl9dFzY53n48R+I7MBQJ1sm1Uuyof7Oh
	 32Pts6jMaAaWMdhvxjeSoUir0igDqBVLeYX31LI99EQC4rupH8qYZaJjjs2OLmgQPg
	 zeWhpCxzVGCPr/LMGDW5gDzfmrJrl3XYIEhWkQtWKuW2Asz6Rdp/3APaxNFfpL3MYv
	 B4hEYAKSD2yfMxarShNH0E1WfaEDHksyES1dUGS7GYrZniIkm7eePBrUsoCEN7yUmu
	 k6ozRfG0qwUJiIM3lypyY1dmaIZbBRGpc2+xVI7wKevEU60YiNK7+cnHv5aJsqf7dz
	 UoG8F2GG44FNg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v32 6/7] arm64: dts: imx8ulp: add secure enclave node
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: robh@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260730-imx-se-if-v32-6-95f56dff4ba9@nxp.com>
References: <20260730-imx-se-if-v32-0-95f56dff4ba9@nxp.com>
 <20260730-imx-se-if-v32-6-95f56dff4ba9@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 02:45:04 +0000
Message-Id: <20260730024505.078AD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Devicetree Schema Violation for disabled secure-enclave node
--

--- Patch [6]: [PATCH v32 6/7] arm64: dts: imx8ulp: add secure enclave node=
 ---
commit 9ea23a325f779943e0d6ff5ef6459ab8d6494416
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

arm64: dts: imx8ulp: add secure enclave node

This patch adds the EdgeLock Enclave (ELE) secure-enclave node to the
i.MX8ULP SoC dtsi. The node is kept disabled by default so it does not
impose a reserved-memory requirement on every board.

Closes: https://sashiko.dev/#/patchset/20260724-imx-se-if-v30-0-ce8ba256692=
c@nxp.com?part=3D6

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

[Severity: Low]
Will this cause a devicetree schema validation warning during dtbs_check?

Because the dt-binding schema requires the 'memory-region' property for the=
=20
"fsl,imx8ulp-se-ele-hsm" compatible string, omitting it here means any boar=
d=20
that includes imx8ulp.dtsi without enabling the enclave will fail validatio=
n,=20
even though the node is disabled.=20

Could we avoid validation warnings by defining a dummy memory-region, or by=
=20
restructuring how this node is included for boards that do not use the encl=
ave?

>  	};
> =20
>  	cm33: remoteproc-cm33 {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-imx-se-if-=
v32-0-95f56dff4ba9@nxp.com?part=3D6
