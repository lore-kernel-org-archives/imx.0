Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F823242BA
	for <imx@lists.linux.dev>; Fri,  6 Feb 2026 16:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770395152; cv=none; b=C0TQ09G4rph+zKfLj6DDAt+wGqyGczoUSb5RseoZegcgPbbAqVR07Y7HBaoGCuRUvTXndNdVM/E/Tsd+Sdiuv7dlkR5oVGAtzLhA8ujTAAjOclSTFRHorpW3kMIUc4T/GqKKDt++0n34Crk+DiXnllfwxoPiYGRP3GOuWyjanAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770395152; c=relaxed/simple;
	bh=kkIsEzWW3sArWoc9saj9rYNsVs8MtIvVRU0xQyiN1e0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tSDDXsr0VyZaV50yi7f+TP7KR5hzIOMUsARxWveMMVs9pTAzCdR6jMAlzW6vIZ2zsd7bshPXxfpwi7Pk/7dXOLw197EGNNX0xyE/MIznktKKwnYPyuB+X02VV3pCT2CwPpb5Ox5EpgQQjFMMUq8DK86GRMZc6R6yvtL3GENWrhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jkxnRysk; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jkxnRysk"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-385d5f10c7aso1113271fa.2
        for <imx@lists.linux.dev>; Fri, 06 Feb 2026 08:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770395150; x=1770999950; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fLftybbN8ivPeyXwk8NLfhAbzG7sAr9RazdOdi/8IEo=;
        b=jkxnRyskDbTym/Z80J09DfPY/nwUFXiBLMfbJqHkO2rZbB5fQrwgU5TNEghEl/Xn+B
         mwaS9ougyu6+hpQ0hcrIyzSPzCOJIzkCd1FeGT8dxhcl0KKvVtoEAdhY9PEOBP+VZrpO
         i26yidFdvfEqZ3tgCgTSqAwEt2JTl0o9gkxBv8KRWvH82ho5a8jrv6pUDF3qz+CU0ZTG
         c67MRgFNkpdDKGQvCM0GWPZ5VoyYL2PzePAkhn2V2yOT5bQsA7GfcNhgiBbaNnIWCG5J
         vPyDWRXQdUFRs0y9bThjN5Y2v05UFkbi1jgV4RrbRSguT+rg4fhtLrlYNfINQhZ2Dzgb
         JkDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770395150; x=1770999950;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fLftybbN8ivPeyXwk8NLfhAbzG7sAr9RazdOdi/8IEo=;
        b=Hx0lieG8ct7xeacXZdgPBCJGUl6BOz8GLVaKewc8KC95DzSUIY+gJ9g+f4r8qpukAb
         bkHyxaZXn3HxUleeiHcKTfd7SY/PCVS3OsAqidOv/hHH11umXF9hmY4jefQ5HR9hQnXe
         Ee6XCkxBwBsOEnwj+ZVLK9ny73AtxiNSHAQHP3naPPYMYqBoKU+Vbp+MaJsE4QcoD7ag
         GQa6BKeNeDJ588JkaHE1wSyrCW0lapIRIfswFvJ+SZ36nsjM1jsmO1QNkk4Bl6Pposcu
         BA+x2FFV3cM7TJcmZt93UYNUml1IObJwfDp8nd1QNt0P9iUJmYw+mQTBh5SiURQbE8ux
         O/Ng==
X-Forwarded-Encrypted: i=1; AJvYcCWm25xMum89RDSCTAOB5rO4oe/+TbcNoFu4b4HgEs/JUI63OoESnKvMzNGYj7Ux1XowlGg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzMHYg/YTWpopBXgYBuJGy45et+nByzmfEuncnXYGwBR6Zu1cqY
	dGF3cmJalrMSBx2EU8OyieBebJYM0o6lGuBP0Yr5BbTdTEEzA0anHkBtVIxRZgWefOA=
X-Gm-Gg: AZuq6aJX9uq0S5L3cd+wNTNwAQdneGtOZCRtBOl0HAFHjHLM9zAZhFLHU2V1SoWNYiU
	O6s87hqDLtuAC7Qd+j3801uqzC+pfRhX6Pjiu1ItIZyrnTubRMp8MTY18M9arUmsmD9jYMU5wvG
	AelbTTA3Vb8dIY2v2Hl2C2wjkYlGSwp/jqWPUxT0PoGpFDfF3ecUlmHgv/ajrfXFkkPePDowukd
	6+Zti16Gw6aIlRZUtRzpSfsg8CtWzIU8+pGZ7U9VI3OpTfbmXwHEjAwXMKOngo60fqVoPUq8UzR
	Fks3xcviq3E61SEMiMm+p6iYqMRFLANZQN+ONIO+I77Kws3q8xZLy5zgT8MqiUqjcuLnYkGKznc
	NLRSxEuW7CmwO4yw+YuSN33D049cvW2QuxwDHl8X98q2UW7EVPlLIqqku5+y+Z+1nwabMpQuKF/
	1qb2uRj+4fjRTPVi90nKbDWbx1ve+4AX9votej3RflwLRrbCNU3+d7UswSEGL78fqS+w==
X-Received: by 2002:a05:651c:154c:b0:37a:7a9c:5c0f with SMTP id 38308e7fff4ca-386b51d93cemr7758311fa.3.1770395150443;
        Fri, 06 Feb 2026 08:25:50 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-386b623668asm6346741fa.3.2026.02.06.08.25.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 08:25:49 -0800 (PST)
Message-ID: <e0969b37-8a7b-416a-9789-8662ce7f3307@linaro.org>
Date: Fri, 6 Feb 2026 18:25:48 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: talos-evk-camera: Add DT overlay
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20260122-sm6150_evk-v5-0-039b170450a3@oss.qualcomm.com>
 <20260122-sm6150_evk-v5-5-039b170450a3@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260122-sm6150_evk-v5-5-039b170450a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/22/26 12:48, Wenmeng Liu wrote:
> Enable IMX577 via CCI on Taloss EVK Core Kit.

Typo, s/Taloss/Talos/

> 
> The Talos EVK board does not include a camera sensor
> by default, this DTSO has enabled the Arducam 12.3MP
> IMX577 Mini Camera Module on the CSI-1 interface.
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/Makefile                  |  3 ++
>   .../boot/dts/qcom/talos-evk-camera-imx577.dtso     | 63 ++++++++++++++++++++++
>   2 files changed, 66 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index a2e48b58323c10735c8b98996cee6669e4f918e7..b505b5b1aa2feaaae691977b35a2d872751c4a46 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -349,8 +349,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera-imx577.dtbo
> +talos-evk-camera-imx577-dtbs	:= talos-evk.dtb talos-evk-camera-imx577.dtbo
>   talos-evk-lvds-auo,g133han01-dtbs	:= \
>   	talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera-imx577.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds-auo,g133han01.dtb
>   x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
>   dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso b/arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso
> new file mode 100644
> index 0000000000000000000000000000000000000000..53006a861878f9112673b9a0ad954bed7a5fdca5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso
> @@ -0,0 +1,63 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/clock/qcom,qcs615-camcc.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&camss {
> +	vdd-csiphy-1p2-supply = <&vreg_l11a>;
> +	vdd-csiphy-1p8-supply = <&vreg_l12a>;
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
> +		reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 = <&cam2_default>;
> +		pinctrl-names = "default";
> +
> +		clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +		assigned-clock-rates = <24000000>;
> +
> +		avdd-supply = <&vreg_s4a>;
> +
> +		port {
> +			imx577_ep1: endpoint {

I'd suggest to rename "imx577_ep1" label by dropping the '1' at the end,
it brings more confusion than meaning, at least in 'csiphy1_ep' name it
means the CSIPHY id, but here "imx577_ep" would be better.

> +				link-frequencies = /bits/ 64 <600000000>;
> +				data-lanes = <1 2 3 4>;
> +				remote-endpoint = <&csiphy1_ep>;
> +			};
> +		};
> +	};
> +};
> 

-- 
Best wishes,
Vladimir
