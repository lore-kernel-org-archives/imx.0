Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574393EF0A4
	for <imx@lists.linux.dev>; Tue,  9 Jun 2026 08:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780995356; cv=none; b=TGNd1BikaPFdfrpp4+rKhy7cE3XEq5Q83ncwzPWU6Mn5bI07Q+QCpz6SEwEKG+pXu/zRfC5RDoU44SPQK+4KLJkHekErvtDXAXrzHhxjP77TiPso+JgHXEu2EPrE7CJCRvlh3KwfD8y9PpRl1H/zXj/Zmm08Ta6tJIX89t8XbnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780995356; c=relaxed/simple;
	bh=WEUJDi01qfK1lYTO7fit5r3i6qyzMDV+kRJKNjn0A1c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hK9itCPBV2o2AjXcCiVqfHNqeFAl7m/O1BFc0tiYW6DvJd4wmRWPdIVgElfw87d30Il3MBXTUaVXDm3uZ1DSzHVJJJ5tzJ7z/xYqMpqqBoA7Vi3kDJWV0KpFPrOHQmmJ85Rivqa7e3sJPSre7oVKmf7A/Vav3c5lG+oi+xJ0dDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OdbdRRD9; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OdbdRRD9"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-bec450b950dso746190766b.2
        for <imx@lists.linux.dev>; Tue, 09 Jun 2026 01:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780995353; x=1781600153; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fGHDi/EgG5Cp56Yn719wGUCuyzVWJDzp1Ho86cPqGa4=;
        b=OdbdRRD9l0LyZzsHFEyp9O1hUT0elzGevEL4tZivbbvW25cycwZm8Ch22XUmAEt4zE
         7YnRhwpaDVJ2uHBXcXZDG4caUwEjvydc0kGNgclmY0WfTGckQhU+2PBz4rJoveMHYNPt
         XCty2Q/PnS/KPE4chh913iq2ulT4aYAbJuLb4BmDbKEWFwO0e0fwfVz2E+8GnpGkKqrk
         LFdHoeylqraN33TL2LA5ZzxyXb/f+lk8W3nsEKFgvS6k95jy06JpFVSnvVn5MkBwYUSf
         gCbWekHfEltyElVkZ8aU/BzppKvKaDrbwwhwsLHn0+NVkI4wJhEP59/UCSSks9AbTqfY
         OSUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995353; x=1781600153;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fGHDi/EgG5Cp56Yn719wGUCuyzVWJDzp1Ho86cPqGa4=;
        b=YQmHiY7BcF1veyNc/4tDN8I301yXaremvW4M0Vhre2XPVUG8T2JUwuES0mTX39jhub
         PBbck3bsKO/P8CQxzU7XEb2/7KiJLrL2cbA9rg9imdbU+CEKjtmMp4yPDjiBhcvol+JV
         yDQcF7yv7mbDuvvXKthfVRyX/7ryQ8oQbD2TK6fmVLGTS+goWXSQfaY7CJ2LPOA4CzKX
         Wl+QCEwmZ2O/VjF9XV0E7A7JFuOd92JVoaAGe7Bnotv6G+3hY81ZoKI6eoJh8YJ1DSyq
         6i9gnGhWjyD4iQ4IN9v/GpBMCtnhVmYt//8z4Q5O3POW+DxaMG7PxVCLuu2kWgLz076R
         zRDg==
X-Forwarded-Encrypted: i=1; AFNElJ+QdSjlg7/aWarDVO3NNklHIYA/n8Hp1rvDZswazNJBmug6hRA51ZnqfRKij7F4RkWjnCI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwetwEDLnYU2+hw+58zlmYrxjUKOMzJasWWH2btBTf6anSIDbPL
	PXTEGc01cUFh+s3Bm4As/1z8DdjoRsAU45bINPat3i3aNrqpDBPZAmtwIZhpJxMNs0s=
X-Gm-Gg: Acq92OEacU53m7DvVKTxPBPAdHXGL4S2GdBdU7gLshDUIkFjlFk7BxKuGYc3GDXG1cy
	SdJV73IpPybEb3N26T61yYCKqjNO0RKNBzLazbpxCct1J8g9+PzFvrjKgfGItYbWRIUvAwaCbyr
	VD1qnIELfcdf5qaY7PXOHM9LGnNEEzqWo15Ata7l464Zoap2L+ipu3ZSz58MEZN09VvRmtAtMMi
	f+BbTmCgC6WbbPGaGugZXxMgjiOTkXpSC3XvYrggkHw35FaHurg8USo1yAnnzaAEEnV1U4CZMIM
	P/3O9W1GG47bvZiWPUJM1LRCjvKS4ecLbddjfJX4e2tlvz9zlSClj2wGHFXOeW3OYgYj96kJWH3
	elv9z8atwizxObWGDJDQvWtJKJWPkwDDLpZ3dxSFimrKDxZuzKqhZ7osHM1LDnYJ7s7f9hT03aj
	l/gtMetxDySJ6G0C2z5kV0K5PiPwPbMyhE/uWlP6wRvxisA8UrN88ANuY=
X-Received: by 2002:a17:907:da9:b0:bed:8f7e:d84b with SMTP id a640c23a62f3a-bf373902d8bmr939406866b.43.1780995352597;
        Tue, 09 Jun 2026 01:55:52 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.72.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0517714c5sm1012233266b.2.2026.06.09.01.55.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 01:55:52 -0700 (PDT)
Message-ID: <20ea3aef-99af-4185-88c4-0b0d96c865f0@linaro.org>
Date: Tue, 9 Jun 2026 09:55:50 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: shikra-iqs-evk-imx577-camera:
 Add DT overlay
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Suresh Vankadara <quic_svankada@quicinc.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
 <20260608-shikra-camss-review-v2-7-ca1936bf1219@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260608-shikra-camss-review-v2-7-ca1936bf1219@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/06/2026 15:06, Nihal Kumar Gupta wrote:
> Shikra IQS is an industrial-grade variant using PM8150 PMIC, requiring
> different CSIPHY and sensor supply rails compared to the retail boards
> (CQM and CQS) which use PM4125.
> 
> Add a dedicated overlay for optional IMX577 integration via CSIPHY1.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/Makefile                  |  2 +
>   .../dts/qcom/shikra-iqs-evk-imx577-camera.dtso     | 70 ++++++++++++++++++++++
>   arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts        |  9 +++
>   3 files changed, 81 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 76b8f144983827f4905a72935e8d5291a227dc97..09f2318d1c12c4239a6a7bac4ecbca38eb65ffa2 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -340,9 +340,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
>   
>   shikra-cqm-evk-imx577-camera-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
>   shikra-cqs-evk-imx577-camera-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-imx577-camera.dtbo
> +shikra-iqs-evk-imx577-camera-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-imx577-camera.dtbo
>   
>   dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-imx577-camera.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-imx577-camera.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-imx577-camera.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso
> new file mode 100644
> index 0000000000000000000000000000000000000000..340d6303adc6e1bea55f1bd0598175f0cb269737
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso
> @@ -0,0 +1,70 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/clock/qcom,shikra-gcc.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&camss {
> +	vdd-csiphy-1p2-supply = <&pm8150_l11>;
> +	vdd-csiphy-1p8-supply = <&pm8150_l12>;
> +
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			csiphy1_ep: endpoint {
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&imx577_ep1>;
> +			};
> +		};
> +	};
> +};
> +
> +&cci {
> +	status = "okay";
> +};
> +
> +&cci_i2c1 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	camera@1a {
> +		compatible = "sony,imx577";
> +		reg = <0x1a>;
> +
> +		reset-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 = <&cam_mclk1_default &cam1_reset_default>;
> +		pinctrl-names = "default";
> +
> +		clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
> +		assigned-clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
> +		assigned-clock-rates = <24000000>;
> +
> +		/*
> +		 * avdd and dvdd are supplied by on-board regulators on the
> +		 * IMX577 module from the connector's 3.3 V rail; they are
> +		 * not SoC-controlled. dovdd (1.8 V) powers the carrier board
> +		 * level-shifter that translates CCI I2C and reset lines
> +		 * between the SoC and the connector.
> +		 */
> +		dovdd-supply = <&pm8150_l15>;
> +
> +		port {
> +			imx577_ep1: endpoint {
> +				link-frequencies = /bits/ 64 <600000000>;
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&csiphy1_ep>;
> +			};
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> index 3003a47bd7594206f0ac54957e0af509fa365f54..811fd5da4af7babd412d70fee84434849846dc2f 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
> @@ -38,3 +38,12 @@ &sdhc_1 {
>   
>   	status = "okay";
>   };
> +
> +&tlmm {
> +	cam1_reset_default: cam1-reset-default-state {
> +		pins = "gpio33";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +};
> 


Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
