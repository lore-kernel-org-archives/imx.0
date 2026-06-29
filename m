Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46D63890EE;
	Mon, 29 Jun 2026 07:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782717289; cv=none; b=KSDmnI0nCXkQV2Ig9cC+78vGK9BipUaLFSACFXlF4fCQU07NHLnbpK9OIFAPjOALxNLefotMAt8LW8bunOJR31Y4IWhSFEed5vUMjeqFv+RnOayXouypa49QSlsd48+8km3rjhCBtJqNev+ep8NLDEc4JBQSuABPvziHWpb/dZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782717289; c=relaxed/simple;
	bh=rMp1Ag1FDDDotySQwzDFwG/fZQnrWQ6zz1/7em5Efpw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=K6F65u7u5bTQ5qA5JxBMoq0+EWXm0IWeR2j0TLcgxJ9XsF3lJjYl9IafIwf3z1OkITFS3AZWbzi80+IptWNyTYSp3R19l77aICkJ466zPyLbZZ0U5vaz4HLD8oD1grYe1TD/MUB32DSrIK7O8JkwS2A2P3BHuJg/HsbfuzclhsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E7CE1F000E9;
	Mon, 29 Jun 2026 07:14:48 +0000 (UTC)
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v26 6/7] arm64: dts: imx8ulp: add secure enclave node
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260629-imx-se-if-v26-6-146446285744@nxp.com>
References: <20260629-imx-se-if-v26-0-146446285744@nxp.com>
 <20260629-imx-se-if-v26-6-146446285744@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 07:14:47 +0000
Message-Id: <20260629071448.2E7CE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Inconsistent indentation within the `hsm0: secure-enclave` device t=
ree node.
--

commit 4cec20d0cfb861451c94ac062d1b2fa257cda38b
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

arm64: dts: imx8ulp: add secure enclave node

This commit adds support for the NXP secure enclave (EdgeLock Enclave
firmware) for the imx8ulp-evk. It adds the sram0 label to the existing
sram node and introduces the new secure-enclave hsm0 node.

> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot=
/dts/freescale/imx8ulp.dtsi
> index c6d1bb9edf388..933127f870c6f 100644
> --- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
[ ... ]
> @@ -185,6 +185,13 @@ scmi_sensor: protocol@15 {
>  				#thermal-sensor-cells =3D <1>;
>  			};
>  		};
> +
> +		hsm0: secure-enclave {
> +			 compatible =3D "fsl,imx8ulp-se-ele-hsm";
> +			 mbox-names =3D "tx", "rx";
> +			 mboxes =3D <&s4muap 0 0>, <&s4muap 1 0>;
> +			 sram =3D <&sram0>;
> +		 };

[Severity: Low]
This isn't a bug, but there appears to be an extra space after the tab
indentation for the properties and the closing brace in the hsm0 node.
Should these lines use standard tab-only indentation to match the rest
of the device tree file?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-imx-se-if-=
v26-0-146446285744@nxp.com?part=3D6
