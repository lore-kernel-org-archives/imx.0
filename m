Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B6D1917E4
	for <imx@lists.linux.dev>; Thu, 19 Dec 2024 17:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734630562; cv=none; b=LEmjGWO56WxWslhAuoYxp1RizZMTHIRevnWeHcUNxGnKBXWvGnXxWBUALMiHilOTpYlYUodE4POoo97E2WAzgNlHL27/LHcTd4cv1TN2WWvT9IT3GaB3PjivreXK6V56hNFLUcEEoZY/FAi2BX9epfNpWdRJZS2McRQLXccyTCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734630562; c=relaxed/simple;
	bh=6DfTKbGR+SPdlzczE7ZjsyDtTF5ETvc8keUIgBz+FNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mqROfdZbrsfJTfpqtYoKuQ1WP10Uf60H+zA02mfOi4NSQGiIWjjzmIGlsccCOkH2s1sB7ShfZ9h2J19mmqZ92VTNwP2SnjMIyzZyuN/fyG6IdUrVmt4j/syWfbcGtsCV9JqTbRgOj+iJ8cd0HX/Gdc3g4Fb8tS546eCKJ6we0rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOKe9-00033q-Bt; Thu, 19 Dec 2024 18:49:13 +0100
Message-ID: <ab896c6a-49a2-4eda-bee3-c429fe8cef1b@pengutronix.de>
Date: Thu, 19 Dec 2024 18:49:12 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] arm64: dts: imx8mp-skov: fix phy-mode
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Oleksij Rempel
 <o.rempel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241219-skov-dt-updates-v1-0-38bf80dc22df@pengutronix.de>
 <20241219-skov-dt-updates-v1-9-38bf80dc22df@pengutronix.de>
 <Z2RbwCt2zX2GyK8O@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <Z2RbwCt2zX2GyK8O@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On 19.12.24 18:45, Frank Li wrote:
> On Thu, Dec 19, 2024 at 08:25:33AM +0100, Ahmad Fatoum wrote:
>> From: Oleksij Rempel <o.rempel@pengutronix.de>
>>
>> Use rgmii-rxid instead of rgmii-txid. It should have no effect here,
>> but rxid is the correct value in our case.
> 
> Use rgmii-rxid instead of rgmii-txid because ...

I consider it useful information to note that it should introduce no
functional change.

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
>> index 80d212acc0c3..a683f46fcbab 100644
>> --- a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
>> @@ -215,7 +215,7 @@ adc: adc@0 {
>>  &eqos {
>>  	pinctrl-names = "default";
>>  	pinctrl-0 = <&pinctrl_eqos>;
>> -	phy-mode = "rgmii-txid";
>> +	phy-mode = "rgmii-rxid";
>>  	status = "okay";
>>
>>  	fixed-link {
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
