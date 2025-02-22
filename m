Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE9A42AF04
	for <imx@lists.linux.dev>; Sat, 22 Feb 2025 09:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740215419; cv=none; b=MOsBA+J2rB3mTczOHaoxNHU/ur6SSqk5LNda1lVmwP5IGipAOb/5cJhymxLiBAGjZhFYueliCbGoUeIx3RZjqaMutu7SRHdVt1OKaf/HLA7xil5wQJn2yzuv35O3Q9ytrxLrcO8a0IzSTvVkcGsef1jnsXY0YeTJPMA+1XQ5cgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740215419; c=relaxed/simple;
	bh=IOzuINMkP8/jYoWkvyZGSyLnrz2QRHSYnZDmR7OufNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CTOuQhsTf38Y8g698w1SUg7oXN9gxpx+OnXzuBJQtEycnKbVbJcVztd5P/J8lNRhhW2Kev+UnAi7lwmMgTHgPRnB4GAhUkoSVDVxryq1IBKMzHqF41LQOFNpq/HKht27WHKMxaWTTxH8BupFowTDvBlbm1JboPUElR0HyWz+XQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=pG73TqlZ; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="pG73TqlZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=HNf3ovGngIu+2imVC6jh5NhzQqrcYgc31OJf+dXqycE=;
	b=pG73TqlZWjD/lpev2f0r2Oon0FE7bKhizo3EOL4E8vmZbeMhTHho9HhElLiGHz
	TLN93grFoPq2ishUfDPsJbanYld6c4rXGeuDbAvBg+CUIoOlYjd+6Va+djVNVZv7
	I1GzMFnot5SUWcTCEyD2MDbYhmWfhVxYSniRNJzOZcTbo=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgAXoo1TlLlnd1N6CQ--.21701S3;
	Sat, 22 Feb 2025 17:09:41 +0800 (CST)
Date: Sat, 22 Feb 2025 17:09:39 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: mba8mx: change sound card model name
Message-ID: <Z7mUU/Rgj3Gx7g9E@dragon>
References: <20250120132503.556547-1-alexander.stein@ew.tq-group.com>
 <20250120132503.556547-5-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120132503.556547-5-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:M88vCgAXoo1TlLlnd1N6CQ--.21701S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrurWxGF13uFW8Ar1UJFW7XFb_yoW3Xrg_AF
	Wftw1DJa1DZF4fur1Fkr4agrZa9ws7WF1DGr13Ww13X3WrKa1kGF4qq342yw1j9a4jg345
	Crn3t3yq93yjkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8pHq7UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRf7ZWe5dcBuMAAAs1

On Mon, Jan 20, 2025 at 02:25:02PM +0100, Alexander Stein wrote:
> From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> 
> The card name for ALSA is generated from the model name string and
> is limited to 16 characters. Use a shorter name to prevent cutting the
> name.
> 
> Since nearly all starter kit mainboards for i.MX based SoM by TQ-Systems
> use the same codec with the same routing on board it is a good idea to
> use the same mode name for the sound card. This allows sharing a default
> asound.conf in BSP over all the kits.
> 
> Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

I may have missed some prerequisite ones, but #4 and #5 do not apply for
me.

Shawn 

