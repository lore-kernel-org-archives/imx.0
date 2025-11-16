Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0BD2D73A5
	for <imx@lists.linux.dev>; Sun, 16 Nov 2025 13:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763298653; cv=none; b=FK7tJoD0WrfCzGH6IS5X2huQCex/kWY878GNRhS+fh2Gy6y3JMkVG7NqCMsGz2i49ZpxPNWAjA0FxiVI76pXrnUjrj4/cNeFlZ+r+revEpVBU5vxbv+8MSCVU1wzTsg1+44rR/AxALU4/MiR1NpLX67mWlM+cfbl+hIwIh1Lzr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763298653; c=relaxed/simple;
	bh=rD9K4LiNQFuQgNTEM0CDuKb4VnJ/W90rbS9ErlVkVtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qtX3yBw0fkRnS8Hra14viVCPg0TV0eHBAouXkscAa32MPgg98ozlBH/mMJFWx7MiL4bhVmDgSI8OSCXMlLkclWRxd4BUaIWuuxpbJgcyfLS29Gv4ypkPTKy0y6SkyWtDAiSY+rtBWYw8IK9hLImZyHg0Vl6pS6TJaGoEMt1lh5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=EmkVErn1; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="EmkVErn1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=dWBBmvT5p0UOXw0ZQWdcqEHb8L1MuEgC28NscIj1Rzo=;
	b=EmkVErn1LDwDlPIFjJrwgEGtza1lnQQHZMMu6czXrRbc4FOVfKlHN9p3hnDz+J
	+QLkKVUSVY0Ya0ubuarNLj+3bXZeEJ2UGimlNfreCvBJgJ68DaOB7kW1WVuDfFu2
	xG2nPPkTmfFV/4ckNmPEdJ7gkotZTv+Gh5ud+6e0f1ljc=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3HEREzRlpnOIlAg--.8122S3;
	Sun, 16 Nov 2025 21:10:30 +0800 (CST)
Date: Sun, 16 Nov 2025 21:10:27 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, Frank.Li@nxp.com, jun.li@nxp.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8qm-mek: fix mux-controller
 select/enable-gpios polarity
Message-ID: <aRnNQ__Ukp_74XA5@dragon>
References: <20251113111444.888985-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113111444.888985-1-xu.yang_2@nxp.com>
X-CM-TRANSID:Ms8vCgD3HEREzRlpnOIlAg--.8122S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU8PfHUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIAYlimkZzUZP6AAA3V

On Thu, Nov 13, 2025 at 07:14:44PM +0800, Xu Yang wrote:
> According to the board design, set SEL to high means flipped
> connection (TX2/RX2). And the TCPM will output logical 1 if it needs
> flipped connection. So switch to active high for select-gpios.
> The EN pin on mux chip is low active, so switch to active low for
> enable-gpios too.
> 
> Fixes: b237975b2cd5 ("arm64: dts: imx8qm-mek: add usb 3.0 and related type C nodes")
> Cc: stable@vger.kernel.org
> Reviewed-by: Jun Li <jun.li@nxp.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Applied, thanks!

