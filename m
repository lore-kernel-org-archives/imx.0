Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2513A934
	for <imx@lists.linux.dev>; Sun,  4 Aug 2024 15:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722783890; cv=none; b=Ub6Kfgt0KSW38uxkwJdeqOU0+6vq20qlfgJ9IPvvuB+x5dpx2aIpfkmlCkWADRo6aT5FWE6M/tK/HBRKBKCji+TwVse6/pCaeDnDu4a4m4T0hAiDkCyjzgVseMjdHGgrlFJhXfjp+QFqXH/cYuS4WPTPWMoMzZNRWdxoQTq4AaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722783890; c=relaxed/simple;
	bh=y5K9mTP8UV8PmFAeBNTKn233/lmqrtPpN3ICIpYlWT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oaSYROpcwgC8/xt2OAgN9LR0spdsQoDebAVfkzRAxuDxt4iz5SWZzoFfei9FNql4+epcGzWL4cMtoMCeBGQwjlcIFauxCd5DuEud48MaWeSIWvS2GzZbvQS8mRYp465apZ7r6eS8U20OTgMNYDRA7RVEwMQpD2TR41fPZDOcvOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=T7pWDpvI; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="T7pWDpvI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=fnQ4h9iQX+Dg94vJyXQLUX6l7PO9keScEuNzhdy3Gq4=;
	b=T7pWDpvI/b2HDfNeSRy1pmkYcz2Wrs5g1BkYHP2+US01LelYPXEKOZaiM84KE7
	HjM2/HjnfUrj/4XvjUcQFOFJNGO8zi8a9srzKeWZDXIJPBvcTTdmp+xNY2zD+HML
	i8tRA0Bg/BuS1650IrFUiLTKkL5NuoO9XFprLObex3zP4=
Received: from dragon (unknown [117.62.10.86])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3Pwe1la9m0fGDAQ--.41982S3;
	Sun, 04 Aug 2024 22:52:39 +0800 (CST)
Date: Sun, 4 Aug 2024 22:52:37 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V2] arm64: dts: imx95: add p2a reply channel
Message-ID: <Zq+VtTD1cbZE07Sb@dragon>
References: <20240628020921.1108888-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628020921.1108888-1-peng.fan@oss.nxp.com>
X-CM-TRANSID:M88vCgD3Pwe1la9m0fGDAQ--.41982S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxtxhDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCR0xZWavYHlo-wAAsH

On Fri, Jun 28, 2024 at 10:09:21AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> For Platform to Agent(p2a) notification, i.MX95 System Manager(SM)
> firmware requires a reply communication. So add mailbox channel for
> p2a reply communication.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Applied, thanks!

