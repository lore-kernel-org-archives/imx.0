Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C61531B0A;
	Tue,  8 Sep 2026 12:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788868811; cv=none; b=a018PqBcNQE2UldTbJ8vFXRxsOo5ADMR4h6EfnnZZCmLr+SjyS9QrNST0zNM+YwmVzFa7MiAnQji+6YSdIzSobyXy9UH5Ii8gxHCZK3yqS4B0tUozxed2yZY0QzljDeI6YMtJhOPPK2nQQCmCm3rhqzGJQEKX3PPjjiFbs86De0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788868811; c=relaxed/simple;
	bh=3IcTro2gmbaI6WhIwMZfG3bf0Dbf2TEP0gYjWkSBdgo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=h/v9aFW6fUUpE6SvU2pOJ2gDSuAm8rDlXCjQwqT/EO3rU097VQ9NR7GclyYs7pOgdPFFq8GYgDBhsWj1wwp+qCa0r7RnW/QiRpqkR7QYPH3T9eYtgoriMsRjekJ6DIcPCYwkKzYkL9bv1GW5jZyzamDwwoHsFqLIL9SK1m8AxVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QkUo8RFI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QkUo8RFI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15E3B1F00A3A;
	Tue,  8 Sep 2026 12:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788868810;
	bh=fV/8CKLvMK4MYnc0C/SctEnTQHtBkX6nvskBC+ikUIw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QkUo8RFIJUk27A7RIUrXoaQ9UnU+h+QnWvM0iRAnQKVk0NZN+yeW5FuqOaNUp4F3K
	 2kGmw8KRvZ8/Cz/cs09fF/VyrzrligqRlYt+845VbEuO3PiG6v2esm+cJZKilr4Lqi
	 1eicnypEke9GABniaWSrqpCtIHRe0EObKp6Ru4L7fr/2JEZRF9K4ES+9QUsvSlDzAf
	 U1QK/XqakojTa2zjEpPf0wlSJFnsfYobkzd0fa/dAfNtAatrnI+86V3tzZ8O/aMzOk
	 H0h01TtnB33BCsVV7G/6E4ZLwOjT/zDjWfTuF4YzVYKEz8+/ZUuxKXi4cBgi+2yeQL
	 HQ48VaZgtx8wQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v49 6/7] arm64: dts: imx8ulp: add secure enclave node
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260908-imx-se-if-v49-6-a59529118839@nxp.com>
References: <20260908-imx-se-if-v49-0-a59529118839@nxp.com>
 <20260908-imx-se-if-v49-6-a59529118839@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 12:00:09 +0000
Message-Id: <20260908120010.15E3B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message inaccurately states that it adds a label for =
'sram@2201f000', but the patch actually adds the label to 'sram@22010000'.
--

commit dbbf090119a95f58809b81bd6ae60d95c81f233f
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

arm64: dts: imx8ulp: add secure enclave node

This commit adds the EdgeLock Enclave (ELE) secure-enclave node to the=20
i.MX8ULP SoC dtsi. It also adds an SRAM label for the node to reference=20
and keeps the enclave disabled by default.

> Add the EdgeLock Enclave (ELE) secure-enclave node to the i.MX8ULP SoC
> dtsi, together with a label for sram@2201f000 that the node references.

> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot=
/dts/freescale/imx8ulp.dtsi
> index 777b89ed68490..ac8293f81c6b2 100644
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

[Severity: Medium]
The commit message states that it adds a label for sram@2201f000, but the
patch actually applies the label sram0 to sram@22010000.

Could the commit message be updated to reflect the actual memory region=20
being labeled, or should the label be applied to a different address?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908-imx-se-if-=
v49-0-a59529118839@nxp.com?part=3D6
