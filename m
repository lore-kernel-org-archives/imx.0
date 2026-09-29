Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1EE53977C
	for <imx@lists.linux.dev>; Tue, 29 Sep 2026 15:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790695255; cv=none; b=hd3W1UsrimPAvsGKnklPCuP0QTlnVKjw4ojx7KWwfsbx47hWThNbdSgf3xT0q38zLhbz/w2AVUO8PD2pSHgKMT2LkUMDU35dXAGnz3HDw7/jmXinL/0T/CTxGSTTWwJvwmf9YsVNs151+/MVGd3CHiZpJarNB3jXAi55YICozkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790695255; c=relaxed/simple;
	bh=pBxNS1bNtBf30rEZNvzpqa0C4ZlKjw0kKCPl6PN35dg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HHCo1ewrjzTU+NcVBJIZ+wIikuIRMX3hSoF67kP+cBnN0XSkr+bB6OH0l3cQUBAM+aS/WxlGM2QvIKY4VXpk3fKkXvqqvp1vDLBbGWzaBaU++cqQ6q3PoPmf+eF8lcUowuX0rRp+DrAvqBzpStttvKMLR+Jo4LJRc24Jdqr/2X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=OwYg1zNe; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="OwYg1zNe"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B2D00106C7C;
	Tue, 29 Sep 2026 17:20:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1790695232;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=jaSo4Yb5WbEA26v9hASwh38CJf2MLKJoEN33KGK1KgY=;
	b=OwYg1zNeWSvdQ4w9b+0TZLvqfWPigX0M3fzPgWzz+vPcJje+jsx5G9iaA3nb96uB46BhnB
	bpUAgegtqCIlqJEgRs0tC8jzU80+f6TWCC84lEsbRMhI8+7qZtAXimvd0Lm7j/MYgIdq7z
	edl6CZsip8z+cEmazKcVjdbds4HsGMLJcIS6hCj1Oz/bbZSruTBoyXbT4sqtJQQBcSJkWB
	3hmFeCIdr7PMB7WkQQJVPjS+YNXhHY87/CldFdRAvSBSRRNrmicvjq1iNcGnutArvRKDVJ
	xops2aHs+in5y9A7DwQgid3i7qcN704OwIO/ZkKV5hOsm2YG5QaKgDKIMdKRTA==
Message-ID: <49303872-5622-4e1d-8e1a-01394ec29367@nabladev.com>
Date: Tue, 29 Sep 2026 17:20:27 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: imx95: Add support for Data Modul
 i.MX95 eDM SBC
To: Frank Li <Frank.li@oss.nxp.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Aswath Govindraju <a-govindraju@ti.com>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, imx@lists.linux.dev, linux-can@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260928204741.175754-1-marex@nabladev.com>
 <20260928204741.175754-3-marex@nabladev.com> <arvPDq8sjjv7na01@SMW015318>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <arvPDq8sjjv7na01@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 9/29/26 4:45 PM, Frank Li wrote:

Hello Frank,

>> +	backlight_lvds: backlight-lvds {
>> +		compatible = "pwm-backlight";
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&pinctrl_panel_backlight_lvds>;
>> +		brightness-levels = <0 1 10 20 30 40 50 60 70 75 80 90 100>;
>> +		default-brightness-level = <7>;
>> +		enable-gpios = <&gpio2 27 GPIO_ACTIVE_HIGH>;
>> +		pwms = <&tpm3 3 5000000 0>;
>> +		/* Disabled by default, unless display board plugged in. */
>> +		status = "disabled";
>> +	};
> 
> The both backlight is not used in this dts, can you remove it and
> add these when it real use.
It's the same thing we do on the other boards, so I would prefer to keep 
this consistent:

arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts: 
backlight: backlight {
arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts: 
compatible = "pwm-backlight";
arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts- 
brightness-levels = <0 1 10 20 30 40 50 60 70 75 80 90 100>;
arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts- 
default-brightness-level = <7>;
arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts- 
pwms = <&pwm1 0 5000000 0>;
arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts- 
/* Disabled by default, unless display board plugged in. */
arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts- 
status = "disabled";
arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts-    };
