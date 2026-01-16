Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BDF3587B8
	for <imx@lists.linux.dev>; Fri, 16 Jan 2026 09:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768556577; cv=none; b=VGqA9EwxE6HbIN5Vrud69cuFvdSYWMbExW8ksknU3rxv3gj1Kayhyxiiy/2eUsvRQLrxVD/RsNWCVGNschURqaDOf9WKsbIDLJDn24aIQC8UFp3+NM4xOB+NFNHRvEOOWbCnNAS5UZ96Wuw1FQl0oEFprvDUPyO5U+tMH2SMdx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768556577; c=relaxed/simple;
	bh=vP063z1xuHc0hC+vX2dzTXC8+KnCaJkWrtP6q+wirGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u9jZMHaPMOrwtajioyCglqOI5jKS3O6uLCWxfPkG623dz+3BPytGdU03AJTBU4wnVKEybs/QxxAzDHf5PBfWeur9Cih+3UO1aBuerNlQZz+Wj48kdqG+F0yDndLni0BIwqT0yDzuGZ8HU8gRwZAdwLVrdTPq9W1C8jYDambxMR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cCGIrKGV; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cCGIrKGV"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59b786b2a6aso146651e87.3
        for <imx@lists.linux.dev>; Fri, 16 Jan 2026 01:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768556573; x=1769161373; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ABv8OdJi32Gg0FcjWxhtSwfXTwcweC/Wx9N7YPA9N0A=;
        b=cCGIrKGVsE/cDM24SmdY2/sWFlFZoG4IHqyltzv31pYyiLpYm7dsoZ+MxcaCGkag9k
         1EK82IkduJqQN3eLEl0rOiY6V2HVDXmgp4Ugvj1F6NZOXKdRAIdzxuZx4PUjeQA3HHJN
         sg6GwZFGBMDIH5BfRxKttn2f9by9Q82vtQSvWUbXkmj7QA6aqkR9C7lxmchd+NT8AtQO
         66hufhzpeKZFaiVZqJSY6nVhpV4RWDQ71MSr5lWxTND3qxj9/YkiLW40PalPre2mLBMn
         j4r6Ja0bWo5xwESqyzMq/30Mu5zDWvBHnOmuOji3fhU9GUpRaqTWca+SEgIWj3GOPnDZ
         9b4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768556573; x=1769161373;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ABv8OdJi32Gg0FcjWxhtSwfXTwcweC/Wx9N7YPA9N0A=;
        b=NYN9A9gV1gH6CTLl+H2IrqKCIL3bGiQz4OSXKdlBVHarQUDkcQm5e2eRiT8S4dbfPl
         2IzlmzoHl7YnC0/jQCdHGhlfuKsxeOlRYRR0Vbzsyn8ylVNeB7D6kk5Xw2I7IEWVqN+d
         dUfl8tAIkRaRD2Ko3+zCkZErHMg6sLVXjUtO2nxKeMTRnLsR2X8XW/kpSNGModPlnm/e
         tM2BJvJmD3GfQ65B1EvE815Hy6g5bdZxe4W58JAafzvPePckB+jjfVk9QG9Owp02KftO
         kYU4BqW8ZK7IZ9f+/WK2WBmHs0/7RITG+ZqO9eOiFcRR4ObM8PJ2K+bqGlGFYYEfTqSt
         sKJg==
X-Forwarded-Encrypted: i=1; AJvYcCX5sNoIJgm1tpZmxBpiN7sE3AL5nqgPHLh7exCfYS1xRteNf/TvaNww0imRRZgZqiYu2oU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxnUErQHKwUxQknkUOW8k8zm9nkpp/YLg5IvU3aGqdcmc43HLgW
	hcEYxrykI5kbqbtlXaJKH4w+D8kWlq+j+Hwxf8UiudaT1RcLQpInNReF2qybi0ZcidU=
X-Gm-Gg: AY/fxX4grk3m/SE3QiOE68pgrVCv9krlaFrV3AR7mya3nQjk3P8D8kBk6irCPTIH3Wm
	+p58IfNQy0kxOCT8AQCwqbtHBmYuGIrk/8a1JJ4OTjOw7qRaiVe7HMSUxZKTTqtvJ9BHi3LApUs
	ttgEsRJghjyxcaASh9t5d0J17A4+mGPFzLe7HhGY87lBcj3e+JuKCVhZeXO4x+ODmoUd//njC0y
	KOjunw9jz2p5+zT4pYyyhU9+zkcUXxGsLt+ilm6u+D3IiOV8uJyuud2jBLZyIIeeZMGYisBvN35
	qyyCj+dvqcblZm1akm9NmWO6rhc5TXe3RVS0yJpdzT+aqfPEJigCyWhKlX4p3LtWGj/HYmC2Lsf
	N83KqkI959Oq8fhGtqmUyUNON+Cg4ldtJNuMV3jm8IwdnzGSGg/E47cagXpWZeSMTP7jCvESAeu
	F7mBOrlqE3e48w/HU9Xa+O8Is/H7OKs6SXKLytX0iwlKTNevlzYgr0jOg/gMI8aNSung==
X-Received: by 2002:a05:6512:1514:20b0:597:d790:a1a2 with SMTP id 2adb3069b0e04-59baef18155mr314794e87.8.1768556573145;
        Fri, 16 Jan 2026 01:42:53 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf33e82dsm618507e87.11.2026.01.16.01.42.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 01:42:52 -0800 (PST)
Message-ID: <e081fa74-9e0b-4e54-a51d-eee97ae6f4fa@linaro.org>
Date: Fri, 16 Jan 2026 11:42:51 +0200
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
 <3b16ffa2-1580-426c-aa9c-f377d913d49c@linaro.org>
 <e27deffc-bbcc-48bc-9e4e-ce52698d98f3@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <e27deffc-bbcc-48bc-9e4e-ce52698d98f3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/16/26 11:32, Wenmeng Liu wrote:
> 
> 
> On 1/16/2026 5:12 PM, Vladimir Zapolskiy wrote:
>> On 1/15/26 12:12, Wenmeng Liu wrote:
>>> Enable IMX577 via CCI on Taloss EVK Core Kit.
>>>
>>> The Talos EVK board does not include a camera sensor
>>> by default, this DTSO has enabled the Arducam 12.3MP
>>> IMX577 Mini Camera Module on the CSI-1 interface.
>>>
>>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>>> ---
>>>    arch/arm64/boot/dts/qcom/Makefile                  |  3 ++
>>>    .../boot/dts/qcom/talos-evk-camera-imx577.dtso     | 63 ++++++++++++
>>> ++++++++++
>>>    2 files changed, 66 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/
>>> qcom/Makefile
>>> index
>>> 00652614e73582fa9bd5fbeff4836b9496721d2d..be9aeff2cd1555bc436e1b8eb78d8e1c9b84f9c4 100644
>>> --- a/arch/arm64/boot/dts/qcom/Makefile
>>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>>> @@ -339,8 +339,11 @@ dtb-$(CONFIG_ARCH_QCOM)    += sm8650-qrd.dtb
>>>    dtb-$(CONFIG_ARCH_QCOM)    += sm8750-mtp.dtb
>>>    dtb-$(CONFIG_ARCH_QCOM)    += sm8750-qrd.dtb
>>>    dtb-$(CONFIG_ARCH_QCOM)    += talos-evk.dtb
>>> +dtbo-$(CONFIG_ARCH_QCOM)    += talos-evk-camera-imx577.dtbo
>>
>> Please remind me, what does dtbo-y Makefile target serve for?
> Rob mentioned:
> https://lore.kernel.org/all/20260106192609.GA2581379-robh@kernel.org/

It'd be better to ask Rob about it, I suppose that the concern may be about
a missing in the qcom/Makefile mechanism to build standalone .dtbo artefacts.

> I checked, dtbo- is not an upstream usage, it will be updated form

Right, that's why it attracted the attention.

> dtbo-$(CONFIG_ARCH_QCOM) to dtb-$(CONFIG_ARCH_QCOM) in the next version.
> 

But...

>>> +talos-evk-camera-imx577-dtbs    := talos-evk.dtb talos-evk-camera-
>>> imx577.dtbo
>>>    talos-evk-lvds-auo,g133han01-dtbs    := \
>>>        talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
>>> +dtb-$(CONFIG_ARCH_QCOM)    += talos-evk-camera-imx577.dtb

it's already here and it was here in the previous version.

-- 
Best wishes,
Vladimir
