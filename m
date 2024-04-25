Received: from mail-177131.yeah.net (mail-177131.yeah.net [123.58.177.131])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB6C784D3C
	for <imx@lists.linux.dev>; Thu, 25 Apr 2024 09:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714039133; cv=none; b=Xg80ZVUfVQ4MKVMscONEUL8iL9VM7eT9f3MOowRhilNydHX4KNJoWj9bCykMSuyNVqS7yabWIcGpklH7RzH1xNIRNLJupa4huJDj1CUsRcPk/zGnTUqaemp8olxCINoY3eg/JDtV3OSJk6FOQiIushVK1WqJZpc66KKPnTt2DxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714039133; c=relaxed/simple;
	bh=bS5vRZgCepqsfybsuZmUFrGIxQpeiKXaE4I15xitOig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I5t5qdWciMfaOhozHYkugfqOI9TnBIGZiG10tI9U9Kn6t1A2hR0827NJTVmd+TZD37dDDB4S4w4tdrw5gz7dJhFonv48q5sfvYy/GtQZ0ErX4wYS1SvZKv81FNuCdmRV0rGtzpDWNV6SoC3Ogy58cHnxchRUJZH2YyJjBnLsjDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=HJ4ikIuF; arc=none smtp.client-ip=123.58.177.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="HJ4ikIuF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=SUK3KiYsAjXmz1lQMFlWpM7cirHy3HazgSFNWJvitho=;
	b=HJ4ikIuFN43ZQXNjGc2sJM00WaIucvlYOZNwkAcJ6WDdd2evjqUe+8s456JNYl
	fgOe1CD+H0VRnuqB7vlSLlvyJMY1unn7IxuqAqJhVv3bAjt5EtYM3Oe9aBdbgfSx
	l6xaxrK2Mo+6ZQyh0PzsA2GTit/2HRCzLWqdsIaDpCpyQ=
Received: from dragon (unknown [223.68.79.243])
	by smtp1 (Coremail) with SMTP id ClUQrADXHyFKKSpmwUBvAw--.20945S3;
	Thu, 25 Apr 2024 17:58:36 +0800 (CST)
Date: Thu, 25 Apr 2024 17:58:34 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Joy Zou <joy.zou@nxp.com>
Cc: m.felsch@pengutronix.de, frank.li@nxp.com, ping.bai@nxp.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/1] arm64: dts: imx93-11x11-evk: add RTC PCF2131
 support
Message-ID: <ZiopSiXqkZ3H7Dhv@dragon>
References: <20240425013507.2840128-1-joy.zou@nxp.com>
 <20240425013507.2840128-2-joy.zou@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240425013507.2840128-2-joy.zou@nxp.com>
X-CM-TRANSID:ClUQrADXHyFKKSpmwUBvAw--.20945S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUsyCJDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiFQzLZV6NnF5h7QAAsq

On Thu, Apr 25, 2024 at 09:35:07AM +0800, Joy Zou wrote:
> Support RTC PCF2131 on imx93-11x11-evk.
> 
> Signed-off-by: Joy Zou <joy.zou@nxp.com>

Applied, thanks!

