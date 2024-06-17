Received: from mail-177132.yeah.net (mail-177132.yeah.net [123.58.177.132])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C19B15EFC9
	for <imx@lists.linux.dev>; Mon, 17 Jun 2024 02:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718590438; cv=none; b=jY/9GU2Iby4XoKqWxTRaqpSIrY8X27FX6VpMipy7C0K5IcwF/as2EZ/hgvlxBhpxG4FJ7dGU0gFw0SQF6IdDrAjI4wvY7Y986ACZ5QoRUskQymbRJnLuLyb5Tfq9Hp9VIYJpqwNZ94ZpyEwWdOboNlde6wcpONCHxZkiPBZqmfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718590438; c=relaxed/simple;
	bh=+ChJNRRhh6Ooomnz0uf9uVFqgEdgCQiqOFIj1PoFZ5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U/PSU17BlJiOY+SsR+hfvomMuWgaE4mEp3tt4JFr7+QW2z76cskCntXiPumkbwsBFPoLLmn7h/Kk3VqSMEmDOssgLpHjx7CSqAQ5N8v9weGaY5/GAKUc2BxNAQVjF/AzP2eh3kYZGdT0rjJkR+vaQ60ml96mx7JIGV2NGnzomnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=PsDFP1S5; arc=none smtp.client-ip=123.58.177.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="PsDFP1S5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=71gC8yDm4k7eZg1Y0V9ZDsb/7u05Sw61OERK9LlIG18=;
	b=PsDFP1S54lW+pwukb5k3tc5SV2Jw46kJRjPpnqYwFwRmZVAvbtt+iviZoNH2xF
	DGDyURIWlyq1Gh7gNhWV2Z7Uc/Ob91WNcZanfkdjiAJxj031n3GXZeGs/IR1Q5Cm
	Cihwi4BfUOirsyhFUNExNam2O1YCnvfCQlKJqcm3aVZrI=
Received: from dragon (unknown [114.216.76.201])
	by smtp2 (Coremail) with SMTP id C1UQrAC3H_XOm29mtfXNCA--.38477S3;
	Mon, 17 Jun 2024 10:13:35 +0800 (CST)
Date: Mon, 17 Jun 2024 10:13:34 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: freescale: imx8mp-verdin: add HDMI support
Message-ID: <Zm+bzkh7CgBuFs53@dragon>
References: <20240610141001.32034-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610141001.32034-1-francesco@dolcini.it>
X-CM-TRANSID:C1UQrAC3H_XOm29mtfXNCA--.38477S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU3zVbDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiDxIBZVnxc0yGvAAAsU

On Mon, Jun 10, 2024 at 04:10:01PM +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Enable HDMI output on Verdin iMX8MP on all the supported carrier boards
> (dev, dahlia, mallow and yavia).
> 
> HDMI DDC I2C is used in regular I2C mode, see link on the related
> dt-bindings patch.
> 
> Fix CEC and HPD pinctrl, having a pull-down on HPD and a pull-up on CEC.
> 
> Link: https://lore.kernel.org/all/20240515062753.111746-1-marex@denx.de/
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Applied, thanks!

