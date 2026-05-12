Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFD715E5BB;
	Tue, 12 May 2026 00:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778546281; cv=none; b=OZlgKw3SxrzSnmnGjkn39eYMQVSctk2turJ6CipbIjPY0JcpVPBWrPY/8wsCml83R3MbmkhRojAFJLh4bCshfX1a6VrILUvxiu42qQAGmw2ON63BGK/iDafDOPbq1heFyBp39HluO/UEn6tyNowwQF0Z8fI1HLwsEEf2oqcSE5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778546281; c=relaxed/simple;
	bh=Er4tIgZxYoPNsDmdjYemFqMQ0saiN8bMP59hd/0eIsw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XUk+AiH0NvqNeaAo+zYcPWKaFnCki/V3WANxwEbBhDNr8pU+gZd8NvSi4JY7KmFZ3r3XdbSBZ0zkKGJbzCAtqeLkKeuB7uOW+ePk7jYVXzJydTmzThRduO5JFOssn9vHSM0x9Zb5EQkTgsU5OnAr05OwVGffjJjrnNQZUccnjAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IpsxBAOf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IpsxBAOf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC30DC2BCB0;
	Tue, 12 May 2026 00:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778546281;
	bh=Er4tIgZxYoPNsDmdjYemFqMQ0saiN8bMP59hd/0eIsw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=IpsxBAOf5j/1va1k6RLZJciR5rEu/ZkGxpzHoGptbgojF4yr5/gheAfe8Xh8R0yzG
	 DE9ja9LsYsW+d4l0UXpCuiXAbfrtzsde/iu5MxCQYDsLMBFFmt9FKUO13dw102pIcU
	 UrhgkBsb1b+a/NX+ovQVECBaLBnDslS/hDY0MyIftFDKRi8OQIOQ3P2do2G8PvoT/s
	 3EcjAobsTsT/YjHI7C/tZgEoWZuXVRwQxtdgG5GR+6bfUFzScQhbmUDq3Gotv8hz4J
	 wTMsyEs9ocrhodKxJksLTlHYC1aUmV/aT78ylve5PjmB965ce5uciwJCzfmFwH8dQb
	 I7sxIuxfsgP2Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] arm64: dts: imx93: Cortex-A Core remoteproc
 device node
Reply-To: sashiko@lists.linux.dev
To: "Jiafei Pan" <Jiafei.Pan@nxp.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, robh@kernel.org
In-Reply-To: <20260511023928.39640-5-Jiafei.Pan@nxp.com>
References: <20260511023928.39640-5-Jiafei.Pan@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 00:37:59 +0000
Message-Id: <20260512003800.BC30DC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Use of undocumented and unsupported property `init-on-array` in th=
e clock controller node.
- [Medium] Encoding software-specific use-cases into top-level static .dts =
files.
- [Medium] The `m33_reserved` memory is declared but not linked to any remo=
teproc node.
- [Low] Grammatical errors in the inline device tree comments.
--

commit 63c01069d7a6eb875616e06076ef323b131b3915
Author: Jiafei Pan <Jiafei.Pan@nxp.com>

arm64: dts: imx93: Cortex-A Core remoteproc device node

This commit creates new top-level device tree files for the i.MX93
14x14 and 11x11 EVKs to support a multicore RTOS configuration, adding
Cortex-A Core remoteproc device nodes.

> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts=
/freescale/Makefile
> index 711e36cc2c990..f067e5c44daef 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
[ ... ]
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx93-11x11-evk.dtb
> +dtb-$(CONFIG_ARCH_MXC) +=3D imx93-11x11-evk-multicore-rtos.dtb

Device trees are generally intended to describe the physical hardware
of a board rather than specific software deployment policies. Does
adding dedicated top-level device tree files for an RTOS use-case
risk a combinatoric explosion of files whenever the base hardware
changes?

Could these software-specific configurations be implemented as Device
Tree Overlays (.dtbo) or applied dynamically via bootloader fixups
instead?

[ ... ]
> diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk-multicore-rtos=
.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk-multicore-rtos.dts
> new file mode 100644
> index 0000000000000..9fb2b94b83b4f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk-multicore-rtos.dts
[ ... ]
> +		/*
> +		 * Reserve up to 16MB for one possible RTOS instances running on
> +		 * one Cortex-A Cores when booting Linux on at least one Cortex-A Core.
> +		 */

This isn't a bug, but "instances" and "Cores" should probably be
singular ("RTOS instance" and "Cortex-A Core").

> +		rtos_ca55_reserved: rtos-ca55@d0000000 {
> +			no-map;
> +			reg =3D <0 0xd0000000 0x0 0x1000000>;
> +		};
> +
> +		/* Reserve 16MB for FreeRTOS on M33 */
> +		m33_reserved: m33@a5000000 {
> +			no-map;
> +			reg =3D <0 0xa5000000 0 0x1000000>;
> +		};

Is this memory-region intentionally left unlinked to any remoteproc
node?

Since it is not assigned to the cm33 node and is marked with no-map,
it will not be mapped by Linux. If the imx_rproc driver attempts to
parse an M33 firmware ELF and load segments into this memory, won't
it fail to validate or translate the physical address?

> +	};
> +};
> +
> +&lpuart2 {
> +	status =3D "disabled";
> +};
> +
> +&clk {
> +	init-on-array =3D <IMX93_CLK_LPUART2_GATE>;
> +};

Is init-on-array supported by the upstream Common Clock Framework?

This property appears to be absent from upstream dt-bindings and is
not parsed by mainline clock drivers. Because the framework will
silently ignore it, won't the late clk_disable_unused initcall
disable the LPUART2 clock, given the lpuart2 device is marked
disabled?

If the RTOS running on the remoteproc attempts to access the gated
UART, will it cause a bus fault and crash the remote processor?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511023928.3964=
0-1-Jiafei.Pan@nxp.com?part=3D4
