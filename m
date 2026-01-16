Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693AD221F39
	for <imx@lists.linux.dev>; Fri, 16 Jan 2026 13:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768568663; cv=pass; b=h3x5nruzK2quv4XeN9d1juJRVpuhXMjxf2NNqqp7J5imsw0Wphyp+sTfTphZs15+7PDADuYz1Li7NeWrLWu0WnBKNCvO3q+w02EvVVCm6yPfu2PONGbIeOxmuNfaLLZREcOC8TIg/XEjX+leSFqp6pyWw09QY64nHjLJ+FMcfz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768568663; c=relaxed/simple;
	bh=XSE9gGYLw8PadLVndxcVP/TcpVS4AVlOUv4UXdPej8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fYTohOVN0UX53QyI4Zc4lmlPKXwtj0vDtVusVMlU+6BT2BnM9fbQAyjbgv3QVQbvz2FjuyAH3RDgIn57iIJqf+c1NcTQW2VaQaJUA2rwHWOurRB8rr4sCfKlpTCHpa99Q4EY6QlKQ4Pn4iUqut8exlcpEKvWkCUBQxoj0zYxq9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=1LP1wsLw; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=P9H/Nd9m; arc=pass smtp.client-ip=185.56.87.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="1LP1wsLw";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="P9H/Nd9m"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-l5rn.prod.antispam.mailspamprotection.com; s=arckey; t=1768568662;
	 b=ExDJwriXFLBHP86K39IN5+bZ1l2AaKgxu1V/nec1PsITNcneQevhQjZZpXKdme0PAyKpn7rSCC
	  E7lo4xCl2/fqO/LJtQFD1AjUuvoSSBNoyDeBK/fsR35qltqfXQkidDD4VFhsNLrlex8YlwRzkj
	  ucgolelFMFkqCLTeL38FD14jwWKP9aGyt79gGGHwSDd+QxLQg0vn5f7qi57Dfm1GAaPFULyt8b
	  qg61k0hmP3tU3ezcWBLWeoZsfPN0VfC0TTOgZD8ChVuSa9Nlj0jq7U8J7PzmZI8WwqZ0bhwEZl
	  BbctQnT8o4mMpg7g6RvJs0aS5iyUyxWqe+18+DBnWRA7rg==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-l5rn.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-l5rn.prod.antispam.mailspamprotection.com; s=arckey; t=1768568662;
	bh=XSE9gGYLw8PadLVndxcVP/TcpVS4AVlOUv4UXdPej8w=;
	h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	  Message-ID:Subject:Cc:To:From:Date:DKIM-Signature:DKIM-Signature;
	b=EQD51OLFQEIceC4DIGZj+8lPFFXl05GI3LaQyCo9HOvWUdyJkdUOhbrUDqi8FLzKB1mcFxvTP7
	  hWCKUIJbrlSQSKnxWAfJXQDA/mOBrhRV23lejrzD89NqBpjl8DuSKOihe5TKZRRHHoxxNFl2Ko
	  6gGTNXPJVBt8DYoiSUXHhx5tHbEkO8gcMqTHikt2A1Vsco+UwUOlIaDfiFmxWyCHpON6F8Uwuf
	  RqVHDzcDnc81GBQbadufZb9OkGBT3rgHkjar50kGqm5/pUUhIE2HAayfLwZOIkhL9bmZXWQa3W
	  wFV0VhZMS9SIeLudR3Lidtst+aPTcKp15AKpVzoW/Kt4Dg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To
	:From:Date:Reply-To:List-Unsubscribe;
	bh=xkK1Ejw0KxmIMEk93SickPJJ21Kj8+bMSYnsUDhPGNk=; b=1LP1wsLwXqNLRnAfqy+JiYRds1
	Stuul4FT0ERDSmagP9qA6GvbEc2CPBXluHaB03/9IdsZLH09WBrnv1VCu6pPmHhYR812124kni33F
	UP095tmLr5+qIkfaS8nvceuefydbK4oVLCO2hinC2bKqis6c6IbngUv9Dr9wjQ6zwTVc=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-l5rn.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vgjUr-00000001br1-3tRj
	for imx@lists.linux.dev;
	Fri, 16 Jan 2026 13:04:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=xkK1Ejw0KxmIMEk93SickPJJ21Kj8+bMSYnsUDhPGNk=; b=P9H/Nd9meIDed7qu/cwVrC+SAf
	H5B+l1TOcHF68tQvca42uE+EHuoM987Rq7Xu9rl1ZwHLEiK8M+VUs0dKW8y8yGIyTl3ie6IMU4UKh
	YVStldrpw4Qp+67x9HRFZ6jHr7lRObEXorWIXr7JrzFSHSJSk6k4drDjCvVA6MeGoKgQ=;
Received: from [95.248.141.113] (port=60003 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <francesco@valla.it>)
	id 1vgjUd-00000000M5y-1XmV;
	Fri, 16 Jan 2026 13:03:59 +0000
Date: Fri, 16 Jan 2026 14:03:57 +0100
From: Francesco Valla <francesco@valla.it>
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx91-11x11-frdm: fix CAN transceiver gpio
Message-ID: <aWo3PZni1Pb9T6FI@bywater>
References: <20260115-imx91_fix-v1-1-9351c3fac76a@valla.it>
 <CAEnQRZD2CvQLO2hBDbX2H8PeeNkzQmLoK6jzeF6HKw8HHa8ukg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEnQRZD2CvQLO2hBDbX2H8PeeNkzQmLoK6jzeF6HKw8HHa8ukg@mail.gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 6a24f6a303db1600773d4a81a1927982
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vgjUr-00000001br1-3tRj-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-l5rn.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hi Daniel,

On Fri, Jan 16, 2026 at 01:40:11PM +0200, Daniel Baluta wrote:
> On Thu, Jan 15, 2026 at 8:25 PM Francesco Valla <francesco@valla.it> wrote:
> >
> > According to the HW schematic, the CAN transceiver does not have an
> > enable pin but a silent one. Fix the GPIO property name and polarity.
> >
> > Fixes: b4bf5e55899e ("arm64: dts: freescale: Add FRDM-IMX91 basic support")
> 
> Just for clarification GPIO 23 is connected to a pin named CAN_STBY.
> So I wonder if it isn't
> better to use standby-gpios instead of silent-gpios?
> 
> I am looking at FRDM-IMX91 schematic file SPF-94610_A1.pdf.
> 
> But on the other hand we have
> 
> static const struct can_transceiver_data tja1051_drvdata = {
> »       .flags = CAN_TRANSCEIVER_SILENT_PRESENT | CAN_TRANSCEIVER_EN_PRESENT,
> };
> 
> So TJA1051 is not advertised as having a stdby flag.

Regardless of the name of the net, the functionality of a standby vs a
silent pin is very different. In this case, since the TJA1051 is
including a silent pin (pin S in he datasheet [0]), I think it's better
to declare it that way.

In case someone adds the support for a phy-oriented listen-only mode
(which is something I am thinking), this wouldn't break the integartion.

Regards,
Francesco

[0] https://www.nxp.com/docs/en/data-sheet/TJA1051.pdf

