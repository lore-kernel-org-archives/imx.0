Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E672E282B;
	Wed, 19 Aug 2026 13:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787145824; cv=none; b=Cu7RLcHhOo/WoGviQTyqL0nWWS09CH7ZvFyFwXJiDh6VGI7KvI36P5E55jBJsYIfZ2Hiieh/0rZGSXiRZ0oIDqNCAlFuwQR7aLMfMiw6y69LY40rxxkCQanWfCCOavstf/5UEHh9ze7xgrfF2pLsSzMYDvxTXMvDgwIrgbJvAgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787145824; c=relaxed/simple;
	bh=csgMa/QibvOKbjaoecc19dQD5xpNkKm90cF7EEowrTs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mvuvMQSA02n84qQh+3wP6UdcWM5+6gK4aqCF9BSf4GNDJMilUjxDDiaWCjXJ5nK0FUvUpPRNPKJM+NTsJU5+R2WL10SJyU3CX7mmLox360IS99gy58gQ7DujmOG2uTK52CJ6HiKbGxP4L1ityjE/RS/Uxm6Po1JZ9Ao6BOe3yQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nScihf2t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nScihf2t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B46501F00A3A;
	Wed, 19 Aug 2026 13:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787145818;
	bh=8f8K+orO4idWNWQ/RLLI4XBD04M3E2A2gzk70wmdmHM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nScihf2tiikh0j9wJhqdCJ2dY4ZNfR9bPCnqPbvzOX5wigSWVVk0kvnUS0bgTkFpJ
	 lbmzykNrbkynv1SMNqM/8/aEcOV4n6rwCjdyTKlyfM9gLVyge/T6Ee/gkQkWNZNVUE
	 HglcemM0m5AeJu0GBxKxxr166Zp1Tj44z2A4tTILU3b/ye8pD4w0AK1YowbfoyOu1p
	 UYCbrgXgBAQfeYzB96xmhTn9rdDWVzSBnNWF3LPQAB/+wfxtgaQyQGkfLF0Zjy0EKB
	 L5nRf3Xa8JUgaiSpPyB/DhtHJaiPBeAEoSRyn55bp+HOmumWKT0LfnYNqWTrr+JyF/
	 LeTOMrOuCB+pA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v38 6/7] arm64: dts: imx8ulp: add secure enclave node
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260820-imx-se-if-v38-6-5df4a4cff736@nxp.com>
References: <20260820-imx-se-if-v38-0-5df4a4cff736@nxp.com>
 <20260820-imx-se-if-v38-6-5df4a4cff736@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 13:23:37 +0000
Message-Id: <20260819132337.B46501F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The patch explicitly mentions that boards enable the enclave by =
including 'imx8ulp-firmware.dtsi', but this file is missing from the patch =
series.
- [Low] The disabled 'hsm0' node lacks the 'memory-region' property, causin=
g an unconditional device tree schema validation warning.
--

--- Patch [6]: [PATCH v38 6/7] arm64: dts: imx8ulp: add secure enclave node=
 ---
commit 031e0af8a8a7b64a1399f13195904638982a6007
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

arm64: dts: imx8ulp: add secure enclave node

Add the EdgeLock Enclave (ELE) secure-enclave node to the i.MX8ULP SoC dtsi.

> Keep the node disabled in the SoC dtsi so it does not impose a
> reserved-memory requirement on every board. Boards enable the enclave and
> provide its memory-region by including imx8ulp-firmware.dtsi.

[Severity: Medium]
The commit message mentions that boards enable the enclave by including
imx8ulp-firmware.dtsi, but this file appears to be missing from the patch.
Did you intend to include it in this series?

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
Does omitting the memory-region property here cause dtbs_check validation
warnings?

Even when the node is disabled, the fsl,imx-se.yaml binding schema might
unconditionally require the memory-region property for fsl,imx8ulp-se-ele-h=
sm.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-imx-se-if-=
v38-0-5df4a4cff736@nxp.com?part=3D6
