Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9131F0984
	for <imx@lists.linux.dev>; Tue, 10 Jun 2025 10:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749550140; cv=none; b=XSwtzKpurWEobFLbi6x3Bnjl1udGQCoysPd2L4M9D5nY6nyCD5c+CDZ/A9+yCdhhOOmzLge53EaxGvDdT1wDwJAuTY4QyYV1L2D4x/c+vZpGo3vQrGb3M6IvfZszUrTTNf2RF+bzM6kMBO6Mstt+EI8VM4nFD7Ue0dK7B4eCB4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749550140; c=relaxed/simple;
	bh=tGoJmTc58ybApNOHcipkSD0gMe2QGzIVYxv982b8FxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fy86PguOKQ5bIvBhg+8BNkqCGNfliSjV0XgOqcvT8aq3is74fny8/m6r1C41vhRoalGQh0lPFtMUbOfXmGvFWpimdBi43vaX+rKEwo+p3MCZnU+lurQQ3csCHbmbcKryMRoP/Bfx9LDok0xRU6eAUzA3kH/fYy6LnL8GnTVeT10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=orhA1OCR; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="orhA1OCR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=TgKyCq0suARse86RWO6v52OcwDaIabQUncCNwXGdf7k=;
	b=orhA1OCR69h5nCVM63EeQylwCHOfbCK+3JKxQmRztw+SZQkhiSKHB/EsB1w1sw
	CDrdgCAlQI+ONYUQ73RYGJMXSmZPGPN7DXXR41Cc3p1pxaa/DdI3/FpEGkO/kw4U
	Nz11icyvNrVeXoYoD+egEO9QY0R1FNp8EQBaahR4vDZus=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgCXfxcXBEhol69VAA--.35126S3;
	Tue, 10 Jun 2025 18:08:25 +0800 (CST)
Date: Tue, 10 Jun 2025 18:08:23 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Xu Yang <xu.yang_2@nxp.com>, Peter Chen <peter.chen@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, imx@lists.linux.dev,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: i.MX kernel hangup caused by chipidea USB gadget driver
Message-ID: <aEgEF6YKYccequVw@dragon>
References: <aEZxmlHmjeWcXiF3@dragon>
 <c56pgxmfscg6tpqxjayu4mvxc2g5kgmfitpvp36lxulpq4jxmg@ces5l7ofab6s>
 <c7bfdfec-bc49-4ce5-8dd9-7a69d8e24ceb@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7bfdfec-bc49-4ce5-8dd9-7a69d8e24ceb@rowland.harvard.edu>
X-CM-TRANSID:M88vCgCXfxcXBEhol69VAA--.35126S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZrWkZryrXFWkZr4fKr15Jwb_yoW8Crykpa
	y3KF47Kan8XFWfurnFkr18JFWqy39YkrZrCryDXr47Cay3uw1fGF43KrW5KFyqkrn3Gwna
	vFy2q34kKF1DZ3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UQ2-5UUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEhRoZWhH6wl3OQAAsI

Hi Alan,

On Mon, Jun 09, 2025 at 09:54:45AM -0400, Alan Stern wrote:
> On Mon, Jun 09, 2025 at 07:53:22PM +0800, Xu Yang wrote:
> > Hi Shawn,
> > 
> > Thanks for your reports!
> > 
> > On Mon, Jun 09, 2025 at 01:31:06PM +0800, Shawn Guo wrote:
> > > Hi Xu, Peter,
> > > 
> > > I'm seeing a kernel hangup on imx8mm-evk board.  It happens when:
> > > 
> > >  - USB gadget is enabled as Ethernet
> > >  - There is data transfer over USB Ethernet
> > >  - Device is going in/out suspend
> 
> > During the scp process, the usb host won't put usb device to suspend state.
> > In current design, then the ether driver doesn't know the system has
> > suspended after echo mem. The root cause is that ether driver is still tring
> > to queue usb request after usb controller has suspended where usb clock is off,
> > then the system hang.
> > 
> > With the above changes, I think the ether driver will fail to eth_start_xmit() 
> > at an ealier stage, so the issue can't be triggered.
> > 
> > I think the ether driver needs call gether_suspend() accordingly, to do this,
> > the controller driver need explicitly call suspend() function when it's going
> > to be suspended. Could you check whether below patch fix the issue?
> 
> The situation is more complicated than this.
> 
> In general, a USB gadget cannot allow itself to be suspended while the 
> USB bus it is connected to remains active.  Not unless it can be set to 
> wake up when a USB packet arrives, and even that probably won't work 
> because the wakeup sequence would take too long and the USB transfer 
> would time out on the host.
> 
> The best way to fix this problem is for the gadget to disconnect itself 
> from the USB bus whenever it goes into suspend, and to reconnect when it 
> resumes.

Thank you so much for the insight!  It matches my testing pretty well.
The disconnect/reconnect gadget in udc suspend/resume is more reliable
than suspend/resume gadget.

Shawn

