Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8732E32BF25
	for <imx@lists.linux.dev>; Tue, 28 Oct 2025 12:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761653711; cv=none; b=VJR/MKm7ZnrR6SByFi9TOeAT3BvciqFLjC2Pk7lZbsy+VUi/Q/pXt9Je1zkNYSriz7m0IgasDpyf7qE5qfY8jzizVZ8Zq1ZVzuiznKBrE9ZmPwXmq/Ubh5yYuP191Hj3CsmDawRMhi4G/qt7EFq55y5bnC5B68CDLUglWRhpnr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761653711; c=relaxed/simple;
	bh=HZb1NJk9EiYvwXWi/VvLTVxzoQi8tgU2qAmxFsu1Zc8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vurve7uxkSBpXRottuCj+gfaxV7Mj6r7g2lyyADdt3dbsDVrHWQcGCglgRP7hY2Q1u9yCtj5pu06CIuN/p6CxFxwYnLRug9V+s+IdwrGuxOkv+BoNizboyDMnGA7nP/bOR0v2FTfK4/o/PZ1GsIOC+cvhcYhVK8P0Hlk86kgS80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CTTOiZVl; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTTOiZVl"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-362e291924aso48379561fa.1
        for <imx@lists.linux.dev>; Tue, 28 Oct 2025 05:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761653708; x=1762258508; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YJAViX7/B9WZe7f1Z9+bJz1YrkYOWWpEGINZC+5C01E=;
        b=CTTOiZVlR/1Dfjxa0IVYl0WoBN0pZODgsxcPORPt9VpcwMME6Ir8ssZU6qjSvD6Xb0
         sPSZpeyOMA7BlcgwVf4N8P2PzTU9VDH3SZPBy7iocToZoAPhIMDMgU1Xj9MiPZRL2Ls1
         6e7DXJjqxJjqBmWyJnwS/QWyUTbOuy/kNebGAD/WFBDG/bFTAT+dPRyyh4Os+evRscVc
         AEJiiTw9IRDMm4OWoAdSo4SvGfgDED4XXUpx+EW6ajAR+kGJrHH7d5Y3Xwg1+taYH6yH
         zT36O2upc0heHB52Me7neDFiQjoQAYe/I6cROypFdlSuIw+0XwwbKMlCx1TQ8NKp1h8/
         4VeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761653708; x=1762258508;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YJAViX7/B9WZe7f1Z9+bJz1YrkYOWWpEGINZC+5C01E=;
        b=t2bAjJF4huo/Fof3IrS+vwJ8uQeD8JF5MOwQ30oknyAkGzo68fejpGPJEjLndWZ5sh
         m6vqTXZc44pBjUUrIkub63/JDTVy1PIu2FCPO5hYWQFO/WJR4sRPRiQCAHsX1w63tHxo
         XxVXFMvIc8g6ANXLbtJ6PmZ72gjKYehxYqur6XT79Py41r8UDFCM3auwHAkliHKn0jrS
         ACYFQC+gmFrUCgJd9JvJfII/gRoOLOGe1cjz/f0wxa1ddtW26PLVq8/89QxtPUOoemQ4
         aJZXIval0qgIdm7Co31HW7b6+F2SjkxfJ9y6HuaH6qmH9h6DUqZfdD7e/nwlo9rjj1cP
         Gojg==
X-Forwarded-Encrypted: i=1; AJvYcCVnGAEKYpcs0dQs9dvIrT6Bgnn5yO4IjttMnBU+Gc/JuDwHJon+HGOUdlIBPjLWYILU4Qw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3rwpanFleNqsQO9aW4I86OUDsTCG/v2dYsVI6pUhqQzUgIJll
	fPyS8SqKOxqH2EEEAYymck8EXEdYV4tmaNEQbd+Uec0u1sld0Rksr9TWKBhyBffi
X-Gm-Gg: ASbGncs2mxYfMDktkQvXywTGVRUHJxDXvBkr6l2tOCn2meJquH66XMAAHkS9DJZTH+Y
	GNvd9t3bia2SVqLLcr+3FHwzQFESQKlmHp4u7hW3aAOJFSXddo5jKZbyB8NQzya0NZRxgNEsyQX
	qZ59c7zKMEbFZOTdAi0azoOTqCh2PYwm+LIpoa++tqFJxXFYwdq7V5jZIFw6H6Vkzo0n3h/1GNW
	LRHJTEtro+qf9i5aLmfANYvzrCXAli6mc284BOe9bOq15Fxo/VeegqOocrsXShMv7rr200suUrO
	JxSp8m+PXSMEymOMROUB2ljidVnbgJf1rJwsSfn2z48t5Jd+g9P7v2jIiseh2AsVdn3VaxW6QZS
	cZxsHs5PuM9DMJcC4WSnTjXbKwiBXWU8qgfD1KjKArP4vm/1Dnt7INFjZv9BN/CumRMWfwjvVVu
	ZRrDcilyY+zFZyPK/b7uHkLwN9Kv/Q1r1jtcUlAKaFJhwaU7wjQK3QWAMC5g==
X-Google-Smtp-Source: AGHT+IFB+EXEALL0lVPB7zL+t0ISwe5rbBYFS+A45wiTOhrUz5I795qhcCG4TnO4o8BABiT+ozftyw==
X-Received: by 2002:a05:651c:20cb:20b0:378:ddbe:2d95 with SMTP id 38308e7fff4ca-379076c11aemr8817671fa.20.1761653707262;
        Tue, 28 Oct 2025 05:15:07 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee09204esm28490401fa.8.2025.10.28.05.15.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 05:15:06 -0700 (PDT)
Message-ID: <a7012995-c2a8-48a3-abe1-5c227272f21c@gmail.com>
Date: Tue, 28 Oct 2025 14:15:05 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm64: dts: freescale: add Ka-Ro Electronics
 tx8m-1610 COM
To: maudspierings@gocontroll.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20251022-mini_iv-v2-0-20af8f9aac14@gocontroll.com>
 <20251022-mini_iv-v2-3-20af8f9aac14@gocontroll.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20251022-mini_iv-v2-3-20af8f9aac14@gocontroll.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Maud,

Thanks for the upstreaming work! :)

On 22/10/2025 10:22, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
> 
> The Ka-Ro Electronics tx8m-1610 is a COM based on the imx8mm SOC. It has
> 1 GB of ram and 4 GB of eMMC storage on board.
> 
> Add it to enable boards based on this module
> 
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>   .../arm64/boot/dts/freescale/imx8mm-tx8m-1610.dtsi | 439 +++++++++++++++++++++
>   1 file changed, 439 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610.dtsi
> new file mode 100644
> index 0000000000000..46d3ad80942cc
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610.dtsi
> @@ -0,0 +1,439 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2021 Lothar Waßmann <LW@KARO-electronics.de>
> + * 2025 Maud Spierings <maudspierings@gocontroll.com>
> + */
> +
> +#include "imx8mm.dtsi"
> +

// snip

> +	pmic: pmic@4b {
> +		compatible = "rohm,bd71847";
> +		reg = <0x4b>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-0 = <&pinctrl_pmic>;
> +		pinctrl-names = "default";
> +		rohm,reset-snvs-powered;
> +
> +		regulators {
> +			reg_vdd_soc: BUCK1 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <900000>;
> +				regulator-min-microvolt = <780000>;
> +				regulator-name = "buck1";
> +				regulator-ramp-delay = <1250>;
> +			};
> +
> +			reg_vdd_arm: BUCK2 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <950000>;
> +				regulator-min-microvolt = <805000>;
> +				regulator-name = "buck2";
> +				regulator-ramp-delay = <1250>;
> +				rohm,dvs-run-voltage = <950000>;
> +				rohm,dvs-idle-voltage = <810000>;
> +			};
> +
> +			reg_vdd_dram: BUCK3 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <900000>;
> +				regulator-min-microvolt = <805000>;
> +				regulator-name = "buck3";
> +			};
> +
> +			reg_vdd_3v3: BUCK4 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-min-microvolt = <3300000>;
> +				regulator-name = "buck4";
> +			};
> +
> +			reg_vdd_1v8: BUCK5 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <1950000>;
> +				regulator-min-microvolt = <1700000>;
> +				regulator-name = "buck5";
> +			};
> +
> +			BUCK6 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				/*
> +				 * The default output voltage is 1.1V, bumped
> +				 * to 1.35V in HW by a 499R/2.2K voltage divider in the
> +				 * feedback path.
> +				 */

Could/Should this be described using the:
'rohm,feedback-pull-up-r1-ohms' and
'rohm,feedback-pull-up-r2-ohms'? If I understand the comment correctly, 
that might allow the driver to be able to use correctly scaled voltages.

https://elixir.bootlin.com/linux/v6.18-rc1/source/Documentation/devicetree/bindings/regulator/rohm,bd71837-regulator.yaml#L108

> +				regulator-max-microvolt = <1100000>;
> +				regulator-min-microvolt = <1100000>;
> +				regulator-name = "buck6";
> +			};

Yours,
	-- Matti
