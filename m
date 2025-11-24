Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82B730B533
	for <imx@lists.linux.dev>; Mon, 24 Nov 2025 13:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763992479; cv=none; b=bFmpfTlMMJ97oiRAS2ViG+4qijbpvpV4EJAoymdc03bjoeh1yzTOWenHgETWz/91oizIOjpru4oAqUr+ql8wvD2X6Hzyr3iVXDoTARLrX9ptgeTlBaMYPqfjZyBwT6aTrSVWVBt/b607cNcWIIHP5K7VgMfVdjN3TzYPeCWSisk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763992479; c=relaxed/simple;
	bh=UYgW3DXrOmFKdQcFmdndNxUgB7axc9/7w2XBa9zeFQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lvnuN3gA77GlW3MF9owqV15wiBFaFS9aTxAHtCYlBPFFgd/c+TBJFM4wUP469n3N4i8FacBuMZuBntncPGBLpOXpfebhAaTrsaKXHiV7LqHjwoh6M1E+zu+kA03eav7l1hsi4dl41pahweREBSyn9GkwFzqRcyqBIcnVOqjtilQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1vNX1Q-0000Dx-Aw; Mon, 24 Nov 2025 14:54:28 +0100
Message-ID: <18901222-fa5a-4e5e-91c9-f252d6bf1a18@pengutronix.de>
Date: Mon, 24 Nov 2025 14:54:27 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: dts: imx8mp: Update pin function file
 according to Rev.D RM
To: Aisheng Dong <aisheng.dong@nxp.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "robh@kernel.org" <robh@kernel.org>,
 "dongas86@gmail.com" <dongas86@gmail.com>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>, Frank Li <frank.li@nxp.com>,
 "kernel@dh-electronics.com" <kernel@dh-electronics.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux@ew.tq-group.com" <linux@ew.tq-group.com>
References: <20251124095449.4027676-1-aisheng.dong@nxp.com>
 <5432a356-7694-46a5-966b-29257f37a8f5@pengutronix.de>
 <DU0PR04MB929990AF168DA048D26E993480D0A@DU0PR04MB9299.eurprd04.prod.outlook.com>
Content-Language: en-US, de-DE, de-BE
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <DU0PR04MB929990AF168DA048D26E993480D0A@DU0PR04MB9299.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Hi,

On 11/24/25 2:39 PM, Aisheng Dong wrote:
>> From: Ahmad Fatoum <a.fatoum@pengutronix.de>
>> Sent: Monday, November 24, 2025 8:07 PM
>> Subject: Re: [PATCH 1/1] arm64: dts: imx8mp: Update pin function file
>> according to Rev.D RM
>>
>> Hi,
>>
>> On 11/24/25 10:54 AM, Dong Aisheng wrote:
>>> From: Anson Huang <Anson.Huang@nxp.com>
>>>
>>> Update i.MX8MP imx8mp-pinfunc.h file according to reference manual
>> Rev.D.
>>>
>>> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
>>> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
>>
>> At the very least, we should keep around the old defines.
>>
> 
> Could you help elaborate a bit more why need keep the old defines as I saw the previous
> update patch also didn't keep them?

Which previous update patch do you refer to?

Generally, If the defines are wrong or misleading, I am all for renaming
them.

In this case, NXP changed their mind and renamed the function in an
(unreleased)) reference manual.

The tradeoff here is between:

- amount of confusion avoided when we rename USB_OTG to USB
- amount of overhead introduced to adapt device trees

I think the benefit of the rename is marginal at best and not worth the
unnecessary breakage it would impose on countless downstream users with
out-of-tree board device trees.

Cheers,
Ahmad

>> I don't think though that aligning with slightly different naming in a newer
>> reference manual is worth the churn.
> 
> Besides the renaming, also dropped some invalid defines and added new ones.
> 
> Regards
> Aisheng
> 

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |

