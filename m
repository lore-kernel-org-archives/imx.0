Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 596141F94A
	for <imx@lists.linux.dev>; Sat,  2 Nov 2024 07:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730531290; cv=none; b=BYS6afD32K/6x1bPweb9M/STes5aBxSywzjBKXChmMzHci61RISJHs1JIgp3Ql2/c2iaFD8TeWi5ry6WRG4QJpz+bTSULUQwbB7Nu4ExWCMmJopxGhO7FQu2aC3ne5fQXPA/2OyXsarGR8quVtOUjqNt1F7HKqALuD+Zaik1m9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730531290; c=relaxed/simple;
	bh=HyMk/j65phlFliQ4KdfkM5Tx49kM9Fw3F3jacl8vCEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SVTTFVSut/5ssgfIgkGob3Tov2qp8wDMrtqX760fdBab9uiO7hGj8LYzMFjFigCOfUmrZJne9eX1CuqyIpWV29Px1Vv4l8qGBruDYxqdDGYXrojGPXvhy1S+u/JlocDPVjhyMXG7sq7i4qhh3baR0y9BV4lr2Un4syjZq0zlxzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=NVy63dFm; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="NVy63dFm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=SSPQBPU9VpGhI17i4emlrIw4t8MerKFEhaezHfQMv1o=;
	b=NVy63dFm47y4WN43OQDZk59kI1f5y4gxJX5UFAvTD5wB2zbAD5gIqHIveGd6uv
	sSpVWkI3GYQxOH2iNQiWRF+3rRR5dtrO45Cdbkmmg9qixIvrKYG98kDe/7rAgaeR
	eei8OZnLyqk2Bkta8J0lX34Cw/D3LrDml3quSXo0RDAs8=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgCXl526zyVnPL1+AQ--.14928S3;
	Sat, 02 Nov 2024 15:07:40 +0800 (CST)
Date: Sat, 2 Nov 2024 15:07:38 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2 resend] arm64: dts: imx95: Add missing vendor string
 to SCMI property
Message-ID: <ZyXPugjIFe9FOpKO@dragon>
References: <20241030095555.222143-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030095555.222143-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:Ms8vCgCXl526zyVnPL1+AQ--.14928S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVg10UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCw2LZWclsr877QAAsx

On Wed, Oct 30, 2024 at 10:55:51AM +0100, Alexander Stein wrote:
> With commit 7bf46ec090b9e ("dt-bindings: firmware: arm,scmi: Add missing
> vendor string") this property has 'arm' vendor prefix. Fix the property
> name accordingly.
> 
> Fixes: 61ed94cd54e3 ("arm64: dts: imx95: set max-rx-timeout-ms")
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied, thanks!

