Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A611AA1DB
	for <imx@lists.linux.dev>; Thu, 19 Dec 2024 17:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734630044; cv=none; b=Bc4+n8WjN6dN6RNCOmlE61NDd9ofqoZiR0P8Xx/Y+LsnfAcPLov2rlXmzNf5MH5I6z1UH+BjoQj2aJPgsADVUL7hhjHSy+/7RZf4iVAL4SBgE3oilJbQcg2rj5JhBJ9lOZeCx8xAC5sWGc218sWa23dOwl2Bka0VP/89PxNqCt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734630044; c=relaxed/simple;
	bh=tXfPr364+aSgP7AgKDDupR64VgNpZBLMrVU6uNf8qBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V3rUa85ryKfVtZ6HaTiZnEZAvpOCM+193oEhnaXsXnOaaLeAxvc1ktjERMFKNDzBfQpA0BLZhyU8fv/J78BML/ULYoKQfOeyOJDZ7+pfz3v4y/kgyeyde2QcqRjkRId9KWL/VB3y9aRLb6mR7rLRnqfce7ZOldz22m8Fq9hEAC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOKVh-0000ky-NV; Thu, 19 Dec 2024 18:40:29 +0100
Message-ID: <f085aa33-f0b7-49e7-bbfc-d3728d3e3e8c@pengutronix.de>
Date: Thu, 19 Dec 2024 18:40:28 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] arm64: dts: imx8mp-skov: describe HDMI display
 pipeline
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Oleksij Rempel
 <o.rempel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241219-skov-dt-updates-v1-0-38bf80dc22df@pengutronix.de>
 <20241219-skov-dt-updates-v1-4-38bf80dc22df@pengutronix.de>
 <Z2RZY/gvQ0qqDjqv@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <Z2RZY/gvQ0qqDjqv@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Hello Frank,

On 19.12.24 18:35, Frank Li wrote:
> On Thu, Dec 19, 2024 at 08:25:28AM +0100, Ahmad Fatoum wrote:
>> From: Oleksij Rempel <o.rempel@pengutronix.de>
>>
>> Back when this device tree was first added, there were no i.MX8MP
>> HDMI bindings upstream yet. This has changed now, so let's use them
>> to describe the HDMI on the imx8mp-skov-revb-hdmi board.
> 
> Skip your story.

I am sure you don't mean it this way, but the way you phrase it
sounds a bit rude.

> Just said
> 
> Add HDMI display pipeline for imx8mp-skov-revb-hdmi board.

That's already what my commit message title says.
I am not a fan of just repeating the commit message title
in the commit message body.

Unless you have a concrete problem with my commit message,
I'd prefer to keep it the way it is.

Thanks,
Ahmad

> 
> Frank
>>
>> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
>> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
>> ---
>>  .../boot/dts/freescale/imx8mp-skov-revb-hdmi.dts      | 19 +++++++++++++++++++
>>  1 file changed, 19 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dts b/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dts
>> index 206116be8166..32a429437cbd 100644
>> --- a/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dts
>> +++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dts
>> @@ -9,6 +9,21 @@ / {
>>  	compatible = "skov,imx8mp-skov-revb-hdmi", "fsl,imx8mp";
>>  };
>>
>> +&hdmi_pvi {
>> +	status = "okay";
>> +};
>> +
>> +&hdmi_tx {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pinctrl_hdmi>;
>> +	ddc-i2c-bus = <&i2c5>;
>> +	status = "okay";
>> +};
>> +
>> +&hdmi_tx_phy {
>> +	status = "okay";
>> +};
>> +
>>  &i2c5 {
>>  	pinctrl-names = "default", "gpio";
>>  	pinctrl-0 = <&pinctrl_i2c5>;
>> @@ -19,6 +34,10 @@ &i2c5 {
>>  	status = "okay";
>>  };
>>
>> +&lcdif3 {
>> +	status = "okay";
>> +};
>> +
>>  &iomuxc {
>>  	pinctrl_hdmi: hdmigrp {
>>  		fsl,pins = <
>>
>> --
>> 2.39.5
>>
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
