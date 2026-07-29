Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FB043C067;
	Wed, 29 Jul 2026 09:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785319180; cv=none; b=kVIFobLRROFiU9Paco1rsj4lOt/w2RrrN6AQzZJNsB1l10uPJqdniNwedI2Q2kQ3vnINNa6S8cd1pqWyhopQQUZ+EIv3ma/WjM71t7+JSRqEqFEVpuGIozXPcfj+apeHqB8SrzsNmJLTNRzI7PkldpN08fQvTsVakfDI5MiGedU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785319180; c=relaxed/simple;
	bh=d3tVu++XWFnt+3llxlSIR5IeRhNyTeIZGBslCiwOZKo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=B2hW+IFIcfhaox4k51ZvrTeYOu5y4x3WgC5Np6poTvj+oScx58rYpOj4Ciqos1Rr1e+F7WiayhwR4Vrl288qhYAdEmkMvpQFmMUPbXfEG/ihYnb3p2zf3H/vOnjmjeNWKV+Oeo1WOxleDpd98LYS4A0pSkOKhazdXEXdxACE1+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OcdOsdYQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OcdOsdYQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 979351F000E9;
	Wed, 29 Jul 2026 09:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785319179;
	bh=UPSQuIZCLeDjvkmQgOhrkHgGt8HlgRZqYzKxSEUdlaY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OcdOsdYQ0zdV64nmvxgjUz/WXsgp8cG9yNRarb2DP/dRL2IoUKn3TxtC5V80N1Cgi
	 LoZRCL5qCDXkAgRr4gOeTo0YaZfnRNBj9kGjBCSIoNQ2w0UPmb/uZlMe76dJHe1VFN
	 ddClvNgmgUNL9Oqe83jr/+dQsPEacWe74uKHPfGBIR6kTyfcDIcSO830SpmWhUQ3eM
	 YlUN5AEnZ41Zq/CxgFXQsM2Yp7W+uyIpzLNKyjJmj9gtxV2CNZp02CBanIC/jLEyhQ
	 8spFHh6930TJ5+I6EVNVS+Nt4d0QDdUDNjGFM4e5Q6cIDJxpu3np8J5dfS/Q/CJ/K7
	 HCB0pZ4yOJE+g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v31 6/7] arm64: dts: imx8ulp: add secure enclave node
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260729-imx-se-if-v31-6-e59af7adb784@nxp.com>
References: <20260729-imx-se-if-v31-0-e59af7adb784@nxp.com>
 <20260729-imx-se-if-v31-6-e59af7adb784@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 09:59:38 +0000
Message-Id: <20260729095938.979351F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added 'secure-enclave' node lacks the strictly required '=
memory-region' property, and the referenced include file 'imx8ulp-firmware.=
dtsi' does not exist in the tree.
--

--- Patch [6]: [PATCH v31 6/7] arm64: dts: imx8ulp: add secure enclave node=
 ---
commit 84c95486094c423a74f2d67654a196de0232a9f8
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

arm64: dts: imx8ulp: add secure enclave node

Add the EdgeLock Enclave (ELE) secure-enclave node to the i.MX8ULP SoC dtsi,
together with a label for sram@2201f000 that the node references. The node
is kept disabled by default.

>     Keep the node disabled in the SoC dtsi so it does not impose a
>     reserved-memory requirement on every board. Boards enable the enclave=
 and
>     provide its memory-region by including imx8ulp-firmware.dtsi.

[Severity: Low]
Is imx8ulp-firmware.dtsi missing from this patch series? It doesn't appear
to exist in the tree, which might prevent boards from enabling the enclave
as instructed.

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
>  	};

[Severity: Low]
Will this node fail dtbs_check validation on boards that leave it disabled?

According to Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml,
the memory-region property is unconditionally required for this compatible
string:

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

Even with status =3D "disabled", the schema expects the memory-region prope=
rty
to be present in the node.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-imx-se-if-=
v31-0-e59af7adb784@nxp.com?part=3D6
