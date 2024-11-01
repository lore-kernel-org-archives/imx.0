Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 349F61D555
	for <imx@lists.linux.dev>; Fri,  1 Nov 2024 08:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730449549; cv=none; b=jSS65HpIS+fv+1oCnv66amd5TnVRXGFDSdXqgIAuq4ZTKWal5y5WceuUSgv9n9zRdr76303kFG6+U065eN6UMa2dYH1SrDmzEonjknSyKQFP+BPqei4+Gead2qQv4knMTplzV6crnfKnpcWWsNLMOkBSse2hoPBvEo8zo8oDYzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730449549; c=relaxed/simple;
	bh=Pg1bDa1VqMZxjfg4dsHifi+vJu/fSVqVb7HHC7zr2dI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oI31aUGgFo/UVN/3jvRI4xImspMQ+prDFPC3avK/L9DIuAj2aHnGbQYWBZh9RbzcGLQ2SA4ZUHFjg1dZxbrIPRmZ9Dp5zAYmQ831K9bZnl4Zb1eEX4gOCmkAOQXm5YaPka6IQ4d4ahGWSfZ+1OSTQHMFunPVev3S42ZYb+xl4MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=f5u/4noK; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="f5u/4noK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Hg2TJ/Baji1tRW8RpbjYn7MFzFn5+qm7pKjjEWt0Flg=;
	b=f5u/4noKj9KilTbCNFgWVQt0bGoeXfnwxuWKmDWbSN/n13pk1aLAXJgkovhzLU
	6q4JEnRL7IDFaszpuM7Q9Z7G685BnYPLkMeYTe6j6vmF0DpnMU9xY2PcFo0KXj/Q
	A4FTuluYuFo/tmOKvgqc1K5nm7Xr1KyXOwlajU7dk4bzc=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3tv6xjSRn72xnAQ--.13820S3;
	Fri, 01 Nov 2024 16:13:39 +0800 (CST)
Date: Fri, 1 Nov 2024 16:13:37 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Stefan Wahren <wahrenst@gmx.net>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	kernel@dh-electronics.com, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 02/12] ARM: dts: imx35: Align pin config nodes with
 bindings
Message-ID: <ZySNsQVp5+JmRohH@dragon>
References: <20241017211241.170861-1-marex@denx.de>
 <20241017211241.170861-2-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017211241.170861-2-marex@denx.de>
X-CM-TRANSID:Ms8vCgD3tv6xjSRn72xnAQ--.13820S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUa-eODUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBWKZWckjIUEMAAAsA

On Thu, Oct 17, 2024 at 11:11:19PM +0200, Marek Vasut wrote:
> Bindings expect pin configuration nodes in pinctrl to match certain
> naming and not be part of another fake node:
> 
> pinctrl@30330000: '...' does not match any of the regexes: 'grp$', 'pinctrl-[0-9]+'
> 
> Drop the wrapping node and adjust the names to have "grp" prefix.
> Diff looks big but this should have no functional impact, use e.g.
> git show -w to view the diff.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

Applied all DTS patches, thanks!

