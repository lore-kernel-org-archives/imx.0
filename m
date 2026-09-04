Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CC83B05B3;
	Fri,  4 Sep 2026 09:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788514519; cv=none; b=Z6pXCYAfO55H+BcSnDc6ZtSHeq9D0LESGOQLppMJ09Wy1zVUsFq9wCkBd4uxYcp2iQD92Ms2J9aH44TSnq/hUATYfr7M0jG6/bDlzbAiqBI9tPxK0llRh/70LYr3EuwEQ7aNRAuwdNjeDivbzTa8m7o2Yo+AZJLz9temO+8CclY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788514519; c=relaxed/simple;
	bh=0S3s7Vi23DdPZRNknj5dPgne9gAg0tB+UkGCEMd+RIY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RG9kNQGzQuHPZzJl4/tXpU0lfj9LYLggEKqBumtBvZypUILjeeQF3jbtZ7V3HnggS7Bb9UwBMKjtvcrsDk+jnN/NIAviwbeuWZ7N33pyXXjfgmr/q2FywtnaVSaZ1X7t6QjRNDIfkdEiXEl07bIhviuyCqyHVeDPnMa2ZmA5Buw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I/lNwJZR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I/lNwJZR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C39E1F00A3D;
	Fri,  4 Sep 2026 09:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788514518;
	bh=trTeFc2WypfOzmIIAl8FTRX8kR3ytEVr9yksIeyS1UQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I/lNwJZRDlVgIaiyAJNNL278Dv8Gyc4o3VuwJkAZfQxXNwWS8ShlETy6nS6vqCmzY
	 eBYMTeH7w56ADae+WDcb3jcv5Mbr3iZ1gYPITeFWkdR/oRHCsgcR4gpzL3ypseAYBv
	 ionekvDM+DMXZnvqWadLndCREjlZ4MpeYN0dHV7zErn+XSujh3CUnEEw3pAA0XIwSa
	 jlAv02qXF4hxW307SiWo1GkNUS5KoXreZWxpjGdeOVHjPXlbNTdqgQwT/565g3BuwV
	 thYyCLdiNFfjBoYixtpHI8nEimsRIXI8Dp/MPLDsSMR1SaDTkFIDf+GRdrr0Fq/aoT
	 dGAhmKybneGSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v48 6/7] arm64: dts: imx8ulp: add secure enclave node
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: robh@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260904-imx-se-if-v48-6-dad90eec7eaf@nxp.com>
References: <20260904-imx-se-if-v48-0-dad90eec7eaf@nxp.com>
 <20260904-imx-se-if-v48-6-dad90eec7eaf@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 09:35:17 +0000
Message-Id: <20260904093517.8C39E1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The commit message claims to add a label for `sram@2201f000`, but t=
he patch actually adds a label to the root `sram@22010000` node and referen=
ces it.
- [Low] The `memory-region` property is required by the `fsl,imx8ulp-se-ele=
-hsm` DT binding, but is intentionally omitted, which will trigger `dtbs_ch=
eck` warnings.
--

commit 52c5da8aa6e62285f5f6a0932125a8349ec01ea0
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

arm64: dts: imx8ulp: add secure enclave node

This commit adds the EdgeLock Enclave (ELE) secure-enclave node to the
i.MX8ULP SoC dtsi. It also keeps the node disabled by default and adds a
label to the SRAM node for the enclave to reference.

> Add the EdgeLock Enclave (ELE) secure-enclave node to the i.MX8ULP SoC
> dtsi, together with a label for sram@2201f000 that the node references.

[Severity: Low]
The commit message mentions adding a label for sram@2201f000, but the diff
shows the label being added to the root sram@22010000 node instead, and then
passed to the enclave.

Is this description a typo in the commit message, or was the label intended
for a different node?

> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot=
/dts/freescale/imx8ulp.dtsi
> --- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi

[ ... ]

> -	sram@22010000 {
> +	sram0: sram@22010000 {
>  		compatible =3D "mmio-sram";
>  		reg =3D <0x0 0x22010000 0x0 0x10000>;

[ ... ]

> +		hsm0: secure-enclave {
> +			compatible =3D "fsl,imx8ulp-se-ele-hsm";
> +			mbox-names =3D "tx", "rx";
> +			mboxes =3D <&s4muap 0 0>, <&s4muap 1 0>;
> +			sram =3D <&sram0>;
> +			status =3D "disabled";
> +		};

[Severity: Low]
The fsl,imx-se.yaml binding appears to require memory-region for
fsl,imx8ulp-se-ele-hsm, and does not gate this requirement on status being
okay.=20

While boards that enable the node provide the memory region, might
leaving it out here cause unwanted validation noise from dtbs_check on boar=
ds
that include imx8ulp.dtsi but leave the enclave disabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-imx-se-if-=
v48-0-dad90eec7eaf@nxp.com?part=3D6
