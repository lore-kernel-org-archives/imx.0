Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B72F2D97B8
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 06:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761545219; cv=none; b=qLX3IUyAY8z5JZ885l4y+4cHkaHA9OInZOQSMWR+nZlCGYgP97szUVZfi72QPSMPp3qkHHeHKq/mLkdrn1Hps6ealHroW1hLdC3etmjneZA9i1iTfqoZVyiYY4/Z//8xtLyiIoHNJgpBQF7x8TBrnu/QHhYg/LB1zRLVyYgmyag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761545219; c=relaxed/simple;
	bh=avkOs55f7P9lPmiFz2OLaiSF7OlFmzbNHKp1T2Jv8LA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dsB2SRjFwrKpgRgku6u1hPX7Nd83dwYAgOj9hdsYS/HtkBqQDYXGPnd5Hns2GXSxlXRgCDJrfkQTvFWlKh7Jvqp+G7Ufdtd8ToLI+rVG+w65nr3imZh/qeCHBUw3yLnPdd8by3Cb4kdBfj2VSElhPkM4tjBXFeLLHedvZM75epw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=NUu4nwSv; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="NUu4nwSv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=SSnBpXFr6UaDyoCUOpqPlNQbbbgbwumFKZey7Ajea30=;
	b=NUu4nwSvx0K7ohAoRZemwdB0PwhVz2iSweBvNEbGOCpbKNqgmn+DKtm19AQwAQ
	do3KElpdwMi6IITro1AMmKKQG7d1B85lmvJ0/u005vFc1gtzJHDtWWcU+NEbcm6f
	EEnQ+eK5nzeZgk0DpYKmfFewg+U+AfQY9A0negkNE3vHY=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with UTF8SMTPSA id Mc8vCgCnr3jcC_9o9QE_AA--.49326S3;
	Mon, 27 Oct 2025 14:06:23 +0800 (CST)
Date: Mon, 27 Oct 2025 14:06:20 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Jonas Rebmann <jre@pengutronix.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@oss.nxp.com>, David Jander <david@protonic.nl>,
	Lucas Stach <l.stach@pengutronix.de>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v4 0/2] Mainline Protonic PRT8ML board
Message-ID: <aP8L3JkMGzHsVPId@dragon>
References: <20251014-imx8mp-prt8ml-v4-0-88fed69b1af2@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014-imx8mp-prt8ml-v4-0-88fed69b1af2@pengutronix.de>
X-CM-TRANSID:Mc8vCgCnr3jcC_9o9QE_AA--.49326S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU8hL0UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNh8UeWj-C98t-AAA3W

On Tue, Oct 14, 2025 at 03:09:30PM +0200, Jonas Rebmann wrote:
> Jonas Rebmann (2):
>       dt-bindings: arm: fsl: Add Protonic PRT8ML
>       arm64: dts: add Protonic PRT8ML board

Applied both, thanks!

