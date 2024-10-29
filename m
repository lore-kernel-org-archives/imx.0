Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A562A2010F4
	for <imx@lists.linux.dev>; Tue, 29 Oct 2024 07:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730188420; cv=none; b=LMO3U48IUYzuDiyephu7ORjmqvxCfggQZJeq1xCeQCo89zhjJb5gA48r4VMxmgxu1I/SXYpnIZZE6rEmBAryUsD7owt+yqzjo2kpe6PuJ+5SfCjAKGkDCS79HZ0NtexpYdHL0hcAgcQywTc2IVXfxSx9ttS4RbNepalsqJbq7iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730188420; c=relaxed/simple;
	bh=HOCb3f9hLfDS0KMvOMasmmI2vyK/m+oTMPg+Aa8Oy5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=NEMp1G3oi7vbev1PLq28NLZmq9rqmlWeFD1qqTzV/jHxpQe3B3T7UIPkoFyMaTgnHIg7EjXL1EGaA6iyb0PnwC729V5e82b8/zirWGPbq6oYuYWFDdL9UKJR24Qvk14zf0Oz/cUNq3XQ7PaTRrupEmVo2Lco+UsqV5Kht9att7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LDtqr0y1; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LDtqr0y1"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539e3f35268so6061802e87.3
        for <imx@lists.linux.dev>; Tue, 29 Oct 2024 00:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730188417; x=1730793217; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4C1nIRdVvB18ebQ3for2XC65VIyhOskwKvhIjCaNvVI=;
        b=LDtqr0y1Jr/8qASOT5+6BwtFotuoOAral+P9mywfdydfd8EprdaT2KYLL5h+u39bAd
         EF/H1uXzBZau4Q1y8NoLYqJQItW15OLqq4MpkvmL+xFIpCCy2qnjZf/T7Mj4LG4FHfhd
         yfID7d4VLJzIMMh7FcnJIy8w4RFpVmnX5nvkvxRRb3qOoIH1aEXZ4GnJ3V/1S3URO35R
         osSlmQmRFYhifE0XPsqUpp/fjWS3Gx0XxeLoQkM3z5EQ1+VuK5wsT5GSmaKUXwjrTzpX
         rdeurNNYaVLd5qD6s1LxN6/fG2t4GebA8rR1ijbMmeEVVtHGvqI6dRWo6/Ox2+sgXW4I
         IWyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730188417; x=1730793217;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4C1nIRdVvB18ebQ3for2XC65VIyhOskwKvhIjCaNvVI=;
        b=TJLG+Lg1/wBm784p8NiBDhE4aK3m7ce8ZWo+NkJGG7xpP4ZvR9lGPpjc111TRYyJNL
         QwwctQHCWBGGIhha1/sl/Ot1aQnfve1aLHMihsQMTPwT2t2ix3cfC2N/a1EW+xOTdfUi
         +weoPSbrq71CwiWCF1UzK1cp7aULJQdfEuvb7VFCaXb9LJhBX55hfl9hKrqWxcVRsWxb
         L1ouIwSVGrhxjhZJKPYKYPSCnML5lPTvOkqJBAOp3v7oarjP85zcZ+/O59QLu2qbg0NG
         3U5RFpFnXsUJVfmz/3dY+BNFl7/jdkIccZisco+tOcMXX1sF/XnyAqX+1QON5PzavZAJ
         z+Lg==
X-Forwarded-Encrypted: i=1; AJvYcCX0Hv/Y0ya7SrB+3pfylaTcN+gOACFjEZ93f6u+nwb0YpPmVHve4CtwD+34T40Cxtml5eM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwsR7doJglhFRlRTkebGsCAGjPUJdsq6g0eex0tkwc7hMfVHeim
	IZDMIdQgnHk0vBcPX4ysmpXZuKQBhNw8B7M8vxu74vkiffufI299
X-Google-Smtp-Source: AGHT+IFX3omEHoD4JMYIBlaDhHQFN4sNVOKfMjc39GiZe38I9QMTzCKzecpErYGK0y+EHQaRGeWtVg==
X-Received: by 2002:ac2:5683:0:b0:539:8fcd:51f with SMTP id 2adb3069b0e04-53b348deb3bmr5368808e87.30.1730188416343;
        Tue, 29 Oct 2024 00:53:36 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1de04bsm1296446e87.247.2024.10.29.00.53.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2024 00:53:35 -0700 (PDT)
Message-ID: <f2bb661d-8ef5-43d4-aece-c7fec01ff9fe@gmail.com>
Date: Tue, 29 Oct 2024 09:53:33 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ARM: dts: imx: Add devicetree for Kobo Clara 2E
To: Andreas Kemnade <andreas@kemnade.info>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 linux-kernel@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 devicetree@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>, imx@lists.linux.dev
References: <20241024142206.411336-1-andreas@kemnade.info>
 <20241024142206.411336-3-andreas@kemnade.info>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20241024142206.411336-3-andreas@kemnade.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/10/2024 17:22, Andreas Kemnade wrote:
> Adds a devicetree for the Kobo Clara 2E Ebook reader. It is based
> on boards marked with "37NB-E60K2M+4A2" or "37NB-E60K2M+4B0". It is
> equipped with an i.MX6SLL SoC.
> 
> Expected to work:
>    - Buttons
>    - Wifi
>    - Bluetooth
>      (if Wifi is initialized first, driver does not handle regulators
>       yet)
>    - LED
>    - uSD
>    - USB
>    - RTC
>    - Touchscreen
> 
> Add human-readable comments for devices without mainlined driver and
> binding. Such comments can e.g. be help to find testers if someone
> starts to work on the missing drivers.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

...

> +
> +	pmic@4b {
> +		compatible = "rohm,bd71879", "rohm,bd71828";
> +		reg = <0x4b>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_bd71828>;
> +
> +		interrupt-parent = <&gpio4>;
> +		interrupts = <19 IRQ_TYPE_LEVEL_LOW>;
> +		system-power-controller;
> +
> +		clocks = <&clks 0>;
> +		#clock-cells = <0>;
> +		clock-output-names = "bd71828-32k-out";
> +
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		gpio-reserved-ranges = <0 1>, <2 1>;
> +
> +		rohm,charger-sense-resistor-ohms = <30000000>;

I am afraid that this one is _my_ very much terrible brainfart. Yeah, 
pile up the stones and start casting ;)

I am fairly sure the sense resistor is 30 mOhm (0,030 Ohm), not 30 MOhm 
(30 000 000 Ohm). (And I am the one who misinterpreted the M in some 
email/data-sheet in the past - and never questioned the sanity).

In short, AFAICS the sense resistor is added "in series" to the system 
load. Eg:

           --------
       ---| Rsense |-----
      |    --------      |
  ---------           -------
| VSupply |         | Rload |
  ---------           -------
      |                  |
       ------------------

Hence, by measuring the voltage drop on the Rsense gives us the current 
flowing through the system ( good old U = RI ).

I believe having 30 Mohm (30 000 000 Ohm) resistor there would not make 
much of sense... With a Fermi estimate that the system works with 
voltage magnitude of 1V and current magnitude of 1A and then applying 
good old P = UI and U = RI would give us wonderful results :) Quite a 
battery on poor Kobo, right? You'd better to not touch the battery 
termninals ;) Oh, and looking the driver code I've written for handling 
this property... Sometimes I really don't like mirrors :)

Well, now that I got this out - I suppose this could be
rohm,charger-sense-resistor-milli-ohms = <30>;
or
rohm,charger-sense-resistor-micro-ohms = <30000>;

I further guess there is no upstreamn binding doc for this property. I 
think there is also no upstream charger driver for the BD71828/BD71879 - 
only an early RFC and some downstream mess - but stil it'd be nice to 
have the property in place as the size of the sense resistor is needed 
when converting coulomb counter register values to current.


Yours,
	-- Matti

