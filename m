Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D482F6563
	for <imx@lists.linux.dev>; Tue, 11 Nov 2025 09:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762854450; cv=none; b=GG0oHqEPNSfVdOm9jHh0L/tzNjJa9g8bYXiWroqSh4X/S504yQwdcIFDly+1DyRskOrhfkTQNwY1aIrgxKYT/5lg4PJMRcK64l1KR99JKmHmKLCkZPZLflKPYgWwyirieqpTv5kXWtPXGWeRu5JeZbLVxHpJX0Rigbs56/eIy04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762854450; c=relaxed/simple;
	bh=ohd9pdrMVmles/05qOjVwCvl5qGyPbg0cYR2z6zquEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wusiw3YyfRRwEPZFxxZ2Gfws25N1yaGXjFIbz8ZEWqAiY0BV9UXzpr19TsPCC8Iwmb/9ZCxwKNFGCCadaSPrSOXogcOVeJN5CKV24uJisqPbFRNAnp6evGQ5u+QTIh6jASdJ0CVhO+oU7e5fLo79t9ZDr2BqgkaXGQ8U1w48D2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=ckeyb71l; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="ckeyb71l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=XXkLRI0g65UAMkaqYzjM8MbTk3dgR2IEiJk+nolN7Bg=;
	b=ckeyb71lGo1/OFEuPgVLJStCZXixLHM+k/OiY2qCmam22s5Ibto5T8vJmY9+uA
	mqwDfDtUWt4jPNk9QznDPQI1kFNRPYu2aqFQ7cywpCMeqKgm77825GZhDvxu8xFl
	ExtOiDMCJ7yt0zS/XHOrHDl7cC7lqoop7Y0uGiHIe4y2Q=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDnLZcKBhNpcL_DAQ--.5228S3;
	Tue, 11 Nov 2025 17:46:52 +0800 (CST)
Date: Tue, 11 Nov 2025 17:46:49 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Maarten Zanders <maarten@zanders.be>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW@karo-electronics.de>,
	stable@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: nxp: imx6ul: correct SAI3 interrupt line
Message-ID: <aRMGCbDMDkasXMlU@dragon>
References: <20251024142106.608225-1-maarten@zanders.be>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024142106.608225-1-maarten@zanders.be>
X-CM-TRANSID:M88vCgDnLZcKBhNpcL_DAQ--.5228S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUYJPEUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNgyjCWkTBgwY6gAA3S

On Fri, Oct 24, 2025 at 04:21:06PM +0200, Maarten Zanders wrote:
> The i.MX6UL reference manual lists two possible interrupt lines for
> SAI3 (56 and 57, offset +32). The current device tree entry uses
> the first one (24), which prevents IRQs from being handled properly.
> 
> Use the second interrupt line (25), which does allow interrupts
> to work as expected.
> 
> Fixes: 36e2edf6ac07 ("ARM: dts: imx6ul: add sai support")
> Signed-off-by: Maarten Zanders <maarten@zanders.be>
> Cc: stable@vger.kernel.org

Applied, thanks!

