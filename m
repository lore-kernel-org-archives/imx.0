Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D9B2B9BC
	for <imx@lists.linux.dev>; Tue,  6 May 2025 22:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746569027; cv=none; b=QcaXalZvgnzhZe9uuSL39Xk9B9+k21QFlNeNCW1979E8nZFgm4i7BzKCiqIjL/S0NLBMMqH2Q5hunuvoFeB3UPywYiwFmhu1sqxdgkFkyoTy2P6CrlscKvD81W1xpq0jevKgwXPDWa0n1cE3WPuh7L0402nhq/YduPZhuM+LMoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746569027; c=relaxed/simple;
	bh=ajzWJDE0PCf5lFECkh00P7A0CoWBSmSLJqJpRELRqOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LrmdUEEeGrtSTRlJAqfdAV5Dl90rCKLJiPg+nRdysOsBAy4/9R99zXr+7qje+TddHZuW+7WG63UoPFjdNvuypLAcR9VdnXJxCdRCbtHRcoIFvqNNXOTtOLqXT3WDCR0gFem1XYfC5wdil1D2ZDWwXOkNNeNVec0Pq/lTOfS3B8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=R9498fX3; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="R9498fX3"
Message-ID: <50e809ea-62a4-413d-af63-7900929c3247@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746569022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IF11V1LxbdaWQKHY5/mURULyUQidK3c4QDqI9he05Rc=;
	b=R9498fX3TtQBfCoT86rtJv1QMpLmeIEhNVtIOLf/Y7q9isypSpTrEFX8054v4WOiCbvky+
	cBEfqsErs/D814j6M1rFVjTASwb3WDR/jY+ySijrxmqU7g1iV1OSI8b0UagDq/DbWy83R/
	rOZi8mksEcKZwUhv95wx1TBKPQeHLxg=
Date: Tue, 6 May 2025 18:03:35 -0400
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [net-next PATCH v3 05/11] net: pcs: lynx: Convert to an MDIO
 driver
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 upstream@airoha.com, Christian Marangi <ansuelsmth@gmail.com>,
 linux-kernel@vger.kernel.org, Kory Maincent <kory.maincent@bootlin.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Clark Wang <xiaoning.wang@nxp.com>, Claudiu Manoil <claudiu.manoil@nxp.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, Joyce Ooi <joyce.ooi@intel.com>,
 Madalin Bucur <madalin.bucur@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, UNGLinuxDriver@microchip.com,
 Wei Fang <wei.fang@nxp.com>, imx@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250415193323.2794214-1-sean.anderson@linux.dev>
 <20250415193323.2794214-1-sean.anderson@linux.dev>
 <20250415193323.2794214-6-sean.anderson@linux.dev>
 <20250415193323.2794214-6-sean.anderson@linux.dev>
 <20250506215841.54rnxy3wqtlywxgb@skbuf>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250506215841.54rnxy3wqtlywxgb@skbuf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 5/6/25 17:58, Vladimir Oltean wrote:
> Hello Sean,
> 
> On Tue, Apr 15, 2025 at 03:33:17PM -0400, Sean Anderson wrote:
>> diff --git a/drivers/net/pcs/pcs-lynx.c b/drivers/net/pcs/pcs-lynx.c
>> index 23b40e9eacbb..bacba1dd52e2 100644
>> --- a/drivers/net/pcs/pcs-lynx.c
>> +++ b/drivers/net/pcs/pcs-lynx.c
>> @@ -1,11 +1,15 @@
>> -// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>> -/* Copyright 2020 NXP
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/* Copyright (C) 2022 Sean Anderson <seanga2@gmail.com>
>> + * Copyright 2020 NXP
>>   * Lynx PCS MDIO helpers
>>   */
>>  
>> -MODULE_DESCRIPTION("NXP Lynx PCS phylink library");
>> -MODULE_LICENSE("Dual BSD/GPL");
>> +MODULE_DESCRIPTION("NXP Lynx PCS phylink driver");
>> +MODULE_LICENSE("GPL");
> 
> What's the idea with the license change for this code?

I would like to license my contributions under the GPL in order to
ensure that they remain free software.

--Sean
