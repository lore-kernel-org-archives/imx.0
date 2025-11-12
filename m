Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D3133555E
	for <imx@lists.linux.dev>; Wed, 12 Nov 2025 12:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762952190; cv=none; b=P52oLTks1cA0z4Iyc/y7IlZlDw+cmn/jsn0WvyIRszzN9ZUtFs2ZAGR3Pm4zsnoS9Tq1bfnmnTyPQw0uJzE5ddT/MklQQILimSAobUTy8NEjMHgTxKBZiHmRJsuRjhrL7H6W/VUIFasxUUZUjfVP/eqivr6W3R1msCP9tl84kZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762952190; c=relaxed/simple;
	bh=rfZ47164vUAnuxaU/M/p7rQIXKJ9sbj0HOxvYJGXYEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FJt76dXIi5HpkFwpMNXVxj5M+0Gc2AL8KA44lSEjLapL1OSVny1Xp36F/xZOE9oFCPP/7tcozee2FzoEQCDoY1v4tPp1botArLM9012eGshO3/mYltdVLlQQyzxr2C/0SZYYMViKu8QwHxzFfupqEcjo/i9DF5BAcQQA8/CI7GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=TIiOslFf; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="TIiOslFf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ovOaO7o5EVy31SCddS4vIZxUwqi/JxafOZ5Xize7kHY=; b=TIiOslFfi3mXLkrInndtcQ3PTG
	e7R9cAW4DEmjWFydFzK+Z5XsyNBvuoAF7Ifu16xV8MgUwZerp7Zvpr3iQE5Ikm4Jpigrh8PcP2/8R
	YaNVfbJDPyPCu/J6pAqK4O9qJk/+4oNyIWri3FIXrcGzYbf1flhbyfxChW4POjc03dX0jJSlkGiKp
	yEbuScVgfoVReSWjTtoMa88gutdmKCoEvOjHB8NLc3Xd0gWqPz+WexiKxziYtX8zpRaR5hf6tH9nq
	jzUVzlcnLlAknBhe70ApwVbBJ9lCdM5C5xL+RZqqOVVJG8J/wGNytjd6ejm2csW2OSG/8fl5VrqiH
	zvCTS/8g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35520)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vJAOe-000000003vM-1L2V;
	Wed, 12 Nov 2025 12:56:24 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vJAOc-000000003th-1Abs;
	Wed, 12 Nov 2025 12:56:22 +0000
Date: Wed, 12 Nov 2025 12:56:22 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, Andrew Lunn <andrew@lunn.ch>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Disable EEE for 1000T
Message-ID: <aRSD9n_F4aRXAdf3@shell.armlinux.org.uk>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
 <e87ff7f2-d16f-41f2-b781-b175cfb84b21@lunn.ch>
 <aP83bMDWCre7-Sjw@pengutronix.de>
 <aRR-6Nl3ELB2v8gV@shell.armlinux.org.uk>
 <176295131007.567526.3395425614344577792@ping.linuxembedded.co.uk>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176295131007.567526.3395425614344577792@ping.linuxembedded.co.uk>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Wed, Nov 12, 2025 at 12:41:50PM +0000, Kieran Bingham wrote:
> Perhaps further complicating matters.
> 
> I have a Debix Model A as well ... I'm in a different office to Laurent
> - and I believe EEE is enabled on my board/network switch.
> 
> I do not get an interrupt storm.
> 
> I'm not sure how this helps yet, - I don't know what to debug as I can't
> reproduce the issue!
> 
> I can provide remote access to the board with ssh if that helps anyone
> who wants to look at something specific about my setup or run anything
> if anyone has ideas of what to check my side.
> 
> Perhaps we can find some subtle difference between a working case and a
> non-working case...

Thanks, that's interesting. I guess the next steps would be to try and
work out what's different between your two setups.

- same board revision?
- same firmware/ATF?
- same kernel/modules?
- same type of link partner? (I suspect, given the cpu-pd-wait
   interaction, isn't the problem.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
