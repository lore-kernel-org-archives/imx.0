Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7495256B865;
	Tue,  8 Sep 2026 15:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788882908; cv=none; b=l663YS3Q97WPcLOPbOkVEXvlY4m0P1y0SQaBctofF6AEfAUWoTJzvJWIdFusgT5TI+y8MIEtAkeam8Ni8HWifcql7AXbaN5GLayC+jxnWG2tUOUz1dhmcHqEdhyhByyF6AenHloTXI5uYQEUXXo8hsewHPFRyDTSuFv3dkuMvp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788882908; c=relaxed/simple;
	bh=uGkR/7RLnVxFrROyoSpk3xD+mmY1L16OmWX9DokJ7U0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=psSOh3RjPx9Q50b3K9HGgPIz+IISiR8TZLELoyp2Nx6nH+OkMMBGSXY0hzAOPCDDI2Ivz3KocMsNMzEjghVP7B2eOqwPnO2IYCj4PK+kOFPSLh/S8JetGhElVWMwM09KdvaTcku2e4moFWhan376MJXddtT1WeImyz7PIF3xWFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ax4QYOAu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ax4QYOAu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7992F1F00A3A;
	Tue,  8 Sep 2026 15:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788882905;
	bh=oH60/Ep1LgFeVH+nN2jGTYyJTUZs80XuXZ9f+y6aeYc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ax4QYOAuwiV0LJeMMAZUCw4oR2/qSdoyDhHU/iDdOd9xvkgSUAIWT0sU1QIYT3VjA
	 9ZQyXCtK6l1W3HYcpHfN3eqgIh1wyHuQhI13+djKAq/vqXUdt2VOO0E0azh2zb8Q9O
	 2LoQfR/+a5Z8cfHneXR8FQqQU2v5k4sspkq2yefPu7XzhfrhcdChnzjObWoCWFyAeY
	 JBzIbBxAFfSWV+UfMDi4W04akgl4uMDkyDMBWfmlGYUs0dhR0oTG2bC5UyGHaS1moQ
	 3Rp9QBN4LGgHqeYeW5qunEuAoooJFOohfLMnyLExwTsokD5MGYp6P6JFNRI2OHHmF1
	 KR3xUMgZKYRwA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 12/13] ARM: at91: remove samv7 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arnd Bergmann" <arnd@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev
In-Reply-To: <20260908152808.3928630-13-arnd@kernel.org>
References: <20260908152808.3928630-1-arnd@kernel.org>
 <20260908152808.3928630-13-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 15:55:05 +0000
Message-Id: <20260908155505.7992F1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Incomplete cleanup of SAMV7, SAMS7, and SAME7 platform macros.
--

commit 0e6ee4e12ed1996bcca25e4e14e2ee5176bc2d17
Author: Arnd Bergmann <arnd@arndb.de>

ARM: at91: remove samv7 support

This commit removes support for the deprecated samv7 platform. It deletes
the platform initialization code, Kconfig entries, Makefile hooks, and
the corresponding SoC definitions in the atmel/soc driver.

> diff --git a/drivers/soc/atmel/soc.c b/drivers/soc/atmel/soc.c
> index d89f9dcade7d2..e276f86326ec7 100644
> --- a/drivers/soc/atmel/soc.c
> +++ b/drivers/soc/atmel/soc.c
> @@ -210,41 +210,6 @@ static const struct at91_soc socs[] __initconst =3D {
>  		 AT91_CIDR_VERSION_MASK, SAMA5D44_EXID_MATCH,
>  		 "sama5d44", "sama5d4"),
>  #endif
> -#ifdef CONFIG_SOC_SAMV7
> -	AT91_SOC(SAME70Q21_CIDR_MATCH, AT91_CIDR_MATCH_MASK,

[Severity: Low]
Since this removes the usages of SAME70Q21_CIDR_MATCH and the other SAMV7/S=
AME7
macros from the socs[] array, should the corresponding macro definitions al=
so be
removed from drivers/soc/atmel/soc.h? They appear to be dead code after this
change.

> -		 AT91_CIDR_VERSION_MASK, SAME70Q21_EXID_MATCH,
> -		 "same70q21", "same7"),
> -	AT91_SOC(SAME70Q20_CIDR_MATCH, AT91_CIDR_MATCH_MASK,

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908152808.3928=
630-1-arnd@kernel.org?part=3D12
