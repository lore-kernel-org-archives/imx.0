Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F65B1B395C;
	Wed, 16 Oct 2024 07:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729063529; cv=none; b=NjxkP6UJB+U2+XqXwVRJCvivFIfFb1F27HyL7XA2XaV8UGngWBdExRzy9CmCg9KoU7GbIFKvV4Q17LXp51taQgL1HiAFjwpfBq1C5hVx6srXrJw+6Mub1LyXr258MDb2ShANTjBvlxLSR5wa86zsyXYqfNkXKIGPOuCVlWsh+4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729063529; c=relaxed/simple;
	bh=kdtVigLj6YCCN5pmCgfHkrqCjhEdlB4MJFoZ10acCGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tr58otXX9ZmqVL2tbaOR5CYa+21DgCFTao9BQnAT2saFLHXWl9DcOnaf3U2gXqJeQNNdxD/sSSXtM6s1CKoBx8rv3EQwx2CGJTsqWsbJH/c0Ta8oiN9b2/2Gt22xBukfWKwopMlRdAJBHnjRCVgkgIJ2TSaE5r2NMMmUQINIseo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X/vUdDSo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X/vUdDSo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 771B0C4CEC5;
	Wed, 16 Oct 2024 07:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729063529;
	bh=kdtVigLj6YCCN5pmCgfHkrqCjhEdlB4MJFoZ10acCGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X/vUdDSoRSRBjMly44CXsmr1H7H/GNvunmZy5t9MQi0tmPdtSA4812K5yfuZNaD6Z
	 GakM0Q40pRizqEp9y9EvJmY0E22cJ4JyjEvfqLxWS6sDKUn/i6qMxATw4sCGYbVEqs
	 Cd4WY4Ab417PSO6yfWB7JlZTCft81Ud+ZXxFRd/yHcMziY+xNATMb76ocNEKTSxHIe
	 J04xT9dmuRVbcZEGCBkVzXS6KINTsVQagH8QWCSqRzZ3khENtK8gz8Es0yxJpnyD46
	 sGT/NaC0thfVcB8XTJZkcuaOqrJyAHpPgv0URYg9waoaYbi4fPfJcCIYad0jlbRekR
	 5XcP9g9NCXxlw==
Date: Wed, 16 Oct 2024 09:25:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Christoph Niedermaier <cniedermaier@dh-electronics.com>, 
	Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Gregor Herburger <gregor.herburger@ew.tq-group.com>, Hiago De Franco <hiago.franco@toradex.com>, 
	Hugo Villeneuve <hvilleneuve@dimonoff.com>, Joao Paulo Goncalves <joao.goncalves@toradex.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Mathieu Othacehe <m.othacehe@gmail.com>, 
	Max Merchel <Max.Merchel@ew.tq-group.com>, Michael Walle <mwalle@kernel.org>, 
	Parthiban Nallathambi <parthiban@linumiz.com>, Peng Fan <peng.fan@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, kernel@dh-electronics.com
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: Document i.MX6DL DHCOM SoM on
 PDK2 carrier board
Message-ID: <sxw7kruw74n5462wdvpbc7uwyvudxq7hhmyy2nbk6gksq7mt5t@y2nit7t4h5ah>
References: <20241015235926.168582-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241015235926.168582-1-marex@denx.de>

On Wed, Oct 16, 2024 at 01:58:35AM +0200, Marek Vasut wrote:
> Document the DH electronics i.MX6DL DHCOM SoM and a PDK2 evaluation board.
> The evaluation board features three serial ports, USB OTG, USB host with
> an USB hub, Fast or Gigabit ethernet, eMMC, uSD, SD, analog audio, PCIe
> and HDMI video output.
> 
> All of the aforementioned features except for mSATA are supported, mSATA
> is not available on i.MX6DL and is only available on DHCOM populated with
> i.MX6Q SoC which is already supported upstream.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

