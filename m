Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7867350D50
	for <imx@lists.linux.dev>; Fri, 30 Jan 2026 08:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769761788; cv=none; b=URHuUQYtKTGy3o3gEFqduV6qDnoXDZ9T9YhZ3++zYJSHMb/AXRjmOnUDKsQz0uIausIxd8/0rpGYpu9NEmQI7EFb8gXlqG25k2OnQkqJsHCnBs8UZaSsvkRhUbZn/8CtYRmPZeN7r5vn6gHfrY/Oob0doRijyWFqlgxIvgUmbjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769761788; c=relaxed/simple;
	bh=5MEahWuCJP0dPLEmBTsIeIFENKo3FnCUwr1Mmh+9BQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uCA7HE0tuTKYBPGKnKLZHgT4E1Jl9hg6nimgrJIAVGQo+5JNpK5unXOL2suNCj9M68pQFnfHOEQMbzrNU5VHX5LdGXbyBHyxCOdXxLPDLwTpYaZmOZGwc+exM8fxBEl/ds7lnpPvs5yiVLUR6Xj/Vqz4GXl9OeWTsCrewGfH/gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Lua0s3l+; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Lua0s3l+"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1D3424E4233B;
	Fri, 30 Jan 2026 08:29:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E06AB6075A;
	Fri, 30 Jan 2026 08:29:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 94A3D119A885C;
	Fri, 30 Jan 2026 09:29:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769761784; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=/vKn9EEQHyKCNGgNOLS9lAAVgDA2xlkQZrymT9LUk4A=;
	b=Lua0s3l+UZuM4nHOP7UHhBh2KmaT7OYmaPFGeF3fPSrOYmJxLSqrJutiWd3qECpWBtm35p
	/zGCIVZ7cJYfw+6mwhKTwWXc6HU0QIjrYOaKjlRCJND9LWfDb4vdCC2gdILG9sajvFGVYv
	Y9Pvo3Km2luVhWmyF+Y2voc+PbWLxWEWLSaMudYLJzqo66xwaOOPdN9zHwPzzhy7mDIjTe
	alBkuWD/wHpqO4m43YucrAJzumYXEOzLlTUSYSgVmkqcB/GrStBcUw4e79BypD8/H9jBC3
	S5GDiIee6AMOHy5IMZbdiOJMSqdU9cRfvRP4YhB+W7novRZN/ZjeZcNpqyqp2A==
Message-ID: <cb94b647-c2a4-468d-ac1c-c5f18f0734f2@bootlin.com>
Date: Fri, 30 Jan 2026 09:29:38 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: phy: add device link between MAC device and MDIO
 device
To: Wei Fang <wei.fang@nxp.com>, Russell King <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>
Cc: "andrew@lunn.ch" <andrew@lunn.ch>,
 "hkallweit1@gmail.com" <hkallweit1@gmail.com>,
 "florian.fainelli@broadcom.com" <florian.fainelli@broadcom.com>,
 "xiaolei.wang" <xiaolei.wang@windriver.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "edumazet@google.com" <edumazet@google.com>,
 "pabeni@redhat.com" <pabeni@redhat.com>,
 "quic_abchauha@quicinc.com" <quic_abchauha@quicinc.com>,
 "quic_sarohasa@quicinc.com" <quic_sarohasa@quicinc.com>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260126104409.1070403-1-wei.fang@nxp.com>
 <20260128201501.04bb6e5c@kernel.org> <aXsxJa0D0bohafRs@shell.armlinux.org.uk>
 <PAXPR04MB85106B63AF43DE0830B4C362889FA@PAXPR04MB8510.eurprd04.prod.outlook.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <PAXPR04MB85106B63AF43DE0830B4C362889FA@PAXPR04MB8510.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On 30/01/2026 04:41, Wei Fang wrote:
>> On Wed, Jan 28, 2026 at 08:15:01PM -0800, Jakub Kicinski wrote:
>>> On Mon, 26 Jan 2026 18:44:09 +0800 Wei Fang wrote:
>>>> The commit bc66fa87d4fd ("net: phy: Add link between phy dev and mac
>>>> dev") has created a device link between the MAC and the PHY if the
>>>> MAC uses a shared MDIO bus (The MDIO and the MAC are two separate
>> devices).
>>>> Sarosh Hasan tried to change the DL_FLAG_STATELESS flag to
>>>> DL_FLAG_AUTOREMOVE_SUPPLIER to fix the issue [1]. However, the
>>>> solution does not take into account the hot-swappable PHY devices (such as
>> SFP).
>>>> so when the PHY device is unplugged, the MAC driver will
>>>> automatically be removed, which is not the expected behavior.
>>>>
>>>> Therefore, to solve this issue of the shared MDIO bus, we create the
>>>> device link between the MAC device and the MDIO device, rather than
>>>> between the MAC device and the PHY device. And when the shared MDIO
>>>> bus is removed, all MAC drivers that depend on it will also be removed.
>>>
>>> Anyone willing to venture a review tag?
>>
>> No, I don't agrew with the patch.
>>
> 
> Is it because of SFP? If so, would the following modification be more
> reasonable, while SFP still follows the previous logic? I'm not sure if
> phydev->sfp_bus_attached can be used to distinguish between SFP
> PHYs and non-SFP PHYs.

If you want to know if the PHY is in an SFP module, you should use
phy_on_sfp() instead :

https://elixir.bootlin.com/linux/v6.18.6/source/include/linux/phy.h#L1766

It's set for this kind of setups :


               SFP module
+-----+      +-----------+
| MAC | ---- | PHY       |
+-----+      +--\--------+
                 \
                  \_ phy_on_sfp(phydev) == true


phydev->sfp_bus_attached is for the media converter user-case :

                            SFP Module
+-----+      +-----+      +------------+
| MAC | ---- | PHY | ---- |   ???      |
+-----+      +--\--+      +------------+
                 \
                  \_ phydev->sfp_bus_attached == true
> 
> Anyway, this problem has existed for a long time, and I think we should
> find a way to solve it in upstream. If there's a better approach, I can help
> verify it.

Sorry I wasn't available for most part of yesterday for that discussion.

I'll give a try to this patch today, with the above change and let you know
how this goes.

Maxime

