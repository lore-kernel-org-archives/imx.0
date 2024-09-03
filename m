Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42E131CDA2C
	for <imx@lists.linux.dev>; Tue,  3 Sep 2024 06:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725346049; cv=none; b=aNTzzHlN2gYWu0cbUitFftSdC9MCXT0S36N3y3xLZFaLDsh9UOBPdKbi7xoL3KhGVjxahFzVV7VHdMQgmqJSszQuOzLInjOSVSFAejl8e6u80XgYMsf+7V/BG/FlEYFZ/tQOwdxiliRwzxdQIbY4CHujyz9ov4mM4774YRqSbGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725346049; c=relaxed/simple;
	bh=MNpxCUNof5M5OF+r/1sAHGfjON6O/npSbVwGOoIMr/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R0zb8fJJrhgfMuUIup+p6H3wn+6z3PSbC94RBd6gFmw68jkRkMiV64adwbLVPDbz7lLIE06p12X8veegcwPn4F+m/PK4SCVHpEAx3EsQvQ8Vx1+L+tflGtvQoSgrU6Cz8aXUinhtPDVrTwAMRio++O4J6IrgoK0ckg7DhHafqXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=izGazYsV; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="izGazYsV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=fid2FlpZKhUlL5gBAJoutriQF8ObGTeMG+l1QLgPOnM=;
	b=izGazYsV236soT6tSbCC12ScfhAbGaxIbhthJ76jVdOPkw2WMZAmi1cMO+8tqx
	Ru55Z0kWkGnP0Ra1XKc0bqM8RZ8KP3Qon4Z6mUc6adCOOGHY9SOGniwLdMHbW3WE
	pQrD2OoWknL+s4/a1Phv+fPpYenvg4/Zf6P7wBxYK3qUY=
Received: from dragon (unknown [114.216.210.89])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDnTzzfsNZm+0pcAA--.50682S3;
	Tue, 03 Sep 2024 14:46:57 +0800 (CST)
Date: Tue, 3 Sep 2024 14:46:55 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: shawnguo@kernel.org, krzk+dt@kernel.org, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] arm64: dts: imx8mm-emtop-baseboard: Add Peripherals
 Support
Message-ID: <Ztaw3xDa6yY1tWu1@dragon>
References: <20240902054456.5828-1-tarang.raval@siliconsignals.io>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902054456.5828-1-tarang.raval@siliconsignals.io>
X-CM-TRANSID:Ms8vCgDnTzzfsNZm+0pcAA--.50682S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUIxpnUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiERBPZWbWfDOlLwAAse

On Mon, Sep 02, 2024 at 11:14:55AM +0530, Tarang Raval wrote:
> Add following peripherals support for the Emtop i.MX8M Mini Baseboard
> 
>         * Wi-Fi
>         * Audio
>         * SD card
>         * RTC
>         * CAN bus
>         * USB OTG
> 
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>

I'm getting this:

  arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dts:111.20-120.11: ERROR (phandle_references): /soc@0/bus@30800000/spba-bus@30800000/spi@30830000/can@0: Reference to non-existent node or label "pinctrl_canbus"

Shawn

