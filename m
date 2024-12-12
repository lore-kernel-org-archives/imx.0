Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A224B21019B
	for <imx@lists.linux.dev>; Thu, 12 Dec 2024 10:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733997895; cv=none; b=KRnqggCHUuYriIgCZs8y3PzlO5KCUSJV1UM1P03PGUeXiG5fdV2gDRSdGHKsBSRkauAuQWS+YcycQDhREswF6mbyxqjMjCcpeosW4tYHGNNU+ISJxxvjndQgJTVxn1Xrp4CXWcNqt1OfncSarhy71+jKOx0d3vJle9D9mC0zdPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733997895; c=relaxed/simple;
	bh=UeX80lfb499kn+ov58ejv+wnhX5jVuNu0bMwJi5xZUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E4aP1LLZ6/qgPzHVWwNv4Eo3+59R+QDK8cF1esejq5da6TXgV30n0hrfb59pM5y2Zt4sFykpZIB9HEkPXOzgRbyNgs2x+fByvieXR2Lub+OC740T77lnSegsR060Y4MPRTYhinxItPd59m5owPi/CQ+zH1FRsbX63pHm+H7uohs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ncezJQnL; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ncezJQnL"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a9ec267b879so78157966b.2
        for <imx@lists.linux.dev>; Thu, 12 Dec 2024 02:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733997891; x=1734602691; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xcNqGkwIauu/8vGqbL9sA5oDKvOeKbiw9sBlkhBTUJc=;
        b=ncezJQnLS+B9EbBgtnV2IxTO22vPi0Dsa7X8M9sVeO1DYLIdzYdmdu7kYxBFNC1X+6
         jswYKsKWRFKlQmvlOf7jmclAt7pD1Gx7CeqJ6msi+aThzo0pb55/qd84AlZLA0WDBC9+
         Cv2WCHlFWhJPV5qz6lOjbV/R3qJffMWgJp0DA03t4J6lPtUMg4V70wcNL9s9s+qYC/MZ
         h72FzSCULwbIscQIHlHDOM/879zzCyZT1MHGWv71hqVzqY1Kvq30wW3tw36q9asednm2
         FscDhsMtw/l0YcRprhayuzIScidtaX1FE9v4Gt39mQHPvG/zdUACctLDd+W7+ACHc10F
         gcog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733997891; x=1734602691;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xcNqGkwIauu/8vGqbL9sA5oDKvOeKbiw9sBlkhBTUJc=;
        b=cdtBkYGscFKWTygYLZe/PzvrDMq4086/zBxqQwmLAcQ//twuKkF6UcuqvmKq6tcocm
         X1IbjOM0nMu+N86KDIMBNHCXA07KLfkpik+j+333WMhe+pTgtfYvAaZxlSkdusO4kHHR
         QOQ82qoQILLSggcabEEMwaonrGULL8IaGkSrsymW2bHw7cCiY5geqP+QVtvWvBlhyrAH
         mnsFFQ2VUlGtQyKpDEfIVDYKblyGwelpj3pH7yM2g7Q1r6+CDdgoNxxVgflWW7kocKyV
         aEdklY6K1NjtELG1tNu2UW9JTqSN94Thdr0q7obSZqxDCiyaEry/njK4Uh24ZUWTxhmL
         hlRw==
X-Forwarded-Encrypted: i=1; AJvYcCUrLVC9P4YENs3raLEuXiXhGqNVTwmOeBM3mpkjUP6tjbl3Ok7vmPp/FPtqRxWJsidBfwg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxeTD/N6J2SQvNXROfQk5ypGj3s0X4v20JuFWKAir7H9qUe9ny2
	354rNwuNWkxKSkNTZWCd0uZYD1Avs2SiNQkvLE+K6QIBXiYfxBDF
X-Gm-Gg: ASbGncu2UYibUPy64dl8+JXTcV60Qmrbkvo7TIh7A20OC/zSsg/335BM3xcfaJInfWy
	O/D9R9aOfTTaGF6rTHYPS0tXng6StQFR1w8609AQRGUdeW6R25nZzc0RWDAS3PX9TzyDHEbZkDd
	5IVbTyzy/i29boPJ5e5qVqKP+kNNuv+3HVXruB9PQ8IUno1C0rbDnJPnJaxibylz2W+U+ZP9S95
	NYNjFei2cHjN6fZ469vr9MWDX3w0QM7Iz77CPi+dWKSEyivTXXych97kyT1QUwzKNP/R5qth7iM
	b0mU8Q==
X-Google-Smtp-Source: AGHT+IFQT5iUBDmZUMai1sO2ZlzqvJN+RIKe3rhjwPSdU4AZtZ7Q43WieJ/g7Z/ZNDQAZtHYn7R+CQ==
X-Received: by 2002:a17:907:8284:b0:aa6:6696:4072 with SMTP id a640c23a62f3a-aa6b13f4f48mr539712866b.49.1733997890532;
        Thu, 12 Dec 2024 02:04:50 -0800 (PST)
Received: from [192.168.7.105] ([92.120.5.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa67d63f867sm641007166b.133.2024.12.12.02.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 02:04:50 -0800 (PST)
Message-ID: <392884c8-0f4e-43a5-b81c-bf2e80cbddfd@gmail.com>
Date: Thu, 12 Dec 2024 12:04:47 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: imx: add imx95 dts for sof
Content-Language: en-US
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20241113195240.3699-1-laurentiumihalcea111@gmail.com>
 <20241113195240.3699-6-laurentiumihalcea111@gmail.com>
 <ZzUKPehw2G9XcRsb@lizhi-Precision-Tower-5810>
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <ZzUKPehw2G9XcRsb@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/13/2024 10:21 PM, Frank Li wrote:
> On Wed, Nov 13, 2024 at 02:52:40PM -0500, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Add imx95 DTS for SOF usage.
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  arch/arm64/boot/dts/freescale/Makefile        |  1 +
>>  .../dts/freescale/imx95-19x19-evk-sof.dts     | 74 +++++++++++++++++++
> look like it should be dt overlay.
ah, interesting idea, but I don't really see its usage here? As far as I was able to understand the overlays are used to dynamically change the DTB (via u-boot), which we don't really need at the moment.

>
>>  2 files changed, 75 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
>>
>> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
>> index 42e6482a31cb..0a313133d013 100644
>> --- a/arch/arm64/boot/dts/freescale/Makefile
>> +++ b/arch/arm64/boot/dts/freescale/Makefile
>> @@ -269,6 +269,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxca.dtb
>>  dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla.dtb
>>  dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
>>  dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
>> +dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
>>
>>  imx8mm-kontron-dl-dtbs			:= imx8mm-kontron-bl.dtb imx8mm-kontron-dl.dtbo
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
>> new file mode 100644
>> index 000000000000..3fa4c252e355
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
>> @@ -0,0 +1,74 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +/*
>> + * Copyright 2024 NXP
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include "imx95-19x19-evk.dts"
>> +
>> +/ {
>> +	reserved-memory {
>> +		adma_res: memory@86100000 {
>> +			compatible = "shared-dma-pool";
>> +			reg = <0x0 0x86100000 0x0 0x100000>;
>> +			no-map;
>> +		};
>> +	};
>> +
>> +	sound-wm8962 {
>> +		status = "disabled";
>> +	};
>> +
>> +	sof-sound-wm8962 {
>> +		compatible = "audio-graph-card2";
>> +		links = <&cpu>;
>> +		label = "wm8962-audio";
>> +		hp-det-gpios = <&gpio2 11 GPIO_ACTIVE_HIGH>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&pinctrl_hp>;
>> +		widgets =
>> +			"Headphone", "Headphones",
>> +			"Microphone", "Headset Mic";
>> +		routing =
>> +			"Headphones", "HPOUTL",
>> +			"Headphones", "HPOUTR",
>> +			"Headset Mic", "MICBIAS",
>> +			"IN3R", "Headset Mic",
>> +			"IN1R", "Headset Mic";
>> +	};
>> +
>> +	sof_cpu: cm7-cpu@80000000 {
>> +		compatible = "fsl,imx95-cm7-sof";
>> +		reg = <0x0 0x80000000 0x0 0x6100000>;
>> +		memory-region = <&adma_res>;
>> +		mboxes = <&mu7 2 0>, <&mu7 2 1>, <&mu7 3 0>, <&mu7 3 1>;
>> +		mbox-names = "txdb0", "txdb1", "rxdb0", "rxdb1";
>> +		cpu: port {
>> +			cpu_ep: endpoint { remote-endpoint = <&codec_ep>; };
>> +		};
>> +	};
> please sort by node name.
Fix in v3

>
>> +};
>> +
>> +&edma2 {
>> +	dma-channel-mask = <0xc0000000>, <0x0>;
>> +};
> Why need change dma mask here ?
Channels 30 and 31 are reserved for firmware usage

>
>> +
>> +&sai3 {
>> +	status = "disabled";
>> +};
>> +
>> +&wm8962 {
>> +	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
>> +			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
>> +			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
>> +			  <&scmi_clk IMX95_CLK_AUDIOPLL2>,
>> +			  <&scmi_clk IMX95_CLK_SAI3>;
>> +	assigned-clock-parents = <0>, <0>, <0>, <0>, <&scmi_clk IMX95_CLK_AUDIOPLL1>;
>> +	assigned-clock-rates = <3932160000>, <3612672000>,
>> +			       <393216000>, <361267200>,
>> +			       <12288000>;
>> +	port {
>> +		codec_ep: endpoint { remote-endpoint = <&cpu_ep>; };
>> +	};
>> +};
>> --
>> 2.34.1
>>

