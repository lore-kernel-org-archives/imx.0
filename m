Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FEF37CD21;
	Wed,  2 Sep 2026 11:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788347684; cv=none; b=pfDn4ARsVSQPi46JAAbMBzYuUdYw8QIT727AsySJntbfhktvYPxK8IKRPLibtmuMrzJkcsru7Hw7h/d5wJ8pVPE+m14ZQWdyEBsr8QZmEWM5f86xOHSBzQOPkJF0Wq1Lnwiwfzn0f286ZE/fioPu/cfLttRR/xmIR8JZEd0PJAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788347684; c=relaxed/simple;
	bh=VBEFCFEa83XydlY9VZ4+nqJSxzDx0KiCn/hVrdubDYY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P+qoT8q4yUZ5nWxd8YoYVTyTfZfNFjoNs5aBqy9KXObei4nU6B12DzrTZ1DLQp5bPQwSYopcdfJ7f8beo2DTHJJRAInWbaJNYSGp9k2MvdxDJ7E5COmWqZNJoxU5IfqXMJfcpmkHl4Yc+5Dve3tecr8hcGD33MJ508WDHl76ybs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JlWbZgoL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JlWbZgoL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7775E1F000E9;
	Wed,  2 Sep 2026 11:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788347680;
	bh=MxPgfyh2bpLLUuDg3EFGgoku6ylf/BdNGFdILHHqu9U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JlWbZgoLhTm7MMhYxrF8Jwy2T27mgBIBB1fyV+NVw5aD9CReIuF0rt6HX1wMaxAYY
	 m3lUP+Hs9HmC443iz0q9aDjMZjaJrKGRFLpcDRivuROw1P9znEcvlcrs6JvKoT5Fbr
	 bwlExjoqrs41zgCcFOMpSItffMVDWi9l8moAU5zOI3VOM6BfikOFSR6c3f+L5rKCKX
	 W09TmIT1nZg7gXK8oUWefyPTHdh41mEWNa3gD+AVZMyeNYwpukaF0qBiadGDde165e
	 WQoV2Z3eTueW7xbydAamTNESUJ4Dt0ziIDTAKVeHfPTyjh8FJ6AEUdKkWFbvnM4DE1
	 Qzq5nDJcjP0ZQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v45 6/7] arm64: dts: imx8ulp: add secure enclave node
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: conor+dt@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260902-imx-se-if-v45-6-6e400879d8ec@nxp.com>
References: <20260902-imx-se-if-v45-0-6e400879d8ec@nxp.com>
 <20260902-imx-se-if-v45-6-6e400879d8ec@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 11:14:40 +0000
Message-Id: <20260902111440.7775E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message erroneously claims to add a label for 'sram@2=
201f000', but the patch actually adds the label to 'sram@22010000'.
--

commit f6aa8515a434b2969a55227494277b2542fee770
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

arm64: dts: imx8ulp: add secure enclave node

This commit adds the EdgeLock Enclave (ELE) secure-enclave node to the
i.MX8ULP SoC dtsi. It also aims to add a label to the SRAM node referenced
by the enclave.

> Add the EdgeLock Enclave (ELE) secure-enclave node to the i.MX8ULP SoC
> dtsi, together with a label for sram@2201f000 that the node references.

[Severity: Medium]
Is the commit message description accurate regarding the SRAM address?

The text mentions adding a label for sram@2201f000, but the diff below
shows the label is actually applied to sram@22010000 instead.

Could this mismatch between the commit message and the device tree code
cause confusion about which SRAM section is allocated to the secure enclave?

> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot=
/dts/freescale/imx8ulp.dtsi
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

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-imx-se-if-=
v45-0-6e400879d8ec@nxp.com?part=3D6
