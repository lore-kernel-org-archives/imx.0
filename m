Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526962D0C91
	for <imx@lists.linux.dev>; Thu,  3 Jul 2025 09:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751533952; cv=none; b=UF3qhWkJ7urk6r6HuvwBurEPzhxbqiUpyd5PDjaYFZsZzspgI3fN02jq7ASCb4ukbO2UGByl8n3QMnlnv3kTSCXTch6jt4+XfPq62HtfY2GIc1jdmY/YKqTFD0E+zcYj1JfoI42QFJ7Pt8LPRXBdDbdn1lVlk0qePAzppnhOvUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751533952; c=relaxed/simple;
	bh=siD3cphAg8DVM9vLhcOfYMLHxebr51kxPzZ7rQCJGfM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tbl89TC2t2n4B+fe2l1TuswhtjWc5tbAmfDj79Xac1hfT2O82sWZhJ7DDF3yZMBqBoMtQltzuff9khufgsa5RICkdzW4hPSGsdYM+tMc5o2WgihGRQgKWmdVg93f9QXKrawI35BF33z5FGtPAP7gYjjxo+9zTlcsCZ/wPejobAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=nW4ZO1C9; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="nW4ZO1C9"
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id A3E5AA00F5;
	Thu,  3 Jul 2025 11:12:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=zm6mpexl8UNvAjXlAw9B
	3yDJMgzV4getqht/eJlGdTU=; b=nW4ZO1C9dH+SbeS8/4Gjs/GLK94t2Kd0hSk7
	NDetXaEeXgHogmX1TJ7MxvPr9WuDZxN0RXJ4kSrLHwGSUwTDaSXrlw0yl6Iz9exK
	RyXID1x9yeeX9gt6XN1e4Iqp3zCDF26QfL81CSs3LWrN+u+t2Xx2HJNNgcLzV3Ea
	HlJ/FM3ytcwSclbWhajwxzb52++jQGwG7Qi2gvBhckV0+WbGrJY+qu6ioW3gH1V5
	s9PdIUij4Ykl79HaK9/cuiOPPOyB487cvUzFKt4xKr02FF9m21U3kxH4rHzOircl
	t9PXh/Bhv45WghYc1LTw3jS5fcaCTzIJav3V1pQrWsF2Csg2FfFdiG0xiuZiQtP/
	o3X7aYvBJTnAtu8PhRrxe+ztWDfAF2hPXp+ApyeuIIxCaHMqipowPr5Ix9C2Wvl4
	ZFTZG4CeB3SQkQ97b1solAzknwey/f667c3KVBtn62xfVy+ouyR82O7HGnAjH+Xg
	2NcFq70guUC5705CEOSrLAF96evFjQsdiGVclubWHsMtNi0BdgiPt4YiztIPpDYA
	eDE0sLQd6AMZN1usHfTvrvyrhWdVTKZ363vdvTImIeiQvx0OhAUt3hydn8sYXatJ
	svYcbRlQ2Ut2TU7KGYMuqH9kEbz0sAOAh7l843ISreMOVUYLs5WCbtKlFtCTdx/G
	LW998iU=
Message-ID: <828b473b-c5a5-4c5f-9f7c-200f307cd629@prolan.hu>
Date: Thu, 3 Jul 2025 11:12:23 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm: DT: imx6-sr-som: Replace license text comment with
 SPDX identifier
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	<devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250702-sr-som-dts-lic-v1-1-2e8584e6c837@prolan.hu>
 <aGWqIzNvSVw4olz5@shell.armlinux.org.uk>
 <2f628251-5b67-47e0-8038-6c1aeee1ef91@prolan.hu>
 <aGY5bx1Qpx_7Dqea@shell.armlinux.org.uk>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <aGY5bx1Qpx_7Dqea@shell.armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A296767155D6C726A

Hi,

On 2025. 07. 03. 10:03, Russell King (Oracle) wrote:
>>> As Florian has already mentioned, the preferred format for the summary
>>> for arch/arm is "ARM: ... " and by extension for arch/arm/boot/dts,
>>> it's "ARM: dts: ...", not "arm: DT: ..."
>>
>> Ohh, I misread it, I thought it was just about `imx6: board:` ->
>> `imx6-board:`... Ok, I will re-format it for v2.
> 
> Note that it applies to _all_ patches to arch/arm/boot/dts.

Naturally. I will do that for all the v2s I will submit from now on. I 
hope the current format I've been using today is correct now.

Bence

