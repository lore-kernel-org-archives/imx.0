Received: from mail-177132.yeah.net (mail-177132.yeah.net [123.58.177.132])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D1202CA9
	for <imx@lists.linux.dev>; Tue,  2 Apr 2024 02:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712026543; cv=none; b=r9z+B9xcYVfi9Qs9YDA2lJUSzNdqvOL113hH7e9al2b3jeVGN6HOgy3fnZx7ZFmERgYB9zhjwAV5s6TnWahRqFDO48JW+2itEB1n+i/1gPgNZKPZqAT2KuttHuyBy4OZn/c3qg/4LWlerGNLqTLq0aoUopOJ39KD51PCZ1WfiCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712026543; c=relaxed/simple;
	bh=2XxlTwkV2RXhvAN4lsefPHFdrwKpoUD9ZvP4It6xCrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YJsqJodNm9VK7RRcbE0wlDW7iIVAqiWdZ7v+UZag0gllWSSeEatBBaSoj/Cx8fbSSq9LlpdwUKVFr2z9XTiZAKPfuAEpodthyeTHBjSo/Lq+fadOxTecHQNpszG4Zpgew1V1WUwdvJ4FPpHj46J8o8z/ne8OSwARwyoaTJFd1rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=KQ2inAUl; arc=none smtp.client-ip=123.58.177.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="KQ2inAUl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=gWzTiP/4gt9taJuh7HtRu++n48u/+Sj2ewJjuoCFEPo=;
	b=KQ2inAUl8l+yj6skJIHA7KlAGpy4YZHgR1U4rcxurwNbV8w2ZMcL+M2g5M9EZ0
	7lXIh5kLLfH644lAUkdEj1zo/qjFrnQ0D5xuV5yBD1HYUhX+Ab+f/VoQ50kd9H7d
	c93BghKrMQuZzarmiAoURElTExo6aFJLfbDe0o6/ze/6M=
Received: from dragon (unknown [223.68.79.243])
	by smtp2 (Coremail) with SMTP id C1UQrADnThiFcwtmFtmiAg--.40474S3;
	Tue, 02 Apr 2024 10:55:03 +0800 (CST)
Date: Tue, 2 Apr 2024 10:55:01 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux@ew.tq-group.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: imx6qdl: mba6: Add missing vdd-supply for
 on-board USB hub
Message-ID: <ZgtzhYBEM5QJSela@dragon>
References: <20240314141736.2943858-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240314141736.2943858-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:C1UQrADnThiFcwtmFtmiAg--.40474S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxtxhDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiDge0ZVszYdRR2QAAsN

On Thu, Mar 14, 2024 at 03:17:35PM +0100, Alexander Stein wrote:
> This adds vdd-supply powering the USB hub.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied both, thanks!

