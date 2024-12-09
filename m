Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ADBB12CDAE
	for <imx@lists.linux.dev>; Mon,  9 Dec 2024 08:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733733440; cv=none; b=Abcxeif2C+WawAW5XlBJ7Um+lCsKIU22+0DEtoeRkN5zhOfeUB2yplh4V3SwuZFu8s9rLaXarvpJIJH9LMI4BRi20DAQAU+UrknpIDeMEGoJqbHOwSUtk+95bsy+pc2g0c8YLHiBAxnkR2cZcyusRWbXmQpfJL5RczhB2FLWQuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733733440; c=relaxed/simple;
	bh=/+n6QG8R6D9zIR2ROqIAJS9brJs7afCml+rj4Z7FRfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ur03C0Md9oXPFj9N8629m4fDsPmwleICL+dcQFM1ldipZg2+ieKq66y/zWXUhkmRTGCSzsOSdjkAmD3uBYzVW+q0qcYVmmfqllr18ERWYBjzoP2nnQ259XRb1bMuYm0VNlfevkcdc5nyN5ZfDbRMQvI3tE9xvXmfKD97AYtQiHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=OlebIETz; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="OlebIETz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=YnPHthB8LMV885tm2rzcxoiQ16KBEntsl0UFvMdQ5Uc=;
	b=OlebIETzWJZPMwMwiY14oww5JJuepQGVeAXTeZimR0bjfe/+F1B8hp9/9/rTyx
	bz5boksMDTAqM7oVRfo6Q73ckNGHckIUSxiDXeuatyOUBgrhQJCUBq7irb3tvgPd
	xbHl/ZrVlRlW97C+ZSz541pTExVPaTvo2BYTQDeGTh5f4=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3boEqrFZnOi+NBA--.47304S3;
	Mon, 09 Dec 2024 16:36:59 +0800 (CST)
Date: Mon, 9 Dec 2024 16:36:57 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Heiko Schocher <hs@denx.de>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/3] arm64: dts: imx8mp: add aristainetos3 board
 support
Message-ID: <Z1asKaRAJKTBv8ui@dragon>
References: <20241105064206.43626-1-hs@denx.de>
 <20241105064206.43626-4-hs@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105064206.43626-4-hs@denx.de>
X-CM-TRANSID:Ms8vCgD3boEqrFZnOi+NBA--.47304S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUsmFCUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRywZWdWeNriYAAAsR

On Tue, Nov 05, 2024 at 07:42:06AM +0100, Heiko Schocher wrote:
> Add support for the i.MX8MP based aristainetos3 boards from ABB.
> 
> The board uses a ABB specific SoM from ADLink, based on NXP
> i.MX8MP SoC. The SoM is used on 3 different carrier boards,
> with small differences.
> 
> Signed-off-by: Heiko Schocher <hs@denx.de>

Applied, thanks!

