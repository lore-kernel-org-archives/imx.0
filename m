Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B98F35E54A
	for <imx@lists.linux.dev>; Thu, 18 Dec 2025 16:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766075195; cv=none; b=q7ZbcBbfuTNVQF0/tU5lMj3dcIt3BNZe0oYzTnj1oJMrQCp3Sqh0j5bJBQjyfSsfkdcgZq3VtEDSHOx29v2i67GMojUbtQkP55ehFVlI5qDDV6h37MPzeJJfwPVpSfEpn8fQnJGK+7N7SzN7c/VQoKIGllUoj8zgyMsFWbMItpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766075195; c=relaxed/simple;
	bh=PajlIvKA+qiiCxxbkeQoomgkXm+Xqzq2c9FCKYw1Apg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mOlmgHcbY1YqeOepT71dFR5VSQHj3aK+eEg+rtit9y6loODl5iljYuj5PJStsuT2PeeTiPRUgSaptvB6H6vHCpx4vd1/xyb/OhFIE1XrDFQLQvVupH5g13H/S8Nh0yJWBBuI2kU69s1u5Tmcqnx8ySyrWnAb257wYS+kv36lWy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QTwKH4Rt; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QTwKH4Rt"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6418738efa0so1554185a12.1
        for <imx@lists.linux.dev>; Thu, 18 Dec 2025 08:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766075192; x=1766679992; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qJpFHTDEzB05X66xrFgKLfHjWEJGjQ85HofDR0VslZY=;
        b=QTwKH4Rtz6C8iaTmkdf40aLNPDZWe+0Wn6BZ4k9CRQv10oOTH3wpxblYmuo+in0xjo
         oFqc9PRdGOT0rlYA/idWAZw1o02SmCJFEiPO5zRPkkLnFWbD9r0KNCH1hWyWzchKWLYX
         8lqGX7muaa4ZyKDz3a5rI/SmTPx+s0XlUojvKtYWq2f0elClGPXK2+5WGyzhHesW18js
         wrC473P6/NtsqNF6RRHM7YLTLBWRcFchYHUe7K7Fwc/TFK9MELzO0a1NfvbBKWytk/VB
         mhCqUKmbbU8h11i7mGgk/Me8zk7IzqKYWwJSBfgToRzeSCHWMW2U2UO0CTBpUCXRkIMn
         hq0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766075192; x=1766679992;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qJpFHTDEzB05X66xrFgKLfHjWEJGjQ85HofDR0VslZY=;
        b=maNyieDoeOEhQjwDIdxukJkkb68LacirX2t0nXdI0vd6I94QSV8HQ07OvoGci7kzJU
         nrXq3XgRiOiKeTrfvTylKm5kaq9C01kSAuOSKQVCc0EgoghLUIFiIm2TGf6O+YrQMwYT
         wLfK7iomf2M5O1yPnbMd+XOZkY7aQDcIoJnMAYCqfzUsbn67CEmdSBUQAde2sUVw255X
         ZIPQJGTape4yOKogIgWbMCsgYomlWRV0Dik+INxvtO36benSQ/JTzjA6jX4pxI0wyPnF
         gXnUUm4B3KC3XV+pR8vpdpW/ny/0CsjMzYTFaSvjeE1eQUnh5Vfz/1/rY+hZlO0jI5jH
         xfEw==
X-Forwarded-Encrypted: i=1; AJvYcCXSh9qBbuoB/kXrc1zKb8fDlsPqusg8WGtlZGe7Et+/eI/Qu43jvyR/wjlpkaVhufjT6gg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyxY135F1al0U7XX8wvplqpIE5eTNKUdiSCU4IcJgRZGXEmJVFU
	6qRhxaHKed1+KgA9MbQAeWycZAKypFoftXhe7/qAPLSVcTWxbYX3ZZOP
X-Gm-Gg: AY/fxX5evZV/56+edLwwOYVjjmBtE28qSWBtQtrpRN5I8O3C/tFg9mnbPWxU04ceHY5
	i0iFXVlgbuCr6qPC10bJV4JODj7mHUuBY+C3dOngmxRUkFCn7m1Zv8/UJCcG/X4DMPXW+qhzcOt
	5DcsXVt01YfbzhkQK/aafs9/voAcyhd4e+P4n96L0QnN8OZrektxTTwtfwg3lySb2c5s0FDJT6g
	3iDbRUnWoff3kRB2Klv2B93FQ+jBe79aqiycW75Cx1fs7gdu01/FN922yJMIt4UNDqVasogDjnf
	A72k4gizvwAHqaOgrkKPxZAQk+cPQ/Lmg6d1HzbdAkjtdIJpty7WTXvuEyv4JqTdH6/bTcnmJA8
	UBsYj1uDqgUE8a6WqqnfWFyKq5MJhCzYpVofsl87u+mt1voKvUOcY7QBTafVCniTgTEPZ6Obb54
	bv4um4QFfHmKfFNbKLlk7jByVypt8WsAqzSjKYhXpQjA==
X-Google-Smtp-Source: AGHT+IEiLlrNwayE/OEejVPPibTN9DbqbxeQkY7CK+E1iqQkD32NejUfdbwg4BUX3IiK49c125TzrA==
X-Received: by 2002:a17:907:3fa7:b0:b72:5d08:486c with SMTP id a640c23a62f3a-b7d23a9d458mr2400079666b.27.1766075191457;
        Thu, 18 Dec 2025 08:26:31 -0800 (PST)
Received: from [10.25.219.74] ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b802350dac6sm270774666b.65.2025.12.18.08.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 08:26:31 -0800 (PST)
Message-ID: <3e449b21-5ffb-4a6a-b0c4-e9f381334883@gmail.com>
Date: Thu, 18 Dec 2025 08:26:34 -0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: freescale: imx95: Add support for
 i.MX95 15x15 FRDM board
To: Lei Xu <lei.xu@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 justin.jiang@nxp.com, qijian.guo@nxp.com
References: <20251217-127-v2-0-67cb12e56242@nxp.com>
 <20251217-127-v2-2-67cb12e56242@nxp.com>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20251217-127-v2-2-67cb12e56242@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 12/17/2025 9:56 PM, Lei Xu wrote:
> The i.MX95 15x15 FRDM board is a compact and cost-effective development
> platform based on the i.MX95 applications processor.
>
> Add device tree support for this board, including:
>  - LPUART1 and LPUART5
>  - NETC
>  - USB
>  - PCIe
>  - uSDHC1, uSDHC2 and uSDHC3
>  - FlexCAN2 and FlexCAN5
>  - LPI2C2, LPI2C3, LPI2C4 and their child nodes
>  - Watchdog3
>
> Signed-off-by: Lei Xu <lei.xu@nxp.com>
> ---
> Changes in v2:
> - Switched from 'xceiver-supply' to CAN PHY nodes using 'phys'.
> - Added CAN PHY nodes for flexcan2/5 with shared silent-gpio, removed reg_can_stby.
> - Updated MSI/IOMMU mapping comment to match the i.MX95 15x15 FRDM board.
> ---
>  arch/arm64/boot/dts/freescale/Makefile             |   1 +
>  arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts | 963 +++++++++++++++++++++
>  2 files changed, 964 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index f30d3fd724d0..71308d19d35e 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -400,6 +400,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx943-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
> new file mode 100644
> index 000000000000..414ebdacc3cb
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
> @@ -0,0 +1,963 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/phy/phy-imx8-pcie.h>
> +#include <dt-bindings/pwm/pwm.h>
> +#include <dt-bindings/usb/pd.h>
> +#include "imx95.dtsi"
> +
> +#define BRD_SM_CTRL_SD3_WAKE		0x8000	/*!< PCAL6408A-0 */
> +#define BRD_SM_CTRL_PCIE1_WAKE		0x8001	/*!< PCAL6408A-4 */
> +#define BRD_SM_CTRL_BT_WAKE		0x8002	/*!< PCAL6408A-5 */
> +#define BRD_SM_CTRL_PCIE2_WAKE		0x8003	/*!< PCAL6408A-6 */
> +#define BRD_SM_CTRL_BUTTON		0x8004	/*!< PCAL6408A-7 */
> +
> +/ {
> +	compatible = "fsl,imx95-15x15-frdm", "fsl,imx95";
> +	model = "NXP i.MX95 15X15 FRDM board";
> +
> +	aliases {
> +		ethernet0 = &enetc_port0;
> +		ethernet1 = &enetc_port1;
> +		gpio0 = &gpio1;
> +		gpio1 = &gpio2;
> +		gpio2 = &gpio3;
> +		gpio3 = &gpio4;
> +		gpio4 = &gpio5;
> +		i2c0 = &lpi2c1;
> +		i2c1 = &lpi2c2;
> +		i2c2 = &lpi2c3;
> +		i2c3 = &lpi2c4;
> +		i2c4 = &lpi2c5;
> +		i2c5 = &lpi2c6;
> +		i2c6 = &lpi2c7;
> +		i2c7 = &lpi2c8;
> +		mmc0 = &usdhc1;
> +		mmc1 = &usdhc2;
> +		mmc2 = &usdhc3;
> +		serial0 = &lpuart1;
> +		serial4 = &lpuart5;
> +	};
> +
> +	


(snip)


> +
> +	sound-micfil {
> +		compatible = "fsl,imx-audio-card";
> +		model = "micfil-audio";
> +
> +		pri-dai-link {
> +			link-name = "micfil hifi";
> +			format = "i2s";
> +
> +			cpu {
> +				sound-dai = <&micfil>;
> +			};


please add a space in between the definitions of the cpu and codec nodes. With that:


Reviewed-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>


> +			codec {
> +				sound-dai = <&dmic>;
> +			};
> +		};
> +	};
> +
> +	usdhc3_pwrseq: usdhc3-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		reset-gpios = <&pcal6524 8 GPIO_ACTIVE_LOW>;
> +	};
