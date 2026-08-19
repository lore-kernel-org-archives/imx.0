Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B40F3CC7F8;
	Wed, 19 Aug 2026 06:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787120589; cv=none; b=d1H7IDleqDw5O4+q7BMXV7IF4UNvreOXLho6WCkZ4F0zysiPsBtfrUTEqu2ZJOTB5N+xZYuzWRGxm3xjRs0xzycglC1MUSTnGoWNktpj2B1DTlcCS/eniBDuIuMqjJQs1cLW0SExz2F+c9zc+016Cd5Msud+wMfV/8DKjCm5lAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787120589; c=relaxed/simple;
	bh=V7v5Jj0ye95ozW+lLqppzv7xuynYxRafg9SYnlWt1vA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bQwkDe+jSYuCSo0BnsHRbwWKUpy2ZvhPRautYoOlb2/WfM8uJOQ11bGT6nJUNG6byRe7NTzsh8kvDmxbMqkgf9Ngt6lq8REJPsI+M4pZAXXVA3vjH4mKxYAnuD6Mm/GIRRhFVrjHcRP7j56kFHcUwjnUXtCOU4UgZCNHHVxR62Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hi4dWJZD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hi4dWJZD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 783DC1F000E9;
	Wed, 19 Aug 2026 06:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787120587;
	bh=iTwQd6ZGQL69GrI0lffXWXT/CCqLFRBu3LeqofsHHfc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Hi4dWJZD5f2ALPllbcYk4q4WfRNmDU5W+ZXDOZGcw47GUqldsSMBUlhRysIGXwYqT
	 SAWrWLjUmcPXNEIGmgtMf3PDA7ap47q2svb0KpqAid5bxo1OtnrtM3NYej5G5Hj5t/
	 9bruvAXgABtCWWgCqgOfJ/IQ+GsZEvoCLm2hISoRl4oGFOdNE5qU0cMLCIqE5xXL0T
	 JkrOYOmHbfjcvwBKUPTb7CXFIFeYssIMxkIbodfwd+IJ3qza2QWxNLBqvgZgP6DzIl
	 SXpmWaeCyY9ljr8qzLnLVhJIT0PXsQ6kyrUy1ScF7CqEhZpYiW0tIoRo/qqf3SZzu/
	 BMrx8xPw3G7gg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v37 6/7] arm64: dts: imx8ulp: add secure enclave node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pankaj Gupta" <pankaj.gupta@nxp.com>
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260819-imx-se-if-v37-6-5ef5de9ff1dc@nxp.com>
References: <20260819-imx-se-if-v37-0-5ef5de9ff1dc@nxp.com>
 <20260819-imx-se-if-v37-6-5ef5de9ff1dc@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 06:23:07 +0000
Message-Id: <20260819062307.783DC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `hsm0: secure-enclave` node lacks the required `memory-regio=
n` property, and the `imx8ulp-firmware.dtsi` file mentioned in the commit m=
essage is missing.
--

--- Patch [6]: [PATCH v37 6/7] arm64: dts: imx8ulp: add secure enclave node=
 ---
commit 2ba9b9f0319499b595df7fe3ea1566a81890865d
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

arm64: dts: imx8ulp: add secure enclave node

This commit adds the EdgeLock Enclave (ELE) secure-enclave node to the
i.MX8ULP SoC dtsi. It also adds a label for sram@2201f000 that the node
references, while keeping the node disabled by default to avoid imposing
memory requirements.

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
Will this trigger a schema validation warning during make dtbs_check?

The fsl,imx-se.yaml binding strictly requires the memory-region property
for fsl,imx8ulp-se-ele-hsm. Since disabled nodes are validated by default,
leaving memory-region out of this base node causes validation to fail.

Additionally, the commit message mentions boards provide this property by
including imx8ulp-firmware.dtsi, but is that file missing from this patch
series?

>  	};
> =20
>  	cm33: remoteproc-cm33 {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819-imx-se-if-=
v37-0-5ef5de9ff1dc@nxp.com?part=3D6
