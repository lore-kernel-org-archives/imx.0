Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7211D5178
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 01:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761528242; cv=none; b=KOQFz66PT/L5/5pN9KKVmTbK/0l0hc8UYDm7uebV+uD9zPonOYzsii7X6Lc3xflH8Q5QSmfRG9MuKGYPGXxBzl4xKBBGXaEfZKA0pTUZdriptEGhiJec+dIvMPHv4O1vT//Bp7I6HSQc4gtfaeDgWZho3KnDQUzaD1x8xD0O0S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761528242; c=relaxed/simple;
	bh=iD6wDA1kjWeq1mSqPYS3sY7kJa4VtYJr5ov3jg6f4Lw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mFgrhBE2ShA2nN3YysKmt/pFnaNEX9SD+ZlvAgdSUKOJBoiVaQb06WeBWyt2AGTZDeGgXoXo7AvwiIxS4UfghZZoBRRHb+0u7whVf1hGFeeKGgClQ10WrbZc9iGXRWjGELsJXkC3ao5rBiF8nNcy+vatd1Vm3F1DkEo3vDkcMp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=P++ptj8T; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="P++ptj8T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=PecZQr+AQLxYrOsqOJNp571UHlMkTg8jRCR5hHLYE/Q=;
	b=P++ptj8TzTHPih6xPQd3EARciOjKFvOPvZXOGZx0fJ9pujqx0vo4bSRh5YJnkW
	4qekwD1t1Pw+RmWvCpphTNPacfVki5UfCt/6fyEs5OXdrJrC8inv/j4DXZQgmOsu
	K8MLr2jOkflkwPO4kf9NCDmIcbEHSviQ9kgAV51h5v1Bc=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with UTF8SMTPSA id Mc8vCgD3X7uMyf5o7zE7AA--.41338S3;
	Mon, 27 Oct 2025 09:23:26 +0800 (CST)
Date: Mon, 27 Oct 2025 09:23:24 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: alexandre.belloni@bootlin.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: imx6q-evi: fix rtc compatible
Message-ID: <aP7JjJCYl119rANZ@dragon>
References: <20251005215146.3804629-1-alexandre.belloni@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251005215146.3804629-1-alexandre.belloni@bootlin.com>
X-CM-TRANSID:Mc8vCgD3X7uMyf5o7zE7AA--.41338S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUYHq2DUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIA5v1Gj+yY5LJwAA3o

On Sun, Oct 05, 2025 at 11:51:45PM +0200, alexandre.belloni@bootlin.com wrote:
> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> 
> The correct compatible is nxp,pcf2123
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Applied, thanks!

