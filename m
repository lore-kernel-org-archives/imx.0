Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080B9293472
	for <imx@lists.linux.dev>; Fri, 11 Apr 2025 08:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744359711; cv=none; b=BAMqT4PHh0eQrxPL8BqIwPF+gTRiyxCo1RWkCDGKVvxOHB3NUFYooCPYIjgSUX2SjNFNeANNQPkZATQlf0irKkKT3OAJMWYUw9Ymw9gHyJ0DOv5wtYnJEGQcgS0ZN6Gz5GS5En0XlfIG4T6TQRjG+0Jf/Rv+uNpkZBBJLh8ylNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744359711; c=relaxed/simple;
	bh=2DvWBQ9yOXFxUOCe5zNzMFNh6hjobZtSgyoeVn6y7M8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VXlz+SRr6PyQB3dJAki/zAactiCAFnPe2kB0w5HwKzQdMU3h/Z5922gKU1v+CCQo//KM5L/kFFX7TjIsbkvdWT1RVQMwDoxsVzpo6VXI87Pch2ocXBbdUOV2ztx4urbT5htxGEECZTGEwujhLoqjdFX1TgIqkrAD7H1I4GSO30k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1u39dm-0007rF-5N; Fri, 11 Apr 2025 10:21:34 +0200
Message-ID: <f11dd5bc-1753-4685-8385-397ab9c28475@pengutronix.de>
Date: Fri, 11 Apr 2025 10:21:34 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/13] arm64: dts: freescale: imx93-phyboard-segin: Add
 USB support
To: Frank Li <Frank.li@nxp.com>, Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, upstream@lists.phytec.de,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
References: <20250410090251.1103979-1-primoz.fiser@norik.com>
 <20250410090251.1103979-12-primoz.fiser@norik.com>
 <Z/fi2W9UdFkwKpSa@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <Z/fi2W9UdFkwKpSa@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On 10.04.25 17:25, Frank Li wrote:
> On Thu, Apr 10, 2025 at 11:02:49AM +0200, Primoz Fiser wrote:
>> Add support for both USB controllers. Set first controller in OTG mode
>> (USB micro-AB connector X8) and the second one in host mode (USB type A
>> connector X7) by default. Note, the second controller is not OTG capable
>> due to HW design choice.
> 
> I think note is reduntant. USB type A connector means host only.

It's not uncommon for flashing to happen via a USB-A to USB-A cable, even
if it's against the spec. I'd say the note is useful.

Thanks,
Ahmad

> Frank
>>
>> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
>> ---
>>  .../boot/dts/freescale/imx93-phyboard-segin.dts     | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
>> index 027a34dbaf04..faad3c3e627c 100644
>> --- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
>> +++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
>> @@ -82,6 +82,19 @@ &lpuart1 {
>>  	status = "okay";
>>  };
>>
>> +/* USB  */
>> +&usbotg1 {
>> +	disable-over-current;
>> +	dr_mode = "otg";
>> +	status = "okay";
>> +};
>> +
>> +&usbotg2 {
>> +	disable-over-current;
>> +	dr_mode = "host";
>> +	status = "okay";
>> +};
>> +
>>  /* SD-Card */
>>  &usdhc2 {
>>  	pinctrl-names = "default", "state_100mhz", "state_200mhz";
>> --
>> 2.34.1
>>
> 
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
