Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCA03672BA
	for <imx@lists.linux.dev>; Fri, 12 Jun 2026 08:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781251921; cv=none; b=Qs1QZFDp0eOpTsL3bX58gS2JFaMjkaNasRBnQ1tAq2NkNM2iEAIQqUm5fBRM5v0HZngs9pXJmMkW23d/MPE2/hhhqIfbV9QPHsdHJQMyCp5btyQtSQDKpWdYw+GsFGrFOKdRDo60ddupw5eNJ93JQ0M05UIcLLDq5AR6W+jkC9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781251921; c=relaxed/simple;
	bh=w/KMCvTAaLSnkJCY40Gg7KHEFZvGewFVkWrfXQdQo0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dhuPsgJaEhLMyX2O5SiZoD4dfsrF4AXc40zsI9vaRpr5fhSy+++Ahpep2W+PahN4fQ3IotsJLkUZivQkPAKGYTIOrg6WnVJpZb3/rGZ5gFr/6w5aBD+AYDu1GKbRT7cwUOWZOQgIiRQrAprSLVbSSOlu96OX3b73IdIPpWjjqiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z4/j1m9P; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z4/j1m9P"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aa5a77c07aso104945e87.2
        for <imx@lists.linux.dev>; Fri, 12 Jun 2026 01:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781251918; x=1781856718; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MrRgMzUk2Tnqgkc/wKcgEOgJeLLj9KV+tTDn5EhNFR8=;
        b=z4/j1m9Pc2z1aXUpo+WzdDPng2+6TDSqGlgBcU4rT7HjNTkHvWkHl4lPl6loIu32yA
         Sk1IBh+dBoeg5Ah3V+bynHQg+2HOvF6wv1Q2ykp6+njAaP0EFH1nda+5LpVS7ZcrRK/7
         Kp1QOP+lK2pBmfBhJvju0+jrCaeghL4I3rksRgclSbgMaWnN6L2dWhL9rh2a6JunFyru
         Dg6nDULUQZZNtnxkQ3LS9dul/vlubPBXqu0dqlaEKJP1dxWtgNWSkVv6cRA80Ghnzcr9
         3Q26MP6FljXu7biWrcHur2q5uEFSREAzf9VNB/ZZT/qgGZn6Exx7w5ZFnMYLzBvvJ7qI
         YmgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781251918; x=1781856718;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MrRgMzUk2Tnqgkc/wKcgEOgJeLLj9KV+tTDn5EhNFR8=;
        b=gxEIp+hUlOX7AwbnaAC8J5uEGg6cSWUMRBhMFI6KR/19WexSMOjPIXN+4VQ0Ts5uMg
         to+b2VKAdKKfCMb04v+xeMmtXykU7kDZzNh7ywnPb5HtVYc1akccNuqDqSq9R94kNdQK
         k/iWVn8p8XG9th8Q8wFlmZlPm5u7c8904Mi7mgOFHKQWtO0d/qhsXrBHWJofNAeM7GF4
         eSdO5810te8wG9bschKE4l2K3UQU3oB1sTaPg2Ywh+e7iaawwO3QKVcOnnUO+BaD4mPC
         ImBRTtwwuP2i+YuIgQdETqqMDTPKy2NamVBYuxNh67f9ivrbWRW+T3cwQVwwu7ODzfd9
         aw6A==
X-Forwarded-Encrypted: i=1; AFNElJ+IGJxLKmcEYoWk9PBP3v3PzhriVK0V6M7zjbRXGAUp8Q88rtusg1pyplpccIy0rcHLfV8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4+xB+lmNNAZfVS9VFeMT3HZvYm7mPX1BcTFZNprhRyUEcvDtO
	YXBggCcGicD59NYwrNoeJBTRxusUlrnwLY150s8lGYSAIBf8/mImCk2dahWx1HVxC2w=
X-Gm-Gg: Acq92OGerUO1P7yHH+VKtLjcZcrM0fn99qm0L1NIbm4HeGp1EFMVhil8dnBBHibwf3m
	wZRfgPPg/ZVtAoY7AEHyqTNTl+7GhQXakprarnvAJU6Zz2zoHJpl5Q0tmvVNp5u9EGszubqx5JX
	kJBcwg7b1UQqWfN8p9Arh5UxoSU4OowtzmcGR8/0q7NiBLyfcyhO9hKsHZa45yKWHJP8wr3tYG/
	2nyf8mgFnzs2JLQQ0wM4yjT2N4vho1wkbeXLvf8lRBGfZutRjmafF0aiQE5xZL01o+B6dU5i5p9
	1+285FwDi65fSSfyb4wtxSG5djUSwqA/EtiGL0BR4bnFjTvKEZtDhOBPtbLVrewlkfOJr9BNmMe
	L5GeDHMl8mGFDBgXW+EAJOHgdK1rhy7MuyR4d1M8qmqKQ3Wy/x5sSwWWwvr2SHHIwQeId7+TQHg
	o+YEMftMnDgwbQBgyMBAKMBqIl91PRoFCPh3HXhlGH2lUFZpG4ozWYakRKXXsXmWEByiim7LHWJ
	PIuVw==
X-Received: by 2002:ac2:5f19:0:b0:5aa:6ba5:9a58 with SMTP id 2adb3069b0e04-5ad2db30090mr185209e87.1.1781251917979;
        Fri, 12 Jun 2026 01:11:57 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1bb12csm324070e87.84.2026.06.12.01.11.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 01:11:57 -0700 (PDT)
Message-ID: <6ec25a28-9d0f-4c87-a4e1-85d8e410eaba@linaro.org>
Date: Fri, 12 Jun 2026 11:11:56 +0300
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
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
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
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260608-shikra-camss-review-v2-7-ca1936bf1219@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/8/26 17:06, Nihal Kumar Gupta wrote:
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

Same as before, the numeration of data lanes starts from 1.

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

This part goes directly to the mezzanine .dtso file.

After fixing it,

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
