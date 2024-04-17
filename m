Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22AF813AD12
	for <imx@lists.linux.dev>; Wed, 17 Apr 2024 10:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713349036; cv=none; b=nbkn5YiZ1tEPtAmHRWgNZnUdCjTEVsfjGx/VWFQ6PdIM8OjsuGtQ+EiCADO5XplwC8C8cl1fvtiVTDifuCiD18FeeAZPsKyQEXM+0/95YNRye+FBOcsluwX33SJBOU9UAWNUh1L3b9c6QFCcfKf9zeKjbmRhrszJ6tNXb5xyeTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713349036; c=relaxed/simple;
	bh=Q5H8z0gxxxjp59UVdlIimmJCU4yazo9ZSNZ9crTnX3M=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=RH9D6MYULRelKZCNeRzLt/Ai4+WpnHuf3U3dwiPuynRp+G8atZ5HQ2Mck64ek91QYB5Grrjy31toOl5duAF5e2bDNmxLexRTodyzgyowS2PhrNkEa8Jxnvxq8NH8FNRGICPjYH+larS5PdeuiEF9cy55p/IyUJB/kaZVqnvdQ5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1rx2Li-0001BM-Hu; Wed, 17 Apr 2024 12:17:06 +0200
Message-ID: <6872097d-b1c8-40c0-8392-28c351dad3dc@pengutronix.de>
Date: Wed, 17 Apr 2024 12:17:05 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: imx8mp: Align both CSI2 pixel clock
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
To: Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Paul Elder <paul.elder@ideasonboard.com>, imx@lists.linux.dev,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
References: <20240416141914.9375-1-marex@denx.de>
 <352388ee-a267-4c1f-b968-e1a7709d46ea@pengutronix.de>
In-Reply-To: <352388ee-a267-4c1f-b968-e1a7709d46ea@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On 17.04.24 12:14, Ahmad Fatoum wrote:
> On 16.04.24 16:19, Marek Vasut wrote:
>> Configure both CSI2 assigned-clock-rates the same way.
>> There does not seem to be any reason for keeping the
>> two CSI2 pixel clock set to different frequencies.
>>
>> This also reduces first CSI2 clock from overdrive mode
>> frequency which is 500 MHz down below the regular mode
>> frequency of 400 MHz.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
> 
> Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

I see now that the node has a clock-frequency = <500000000>; still.
This should be lowered too, shouldn't it?

Cheers,
Ahmad

> 
>> ---
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: Fabio Estevam <festevam@gmail.com>
>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Cc: Paul Elder <paul.elder@ideasonboard.com>
>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
>> Cc: Shawn Guo <shawnguo@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> Cc: imx@lists.linux.dev
>> Cc: linux-arm-kernel@lists.infradead.org
>> ---
>> V2: Align both clock to 266 MHz and update commit message
>> ---
>>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
>> index 1bb96e96639f2..7883f5c056f4e 100644
>> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
>> @@ -1667,7 +1667,7 @@ mipi_csi_0: csi@32e40000 {
>>  						  <&clk IMX8MP_CLK_MEDIA_MIPI_PHY1_REF>;
>>  				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>,
>>  							 <&clk IMX8MP_CLK_24M>;
>> -				assigned-clock-rates = <500000000>;
>> +				assigned-clock-rates = <266000000>;
>>  				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_MIPI_CSI2_1>;
>>  				status = "disabled";
>>  
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

