Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E113AFD1E;
	Fri, 21 Aug 2026 07:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787298054; cv=none; b=Kx3AmUNJQQNTDmqK24fKPF48PryAE3U1UcZ47r0fp+abSmICoFFPWQLQDqIh92jdbDo0evJbciEcK9WJkgPfJy3Mtp64Ec8fTrrub/snrYdIRbqdFaP84fbWyEZEZVpDkNEjbf4khL9RuRe6s15hRiJiLwBo8ybltuR6WS/ZSXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787298054; c=relaxed/simple;
	bh=ZOmKBcp+8qo0woe0GcjF/FnI3/Iwp8Fm9wr9rCoYIUM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P/J62lzwKANZvxHLYtRT9QbCabw3NCoOGdLW0Fxb3IoRYwtEKdK6XajAuMm4oQ1Sva/mqkBefoM4mSOVjdXvtEkOu393X2p5ELnmRRHKpgg5K9xHG9fQOv3g3ISDYsr90WHShlhR9gCl1YkZaaKKTrlJxwx3ozrATPe76bUATTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HbYfN9td; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HbYfN9td"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD6291F000E9;
	Fri, 21 Aug 2026 07:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787298051;
	bh=ChGbeIGIuU4Atrx5XN6+0G2w2V0kTtii0cikiiW+19o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HbYfN9tdQ3k3RrhVpgw6S9UU+cluGGrUUnswZai5+mm/RpN9NVB2o4PyFD2pUtwMC
	 T2bvGp+vp0V/+PdYiDniff4KM7Udsm7KqZ8RJBLCnEKsTkyRz7rNWaiW2r+5p4A5px
	 KbHjqyqp4iYHlblEWbYwCZTwk9pD2pQeVNlZLKr9trzMwbmUfsAREu45P2rg9GM7o5
	 phExDLf78p7fSNAHL6ybJSAh1NXk08gGknqnEQ/7O0aYnpx/sIXieW5IuLyQ+qeScQ
	 IIvMrrGpHpUqbEMVVt3XwLTVyVRV2zmi/z3lkxWKAb4jWodEPd02irf5y2sTYMrfYJ
	 2sgkPNp9qOeOw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v39 6/7] arm64: dts: imx8ulp: add secure enclave node
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: Frank.Li@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260821-imx-se-if-v39-6-41e4257c2afc@nxp.com>
References: <20260821-imx-se-if-v39-0-41e4257c2afc@nxp.com>
 <20260821-imx-se-if-v39-6-41e4257c2afc@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 07:40:50 +0000
Message-Id: <20260821074050.BD6291F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `hsm0` node added to `imx8ulp.dtsi` lacks the `memory-region` p=
roperty, which will cause `dtbs_check` schema validation to fail for any bo=
ard that leaves the node disabled.
--

--- Patch [6]: [PATCH v39 6/7] arm64: dts: imx8ulp: add secure enclave node=
 ---
commit 2df947c02e3ec38b8653aed8492f9d709b178160
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

arm64: dts: imx8ulp: add secure enclave node

This commit adds the EdgeLock Enclave (ELE) secure-enclave node to the
i.MX8ULP SoC dtsi. The node is kept disabled by default so it doesn't impose
a reserved-memory requirement on every board.

> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot=
/dts/freescale/imx8ulp.dtsi
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
Will this missing memory-region property cause dtbs_check schema validation
to fail for boards that leave the node disabled?

The DT schema fsl,imx-se.yaml requires the memory-region property for the
fsl,imx8ulp-se-ele-hsm compatible unconditionally. Because dt-validate
evaluates all nodes in the resulting DTB, including those with
status =3D "disabled", any board including imx8ulp.dtsi that does not enable
the enclave and provide a memory-region will trigger a validation warning.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821-imx-se-if-=
v39-0-41e4257c2afc@nxp.com?part=3D6
