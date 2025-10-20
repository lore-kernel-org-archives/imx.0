Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A87531B13D
	for <imx@lists.linux.dev>; Mon, 20 Oct 2025 12:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760963730; cv=none; b=LVrvmPwrzfbtgdLeTwhDvwvplXh8jinHG0TUP/86KY+IKihr/r/5RI0R1ItG0/ImcQLZKv6eFSrABDJnDhVbvv9VhuGWX1eYVHDOIiuREeo3olMaef1TQVwC//8m8BtUU1UGlFZQyJrC8oDfTC1zgfHcellKDxQvMkINJfwXFcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760963730; c=relaxed/simple;
	bh=UOwHOT9lCATSleonXEnf65atAJeJJqB71w5Lev4yfkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GKP9/dgkReAJeCL7gvuepvTcBSqsOUuvEDbx7ieNwdxC4md0Ea9887btJ1W5glh6geJsxn2v8PmULvGfIYutSdQfgAXHwyIGwmODtvUi1Rx6irGz654CsGGk3VnLrYoer6QQqwjHuSUBXRAjUmk5/QZIqKIY/V62pB3e7BArWWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=JVb1W5J7; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="JVb1W5J7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Cs0Sz4USsSfuwMxi4PfdiqTuZfj+bT5+l8lmaC7NVa0=;
	b=JVb1W5J73osHVHtj7ZFhwxZPBMxXh3JkPA85TUoQTEpywrzYv1zpboJ2iJyvZK
	pMFjS9G5U6ehjxL9jV4oDoE8tUAbcxZVBXv75ylpPw7K2YDzJIN5tnCk9tp1BDFu
	7OVmWhzNGlVVEe/2dZ95mEzuYQiNtNn+gvv+orwDYbsGY=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDHX6t5LPZobttTAA--.29784S3;
	Mon, 20 Oct 2025 20:35:07 +0800 (CST)
Date: Mon, 20 Oct 2025 20:35:05 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: freescale: debix-som-a-bmb-08: Enable HDMI
 output
Message-ID: <aPYseXEu6beqgxff@dragon>
References: <20250916144710.1285650-1-kieran.bingham@ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916144710.1285650-1-kieran.bingham@ideasonboard.com>
X-CM-TRANSID:Mc8vCgDHX6t5LPZobttTAA--.29784S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUc89NUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNhsBZmj2LHsiEgAA3z

On Tue, Sep 16, 2025 at 03:47:09PM +0100, Kieran Bingham wrote:
> Enable the HDMI output on the Debix SOM A board, using the HDMI encoder
> present in the i.MX8MP SoC.
> 
> Enable and configure all nodes required for the HDMI port usage.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Applied, thanks!

