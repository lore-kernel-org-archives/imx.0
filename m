Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAD5314A77
	for <imx@lists.linux.dev>; Mon, 24 Nov 2025 15:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763997559; cv=none; b=eTz0Mr9JV0TEdhAlUNEOSFYJWlpQwPjC/BDGKPzSUgxBz2Z45sRX02CE7VLkPeFgiGijcT6oKmlNAKxpgF/cmjLP4P/sWv/oX88jinLjywRmYxKyPSJFg8mzvzjPS6Z1idGswLtSm5HX+p+vZHhOPvQezsASzY7ITa63+l1JHaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763997559; c=relaxed/simple;
	bh=rj/A3trtk4Rk41rAV82AFL4Qr0CgnZ8mm/2mh+19lKc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uD9JxG5fbBeTaCZUJcS75MpTeaLXmElTtkGMgcL1XmP12Uig6mMFJzTEFCAeEkFZSvBGt22JrthGoDyoVZgczStNOoh+4ZSMyEwCiDuiEhQKoa2Ip43AbtzVhh76ISF8TxkWIA3IhIUaRZFNFzoUMVca4YXUnAnnqwg4njype3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1vNYLM-0002Fk-6e; Mon, 24 Nov 2025 16:19:08 +0100
Message-ID: <00b6154b-cf95-463d-b46d-2944d2fef8a0@pengutronix.de>
Date: Mon, 24 Nov 2025 16:19:07 +0100
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
 <18901222-fa5a-4e5e-91c9-f252d6bf1a18@pengutronix.de>
 <DU0PR04MB9299811B113C555FD795FDC280D0A@DU0PR04MB9299.eurprd04.prod.outlook.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Language: en-US, de-DE, de-BE
In-Reply-To: <DU0PR04MB9299811B113C555FD795FDC280D0A@DU0PR04MB9299.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Hello,

On 11/24/25 4:08 PM, Aisheng Dong wrote:
>> From: Ahmad Fatoum <a.fatoum@pengutronix.de>
>> Sent: Monday, November 24, 2025 9:54 PM
>>> Could you help elaborate a bit more why need keep the old defines as I
>>> saw the previous update patch also didn't keep them?
>>
>> Which previous update patch do you refer to?
>>
> 
> I mean this patch:
> 
> commit bcf7206fe9c35e048e1dc90cf62216b0f5eaf091
> Author: Anson Huang <Anson.Huang@nxp.com>
> Date:   Fri Aug 14 17:27:19 2020 +0800
> 
>     arm64: dts: imx8mp: Update pinfunc header file

2020 was the same year the file was added, so any fallout it could have
caused back then would have been minimal anyway.


>> Generally, If the defines are wrong or misleading, I am all for renaming them.
>>
>> In this case, NXP changed their mind and renamed the function in an
>> (unreleased)) reference manual.
> 
> This is not accurate. The RM with updated names has been released.

Thanks for clarifying. I had meant to add a question mark :)

>> The tradeoff here is between:
>>
>> - amount of confusion avoided when we rename USB_OTG to USB
>> - amount of overhead introduced to adapt device trees
>>
>> I think the benefit of the rename is marginal at best and not worth the
>> unnecessary breakage it would impose on countless downstream users with
>> out-of-tree board device trees.
> 
> I agree the benefit of USB renaming may be arguable.
> But how about the remain changes (drop invalid defines and adding new ones)?
> Are they still need to be fixed?

The other changes are ok, although it would be good to add a short info
to the commit message especially about the removed macros if you have
any extra information why these pad functions are no longer applicable.

Thanks,
Ahmad



> 
> Regards
> Aisheng
> 

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |

