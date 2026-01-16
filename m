Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201EE31AAAB
	for <imx@lists.linux.dev>; Fri, 16 Jan 2026 09:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768554733; cv=none; b=OkPt2ctrYLvY+Oely96aq9taZHjEAdqTHdvjhC5rKemMcoXYQfigaZ6fFZnG2fAROqCCx0TukmlVZ3KEmaNUgtD/kw5AJoZem0Ea+s1SRQhzYmS9LXAaEL2kV7enbnyoh9F0Bln3yr+eM/Elxbb+iTC24Tqfgdxj3pIdK09LEEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768554733; c=relaxed/simple;
	bh=/HeROcY+wue/RnfDCzGh5TkygmGivHiZHG7v8KNDXNQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PDGAFwm5CGL3XFaemDih5zGPTZQIQPy7ATLUxJQ7MXiT2FbRUYTEZQmGNmK5svfxhTqZadmOy53W0t3a9B/PS1G5W1cMKZ3Gz25tMuIil4yXugXmF+6Y2Rk4AdGhFI4XYIlz8KaqSItCia2P03ihLwbUY+LiJrCqb04JP2Ob3HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G4Aae74v; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G4Aae74v"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-382fb1e257bso2512971fa.3
        for <imx@lists.linux.dev>; Fri, 16 Jan 2026 01:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768554729; x=1769159529; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqAbJs5DEIYF5QCBGJfgcurtZvGAMM7ELYVo8ENiu9M=;
        b=G4Aae74v+d7540Ca3EIT8k659yKtTj182LiYus8p3SY664dhFlK/9PASSgtToFCKAV
         awr0oMk1KKlqaNMjP3JMyqEcxzGN+aH5z/K2Nlj4cI0WqMapNjA48MTCEtTsWP4ZkRZ0
         1cLe6eCQ4p6wsWS+3XyLAB2q8V1sqrAdwCepHCITUOMVgQzkHNeBlL/qM00wtUINR6gr
         pi+9dBuRpQhE2ppg9bAUn9K0lVcGpz8lMeb2tUxay7/pZtzrtTI4CNrtArQMJJ0IdH+w
         G3cUQxL/xhczKt4M0tU5sY6082iIHexBbpniAG6hQxdfcTg3W/GJQlnKUkl+Nrtw/OKJ
         XTOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768554729; x=1769159529;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pqAbJs5DEIYF5QCBGJfgcurtZvGAMM7ELYVo8ENiu9M=;
        b=JcIIbRCq5xKLPmsY5rNXcjMl06x85KthXvB3+ALc8IFbQsCJmytBF7IctK3BW/r5h4
         FstkuuZB6ttAVmKBdN74rR0wowvQ2wqTB3+AqRoE5f2yn/FKvpZ7Bw70pS9TcqvVfben
         KZ5TizuNb8XDgekTRuJ9NG/kjSDfhjooPgk5LtQ7QP5/nSLuLJl/x49TL98XUdoO4ICf
         H2m/euN+xrEmmYHJW0BvP2WOzWduBkz62PFlKFsFL0GxFs+vAgqkjAVwwNofv0AAw/VG
         p77pRL77W1gVNjarYstFg7WpuyD+CCa/JjCXBBPt42u3UrdZC+ffcDvixjNziFLimQRo
         KqTA==
X-Forwarded-Encrypted: i=1; AJvYcCU7ATwMuuvbLT9LIOm9Kh3c3kOFXHv6ZcpuZ7xIw7Bh1m5E4qfPmebn0XgsJ1KUIN3RvjA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1bAFsCjpItCvYQDVMD2HYyfntQZRf0z1Egd7MlS+cb4WUOIcn
	1pytnw09X/O9rF0njBBYBVQDYgZi96H5FauHZquyjn2WJ3DsnGO4QJdrVo/uZlEANp0=
X-Gm-Gg: AY/fxX7UCq20rLzTXDF9mhAH2wn7lZFmQXeYs7qyYmsnuNvR1bMEtg4EYiP4mtipSuZ
	BL57sE3Z+Pvv5pfRIRvgy4m6CZffMb9aoNNdeyES8oEWmTeq9N+0N36xr/5fcgtv11K80P58Pnz
	6WLxEkmZhtLKCcDIow2j7GRbDvGZJ0CyQg5SPp7n26JROzwgikfZ79FIfmyHOo82bXcJ5HLCVw3
	NgOcX+YKplPXGsvmMLo7WqZa2PTEDlQbjCIpuL/i3K+9y6ktwnIGhXWGzcpv2ArQwoG1JmzVrl2
	JrU0JGEt74GJ6IIXwy/nHWRA7HYpqvHQKTFeq8t9lvIwSUXamPZ5EDmBWCGS2NsQmrTPvXoKz0v
	qZuby3s9w7ANdlGDrvX9IwuaTtl6oBQp8iOAl0GzvkJeedgKF0luhubYZZ/SCfiADJjqIoDYFy6
	quD/RoaRSojij9j42C5uCMwYr6g2SwixyiMMLmViPjaYGE8McyMNIx+l5i2xsXiIfl4g==
X-Received: by 2002:a05:651c:991:b0:380:a1c:7039 with SMTP id 38308e7fff4ca-38383fe5fbemr4683611fa.0.1768554729185;
        Fri, 16 Jan 2026 01:12:09 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384d8e0e5sm5608701fa.17.2026.01.16.01.12.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 01:12:08 -0800 (PST)
Message-ID: <3b16ffa2-1580-426c-aa9c-f377d913d49c@linaro.org>
Date: Fri, 16 Jan 2026 11:12:07 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: talos-evk-camera: Add DT overlay
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
References: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
 <20260115-sm6150_evk-v3-5-81526dd15543@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260115-sm6150_evk-v3-5-81526dd15543@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/15/26 12:12, Wenmeng Liu wrote:
> Enable IMX577 via CCI on Taloss EVK Core Kit.
> 
> The Talos EVK board does not include a camera sensor
> by default, this DTSO has enabled the Arducam 12.3MP
> IMX577 Mini Camera Module on the CSI-1 interface.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/Makefile                  |  3 ++
>   .../boot/dts/qcom/talos-evk-camera-imx577.dtso     | 63 ++++++++++++++++++++++
>   2 files changed, 66 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 00652614e73582fa9bd5fbeff4836b9496721d2d..be9aeff2cd1555bc436e1b8eb78d8e1c9b84f9c4 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -339,8 +339,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
> +dtbo-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera-imx577.dtbo

Please remind me, what does dtbo-y Makefile target serve for?

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
> +				link-frequencies = /bits/ 64 <600000000>;
> +				data-lanes = <1 2 3 4>;
> +				remote-endpoint = <&csiphy1_ep>;
> +			};
> +		};
> +	};
> +};
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
