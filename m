Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9F8339855
	for <imx@lists.linux.dev>; Wed, 10 Jul 2024 03:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720580731; cv=none; b=mmEPBjsiere9lIVbufrd7T7y0y3ZniiGP2ZLYG4l6rzA+D4ijtKDyeS56jIhkjrZS1wZ88xUu00j9v1AnzJ4n71CguwJpi2PnMKD6D2p/IbFdDogDdDqLhRiFI+W1n0LD26HUbxgp5aYIVK6ePDZkvh6sZXmKqN8eKSAvCMdaMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720580731; c=relaxed/simple;
	bh=l8LJAJq08pKGlE1L8R3GSOleowdOxUxZdSPKfF1OLT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CllUTniBn8OFGjnKlEuvn1kX5gruGq9wxmXqimC0stIeLf7Tjk2UQK7TtBe7iJi62Zjkb+uQdRjs2fGQSQaxKnwnV7K2EWglFbbyaAsQDLSmOpXSJzWhKrxpobifODEdvXOp0OfRaEUHkZVSwyD3tyYGqVCwGgpdhl/1HxNOqMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=ON5AZv9S; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="ON5AZv9S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=yoKbyY6y+PwSn7kYNR3CBuTfC9HA2wCHppFjzdbEQDA=;
	b=ON5AZv9S6iUJKe3Uf1rY+dzCf/3t/rPI0y2Bhfr8iGC0IzaWZyd4QBnW5rHQhY
	alLz2UQsR1ZYo2pnqyroo44CjjJPPbOC6eEv/FnVfYxvflYZRHFEBcb0u85eWoiv
	9ZCwpjKwtrogQ7OCxGi9z703PcRBgQWaZ1+GG4ANNIS6w=
Received: from dragon (unknown [117.62.10.72])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgB3P5EZ841m4sSEAA--.26945S3;
	Wed, 10 Jul 2024 10:34:03 +0800 (CST)
Date: Wed, 10 Jul 2024 10:34:01 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Arnd Bergmann <arnd@arndb.de>
Cc: soc@kernel.org, arm <arm@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL v2 5/5] i.MX defconfig change for 6.11
Message-ID: <Zo3zGRiDFqduQwLo@dragon>
References: <20240709012534.3106441-1-shawnguo2@yeah.net>
 <3d480ce9-863a-4d2b-ab31-294207a0a924@app.fastmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d480ce9-863a-4d2b-ab31-294207a0a924@app.fastmail.com>
X-CM-TRANSID:Ms8vCgB3P5EZ841m4sSEAA--.26945S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUcX_-DUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCxsYZWZv-fr-xAAAsY

On Tue, Jul 09, 2024 at 04:05:29PM +0200, Arnd Bergmann wrote:
> On Tue, Jul 9, 2024, at 03:25, Shawn Guo wrote:
> > ----------------------------------------------------------------
> > i.MX defconfig change for 6.11:
> >
> > - Enable a few drivers needed by TQMa7x/MBa7x and i.MX53 QSB/QSRB in
> >   imx_v6_v7_defconfig
> > - Enable IWLWIFI driver support in arm64 defconfig
> 
> Hi Shawn,
> 
> I have queued all five pull requests now. I think patchwork
> got confused by the v2, so you did not get an automated email
> for them.

Great!  Thank you, Arnd!

Shawn

