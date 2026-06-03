Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25327441027;
	Wed,  3 Jun 2026 12:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488900; cv=none; b=WxkLfzcHWW/9YfWWWklMSq99+k7CIFq78q0iginvQrETJmaHFcueA7bSIzKsDMsD1Rac3VA0sa+R96ymODW9TD05YqzX+hfas8zi89aRheCb1saxCGBcV1O7xWa/ZEJ2Sp1e4BCMkITzZ/D6saS5RK3f33VIryXAXZC98DR1ruI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488900; c=relaxed/simple;
	bh=n3WHuPIJIqTuO6OMA9qGdB15mAD3+GZrEj/DtYTsoWo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ullKlcX3WMoHrZqiN7OjNzQ5izaYxoyELFWZL76S2xqEvjhNIDJ5lL53RVMF0v+9rhZClyH4iQkH9FEsQ59EjJPUhfCNj/Zbol91o+MWlAs4vKR7OkFA0q55RvojmbYFp8mzfZB4Vb/42lM9QxEtKa6w4B7ZNSwRkiLvkGEa5Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QKKyy2ze; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QKKyy2ze"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 625971F00893;
	Wed,  3 Jun 2026 12:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780488898;
	bh=LuyId85rJ+3fBkpHwHQduuY29G06nIEj0Wd962KPG1E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QKKyy2ze7eZiJEiTdyQEGTkE0A4e+3XLUoGXa7T6bvCSgTzJ9OlsuFawc0TE2ScgT
	 AbkclbNr9vPeDUwRTbFbbetshy5mUrAvBIAbWoo+ZM/9J5R9Zl1TDrUVPhOZf7Jcys
	 MGtwLUlHVNlXGcb+LeJjaV6XdQ8h9VxLZ6/Ve+exHLyKav6t+0TRA0XUIm0bp7olA+
	 0iK6Av4h10Duvc3tyCEPG45LA9AYtlmr80U3d2UEuKbrqVLzIR+YYERq/vUsOqcwBu
	 /OhkTphi0M84cRaj8C3wAKjbLHOUZ1bJ9+vEfxMF9O2kXTBlodZiatU5q4BSdA+CRF
	 zrgAZmWvyqGKg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 06/12] arm64: dts: imx8mp-var-som-symphony: enable
 PCIe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: Frank.Li@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <8b56416fbc765373643dfb0300c3661564e68ba4.1780487415.git.stefano.r@variscite.com>
References: <8b56416fbc765373643dfb0300c3661564e68ba4.1780487415.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 12:14:57 +0000
Message-Id: <20260603121458.625971F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Timeout and PCIe initialization failure during system resume due t=
o I2C-based PCIe reset GPIO in NOIRQ phase.
--

commit 1813e394a2d156f58d0fa0b95aed827b4d4e4bc4
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: imx8mp-var-som-symphony: enable PCIe

Add the PCIe reference clock and enable the PCIe controller and PHY on
the Symphony carrier board.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/=
arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
> --- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
[ ... ]
> @@ -146,6 +152,18 @@ rtc@68 {
>  	};
>  };
> =20
> +&pcie {
> +	reset-gpio =3D <&pcal6408 1 GPIO_ACTIVE_LOW>;

[Severity: High]
Does this configuration cause a timeout and PCIe initialization failure dur=
ing
system resume?

The PCIe controller specifies an I2C-based GPIO expander (pcal6408) for its
reset-gpio. During system resume, the i.MX PCIe driver executes its hardware
initialization in the noirq phase (imx_pcie_resume_noirq() ->
dw_pcie_resume_noirq() -> imx_pcie_host_init()), which asserts and deasserts
the reset GPIO using gpiod_set_value_cansleep().

During the dpm_resume_noirq phase, local CPU interrupts are enabled but dev=
ice
interrupts remain masked at the interrupt controller (because
resume_device_irqs() is called after noirq callbacks). As a result, the I2C
controller cannot receive device interrupts.

Furthermore, i2c_in_atomic_xfer_mode() evaluates to false because system_st=
ate
is SYSTEM_RUNNING and local IRQs are enabled, meaning the I2C core will not
fall back to atomic polling mode. The I2C transaction required to toggle the
GPIO will therefore wait for an interrupt that is masked, resulting in a
prolonged timeout and a failed transfer. This causes the PCIe resume to fail
and significantly delays the overall system resume process.

> +	status =3D "okay";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1780487415.gi=
t.stefano.r@variscite.com?part=3D6
