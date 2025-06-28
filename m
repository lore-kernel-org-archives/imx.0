Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40AC18B495
	for <imx@lists.linux.dev>; Sat, 28 Jun 2025 00:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.79.152.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751072276; cv=none; b=q0j1VZmqLKYfKHwXhlYpoKw455CN8jcpVI/x1NdaIfV9tModaPa/eXzYkbzmVkLR4LYfzlEnN1KlYGKUdnAwSxOSl9J9ZCcS6OcUnZd/76dMEecob4NtflQpooQUzp74wo2qKne2IeWjJnDLx85PVvMKIGmBwmOO8/kLs2/HqPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751072276; c=relaxed/simple;
	bh=57q1XTo9fskI3i3LRIZIGt9aWzBFNP8fj6KqbV6kdO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MuV6t5lvfTcoTbK8FXBwVoYGvNTQixB0DT4rPjIQrjRae2fKUpH4uRc3QJLvFxkEuN3NAT/eHvGvgo1WLDb6xUkpFEjSx4TaAWGIFB8EzYi6dwZKJqOxKjFixDtgGvgydlF9Da4OASGomadhIoLGIfp5yz3ObNX6WKAfafNl8yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com; spf=none smtp.mailfrom=mleia.com; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=sqyXtFpN; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=sqyXtFpN; arc=none smtp.client-ip=178.79.152.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mleia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="sqyXtFpN";
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="sqyXtFpN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1751072266; bh=57q1XTo9fskI3i3LRIZIGt9aWzBFNP8fj6KqbV6kdO8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sqyXtFpN3eSkRFEtmv8vnpqiOcADUPU4b8VCu8pnT2OcrR32qudi+k6PyqJAlIyab
	 OGQz64BWpA1KV8zA9b6Ws9icCYe6HstLmKcn9Vgxh2WnFssl8GpJ+BQxQDt0AmHv+k
	 ytloKFip09LlPwvrYWD7MBk4AQTQGsXCA/H2a/yUJRmbyDRma/QHjmq0kf0mv9H8S/
	 AKmsJqLInIp7supSMr/BAc+FmugXyo3lyu1s2GqqA3RPG4eUw2aeJmdbKnFtptfRdg
	 zwlIjwtXfhnnjFvyNXp17qhOVy6VW/GuUKPLFPXHSWsJ5j2eDKJ3N9TibNWyh9Yn22
	 H69Y5TUW/U3PA==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 5BA6A3C4FE4;
	Sat, 28 Jun 2025 00:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1751072266; bh=57q1XTo9fskI3i3LRIZIGt9aWzBFNP8fj6KqbV6kdO8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sqyXtFpN3eSkRFEtmv8vnpqiOcADUPU4b8VCu8pnT2OcrR32qudi+k6PyqJAlIyab
	 OGQz64BWpA1KV8zA9b6Ws9icCYe6HstLmKcn9Vgxh2WnFssl8GpJ+BQxQDt0AmHv+k
	 ytloKFip09LlPwvrYWD7MBk4AQTQGsXCA/H2a/yUJRmbyDRma/QHjmq0kf0mv9H8S/
	 AKmsJqLInIp7supSMr/BAc+FmugXyo3lyu1s2GqqA3RPG4eUw2aeJmdbKnFtptfRdg
	 zwlIjwtXfhnnjFvyNXp17qhOVy6VW/GuUKPLFPXHSWsJ5j2eDKJ3N9TibNWyh9Yn22
	 H69Y5TUW/U3PA==
Message-ID: <a15cbc55-f0ba-4c15-af27-44b05285bc16@mleia.com>
Date: Sat, 28 Jun 2025 03:57:44 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] dt-bindings: usb: convert lpc32xx-udc.txt to yaml
 format
To: Frank Li <Frank.Li@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/LPC32XX SOC SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev
References: <20250625214357.2620682-1-Frank.Li@nxp.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20250625214357.2620682-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250628_005746_395375_387E3A1C 
X-CRM114-Status: UNSURE (   9.27  )
X-CRM114-Notice: Please train this message. 

Hi Frank.

On 6/26/25 00:43, Frank Li wrote:
> Convert lpc32xx-udc.txt to yaml format.
> 
> Additional changes:
> - add clocks and put it into required list to match existed lp32xx.dtsi.
> - remove usb-transceiver@2c at examples.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Thank you a lot for doing this massive conversion work of NXP LPC
device tree bindings, I would appreciate, if you put me to CC for
all such changes.

While you do one-to-one conversion, you do bring a lot of errors,
because the .txt descriptions are broken.

Please always reference to arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
and arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi, that's the correct
version of NXP LPC DT bindings, otherwise something important
can be missed by occasion.

<snip>

> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/lpc32xx-clock.h>
> +
> +    usbd@31020000 {
> +        compatible = "nxp,lpc3220-udc";
> +        reg = <0x31020000 0x300>;
> +        interrupt-parent = <&mic>;

interrupt-parent = <sic1>;

> +        interrupts = <0x3d 0>, <0x3e 0>, <0x3c 0>, <0x3a 0>;

Should subscribe 32 and correct the type:

interrupts = <29 4>, <30 4>, <28 4>, <26 8>;

> +        clocks = <&usbclk LPC32XX_USB_CLK_DEVICE>;
> +        transceiver = <&isp1301>;
> +    };

-- 
Best wishes,
Vladimir
