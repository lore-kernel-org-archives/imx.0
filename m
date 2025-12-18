Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5673451BD
	for <imx@lists.linux.dev>; Thu, 18 Dec 2025 13:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766065996; cv=none; b=WyXEy96L0h5WFHcdoTziXcTK1H7227OmbR0gCIV/2ZCEHtybw3vGFt/IjFtBq0kG5gTHNwny7RuvwbpBLEJ3DQWkUz+X9wCOWaRTe3xUQwgyrmd90ySOJedgLx+ymYfLX+eUjkJ9z0r8c04kHiXv9V/EYr2gHTwE/GhOVXw4hhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766065996; c=relaxed/simple;
	bh=k1wtDYSaiiLWFrRrGcwn90MyWbfJ68/tBsZWk8VszJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UkThx2v1WZHf6SbyG1+l+I8BhXoLlcoPDQK1iVfUXYnmqDfUzI7NddDu+cse7ML0HVSV0QzVzvruAe+y5SKCHKzp79/CYlq1OKFG2SL0sT1J7xyHCDUqmluJzdQmHKOlYgWODTVC9S1v+qOmEwoLZMxjHRQjruupDG/2EtglAX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1vWERE-0008Rc-F2; Thu, 18 Dec 2025 14:53:04 +0100
Message-ID: <5925c749-1288-4d61-b17f-ac2e1c6c463d@pengutronix.de>
Date: Thu, 18 Dec 2025 14:53:02 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Add devicetree for NXP i.MX93 FRDM board
To: Fabian Pflug <f.pflug@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, Lei Xu <lei.xu@nxp.com>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Haidong Zheng <haidong.zheng@nxp.com>, Daniel Baluta
 <daniel.baluta@nxp.com>, Danwei Luo <danwei.luo@nxp.com>,
 linux-arm-kernel@lists.infradead.org
References: <20251218-fpg-nxp-imx93-frdm-v4-0-cd3a9f6ac89a@pengutronix.de>
 <9a96f664-00ba-4589-b3b8-a04355c0ad0b@pengutronix.de>
 <e15437918fc2e162eec92985e8f11f8e0de91246.camel@pengutronix.de>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Language: en-US, de-DE, de-BE
In-Reply-To: <e15437918fc2e162eec92985e8f11f8e0de91246.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Hi,

On 12/18/25 2:11 PM, Fabian Pflug wrote:
> Hello Ahmad,
> 
> On Thu, 2025-12-18 at 13:52 +0100, Ahmad Fatoum wrote:
>> Hello Fabian,
>>
>> On 12/18/25 12:39 PM, Fabian Pflug wrote:
>>> Signed-off-by: Fabian Pflug <f.pflug@pengutronix.de>
>>> ---
>>> Changes in v4:
>>> - remove it6263 block in i2c1, since it is not finished
>>> - remove usdhc3 pwrsequence, since WLAN is not tested on my board
>>> - remove eee-broken-1000t on phy2, since it is not broken
>>> - update min/max-microvlt on buck converters
>>
>> I know you changed this due to reviewer feedback, but it was wrong
>> advice. The Linux driver already has information about the minimum and
>> maximum range support for the PMIC, what you need to write here is the
>> actual board-level constraints.
> 
> Yeah, I know, that why I only updated the other two rails and changed to minimum for CPU 0.64 to 0.61V for core.
> And 1.06 to 1.14V for DRAM, as it is the settings allowed by the CPU.
> 
> VCC3.3 and VCC1.8 were not changed, due to them being connected to multiple devices and I did not want to make them
> flexible, as it would be a hassle in the drivers.

Ah, good. I read this change log here, checked v3 and then saw you
applied the feedback on the first regulator and assumed you did so for
the others mentioned there as well...

0.61 is the minimum in suspend for VDD_SOC, so that's ok.
For DRAM, that's minimum/maximum operating range so ok too.

Thanks for the clarification,
Ahmad

> 
> Kind regards
> Fabian
> 
>>
>> I don't think the board will like VDD_3V3 at 1.62V or VDD_1V8 at 3.4V.
>> For the fixed voltage rails just set min = max = fixed voltage.
>>
>> Thanks,
>> Ahmad
>>
>>> - Link to v3: https://lore.kernel.org/r/20251022-fpg-nxp-imx93-frdm-v3-0-03ec40a1ccc0@pengutronix.de
>>>
>>> Changes in v3:
>>> - Add Signed-off for original NXP contributors.
>>> - Fixed whitespace errors (Thanks Francesco Valla)
>>> - Added mu1 with status okay (Thanks Francesco Valla)
>>> - Removed address cells from lpi2c3 (Thanks Frank Li)
>>> - Configure pin for watchdog (Thanks Peng Fan)
>>> - Updated regulator config
>>> - Configure i2c0
>>> - Link to v2: https://lore.kernel.org/r/20250526-fpg-nxp-imx93-frdm-v2-0-e5ad0efaec33@pengutronix.de
>>>
>>> Changes in v2:
>>> - 1/2: remove CAN node, as it has not been tested.
>>> - 1/2: ran dt-format (Thanks Frank Li)
>>> 	But also reordered some nodes afterwards again to have
>>> 	regulator-min before regulator-max, have the pinmux at the end
>>> 	of the file, and have the regulator-name as the first node
>>> 	inside the regulators.
>>> 	Re-added comments, that were deleted.
>>> - 1/2: changes subjet to ar64:dts (Thanks Fabio Estevan)
>>> - 1/2: removed reg_vdd_12v (Tanks Fabio Estevan)
>>> - 1/2: added aliases for rtc, emmc, serial (Thanks Fabio Estevan)
>>> - reordered the series to have documentation before dts. (Thanks
>>>   Krzystof Kozlowski)
>>> - Link to v1: https://lore.kernel.org/r/20250523-fpg-nxp-imx93-frdm-v1-0-546b2d342855@pengutronix.de
>>>
>>> ---
>>> Fabian Pflug (2):
>>>       dt-bindings: arm: fsl: add i.MX93 11x11 FRDM board
>>>       arm64: dts: freescale: add support for NXP i.MX93 FRDM
>>>
>>>  Documentation/devicetree/bindings/arm/fsl.yaml     |   1 +
>>>  arch/arm64/boot/dts/freescale/Makefile             |   1 +
>>>  arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 620 +++++++++++++++++++++
>>>  3 files changed, 622 insertions(+)
>>> ---
>>> base-commit: ea1013c1539270e372fc99854bc6e4d94eaeff66
>>> change-id: 20250523-fpg-nxp-imx93-frdm-5cc180a1fda9
>>>
>>> Best regards,
> 

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |

