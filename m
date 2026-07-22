Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C0433936A;
	Wed, 22 Jul 2026 10:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784717552; cv=none; b=CLYehZj7LxOb1rSwlZ77Hcj0IhcuafnXd61p19cxusBTvfSeAVkP/D3NEiGstrOda8OrGonDLmJoUyQGylR+ZUj6fiqQzo09uTHLEMDLodxqDNM0s7nQEG85FacGg8B9qzIx53pj5WjQYGfBvvLBCrBJgrNSSwFqbcY/Dgghw2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784717552; c=relaxed/simple;
	bh=mKxS9DIrToPB8q1OjpZFLuv9oMbxkEDehREPQZVLr1I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Hnx5L4DTSO1SqAKF90oKNwXbcnbIlWNTGGU+XVVdOJUcF3YZkn5poom6JiC1MmN6Sy3gS2Zqw4IrSHFTHhwIvdXlyUi2SpbQ4nq8SGkJTg0NvrGshMWADe+BUNfLXx42DUvl7RepdgETBCF2JqP6JXM6g3DfwLDHezqln7kr7Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aiUKWd0I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aiUKWd0I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF8851F000E9;
	Wed, 22 Jul 2026 10:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784717551;
	bh=cz/AaSM8b4xozM+TmCkIqyTW+QTRuTcoeDKI2hgATjY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aiUKWd0IZAEqlpSez+ESzM5Ww0mBngn9Bb5g0iBZHxm43CQKFVWRLoVRWTowK/viV
	 3p1yi0vjvlIg3eF2qUhtpv3mDdZykTWYxH/hrr+kz4D5LGiXxPdNlYn2gqb1PMzRgO
	 Px5m2Kb437cex4v8C6qtaC7ATGsP2Y2MnKpteaw1XXFLWl+F0NQe5zT7TGtFORNxtV
	 1b72zBh+Tfpp0P1ns3gBuSApRQUqTrPOdKq/XEabYzgBPlnEpxdsGClkP6EkpojRR6
	 YraYbl/wzgOc4QyetJz3CxB9yiBKm2Kp/9nteMXSuzNONgQM1Tqux9fuC4ec3KdARK
	 P3OWbbkPMIcBg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/1] arm64: dts: imx8qm-ss-dma: add LPUART4
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev
In-Reply-To: <20260722104200.17729-1-stefano.r@variscite.com>
References: <20260722104200.17729-1-stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 10:52:30 +0000
Message-Id: <20260722105230.BF8851F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Incorrect devicetree clock indices map both 'ipg' and 'baud' clock=
s to the baud clock, leaving 'ipg' unenabled.
- [Low] The `dmas` property hardcodes the magic number `1` instead of using=
 the `FSL_EDMA_RX` macro.
--

--- Patch [1]: [PATCH v1 1/1] arm64: dts: imx8qm-ss-dma: add LPUART4 ---
commit 7ee265f098cc61c07a1f39c116e402d04752161d
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: imx8qm-ss-dma: add LPUART4

Add the missing LPUART4 node to the i.MX8QM DMA subsystem description.

> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi b/arch/arm6=
4/boot/dts/freescale/imx8qm-ss-dma.dtsi
> index 974e193f8dcb9..25c5e44231639 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
> @@ -8,6 +8,22 @@
>  /delete-node/ &adma_pwm_lpcg;
> =20
>  &dma_subsys {
> +	lpuart4: serial@5a0a0000 {
> +		compatible =3D "fsl,imx8qm-lpuart", "fsl,imx8qxp-lpuart";
> +		reg =3D <0x5a0a0000 0x1000>;
> +		interrupts =3D <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-parent =3D <&gic>;
> +		clocks =3D <&uart4_lpcg 1>, <&uart4_lpcg 0>;

[Severity: High]
Does this clock configuration leave the IPG clock unenabled and map both cl=
ocks
to the baud clock?

The i.MX8QXP LPCG clock driver uses integer division to resolve the clock
index (idx =3D clkspec->args[0] / 4). Both 1 / 4 and 0 / 4 truncate to inde=
x 0,
which corresponds to the baud clock.

Because the IPG clock (which should be at index 16, or IMX_LPCG_CLK_4) is
never referenced, accessing the unclocked UART peripheral can cause a
synchronous external abort or bus hang.

Should this use IMX_LPCG_CLK_4 and IMX_LPCG_CLK_0 instead of the literal 1
and 0?

> +		clock-names =3D "ipg", "baud";
> +		assigned-clocks =3D <&clk IMX_SC_R_UART_4 IMX_SC_PM_CLK_PER>;
> +		assigned-clock-rates =3D <80000000>;
> +		power-domains =3D <&pd IMX_SC_R_UART_4>;
> +		dma-names =3D "rx","tx";
> +		dmas =3D <&edma2 20 0 1>,

[Severity: Low]
This isn't a bug, but does this hardcode the magic number 1 instead of using
the standard FSL_EDMA_RX macro?

> +		       <&edma2 21 0 0>;
> +		status =3D "disabled";
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722104200.1772=
9-1-stefano.r@variscite.com?part=3D1
