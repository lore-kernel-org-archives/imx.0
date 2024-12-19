Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB20C1AAA3E
	for <imx@lists.linux.dev>; Thu, 19 Dec 2024 17:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734630706; cv=none; b=D+EGfNAcM0v8o5wmO09hBOkPSeqRYBcOYjl43FRPRExweIumx+OAr+BY1UQ3XSeGRBivgDpnl49HOtF4S1XSRkred0tNNJmAeJUQ+m+97awyP3B6vZtI/StgeDpmXA6CmllVdjSYyUNZglY1L5KGzw2BzGp3PCw7U1Lxxu1HUT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734630706; c=relaxed/simple;
	bh=RXmn4MciZ9YgwR78W7U17JKWJnMvgFTtpy1SeRCECns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aU9RwmP6w4syy/WbohNABL5aysRcOlIo+kQGOWUXiUVCvSKrT9Ugl5zrHgxELuSm49GgAy1MHacmjW9/eTVL8VmX/4ImSYU3wCrZxo5h5A1CE6YufAhgVHdlA31EIBUiBOoDHgKS5z2vpSjtId8J9xXyYeBpOQQY4caeUjCTCCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOKgS-0003qo-Eb; Thu, 19 Dec 2024 18:51:36 +0100
Message-ID: <30dbe486-7e36-426d-8fa4-3ecd83193a10@pengutronix.de>
Date: Thu, 19 Dec 2024 18:51:35 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] arm64: dts: imx8mp-skov: increase I2C clock
 frequency for RTC
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Oleksij Rempel
 <o.rempel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241219-skov-dt-updates-v1-0-38bf80dc22df@pengutronix.de>
 <20241219-skov-dt-updates-v1-10-38bf80dc22df@pengutronix.de>
 <Z2RcJCaYC2FW3Ks6@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <Z2RcJCaYC2FW3Ks6@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On 19.12.24 18:47, Frank Li wrote:
> On Thu, Dec 19, 2024 at 08:25:34AM +0100, Ahmad Fatoum wrote:
>> From: Oleksij Rempel <o.rempel@pengutronix.de>
>>
>> The NXP PCF85063TP RTC we use is capable of up to 400 kHz of SCL clock
>> frequency, so let's make use of this instead of the 100 kHz bus frequency
>> we are currently using.
> 
> Increase I2C frequency to 400khz from 100kHz because NXP PCF85063TP RTC
> support it.

Unlike your other suggestions, these is no information lost by rewriting
the commit message as you suggest. I don't mind, but must admit it feels
like bikeshedding. What is your concrete objection to my commit message?

Thanks,
Ahmad


> 
> Frank
> 
>>
>> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
>> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
>> ---
>>  arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
>> index a683f46fcbab..ec7857db7bf0 100644
>> --- a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
>> @@ -333,7 +333,7 @@ reg_nvcc_sd2: LDO5 {
>>  };
>>
>>  &i2c3 {
>> -	clock-frequency = <100000>;
>> +	clock-frequency = <400000>;
>>  	pinctrl-names = "default";
>>  	pinctrl-0 = <&pinctrl_i2c3>;
>>  	status = "okay";
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
