Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FDC76F1B
	for <imx@lists.linux.dev>; Sun, 22 Sep 2024 23:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727047164; cv=none; b=Kji9jnmwAjskNs+eKMi0vg7n24Afj8oYSY5IPszSLXAtVEEjDURIsnNFYvgZSH5wVG/icUJHKgYy3Ir397MVPhRsnkPouVKgxjBv6r34mphZIGkUrRWiz4HFhAR6tYef6/chvRI+MjtK5O+wEpcJZd0fhMbEibvXfP/QhLmtKwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727047164; c=relaxed/simple;
	bh=/fsL83JiV5QpzmbHyytfrwF5t0swH4mJJm8/vQzPfT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d2rzAQB0oYOrK4cvYqMqvPY9FWNpizbbKSavQe6vzgK3N/j9l1C8AMpN/yVOgYOfXSAxHhCXSpn94PJzQ/aEj6PyRQBbQnCtHBoPQEa8KCpZLfaw/81sDfXtKBWGBzlbXoa3J5X3PlHLOGSgKeaCMFXFDK47oatB3KSjX98Ufqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fPxPH+jh; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fPxPH+jh"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42e82f7f36aso10699855e9.0
        for <imx@lists.linux.dev>; Sun, 22 Sep 2024 16:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727047161; x=1727651961; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3QmeQYM479yzZexFRDFHjQcwG9TTAWkIzn56oUaf14U=;
        b=fPxPH+jh3R9O0hdbrXQMoThVv2HovIz/3a2tkv7Vt91EBie8990dDV4fiiQBnREfPB
         iB19U3Em+d05618tv1kpMKdtp4wtQAZpY/wnu6URZ3CCiP6F5zer51Pls5v6sDQeNdKe
         Zx1YIbt6oRNS6As4hwufOnSZoG7jVEQCqhl0wdvGw5t38siM1Rcrv3jTlIeM/9mximAE
         8PBhgR7ziOw6RWVh3b9zqmONk5Td5dMPZAXFklJNUvR1OaO0AEmOgksWLVWieLMPqT1c
         9rpGOH+m0jW0chm13SHlAwPpis+/nNL8B1y8Hvh1pACudnxn6cVW1ZyuoDYIlCSciusG
         bdIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727047161; x=1727651961;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3QmeQYM479yzZexFRDFHjQcwG9TTAWkIzn56oUaf14U=;
        b=tywRAQXPs/XB24ace0OLHxvjPrsynpBblel3CjrdB/k4WWdKdrBrBy/K8VSRj7dyF/
         gYklnPjxgOEKk0tD92hS5/aLd5We3gOBp61qJogEOHo/0nkiUFVSTwfJJ/lS0W2I08XP
         cNznuI2G6GinFvDAeTOTOSz/IF+mDcCP3bYidJe33QEdnzdtRiYDKZs35iDo0xfaB//R
         Jkr36Tms6A4HadtMUh/XnUpdw/vb1aatZ6z6mFydx8KBX+vJ/ZZmc2IW/FUc0iNijwgU
         xRq7Ayov7V0KQ0FI0KDt0RSDo/lEOltV217FFIjLYA+1rX7DEwMzA6sTuHvwIB1ev/31
         SByg==
X-Forwarded-Encrypted: i=1; AJvYcCVeqKAk/amkTX8TSySZFp8GDcsIGeI1f0LWNLfV3/n4Bxhy5NMDhzAgqXSzOrC6EC7FS2s=@lists.linux.dev
X-Gm-Message-State: AOJu0YwGqJzoheaur/2DMOOeiAAiKPBHMjFCZ+2vOMieXvmWKughvc+I
	ip/BW4MkPTLDlkWuS0fyypyyvuX24SBmBCf2G41dUTo4hUacd7ul
X-Google-Smtp-Source: AGHT+IGZZw5+3WxxKggocLFzJxwqoSd1f5PjjLcsXXYGL35zdx9oJLvHztzhdL/betnYcPItTEYQ7Q==
X-Received: by 2002:a05:600c:4e92:b0:42c:bde5:9082 with SMTP id 5b1f17b1804b1-42e7ac225b4mr82073095e9.17.1727047161066;
        Sun, 22 Sep 2024 16:19:21 -0700 (PDT)
Received: from [192.168.1.130] ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e7af895b8sm85431855e9.14.2024.09.22.16.19.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Sep 2024 16:19:20 -0700 (PDT)
Message-ID: <d02ea50c-249a-4221-8884-cd6674075184@gmail.com>
Date: Mon, 23 Sep 2024 02:19:16 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: imx8qm: add node for VPU dsp
Content-Language: en-US
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Daniel Baluta
 <daniel.baluta@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Iuliana Prodan <iuliana.prodan@nxp.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240918182117.86221-1-laurentiumihalcea111@gmail.com>
 <20240918182117.86221-5-laurentiumihalcea111@gmail.com>
 <ZusijsRFJPtFc0h8@lizhi-Precision-Tower-5810>
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <ZusijsRFJPtFc0h8@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/18/2024 9:57 PM, Frank Li wrote:
> On Wed, Sep 18, 2024 at 02:21:16PM -0400, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Add DT node for i.MX8QM's DSP, which is found in
>> the VPU subsystem.
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  arch/arm64/boot/dts/freescale/imx8qm.dtsi | 27 +++++++++++++++++++++++
> why not add a file imx8qm-ss-vpu.dtsi to keep consistent with others.

Don't see much value in doing so right now. It's just two extra nodes (should stay that way AFAICT).

>
> Frank
>
>>  1 file changed, 27 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
>> index f8b577ebdbef..ae0165a44dcd 100644
>> --- a/arch/arm64/boot/dts/freescale/imx8qm.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
>> @@ -581,6 +581,33 @@ mipi_pll_div2_clk: clock-controller-mipi-div2-pll {
>>  		clock-output-names = "mipi_pll_div2_clk";
>>  	};
>>
>> +	vpu_subsys_dsp: bus@55000000 {
>> +		compatible = "simple-bus";
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +		ranges = <0x55000000 0x0 0x55000000 0x1000000>;
>> +
>> +		vpu_dsp: dsp@556e8000 {
>> +			compatible = "fsl,imx8qm-hifi4";
>> +			reg = <0x556e8000 0x88000>;
>> +			clocks = <&clk_dummy>,
>> +				 <&clk_dummy>,
>> +				 <&clk_dummy>;
>> +			clock-names = "ipg", "ocram", "core";
>> +			power-domains = <&pd IMX_SC_R_MU_13B>,
>> +					<&pd IMX_SC_R_DSP>,
>> +					<&pd IMX_SC_R_DSP_RAM>,
>> +					<&pd IMX_SC_R_IRQSTR_DSP>,
>> +					<&pd IMX_SC_R_MU_2A>;
>> +			mbox-names = "tx", "rx", "rxdb";
>> +			mboxes = <&lsio_mu13 0 0>,
>> +				 <&lsio_mu13 1 0>,
>> +				 <&lsio_mu13 3 0>;
>> +			firmware-name = "imx/dsp/hifi4.bin";
>> +			status = "disabled";
>> +		};
>> +	};
>> +
>>  	/* sorted in register address */
>>  	#include "imx8-ss-cm41.dtsi"
>>  	#include "imx8-ss-audio.dtsi"
>> --
>> 2.34.1
>>

