Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 428741974F4
	for <imx@lists.linux.dev>; Mon, 21 Oct 2024 10:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729504879; cv=none; b=oAG7DwoOYJiBUZf0PXMZEQbwm1ZQjQq/UypRwbOxGB+bvfeuVHQBR/pTK3xQpMTvDL7FqAU1x4bGvHGS6DsrLGbdaGaXT7j3JYuUUMvJlsbg3Vyq885/77gUdJFG/5xOnY408UiTAHTRx1UDhGYDRzgfTesCNxin/L/0Wcu83Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729504879; c=relaxed/simple;
	bh=ObGji+VpeiBlD8yG5csc2xrc883qj5jnMMm0K2kjqGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iSXe5WHqG7J/GdfLDsx+uy6XhSZiu7gKflXp12Y73gjJhKwY04L/XVqOMxwfeDGwkljkYJtsPC4GySXrv0be7YQMUsNxf4w3hQWVYFWoabgav4P1xgw2yxcXwuqqIx1Qwsgjm7K2pNBkWILmV8HnpfNLlO0PWCZOH/xUgqtiAp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=ji3H7+2q; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="ji3H7+2q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Nr0Qb4mi+ev48H2kOnl6cXqXokfjag9D5tJnRQARqQ0=;
	b=ji3H7+2qoa+IqT8HYhYzDy5dW4VKB+8y1Ku1zs3VwhynMHk/Zgf6tYLbS4mPZP
	6+o3+8UUh2T0C+F4JCky3tHPl0c/qHN/f07i/igp2mJvvNQSaAGcTthtUlM0GRpk
	40AIPmvoZFA4IjyCWOTTUjgFvJqNtS6efE1MgikPT0Bso=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgCH+_Q7JhZn2mWEAA--.4609S3;
	Mon, 21 Oct 2024 18:00:29 +0800 (CST)
Date: Mon, 21 Oct 2024 18:00:27 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, kernel@dh-electronics.com
Subject: Re: [PATCH] ARM: dts: imx6qdl-dhcom: Fix model typo for i.MX6 DHSOM
Message-ID: <ZxYmOzTYBv0CvooS@dragon>
References: <20241007135030.30559-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007135030.30559-1-marex@denx.de>
X-CM-TRANSID:M88vCgCH+_Q7JhZn2mWEAA--.4609S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUa89NUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBAl-ZWcV6t2pkwABsp

On Mon, Oct 07, 2024 at 03:49:58PM +0200, Marek Vasut wrote:
> Each DHSOM uses three digits in the Cnnn part, drop the trailing zero.
> This is a change in comment, no functional change.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

Applied, thanks!

