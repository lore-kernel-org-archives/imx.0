Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC94D12E61
	for <imx@lists.linux.dev>; Sun,  7 Apr 2024 09:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712481141; cv=none; b=HbD9matz1PSlLOlmMsAan+rYcUb7s5CPWrO64Y8gT7Bb5FvBmTaR7+h/txgFrTOIFOKTqumfDaFaep0HvUxSrC+OqyuDHnS+ZXoHb1vMWeoYORZYDGNUlrWhPd1Zpdpo3qxfaOMTi+fxnTQ3iL9e7ntIhx+IWkgj6HUVCpvD2Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712481141; c=relaxed/simple;
	bh=wbGFCd+1NL8jSI8XQljfuiz4rLxtkQO5tIEN+JFfxzo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PI+msmUih5Rja0ebapZaznho+S+d4MCdtN8lt7JQiOMjsr+mAgYlPZ3x1VU2UKzW/9LB+F3t5jPsSWHRspCjklc4KoArslnhMzYf4+TPZyddq0UoEQud5mUQB2l87PHvfli35DpRpXu6DucS/FEtif4ON1abMrOSnH1LXRNlVc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AzeQ+/Ns; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AzeQ+/Ns"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-56e2b3e114fso2748581a12.2
        for <imx@lists.linux.dev>; Sun, 07 Apr 2024 02:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712481138; x=1713085938; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6R3Wqrt/ealjoGpiOfZX8t+gCtVhlHBhoftWHGajc1M=;
        b=AzeQ+/Nst4OZszsTNP0H12slro+kPowlOHEIo52qG2981d1In/LIczCzI1nMDH3mrB
         zobjSDya0qJQAqhfHdVCw3udP1WCgpuJ2OiVl/NpdRXMyIaAaxJSsACvgT34O4SuVzQf
         2C0OeTgoZRU3MRfAGxfSlgwC1sgqFnvQ2dT3fRNNpJYf1b17zBrqryHZMRuJb9/W64FA
         XJFej6Qa5WXC64Xw9T7xFDMcKJIzmhpr9n/hYODqJ5Lw1DlqEGkFsHo1HA0kV7kt8jTv
         aBAcG8myQzxK4B7uJUJmdUrojyju+mllZnVTqILO/pOkEeoiZmCzLZyi7MctWGJ5LLsA
         qiPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712481138; x=1713085938;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6R3Wqrt/ealjoGpiOfZX8t+gCtVhlHBhoftWHGajc1M=;
        b=RZpyVqoC2OTZRt0HNKtN6KlHNMiJciAboU2FcLghtwFyyPahrvzepqtrX9UQ2rymp+
         DDVRjp8HlKFybuPyr0/sj085sK+RXzRPNKdEldT6B3pK9VvaGquaiUGV+t6r4KxawoAA
         DFeLW+KaH3pmkef3wLI7S8+fkU8LrFFwCDzw2dmj5wUh8wgzOSdeyZdAKyZneZgPW+6t
         BlwLF7U41VB68dQbB7gIPLrb1NqQj8Qy9wQ5+j/ulJ2Yr0mELp7DCVGhSsp+ivNJHn0o
         zlxJ+uVF4WIaD96d/HjVgIXZGozwgrF+n0UjxspZp+3+XdV7T52mcPxr28BMzZyQ2lRL
         OyFg==
X-Forwarded-Encrypted: i=1; AJvYcCUFhd/F9jbs+vq/jWJu2fjqxJrAaDePXC3kGKdqn2lwLrSabbaE9krDHzhnsjNqdPiMHqS17d9YINyZHxKALy7BWNOn
X-Gm-Message-State: AOJu0YyKc070Gn8bZPQKpHwDp5UnVSQ9C7PL3cn2xpgGZ5F3j/3r2O5U
	nm8sgrDCAiwPZI+/cJP9zVFeLoHJjnC3g8QMT0nlcWXtLof0jg1daelYeNoTxTw=
X-Google-Smtp-Source: AGHT+IGIMMcEL0XvQXhMMOCEAYIZClZcAaOQz3zLK6Rx5gU0qERXP6hT4VnMrpI6UJPMMHwBNjw6XA==
X-Received: by 2002:a50:d754:0:b0:56c:19d2:85be with SMTP id i20-20020a50d754000000b0056c19d285bemr4419744edj.11.1712481138119;
        Sun, 07 Apr 2024 02:12:18 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id d23-20020a056402401700b0056e2170b9e2sm2704138eda.67.2024.04.07.02.12.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Apr 2024 02:12:17 -0700 (PDT)
Message-ID: <d18b05d9-266b-4a1b-a2cd-3b6f8173a39b@linaro.org>
Date: Sun, 7 Apr 2024 11:12:16 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: [PATCH v1 1/1] arm64: dts: imx93-11x11-evk: add rtc
 PCF2131 support
To: Joy Zou <joy.zou@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Cc: "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20240407051913.1989364-1-joy.zou@nxp.com>
 <20240407051913.1989364-2-joy.zou@nxp.com>
 <f019690a-2397-4bf8-9472-ec38f4b94c1d@linaro.org>
 <AS4PR04MB9386C629F898A8417AE57506E1012@AS4PR04MB9386.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <AS4PR04MB9386C629F898A8417AE57506E1012@AS4PR04MB9386.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/04/2024 11:09, Joy Zou wrote:
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: 2024年4月7日 17:04
>> To: Joy Zou <joy.zou@nxp.com>; Jacky Bai <ping.bai@nxp.com>;
>> robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
>> conor+dt@kernel.org; shawnguo@kernel.org; s.hauer@pengutronix.de
>> Cc: kernel@pengutronix.de; festevam@gmail.com; dl-linux-imx
>> <linux-imx@nxp.com>; devicetree@vger.kernel.org; imx@lists.linux.dev;
>> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
>> Subject: [EXT] Re: [PATCH v1 1/1] arm64: dts: imx93-11x11-evk: add rtc
>> PCF2131 support
>>> +&lpi2c3 {
>>> +     #address-cells = <1>;
>>> +     #size-cells = <0>;
>>> +     clock-frequency = <400000>;
>>> +     pinctrl-names = "default", "sleep";
>>> +     pinctrl-0 = <&pinctrl_lpi2c3>;
>>> +     pinctrl-1 = <&pinctrl_lpi2c3>;
>>> +     status = "okay";
>>> +
>>> +     pcf2131: rtc@53 {
>>> +                     compatible = "nxp,pcf2131";
>>> +                     reg = <0x53>;
>>> +                     interrupt-parent = <&pcal6524>;
>>> +                     interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
>>> +                     status = "okay";
>>
>> Really, just drop...
> Ok, will drop the status in next version.
> Thanks for your comment!

Please read DTS coding style.

Best regards,
Krzysztof

