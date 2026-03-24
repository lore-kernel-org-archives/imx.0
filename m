Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1793F8815
	for <imx@lists.linux.dev>; Tue, 24 Mar 2026 17:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774373958; cv=none; b=lL5HH78h8wurBh6KcmsgJuQiUN/l8guX5Cw+39GKm45ScVz7HV/DZo0Cy76UwE6rbALOb+WvTllPo/mt85a5V9uAzhlWNsUH9Z3ZHw75Q+Fy4JtGGfVcP13/hPinsZpBCKai+GNEhUO3T8xJ7dQgHWC7Z3ddA+68PHvrMBvYv9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774373958; c=relaxed/simple;
	bh=xU/WyK7McpXWdO+9gz1Fv5LxGOl6yL1ITwyb79CIAHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SYQM7hBLcPPtyA28R/WC5GBJvIP5ZJxHHXGlKFvVDJlBhLYRh67lftJqe2xIv1Ze6a/2THoZLGtKULIIT7CEPN84NsE7ZKLn8ca9njBlcDbf7aLzQrA562aduuoyflXvsoZw4gUhhBKcr0TxfQZQMYJK9YHSvVFbVyvmzC/N04I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=IVfk07uk; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="IVfk07uk"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9886F112113;
	Tue, 24 Mar 2026 18:39:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1774373954;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=f/JtUAW8GMSlEGiFymjy5UUqojkB5rvdVEFyaDuZCyA=;
	b=IVfk07uk/ynDHxds/NRsCk3rHM3TbSBSIOTj/IqLvbEz9cyuAO144EmuDtwORQW1zsNVxW
	rmNoWq9YmK80G3NdDLO7FbGf/FljjqwSPCRhdJMk3VyJCFXZ6BcJe3sDHYOPYB03GNPEHv
	Eiq542aYV+NqmjD6j3BZuScr/0mbOZmCx53FhUQ2LbEgzojWBTxzeHBcE69xFvSeqtlPe5
	IBBvAVDx+7Jdv1xn6bpiREYhkPuMS5tIuDPwg1lTyGe6I1XQO2DjrcaQWlm6xnFoo02+Cq
	dJ0CCD6fjki60dIA3qzlV9i68+aPL7tRjE4uaT7hWj2f2+BEqBnPRwlQdeGu3Q==
Message-ID: <e5d7ca6a-fdd3-4aca-aa1f-1d35bc9c0119@nabladev.com>
Date: Tue, 24 Mar 2026 18:39:10 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: imx8mp: Add DT overlays for DH i.MX8M Plus
 DHCOM SoM and boards
To: Frank Li <Frank.li@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev, kernel@dh-electronics.com,
 linux-kernel@vger.kernel.org
References: <20260312232500.197096-1-marex@nabladev.com>
 <acK1YU6M5FGK3qM2@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <acK1YU6M5FGK3qM2@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 3/24/26 5:01 PM, Frank Li wrote:
> On Fri, Mar 13, 2026 at 12:24:04AM +0100, Marek Vasut wrote:
> ...
> 
>> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-ch101olhlwh.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-ch101olhlwh.dtsi
>> new file mode 100644
>> index 0000000000000..534737363c9f0
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-ch101olhlwh.dtsi
>> @@ -0,0 +1,42 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +/*
>> + * Copyright (C) 2022 Marek Vasut
> 
> 2026?

That was the original copyright year when this was implemented, but I 
can update it to 2022-2026 ?

>> + */
>> +
>> +&display_bl {
>> +	pwms = <&pwm1 0 5000000 0>;
>> +};
>> +
>> +&DH_OVERLAY_PANEL_I2C_BUS {
> 
> why upcase for label, generally it should be lower case

Because this label is really a macro , please read on.

>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +
>> +	touchscreen@41 {
>> +		compatible = "ilitek,ili251x";
>> +		pinctrl-0 = <DH_OVERLAY_PANEL_I2C_TOUCHSCREEN_PINCTRL>;
>> +		pinctrl-names = "default";
>> +		reg = <0x41>;
> 
> reg should second property,  please dt-format for new dts files.
> check others
What is "dt-format" ? Linux kernel source tree, even current next, does 
not mention such a tool . I did run schema check and checkpatch on these 
patches. obv.

>> +		interrupt-parent = <&DH_OVERLAY_PANEL_I2C_TOUCHSCREEN_IRQ_PARENT>;
> ...
>> +
>> +	ports {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		port@1 {
>> +			reg = <1>;
> 
> need empty line between child node and property.

Fixed in V2

>> +	#size-cells = <0>;
>> +
>> +	eeprom@56 {
>> +		compatible = "atmel,24c04";
>> +		reg = <0x56>;
>> +		pagesize = <16>;
>> +	};
>> +};
>> +
>> +&ecspi2 {
>> +	status = "okay";
> 
> status should be last property. I stop here because these
> should be identify by tools/script
Neither checkpatch nor schema validation complained about these.

I moved the status=okay to the end. Anything else I should update ?
