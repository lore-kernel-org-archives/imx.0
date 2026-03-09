Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11A63D75BA
	for <imx@lists.linux.dev>; Mon,  9 Mar 2026 15:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773068850; cv=pass; b=NjDWoXuxQDJ3DoTJlLzdpsjcgMvaYKkgUIrYFP2ZDO22NDYZ9IMgHoNfuOQOwL9Lus8B6b8eENlqUMu/sej/L76eqVK6TmRsQbbK3H9andZHbCTSib4nObyE2F5nDZYhR26iaxDtXxSZYJz3nHN78oT9gqAdmEIDSec2maO8Xp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773068850; c=relaxed/simple;
	bh=cmRiodC9r+mRuSIKrsDa+1SgJTeHck5hhqgmz3f7sjQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eC+C59su1ZOKQKk2QE5I34gQimBDHPPC72qlDqTnKlEIoukZXIYgWvB8JUqaPdkkJ3tUg6CqHobPzK28+TSVzBxODSbTEGTozw4vyGSsPeJHT+JfnEo5w4XP5o23xIm28kNdi8SFgHXEM3i9z5YnwHw2M/AZ+9iQF3h+3skOYFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OgUDo58y; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OgUDo58y"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59e4989dacdso6180201e87.1
        for <imx@lists.linux.dev>; Mon, 09 Mar 2026 08:07:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773068846; cv=none;
        d=google.com; s=arc-20240605;
        b=GhrIH6AsRhrFU6XDr/Z80lHGiTJo5Yz6FYhbwNOmKXhU/SYtDMODjRVkohFYaYnht+
         YfXDtVqcZ2KjKL8zS3wQTw2mVfmMjX5tCdHTcOnnXy8ldB5kLgVR9KMfh/Qvijt5ApeJ
         dusKck6DvkuOLKRezsuoYg5XWOQ6xA203jFhvXe+jGvRqs/wycdaN3tkfGAGm916WKF3
         mCKkrQrOsdENQSgaUBzsufV6AD3ZSPhKkpZampQEeZ4IqzD0ZNub4R78B6/4Q5VFHxYg
         X7IjLq5R2DdOa+eew1RmGT10m6JNy+vKBYsTZNefqBhnwbwB2jV9GumQF1QIfzwvdNnD
         gsSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TdH8bvkNIpDog/K3q0ZzGRX8OtZ/OKv1fjCXdvgPWAI=;
        fh=jBoclrl4Q+T9rz7JxDisokU6FTg3xyL+sFUhZl16NGI=;
        b=LWt0Q5N1J0034FaQC1/cmH1364tXT4MZh6rhkgptRWaSkQNIMNFzbrixKCamCak3/f
         EYkGIRSyQBPDQBhGLWups4lUadhLO9HmPoBqRcF4FfypEjsBTdO4MLGRk6UTZR45M/mn
         S8vocMobBPEYZENf3o5feSNucQjXwW3vUJMOg9GYFitHjtXnqjVXFVQIVrzqsKRAYwUB
         cE10BSZHiT+OqyFbS2tomQnjdVsfcYQO9euQcrwlYjt1QbP4TJ4clC9KN7iPud9ouRqP
         Tbk7oNgSIaFsBF0pRnW0wvMuTWd6OnGno4yXOKdB14hQSiNZxqjgR9Jhiz1TTLFFeEiY
         JJ7w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773068846; x=1773673646; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TdH8bvkNIpDog/K3q0ZzGRX8OtZ/OKv1fjCXdvgPWAI=;
        b=OgUDo58yit0bCxsOz6w8Xf/VzIvUUwqNYz5523zTx0NJzXQCS657Pq5mN1SphXfElw
         IZGgSZOnVdvo2kS57U7ZZHWd9fH5FY0IlCzZz23AUrBhrsoPiv/x9yGeaEJ7KI676MTE
         DI/8EQKrU2b5exJfd+pyBeBfsQI0PmnSmxfkOj3A3QTc1dQcJzc7+sOyUt8zFfUA5sR5
         2tLR5GPO9FRWGL449q/byJ6WvRwNa41IZqw6M4dEmdjnmWKH9VNk/I2MlHE2Gj1scqHB
         64kZIENdT6C6A7oSyaq2TPwltkOTIz+TXzykQs2cugvPkfVS2HrjoIC7bePGt5zxbTJ8
         tC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773068846; x=1773673646;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TdH8bvkNIpDog/K3q0ZzGRX8OtZ/OKv1fjCXdvgPWAI=;
        b=Kyv3EvIEvnBjMBznPXAkAyC/iamWChJcFusxyS2KmTpCHSc1WwiBXmQ0VCGpbuPfgV
         hyFDQKKFtQkK9KUe/lyVep4lvMlHIEc7QYJXTQuMOhBrAaBzSicTqTYTeNbn01tWrfwh
         az/wYKW6EuMkz+9ddLx+DSz8gTL8RD/NEtqlpaOqmpwX+ZQg1HjC4Tf6VWn++mYBq4Op
         zV5/ZrEUnuwdypkzcMcVe0aifmQmSGIR4JPjxrfA6+KlMG1Yf1x37s/1eshAVpkS8OKt
         T8IPFpN+sPNlHImfNAUDvMOyfWlxvSwmjfZJt2uNwZuXmPuQe/LmLxmBcnpOS/RcyxgP
         q/Bg==
X-Forwarded-Encrypted: i=1; AJvYcCVME+gKAqqgechphfRUTKdBxS2THDbRyq8Tp9oBBhtX5NzfVc6JIHQ+t0ozn0MmIsB43Lc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyMVpkY559SfhqSk5h8NY6lgP+XimIjQGP2SeeIKbIAqc5tUSbQ
	4OgluOtAHkhjPWMOVgv7pmZUwygvdu4vD/1icYDqlK8zYpLRKL1ToOoJmDj+QgpFFRutq2JqoXZ
	YtFNRAo6+hCHUO5Ix8sM0cExVtxq5jZfWMoAMRA/sLw==
X-Gm-Gg: ATEYQzwfTlTUKf4uZqqkArRhzL0oKsv9xsCyGej0ZqlWz4zcDKXR3eF5w/8qmrcu74u
	bIz8BnLLUotWYRE2je0AWYnIIHv7GO4Y4MqVhuVwy4jJI+3Lq4wrRLQIjkBgcIcf80iSomgcEj9
	twuP28ztYeJFvmLep7vokdx5rFizX/mpxL5xLtFZ3RGY0dhl4Q3j7DcGMp4qFhsp9KYZ6FRgZZ7
	VXXMe9EVq8MzifHRfdXgbD4Sd+iNbLQI2Ai3Y3eVFljqbimDHcOJFPmaUyJzo/PDXs0YqN0sN6m
	stBQNG36
X-Received: by 2002:a05:6512:3409:b0:5a1:2a71:cc3b with SMTP id
 2adb3069b0e04-5a13ccb1aeemr3618408e87.18.1773068845876; Mon, 09 Mar 2026
 08:07:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260309143411.8231-1-ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <20260309143411.8231-1-ciprianmarian.costea@oss.nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 9 Mar 2026 16:06:49 +0100
X-Gm-Features: AaiRm53zSNZD-rgavB1hXZqnC71GE3J4BBqG9ZBYLAtj9oAS6JeEy0pPrIt0G5A
Message-ID: <CAPDyKFof23uOBe7duOLuFJ=qd8bv8f6ryFWbrPcTFB-Jg4ZQTA@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] arm64: Add initial support for NXP S32N79 SoC
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Haibo Chen <haibo.chen@nxp.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, s32@nxp.com, 
	Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Mar 2026 at 15:34, Ciprian Costea
<ciprianmarian.costea@oss.nxp.com> wrote:
>
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>
> This series introduces initial device tree support for the NXP S32N79
> automotive SoC and its Reference Design Board (RDB).
>
> The S32N79 is an automotive-grade system-on-chip featuring eight Arm
> Cortex-A78AE cores organized in four dual-core clusters. It is designed
> for high-performance networking and gateway applications vehicle
> architectures [1]
>
> Hardware features included in this initial support:
> - 8x Arm Cortex-A78AE cores (4 clusters of 2 cores each)
> - 32GB DRAM Memory. 28GB are usable and 4GB are reserved for ECC logic
> - Three-level cache hierarchy (L1/L2 per core, L3 per cluster)
> - GICv3 interrupt controller with ITS
> - SMMUv3 for IOMMU support
> - Generic Timer
> - IRQ steering controller
> - PL011 UART controllers
> - uSDHC controller
>
> This series also includes the necessary driver updates:
> - sdhci-esdhc-imx: Add S32N79 uSDHC controller support
> - irq-imx-irqsteer: Add S32N79 IRQ steering support
> - irqchip Kconfig: Add ARCH_S32 dependency for IMX_IRQSTEER
>
> Future patches will add support for additional peripherals such as
> networking controllers, PCIe, and other IP blocks.
>
> [1] https://www.nxp.com/products/processors-and-microcontrollers/s32-automotive-platform/s32n-vehicle-super-integration-processors:S32N
>
> v5 -> v4
> - Squashed irqsteer 'Kconfig' changes with the actual driver updates.
> - Fixed tabular layout in the irq-imx-irqsteer driver
> - Added received 'Reviewed-by' and 'Acked-by' tags from V4.
>
> v4 -> v3
> - Added missing Signed-of-by's from one commit removed in v3 by mistake
>
> v3 -> v2
> - Split S32N79 SoC dtsi into separate standalone commit
> - Renamed a memory node in the S32N79 board dts
> - Fixed IRQ STEER DT-Bindings support for S32N79 addition
> - Updated S32N79 usdhc driver support commit message
>
> v2 -> v1
> - added driver changes required for S32N79 uSDHC support
> - added driver changes required for S32N79 IRQ_STEER support
> - updated commit message for uSDHC dt-bindings
> - implemented fixes for 'dt-format' tool findings on newly added S32N79 dts files
>
> Ciprian Marian Costea (7):
>   dt-bindings: interrupt-controller: fsl,irqsteer: add S32N79 support
>   dt-bindings: mmc: fsl-imx-esdhc: add S32N79 support
>   dt-bindings: arm: fsl: Add NXP S32N79 SoC and RDB board
>   mmc: sdhci-esdhc-imx: add NXP S32N79 support
>   irqchip/imx-irqsteer: add NXP S32N79 support
>   arm64: dts: freescale: Add NXP S32N79 SoC support
>   arm64: dts: freescale: Add NXP S32N79-RDB board support
>
>  .../devicetree/bindings/arm/fsl.yaml          |   6 +
>  .../interrupt-controller/fsl,irqsteer.yaml    |   4 +-
>  .../bindings/mmc/fsl-imx-esdhc.yaml           |   1 +
>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>  arch/arm64/boot/dts/freescale/s32n79-rdb.dts  |  70 ++++
>  arch/arm64/boot/dts/freescale/s32n79.dtsi     | 362 ++++++++++++++++++
>  drivers/irqchip/Kconfig                       |   6 +-
>  drivers/irqchip/irq-imx-irqsteer.c            |  55 ++-
>  drivers/mmc/host/sdhci-esdhc-imx.c            |   9 +
>  9 files changed, 497 insertions(+), 17 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/freescale/s32n79-rdb.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/s32n79.dtsi
>
> --
> 2.43.0
>

Patch2 and patch4 applied for next, thanks!

Kind regards
Uffe
