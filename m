Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E203332EBA
	for <imx@lists.linux.dev>; Wed, 12 Nov 2025 12:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762950894; cv=none; b=ZtIPw688nQ5hXwV91SqrpBE4TNsCrV2CDDyWcqIQldFG/hbbhUZluTqI6Saia890pKMPuz/bpAFsUTlK8fuF9vKDZ5vIczxZlB8Ppv7JsRqf1p/3d/q1dFcZGCYntRu45HyZ3vRPwhM0OX/WdaaPeL6hM6z9YpPSaDvAa8C/drw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762950894; c=relaxed/simple;
	bh=BhzOm9cbY+gcSwwlrOjCY7xiSouWtpklcMkHzwISypk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hNxqRJu0RO9p0rHj5Kaerhojy0c+9plY9/3cj1qZQpD0iMNI30x3U8R/8BVOcuYZoUruT/kFRGZ16Vfxjs/Csx8IP3mzyQByKX4XzVpyrnyCEEd+c2pLD6sTYJap5xSXxl7aY7KG6c7c9/aajcgiA7Dt0QuzipNQAZC8WFg+mD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=JuSd8Dtr; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="JuSd8Dtr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lU6jZkeZpiccZijv3aker05TIimOBqJ5loP8s0voplg=; b=JuSd8DtrtxZHo+q7x6jNuqyhbo
	Eo9hGjnc+ZerLKyTFmDMb1hhueSDKbxjz7l8sUMngWorzKWh5b0ywy22T2UlWRO7KNNKHwNqGCSyX
	2qKfp96th4vtX+Os7B5Sbl2d0LTwy3YkweYyLvoQr/9SR+VwBZWiEfOf7n4WSxt8y3pFML7u9G/jV
	oYFIPpHltz+Bt/THIZytvxIYGwJ3r716lchKojdF/G+IVxGc8ldr5V7Rqjm2LaCJ0gbvdksypXYVF
	q7Ey1X1TEmEwJnVt6ca+4M5kE6PbzF+7Z9M8lLXjEyaXYMjwix7GbvkfNkvG0XjCmxisjALerzWdR
	iXlJV5mQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43608)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vJA3l-000000003t5-3LII;
	Wed, 12 Nov 2025 12:34:49 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vJA3k-000000003sa-1FY7;
	Wed, 12 Nov 2025 12:34:48 +0000
Date: Wed, 12 Nov 2025 12:34:48 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Disable EEE for 1000T
Message-ID: <aRR-6Nl3ELB2v8gV@shell.armlinux.org.uk>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
 <e87ff7f2-d16f-41f2-b781-b175cfb84b21@lunn.ch>
 <aP83bMDWCre7-Sjw@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aP83bMDWCre7-Sjw@pengutronix.de>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, Oct 27, 2025 at 10:12:12AM +0100, Oleksij Rempel wrote:
> Please note, RTL8211E PHY do use undocumented SmartEEE mode by default.

Same as RTL8211F I believe (as used on the Jetson Xavier NX platform I
have.) I submitted commit bfc17c165835 ("net: phy: realtek: disable
PHY-mode EEE") to get EEE working on this platform.

> It ignores RGMII LPI opcodes and doing own thing. It can be confirmed by
> monitoring RGMII TX and MDI lines with oscilloscope and changing
> tx-timer configurations. I also confirmed this information from other
> source. To disable SmartEEE and use plain MAC based mode, NDA documentation
> is needed.

What I saw there was similar to what you describe (although I have no
way to monitor these signals.) No interrupt storms, but while the
stmmac TX path would enter LPI mode (whether that provoked anything
in the PHY, I do not know), the RX path never entered LPI mode because
the PHY never forwarded that status.

So, I don't think having SmartEEE enabled on the RTL8211E would cause
this interrupt storm that Laurent is reporting.

In Emanuele's case, things are different. The TI PHY reports that EEE
is supported, implements the autoneg registers for EEE, but *doesn't*
implement the necessary hardware for detecting/entering/exiting LPI
mode. So, if EEE is negotiated, the remote end thinks it can enter
LPI mode... which likely causes the link to drop as the TI PHY can't
cope with that, and I suspect that's the cause of Emanuele's problem.

I'm wondering why "arm64: dts: imx8mp: add cpuidle state "cpu-pd-wait""
impacts this - could it be that entering the idle state does more than
just affecting the CPU domain, but interferes with the EQOS domain in
some way. Given that the entry/exit to this state is all buried in
PSCI stuff, without digging through the ATF implementation for this
platform and then cross-referencing the iMX8M documentation, I don't
know what effect this has on the system. Is it possible that PSCI is
messing with the EQOS?

What about the clock tree? Is it possible that the stmmac and/or RGMII
clocks could be lost when cpu-pd-wait state is entered on all CPUs?

Has anyone checked whether there's anything in the errata
documentation?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
