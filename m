Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C526B364022
	for <imx@lists.linux.dev>; Fri, 12 Jun 2026 08:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781251334; cv=none; b=rT0Y8wqRGa5PMXbessStMkntz8Duu5VWTlno2S7FLQxMmpWumX3+R9IGq0kZFZhMvDoskBNs39g/2c1hinfWKldha0dNXt8oaClfAfkU8JLkSD2fA28zm+KQZ+Vp313CxfkhVn8ZyrA4ewQOPq0v8rBO71j8rHUgxWgQA2ghYTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781251334; c=relaxed/simple;
	bh=4cMssSzC9x3YznfsLASdUieBfszbi2Dc1q0Kfv/ciD8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dG22ccvuY7xLy5rdJhqLd1y/6H5Z76IV1jcPvTfVtvvTs1hl7bZ7j7zQw1wLSSxhR8yVC6/Ci16KqRVSa/0zRohOhWDQO1gLb9Ch9TnAG/6vy0Un0yrvlousuWdO16eukhTaIIrUzKx4LvefjzrYlMuFnJCOb3Qw9JgojfiCXiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gBjb4tmt; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gBjb4tmt"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3966e5e7cebso247221fa.2
        for <imx@lists.linux.dev>; Fri, 12 Jun 2026 01:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781251329; x=1781856129; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nMhkGFekCaaDNI8Y6IA3kIgQFx/LhDxMuNSn8eII840=;
        b=gBjb4tmtxYKrOqE+ld6efhkJ+Lc710Xmp4Z8wsxUojRU0ttH8BulUzneqhucepzIwf
         0ITWFG6m7ygG/7m6I/1sA0W+r+VknWj33A05nYMWn4YPX6oI5YZ1yC3THeH1L4ul8dOF
         hewipQZUZmzMpEUbmiRV7qD983L949rCEqTfAeHUfYrc5DmhqcaI90ZGv8Up4ArgGiYz
         lvTCGc9F3UbLTO987H2uYFd33s8Xh5dA28u4EN0TRVUQDH486xpzgJN1C9wKugLMqFQZ
         Q/cugqaBMCgOfbsxpriH7ZAoVav3eIyug9v67Kkt4mZpe+d4CuRnspEKcy+NYCXBuI9/
         uKlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781251329; x=1781856129;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nMhkGFekCaaDNI8Y6IA3kIgQFx/LhDxMuNSn8eII840=;
        b=D2R6uSRVpKtL8Sqtk2XpqqR2qFk7l6RpS83nKWNdz7rMDJX405PWkCG8TkxBjTrplr
         /sq+Z2iorfJ8yto678euWluXSGP5IUc6MAnsVEXwzPUQjMI70pqkouL5FyThO6fztSwu
         RsA4hfG3y3Y+31JIhH5PIxMRS85297J5P4VSXSTJVtLOysjrRDrZf+aq00PiWGq0dUh/
         0jfWWYntYiSFdNh8saFm1jwqvARXT5cfrRbZ3s9yt/hIeZsMvHR6gc9jHezy+tzZFZ43
         pXFP3sE66EmtSE3E2huKLhZSUtTLwMn57jXgHSe9qO4EZRrXFbEXRx00y5RR6Xms1oxj
         wJzA==
X-Forwarded-Encrypted: i=1; AFNElJ89WaTnVaAt2WLK7gs4PtRsQStJUQ35+e2HYvjx6slOhL3iB6sSBF91YWWcugb/8m4qmLE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzfM+mjrSHkpLmF1O4pwZ8xYHmXSbO46gjm452Bn1oRrgJtiapc
	Ukw54yr30ERBqcTnAYqma217JziGhyKiVMc07Q2Pefkcm8SVcRs7u3zHSzRyOIC21Ko=
X-Gm-Gg: Acq92OHLFAtYYfB63/YzhDKOJBXrSkT3aaHdKe00knCxfaDhyHjHGjOqI44I+I/FBLc
	wbMVOp8wATjVgV1bH0zoHeXd/+LHKmH81AT4yPyCrkb84ircnjAkk6i1PXv+467G76gROMClTMv
	P3+ebCABlHqsuLXYQdSzGrlHCE6KmGVZILCnRFq96oZ5LpH02ocZoMtBa2D5D+Q1GZg5jOfJ1P3
	08v5Xp3mxFbiHfoNfA93lJcC1RxyQmEuZRi8WB1Xx3l7aYFnd2MHn+ymQT1H61RMxylpYvWWBZo
	4aaOoSKtVlkWU0aWVJj21po6ui4MG+OJu5eFZbkZgVc8j/Ig2gyWEMx/MytML3V1k9cZ3z44o1z
	q5aMCBvmHuJ4rQ0DnW28Pc5gDCD+81tV1IUmnA4pRzOP6lH/O/v92LsTNPeIbg706g2DafKsu8w
	V0aCDWIvegR18ZhACvne0zv5aTD1TFqJkkimjinzKIMzh8VwauNFn6Ws6GQ/EieWIxcUr3dxg9h
	0/kYf0F9N6K8klo
X-Received: by 2002:a05:6512:3e0a:b0:5a8:bd9c:a2e1 with SMTP id 2adb3069b0e04-5ad2db2fa46mr249662e87.2.1781251328767;
        Fri, 12 Jun 2026 01:02:08 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e17014fsm324975e87.28.2026.06.12.01.02.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 01:02:07 -0700 (PDT)
Message-ID: <b3a6798f-a7ea-40c9-a9b6-3aaba57c8ce2@linaro.org>
Date: Fri, 12 Jun 2026 11:02:05 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: shikra: Add pin configuration
 for mclks
Content-Language: ru-RU
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
 <20260608-shikra-camss-review-v2-5-ca1936bf1219@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260608-shikra-camss-review-v2-5-ca1936bf1219@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/8/26 17:06, Nihal Kumar Gupta wrote:
> Add pinctrl configuration for the four available camera master clocks.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/shikra.dtsi | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index fed71131491ebf6e261bfcd14b5d4a2624837878..2f0f7710c2897e140495afd8d4e8bde50f356096 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -380,6 +380,34 @@ cci_i2c1_sleep: cci-i2c1-sleep-state {
>   				bias-pull-down;
>   			};
>   
> +			cam_mclk0_default: cam-mclk0-default-state {
> +				pins = "gpio34";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam_mclk1_default: cam-mclk1-default-state {
> +				pins = "gpio35";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam_mclk2_default: cam-mclk2-default-state {
> +				pins = "gpio96";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam_mclk3_default: cam-mclk3-default-state {
> +				pins = "gpio98";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
>   			qup_uart0_default: qup-uart0-default-state {
>   				pins = "gpio0", "gpio1";
>   				function = "qup0_se0";
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
