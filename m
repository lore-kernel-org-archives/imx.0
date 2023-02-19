Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB8BA29
	for <imx@lists.linux.dev>; Sun, 19 Feb 2023 09:42:57 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id z7so6213268edb.12
        for <imx@lists.linux.dev>; Sun, 19 Feb 2023 01:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g67KTUEu1MAdzj1fxuzfo1Jy7iO9UcQ/HGCP29+etcg=;
        b=pbpPg1+0txMFMUEh4H3MkNkh6oIg5vys2b+945M3XNxjGgw1BFSnesa4UYK76FzFlh
         hcZQgZAizjB+KuUd+V+2vNp7WoFZOPjGvDk04/7sx62CKjxPoMi6kxE6oNrsWRCZk3YA
         1nLFStM59PzBiW8DHl7YfwXwnJby/yISxUlINs8qc+UoL8S9K1PAzNgtlvfQ72HgIWIN
         v+kzxyESHL3/rsFrqgJdbS3sJQS0izaIZUhrnnrFMM+xfUZ6V4YMUXFJRnHcawvWRI/w
         jicR6+olSiTKy6+rVLNlayBjmyfi/4+DLwkkUOCYPOvZJMczmfpimRsM5hWNhksda54T
         C13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g67KTUEu1MAdzj1fxuzfo1Jy7iO9UcQ/HGCP29+etcg=;
        b=5h4Yf+xv9FjMkx1gQNlu7NVvHFZzMG2PBabnt0Rf4h0rJP0FNHR1vcxbiTb1oNkE5B
         oVwCvIhMqmfJYPmcYfS+reKRKQkKa2fauyTGUEbedX/4NDOal+BfmGGfbw94rCBNrM5U
         1ruLrNo7oQu5JQ8f9B/gzGRbNNE7SQQe3jVcYjfZqtEiXJB9kt5VQ+igYPiP7omxSmql
         ScXUf1emlhJjvhkt86kuCikpz9g+wM/ZAgs6eJe4Cqi5v8nH+8PVeaFCaSRApgbmzB3q
         aMPjKKphFtdZJXEF9r0VmkMD0cdmgE63p2iSGDfPIGUHQQUekvPy/Tr2mpKuomn1eNEr
         j2PA==
X-Gm-Message-State: AO0yUKUJfvfaMQASdvkJ0ps+KhNxy0bEf9trzaqzrVRfQF34xUMsInyk
	dMLTKJmQWQ0HucTDQNbpegTEZw==
X-Google-Smtp-Source: AK7set//fmvW7r/X/KRQ18FljvJ2RDjt2zQcSddkatdljZt5z63B1Q/q9kT2A71vGAyJKegTasT69A==
X-Received: by 2002:a17:906:4f07:b0:89f:1a76:e2dc with SMTP id t7-20020a1709064f0700b0089f1a76e2dcmr6515992eju.0.1676799776177;
        Sun, 19 Feb 2023 01:42:56 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id u22-20020a056402065600b004accc54a9edsm572334edx.93.2023.02.19.01.42.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Feb 2023 01:42:55 -0800 (PST)
Message-ID: <dcba0ee6-987e-0f61-164a-1b62945a938c@linaro.org>
Date: Sun, 19 Feb 2023 10:42:53 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 3/4] arm64: dts: freescale: Add support for the
 Variscite i.MX8MP DART8MCustomBoard
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
 Marco Contenti <marco.c@variscite.com>, Nate Drude <nate.d@variscite.com>,
 FrancescoFerraro <francesco.f@variscite.com>,
 Harshesh Valera <harshesh.v@variscite.com>
References: <20230219031126.19372-1-laurent.pinchart@ideasonboard.com>
 <20230219031126.19372-4-laurent.pinchart@ideasonboard.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230219031126.19372-4-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/02/2023 04:11, Laurent Pinchart wrote:
> The DT8MCustomBoard is a carrier board for DART i.MX8-based modules.
> This device tree file adds support for the DT8MCustomBoard v2.0 with a
> connected DART-MX8M-PLUS module.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>  .../imx8mp-var-dart-dt8mcustomboard-v2.dts    | 499 ++++++++++++++++++
>  2 files changed, 500 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart-dt8mcustomboard-v2.dts
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index ef6f364eaa18..4e6cfcd22e86 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -92,6 +92,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-icore-mx8mp-edimm2.2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-msc-sm2s-ep1.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-rdk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-dart-dt8mcustomboard-v2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw74xx.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-dart-dt8mcustomboard-v2.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-dart-dt8mcustomboard-v2.dts
> new file mode 100644
> index 000000000000..5677236e0ef1
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-var-dart-dt8mcustomboard-v2.dts
> @@ -0,0 +1,499 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> +/*
> + * Copyright 2019 NXP
> + * Copyright 2020-2021 Variscite Ltd.
> + * Copyright 2023 Ideas on Board Oy
> + */
> +
> +#include "imx8mp-var-dart.dtsi"
> +
> +/ {
> +	compatible = "variscite,dart-mx8mp-dt8mcustomboard-v2",
> +		     "variscite,dart-mx8mp",
> +		     "fsl,imx8mp";
> +	model = "Variscite DART-MX8M-PLUS on DT8MCustomBoard 2.x";
> +
> +	chosen {
> +		stdout-path = &uart1;
> +	};
> +
> +	can0_osc: can0-osc {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <40000000>;
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		status = "okay";

Drop status.

> +
> +		key-back {
> +			label = "BACK";
> +			linux,code = <KEY_BACK>;
> +			gpios = <&gpio_exp_1 7 GPIO_ACTIVE_LOW>;
> +			wakeup-source;
> +		};
> +
> +		key-up {
> +			label = "UP";
> +			linux,code = <KEY_UP>;
> +			gpios = <&gpio_exp_1 5 GPIO_ACTIVE_LOW>;
> +			wakeup-source;
> +		};
> +
> +		key-home {
> +			label = "HOME";
> +			linux,code = <KEY_HOME>;
> +			gpios = <&gpio_exp_1 4 GPIO_ACTIVE_LOW>;
> +			wakeup-source;
> +		};
> +
> +		key-down {
> +			label = "DOWN";
> +			linux,code = <KEY_DOWN>;
> +			gpios = <&gpio_exp_1 6 GPIO_ACTIVE_LOW>;
> +			wakeup-source;
> +		};
> +	};
> +
> +	gpio-leds {
> +		compatible = "gpio-leds";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_gpio_leds>;
> +		status = "okay";

Drop status

> +
> +		led1 {
> +			label = "LED1";
> +			gpios = <&gpio_exp_2 7 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "heartbeat";
> +		};
> +
> +		led2 {
> +			label = "LED2";
> +			gpios = <&gpio_exp_2 6 GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		led3 {
> +			label = "LED3";
> +			gpios = <&gpio_exp_2 5 GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		led4 {
> +			label = "LED4";
> +			gpios = <&gpio4 18 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "mmc2";
> +		};
> +	};
> +
> +	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VSD_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		startup-delay-us = <100>;
> +		off-on-delay-us = <12000>;
> +	};
> +};
> +
> +&ecspi1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_ecspi1>;
> +	cs-gpios = <&gpio5  9 GPIO_ACTIVE_LOW>,
> +		   <&gpio1 12 GPIO_ACTIVE_LOW>;
> +	status = "okay";
> +
> +	touch@0 {
> +		compatible = "ti,tsc2046";
> +		spi-max-frequency = <1500000>;
> +		reg = <0>;

reg is usually second property

> +		status = "disabled";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_restouch>;
> +
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <7 IRQ_TYPE_EDGE_FALLING>;
> +
> +		pendown-gpio = <&gpio1 7 GPIO_ACTIVE_LOW>;
> +		wakeup-source;
> +
> +		touchscreen-min-x = <125>;
> +		touchscreen-min-y = <282>;
> +		touchscreen-size-x = <4009>;
> +		touchscreen-size-y = <3865>;
> +		touchscreen-max-pressure = <255>;
> +		touchscreen-average-samples = <10>;
> +
> +		ti,keep-vref-on;
> +		ti,settle-delay-usec = /bits/ 16 <150>;
> +		ti,x-plate-ohms = /bits/ 16 <180>;
> +		ti,debounce-tol = /bits/ 16 <3>;
> +		ti,debounce-rep = /bits/ 16 <1>;
> +	};
> +
> +	can@1 {
> +		compatible = "microchip,mcp2518fd";
> +		spi-max-frequency = <20000000>;
> +		reg = <1>;

Ditto

> +		clocks = <&can0_osc>;> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_can>;
> +
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <6 IRQ_TYPE_LEVEL_LOW>;
> +
> +		microchip,rx-int-gpios = <&gpio5 4 GPIO_ACTIVE_LOW>;
> +	};
> +};


Best regards,
Krzysztof

