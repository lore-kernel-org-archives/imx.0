Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 388BD320F
	for <imx@lists.linux.dev>; Sat, 31 Aug 2024 13:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725111349; cv=none; b=WZLPRvkBhroceOFUHhGsvHYYObqbv57AeHEF1Sz45ZvDjIvDpmq1d2EBFTZIYcQdPqPieM1Y87aRA2qHZ3dFFTDXX9wCF6J2/F/WY0u2WG5Sb0URWu5Id82gRO8zoUsXEewlERkFyHznSfjrovFsbEvciP7JPgJXgkpD+8kh/YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725111349; c=relaxed/simple;
	bh=nb1KlipafvKkZuX0UdkBwV2xAvHWB2eZEw8AwihytT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HC4jxv/cgkGgFYS4t0hPamhmZJhIyHhvy/U62HfV8ThyuK+gh9+y8kZ7MaqrNl6eIhaDVa78WnnvFg66XENIU9V2k3qZWEtfNjBaEj9IXiMnRHg7pLNWoDrTfid06LB8d7xSsazKwBFhuSAYoFrwe6OrR5qNMSLuummhVTVP5C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=nQfnJUmp; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="nQfnJUmp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=bXl+AVvOmYzlBrZ/FtMR0B/VSQACYgUi4M2jIPQ445s=;
	b=nQfnJUmp0UCfO2KACX/GkC8wD4IQnCU0UA7ofRIAiStkAPYVnPIWHB1QpQ4QuX
	6s2cxyTpDaXz05SPp1Cp20C9msuUxSiTlSOfJ1W2Kjk583iDA+ODX3I8f5FfnGFf
	EXrovfRTq0+LrG69UZnoDmOjuVQPOvMvbD9syZQm018IU=
Received: from dragon (unknown [114.216.210.89])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3XzwQHNNm0dA7AA--.11142S3;
	Sat, 31 Aug 2024 21:35:14 +0800 (CST)
Date: Sat, 31 Aug 2024 21:35:12 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8mp: Enable HDMI to Data Modul i.MX8M
 Plus eDM SBC
Message-ID: <ZtMcEIZn2rNLBzPm@dragon>
References: <20240818202741.95967-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240818202741.95967-1-marex@denx.de>
X-CM-TRANSID:Ms8vCgD3XzwQHNNm0dA7AA--.11142S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUIq2MUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEQtMZWbS-GE9EQAAs2

On Sun, Aug 18, 2024 at 10:27:10PM +0200, Marek Vasut wrote:
> Enable HDMI support on Data Modul i.MX8M Plus eDM SBC.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

Applied, thanks!

