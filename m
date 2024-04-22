Received: from mail-177131.yeah.net (mail-177131.yeah.net [123.58.177.131])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 387492F2D
	for <imx@lists.linux.dev>; Mon, 22 Apr 2024 04:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713760464; cv=none; b=klLrCPKIYz61hdSx/cUTppvjCi9A8v58D1M60HUYiXPFHQk39j8D/BLWSHWbJ8kCH3aN/l9zCRSk8AmIxb942uG61+me73Py4ZHsNxCPDSfPtIPTyOInoXIWB4V28TsWoiYXOVd/6VZa0DE6tGuQyxjTHstt3dE+ncSrbR4mUmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713760464; c=relaxed/simple;
	bh=N5wctkp1LXxg8d036Og4usRfLHHyKI9MDODpH1i/LC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EKoq7OWrLlpDSlAk9er6BmV5AjOdbSy8EnmhatHs4+liGd/kGhYskJcRqOx0EcUAyyiavTtzWU2HAtSZNXFS2sqwxk1AHRS70PVqZP4SPeuGrBdtvcxkgh5FAQu2eFhV4Zpe5TT494EqZY4hIuZKOVEHfCGIdA+ndVw4DVidzRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=kooyg5PY; arc=none smtp.client-ip=123.58.177.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="kooyg5PY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=VOt5666oV/l7m+pxjgKi1x/9GVfL1fw5d3LO2qMLxv8=;
	b=kooyg5PYD0IkRLGN0Fdo8W5G7t9oyrOxIvrlmMkVDIUfXaUsUf98pitpHEQ2Sn
	CocD0v8usz4iNz2Epw1OHlJbS145va1pttgDfo9e3gu7+cSlcmHNcnoPmDV1dsht
	lCoTcGsFcG/s7/nHu7Hzg/PvTNoybmT23/FXd8Mg7jA60=
Received: from dragon (unknown [223.68.79.243])
	by smtp1 (Coremail) with SMTP id ClUQrADXP0On6CVmgSQsAw--.42708S3;
	Mon, 22 Apr 2024 12:33:44 +0800 (CST)
Date: Mon, 22 Apr 2024 12:33:42 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH] arm64: dts: imx8mp: Fix assigned-clocks for second CSI2
Message-ID: <ZiXopqGEpaX/Zoxd@dragon>
References: <20240405202214.46251-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240405202214.46251-1-marex@denx.de>
X-CM-TRANSID:ClUQrADXP0On6CVmgSQsAw--.42708S3
X-Coremail-Antispam: 1Uf129KBjvdXoWruFWfZw15uryxZr4UKw4xXrb_yoWftwb_Xa
	4UXF12k3ZYq34fCanrCr1agrn2kFy8Xr98u3WIvF1fKr1DuFW5CFyrCF1Svr1UJ34aqw4k
	Xa48ZaykCr1F9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8EAp5UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiDwjIZVnxcqAfCwAAsE

On Fri, Apr 05, 2024 at 10:21:53PM +0200, Marek Vasut wrote:
> The first CSI2 pixel clock are supplied from IMX8MP_CLK_MEDIA_CAM1_PIX_ROOT,
> the second CSI2 pixel clock are supplied from IMX8MP_CLK_MEDIA_CAM2_PIX_ROOT,
> both clock are supplied from SYS_PLL2 and configured using assigned-clock DT
> properties. Each CSI2 DT node configures its IMX8MP_CLK_MEDIA_CAMn_PIX_ROOT
> clock. This used to be the case until likely a copy-paste error in commit
> f78835d1e616 ("arm64: dts: imx8mp: reparent MEDIA_MIPI_PHY1_REF to CLK_24M")
> which changed the second CSI2 node to configure IMX8MP_CLK_MEDIA_CAM1_PIX_ROOT
> using its assigned-clocks property.
> 
> Fix the second CSI2 assigned-clock property back to the original correct
> IMX8MP_CLK_MEDIA_CAM2_PIX_ROOT .
> 
> Fixes: f78835d1e616 ("arm64: dts: imx8mp: reparent MEDIA_MIPI_PHY1_REF to CLK_24M")
> Signed-off-by: Marek Vasut <marex@denx.de>

Applied, thanks!

