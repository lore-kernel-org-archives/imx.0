Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE421C860B;
	Fri, 12 Dec 2025 13:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765546398; cv=none; b=KWKL7JFnN9waj0YWatmkWCLxJMxdXqB346MESC5wx94k5M95GwXS1k9CH1imDKcm07gblXcOSyg6BJbGOAsSEBARwZU7w+zlbUMe+Z1ZJoKKjltWANKHPGYpf6CDL2cK0YcdAIyG00AXANYuaElUbemzWhy/D4x7PdDA9jZVKfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765546398; c=relaxed/simple;
	bh=BEUmvl8d8kXh9t7wSCVSE4StPMCjB7sRRmM5ccq47uc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OWQB7IiQNVKbGC0yoE/iiT7tyg7psJSJ/KLZjj1W8lfPiCi5XpkYwWTyEqmtNW62E4AyvNjeURnR7i6u3XHu4WhZw1+u/TDojJ1i1Z4YsehTs1Jh0IBDvZPkHz+e19BhnoUGY6aRpRkB3A/C38X23cmpBaMSbGIKRyKyZ7LzdF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=4m6yDxHo; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="4m6yDxHo"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=YWjUVnv5CTcr+GDjfb0bwkJFd0vRqz5/wKl7xHkr6Es=; b=4m6yDxHoMU2gAPCnoz6Xchn4U8
	KHPhsZe/KvJls05qtq0Tfi6OJ+xBFeIG7OmYVQ5Srq0fKdB6+IzfbicCgVtZR7fHZb462uNM4ZzGg
	hpVA1B+8C/GHe8td/FPRqvsGy95sT+D8mqTRl5pdpzcOLEPS7wms4s6ku/jAIMFBj6HE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vU3GV-00Gksn-Fh; Fri, 12 Dec 2025 14:32:59 +0100
Date: Fri, 12 Dec 2025 14:32:59 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Joseph Guo (OSS)" <qijian.guo@oss.nxp.com>
Cc: Joseph Guo <qijian.guo@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Justin Jiang <justin.jiang@nxp.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Tom Zheng <haidong.zheng@nxp.com>,
	Steven Yang <steven.yang@nxp.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: freescale: Add FRDM-IMX91 basic
 support
Message-ID: <8334a902-fd56-4860-82c5-402e1d982fa9@lunn.ch>
References: <20251212-imx91_frdm-v2-0-4dd6d289e81d@nxp.com>
 <20251212-imx91_frdm-v2-2-4dd6d289e81d@nxp.com>
 <55fa5159-768c-4785-b0ba-5553193932ab@lunn.ch>
 <15608952-e974-4b9f-9832-e6a23860fc62@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15608952-e974-4b9f-9832-e6a23860fc62@oss.nxp.com>

On Fri, Dec 12, 2025 at 02:03:03PM +0800, Joseph Guo (OSS) wrote:
> 
> 
> On 12/12/2025 11:39 AM, Andrew Lunn wrote:
> > [You don't often get email from andrew@lunn.ch. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > > +&fec {
> > > +     phy-handle = <&ethphy2>;
> > > +     phy-mode = "rgmii-id";
> > > +     pinctrl-0 = <&pinctrl_fec>;
> > > +     pinctrl-1 = <&pinctrl_fec_sleep>;
> > > +     pinctrl-names = "default", "sleep";
> > > +     fsl,magic-packet;
> > 
> > Have you tested WoL?
> > 
> >          Andrew
> 
> Hi Andrew,
> 
> Yes, already tested.

Great. There is a tendency to just copy/paste this propriety without
understanding what it implies, so i just wanted to check...

For the Ethernet & PHY nodes only:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
