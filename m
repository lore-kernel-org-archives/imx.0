Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9AF41C2447
	for <imx@lists.linux.dev>; Thu, 17 Oct 2024 08:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729154679; cv=none; b=RpbN2Daw3i/eVCcm7pLmGZKpGJLOb4/YvqKi14QxrpTRmF2r4kQZN5grypcc1o05qyfaLhcWP8NlAfcf0DKwzDkWByi2dayVMBFdbzBeWkj+CH4cBRQrtRF5DKZVBGavIEbRQP82KEBid4jjCCCB3O71ALmW+DQ+rwFeyJrPCiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729154679; c=relaxed/simple;
	bh=PBz7kQKc3l9H1T0Y9A9p7V37KYmmj65awrZeqNTRkpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LtcYO2E61adq6PSZsVa2fgC/31kT9Cz+boqdc+H3w5HYZEGcU5yJNdNxxaP8vGhOjgQ8+ftFxe7FcesYIHOcRESUfPQvbVKpaVKT67q5rce8l1CWk6ldnJz34fs7s+KeauVvrtPqajWdsf4g4zniyDJRWuCPfrBJ9ExfNTfQQ78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=O2IeVqA6; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="O2IeVqA6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=f/CE3M9tZlrKOkYsnQZ8XeAHkJLrZZohMbO9naRhDKE=;
	b=O2IeVqA67qKl3mB3QSLg2pCgGT3gaZz9+PcaMgvEqLbh0hsqjhzKoO1ySeiJV0
	WJzVLVAHiB0DQXNS3gWePARkUOc9yR/++TvxB7nJ9np/ofRgPvRpCfwXAn9FXbNC
	bF0h3cyEP7oJ+JqRRTPy3jqKA5U3yGqvI7yhQNKtGRO74=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDXPh5HzhBnoC0wAA--.1292S3;
	Thu, 17 Oct 2024 16:43:53 +0800 (CST)
Date: Thu, 17 Oct 2024 16:43:51 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Liu Ying <victor.liu@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com
Subject: Re: [PATCH] arm64: dts: imx8mp-skov-revb-mi1010ait-1cp1: Assign
 "media_isp" clock rate
Message-ID: <ZxDOR9VL0u6OB+jX@dragon>
References: <20240924071218.3578402-1-victor.liu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924071218.3578402-1-victor.liu@nxp.com>
X-CM-TRANSID:Ms8vCgDXPh5HzhBnoC0wAA--.1292S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7XFykAr1rXF1UGFW8Ar1kKrg_yoWfCFg_ur
	y2y3WkGws8XFn5KrnxGryjya4xtrWUAFyUXr9Fgws5trykZ345ZF1Sv34Fgr1UtF9av3s8
	Was3Wayj9asxCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8qYLPUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiERB7ZWcQs3RUPwAAsE

On Tue, Sep 24, 2024 at 03:12:18PM +0800, Liu Ying wrote:
> Commit 2d39b78e5716 ("arm64: dts: imx8mp: Add DT nodes for the two ISPs")
> added a new phandle to the "assigned-clocks" property of media_blk_ctrl
> node just before the phandle for "video_pll1" clock in i.MX8MP SoC device
> tree so that "media_isp" clock rate is assigned to 500MHz by default.
> However, it missed updating this relevant board device tree where the
> relevant "assigned-clock-rates" property is changed to set a new rate
> for "video_pll1" clock.  This causes the "media_isp" clock rate being
> wrongly set to the "video_pll1" clock rate and the "video_pll1" clock
> rate being untouched.  Fix this by assigning "media_isp" clock rate
> explicitly to 500MHz in this board device tree.
> 
> Fixes: 2d39b78e5716 ("arm64: dts: imx8mp: Add DT nodes for the two ISPs")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Applied, thanks!

