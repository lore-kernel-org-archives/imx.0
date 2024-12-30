Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 094422AE8D
	for <imx@lists.linux.dev>; Mon, 30 Dec 2024 04:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735533312; cv=none; b=karBiMZEPP37Pa7Bl0qDcORWnJpAdRzjhBf+2o0T3VBe+G5LuGSMewxRhT0Y/Aw1GE34YC46zrd/mozEvLg0FJabdUFOavBc5US8hUq6c2YhyH1YtHkhdgox376nKJXUbOcbTxeazHiXGSvQL8QjHXFAZZSQBbWNsATr2kItqvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735533312; c=relaxed/simple;
	bh=yvcTamdxCACSWzdxleHg4mAxBkSzM6t3T390sukGiI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eud4AV4diqX+XSqncw4sKEW/cD4ICfmmyA8gw4ZwM1tMkKzGry5gjO3OouxXIglvTREbtc792bYziJy1d995fa6XwAIEwUM6llWdHlm0rhCqXUsv4jKcN0BvJw5sRcdS5+NzryFTSlraZUBL4WStcXpWqvQFOWQ9A4ySltzjUhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=GxUP7Sio; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="GxUP7Sio"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=SHCKVh2AbwLhmjzcOxs27mhHQlsL+IhUrIYG091MgwE=;
	b=GxUP7SioHjonTfr4b20xM8MrFUAdAUExWHwq+2lBAjygliCst890X2bkyHZ6gZ
	OJ8NQ5EOpkjNNATNNnf4VH7HMxBNVWKcblAoATr83uhLEOxePcRMC6snXk3PdGO0
	IXHRwQO+GgzKifBvpeZn8+FCWjtRZEqQLuEOrAmShqi30=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDnH0bpInJn7NkDBg--.18117S3;
	Mon, 30 Dec 2024 12:34:51 +0800 (CST)
Date: Mon, 30 Dec 2024 12:34:49 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Robin Gong <yibin.gong@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev, joy.zou@nxp.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/5] arm64: dts: imx93: add pca9452 support
Message-ID: <Z3Ii6WzpgAlfXn5q@dragon>
References: <20241205-pca9450-v1-0-aab448b74e78@nxp.com>
 <20241205-pca9450-v1-5-aab448b74e78@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-pca9450-v1-5-aab448b74e78@nxp.com>
X-CM-TRANSID:Mc8vCgDnH0bpInJn7NkDBg--.18117S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUsk9NUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEh-FZWdyDiVSFQAAsU

On Thu, Dec 05, 2024 at 11:51:13AM -0500, Frank Li wrote:
> From: Joy Zou <joy.zou@nxp.com>
> 
> Support pca9452 on imx93-14x14-evk.
> 
> Signed-off-by: Joy Zou <joy.zou@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!

