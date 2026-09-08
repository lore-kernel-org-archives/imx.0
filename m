Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF2F5632AF;
	Tue,  8 Sep 2026 15:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788882678; cv=none; b=qu3g0ehRFwATTMnuqHhZZhcciaw9CGyr/HwjQLnP3JHunLloohrsPGlX67eHCvBqaUBPPPcD5wn01e22Vzx9zVwu1b5VTN1ojSmaOGxAJgotzARwIaJooqKXq6AiICg3UET6xuu2YWUr59AkqkA7je/MUkiogE38YzW5r6VD7X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788882678; c=relaxed/simple;
	bh=7xQ6D4LtbqpCMJPeZHt+weqDMu9iZpeN8/T+jwZ8IpU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PL1DOhec+dqO7cjWgk5ughHlNc0EbWUpdU+qMtuep/fGWlG9Q+HLx30y1HREImdvk7W/gPvssbbn7WsTMVyEx0y5HaNK2uq6/7jY8NLtNugELnRIHVlg8mFhyZFjE3mnzr77RSafU1oS39RuFLEhbUp4bxCzzmcy2GBKym5iyAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y/b3gqtG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y/b3gqtG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5CDF1F00A3A;
	Tue,  8 Sep 2026 15:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788882677;
	bh=XfOrHkiMplGRPl8SWGT/5JqovBnoPMBcDcjoWEm7sBE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y/b3gqtGHY2t5nR5Lc8O3Hfv+ez2dVOr5DdaWskRHCHs/Z4jvPjK0TRPV2BpyLwZX
	 iGGql5/WD2j+KIpW93FI8W+W/0TVSyDzcHsXV0W8Jicme2BMm1PVg/lTtLXQwRpP6A
	 1t9jhylhpmj5s0ugKkBOEyobcAoVMdyf1IT5TYeGZz/JQd5EXirC0sfVGkFl22gEaf
	 UkPgtX/3aprEIi7CgNoYITNwz/bJxe+bVqTrL+vqeNdtUnD01NpUOaebBoZP3njnea
	 xqmh5vbgSVzxcW3MKU+p5f6H6qYFgudDniAZYwVY3Rk7QtwqnpYp644+aEF061TFRi
	 Ejv5eEXgE+QyA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/13] ARM: versatile: remove mps2 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arnd Bergmann" <arnd@kernel.org>
Cc: robh@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260908152808.3928630-12-arnd@kernel.org>
References: <20260908152808.3928630-1-arnd@kernel.org>
 <20260908152808.3928630-12-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 15:51:16 +0000
Message-Id: <20260908155116.B5CDF1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `ARCH_MPS2` config symbol was removed from the tree, but it =
is still referenced in the `depends on` clause for `SERIAL_MPS2_UART` in th=
e serial subsystem.
--

commit 6586f00f58e77d469ef87ccde160d87dd5f7e427
Author: Arnd Bergmann <arnd@arndb.de>

ARM: versatile: remove mps2 support

The Arm mps2 platform is the reference implementation for Arm
microcontrollers and is useful for testing but not expected to be used
as a production device. With all the Cortex-M based products gone, there
is no longer a need for a reference platform either, so remove it as well.

> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 13b38be3353a3..cf380b6868676 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -443,20 +443,6 @@ source "arch/arm/mach-zte/Kconfig"
> =20
>  source "arch/arm/mach-zynq/Kconfig"
> =20
> -config ARCH_MPS2
> -	bool "ARM MPS2 platform (DEPRECATED)"

[Severity: Medium]
Since the ARCH_MPS2 config symbol is being removed from the tree here, shou=
ld
it also be removed from the depends on clause for SERIAL_MPS2_UART?

Looking at drivers/tty/serial/Kconfig, it still references this deleted
symbol for the serial subsystem:

config SERIAL_MPS2_UART
	bool "MPS2 UART port"
	depends on ARCH_MPS2 || COMPILE_TEST

Will leaving this unresolved cause the SERIAL_MPS2_UART driver to only be
buildable under COMPILE_TEST and lead to silent Kconfig dependency
resolution issues?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908152808.3928=
630-1-arnd@kernel.org?part=3D11
