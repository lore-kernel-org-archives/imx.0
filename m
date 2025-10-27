Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F188D19E83C
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 06:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761547933; cv=none; b=GEmRTmrREYEYVqv2AhVwRa31MwmHnwVUkt8pcd+/34pcxtWiQBmrSc2qd3oHRxmxT7y+kXxnG8XAGWOwdyTgGNCz+1jOeEo/H3wshNJ65rvUtnvqpgZ4hs4wQvDWSPTrNOAGC2oPu1A0rO9FL+ww26+TXm5uaav4tLPjqV999bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761547933; c=relaxed/simple;
	bh=oQzfTMH8EPrSL5lmVDEo17eXy5vWAdI6J5k/d1OKqIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GrU4bUi6cMbXRpjMT7/M7OtA87Nw5sqfY1ic9w27mO5xjHvTp8+NDtuPNXaLwleCUWKI6fu2UlMpw3SGcn8byLMpBBTeVK626xw/GFArDsTj7h/vuaSlkkXqE45w6Vq8gYdIwaCH2KUrhOtzQp4SFKcPowLLCidz1wxENzkRqMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=FuZNrB+v; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="FuZNrB+v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ids8GPq+OLZj5NndZN4Sa1BRCsRNAOOVIKZvWbSwRnE=;
	b=FuZNrB+v1YGsv3THEF0JzL2Wip2LNaJSyktXoboKSsC5ArZ3a7g2RHR0U4ZsA/
	R0yDUowupNkbGvZULMhVyzPWd7icumn+DBL8P/jvVQL1bCR0qALsl7FcK90phtvl
	KsKtTHRQm93FyiT40IfY5hPAC6rAH66EMpTB6PusDa5Bc=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with UTF8SMTPSA id Mc8vCgD3v7uFFv9ok6E_AA--.51017S3;
	Mon, 27 Oct 2025 14:51:51 +0800 (CST)
Date: Mon, 27 Oct 2025 14:51:49 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Yannic Moog <y.moog@phytec.de>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de,
	Teresa Remmet <t.remmet@phytec.de>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v6 0/4] Add display overlays for imx8mp-phyboard-pollux
Message-ID: <aP8Whdcda7_qGknI@dragon>
References: <20251020-imx8mp-pollux-display-overlays-v6-0-c65ceac56c53@phytec.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020-imx8mp-pollux-display-overlays-v6-0-c65ceac56c53@phytec.de>
X-CM-TRANSID:Mc8vCgD3v7uFFv9ok6E_AA--.51017S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUzOzVUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIQfAJmj-FoeF3AAA3f

On Mon, Oct 20, 2025 at 02:49:23PM +0200, Yannic Moog wrote:
> Yannic Moog (4):
>       arm64: dts: im8mp-phy{board,core}: update license
>       arm64: dts: imx8mp pollux: add display overlays
>       arm64: dts: imx8mp pollux: add expansion board overlay
>       arm64: dts: imx8mp pollux: add displays for expansion board

Applied all, thanks!

