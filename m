Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADA0194C6A
	for <imx@lists.linux.dev>; Thu, 19 Dec 2024 17:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734630466; cv=none; b=mdogND5r4e5s1k55BbiKOKEb1DjrQl6ImZQ3v+vjAera0ohV7UjAqd79KTyvGSbPCHV2VPVUsP0kvVQ+FHnlekA+7WJMrRZ90UTlBjSlPOUI07P2EQCFTBt5gpFy/A4ykvuGJUBb3zE4v9xXxvowB3IY56GoTwcov4EdzOnh79Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734630466; c=relaxed/simple;
	bh=i9oDS97QSPWCeJnfJR9byCwzGz0Q/D96e1Fwp8/myUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eOW2NJW9Vy0NfgLm643jjdc41BEg9cPTneIux8zw+WTieQrSmWKnFbio+3unSlMDpZMhcI9sLkRFVlFN4wPpFhrRHX2SZpieOBlL3OapxRUPqpKcEhzLrafbJ1zz1gC2rR9RVfwJA9T3cN4sk0jfZtaHhVULnV4AYWQxPBQ/Rv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOKcb-0002fS-4M; Thu, 19 Dec 2024 18:47:37 +0100
Message-ID: <1ced1da5-ae70-4dba-a5cc-e1e05d67b2f3@pengutronix.de>
Date: Thu, 19 Dec 2024 18:47:35 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] arm64: dts: imx8mp-skov: configure uart1 for RS485
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Oleksij Rempel
 <o.rempel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241219-skov-dt-updates-v1-0-38bf80dc22df@pengutronix.de>
 <20241219-skov-dt-updates-v1-7-38bf80dc22df@pengutronix.de>
 <Z2RbINlmO9UL+MPH@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <Z2RbINlmO9UL+MPH@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On 19.12.24 18:42, Frank Li wrote:
> On Thu, Dec 19, 2024 at 08:25:31AM +0100, Ahmad Fatoum wrote:
>> uart1 TX, RX and RTS signals go off the base board and to a RS485
>> transceiver. Describe this in the device tree.
> 
> Look like it is not related what your did in this patch.
> 
> Add uart-has-rtscts in uart1 to ... (because ....)

because they go off to the base board to a RS485 transceiver?

>> +	/*
>> +	 * While there is no CTS line, the property "uart-has-rtscts" is still
>> +	 * the right thing to do to enable the UART to do RS485. In RS485-Mode
>> +	 * CTS isn't used anyhow and there is no dedicated property
>> +	 * "uart-has-rts-but-no-cts".
>> +	 */
>> +	uart-has-rtscts;
>>  };
>>
>>  &uart2 {
>> @@ -618,6 +625,8 @@ pinctrl_uart1: uart1grp {
>>  			MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX			0x140
>>  			MX8MP_IOMUXC_UART1_TXD__UART1_DCE_TX			0x140
>>  			MX8MP_IOMUXC_UART3_RXD__UART1_DTE_RTS			0x140
>> +			/* CTS pin is not connected, but needed as workaround */
> 
> what' means here! what's problem to be workaround?

See the more descriptive comment above. We don't actually have CTS connected in hardware,
but we mux it anyway, so the i.MX UART is cleared to send always.

Thanks,
Ahmad

> 
>> +			MX8MP_IOMUXC_UART3_TXD__UART1_DTE_CTS			0x140
>>  		>;
>>  	};
>>
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
