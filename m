Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 958FF2AE8D
	for <imx@lists.linux.dev>; Mon, 30 Dec 2024 04:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735533086; cv=none; b=IKb+FyMt0kdao8r+x+7dbWUK6CqU7hC9oLzDVvuwILkkuTM5HvckbqCPOBFepkCVCAN4QrTY/FLQLQPwH/QBgonL0aaCEA8hdjHiPARCjpGU/qwOXhtG/IbSSABdXp+IQB0TvUIOFA31wZA3S2IXNjnevyhlSs8ZvSgPqTw+njw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735533086; c=relaxed/simple;
	bh=OgxOz7T/85Rn8Xv1Ep1lp4z8z6lkr2utNhxKxz8/4t0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c1t5k2uWc1bSh3CVYt79rF8hb5Hb/vYtR6FsKKQWfMpblxvYrVV+Zyi2aYbsLd0SEUQmFo9UkYmcWZOlTIOVeQwcSPm+KHwlfp5P1cRJrg4Ri7EQzG/EHL9ws6fK4L9eMnnvBAJtMgmVT8LIGkEy4Evf+h4tPtZ+wvD+1rJ9y0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=RjAJ31d7; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="RjAJ31d7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=VbAGOV1h5XzJc+x6qKEPvwu+pAupe3fETtmFrAGVrxA=;
	b=RjAJ31d78vZcDdlRrRgjQf+2wiTSfxVUxoUic1o4ISibgs3x9si75KTsJDrpsn
	Wnn3aKWpFDJfVbPUlzfs/Dzoq2qTEc4eQkis5XXMo6jquTXuOSNm2mNeFlS4WwiL
	nuOYY7BsXIRq6aPQY5WcWTBnxGGn8ldUhtM9nenFJg9pk=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgBnjrn2IXJn8c4DBg--.60875S3;
	Mon, 30 Dec 2024 12:30:48 +0800 (CST)
Date: Mon, 30 Dec 2024 12:30:45 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dt: imx93-tqma9352-mba93xxca: enable Open
 Drain for MDIO
Message-ID: <Z3Ih9eG7TqKGonkx@dragon>
References: <20241205150730.3132807-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205150730.3132807-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:Mc8vCgBnjrn2IXJn8c4DBg--.60875S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUsmFCUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEQ-FZWdyDppGaQABsR

On Thu, Dec 05, 2024 at 04:07:28PM +0100, Alexander Stein wrote:
> From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> 
> The board has a pull-up resistor for MDIO pin per PHY design guide.
> When MDIO is idle, it needs to be high and open drain is better
> to be used here for power saving.
> 
> Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied both, with s/dt/dts in subject.

