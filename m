Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344F21427A;
	Tue, 30 Dec 2025 02:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767063456; cv=none; b=BVZMi2HNhD1iEnEFLxKdz7dtNOIzCR2Ue89sTh8UnyoR+BO91d3NRuFGrp78iwCwe8VhUn0Ad3s/tqQGh477mWeV1/IAY/SzzB4+Q39Amb/U6+szD9UDce/P+dZpUYuHfpjTqJ0xSlg0jNvgvtHBYgwt2Bi4JZIl5Eab79UW2Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767063456; c=relaxed/simple;
	bh=mZPhCiEGuhQZnTX/hLxPJDSMGw1z4lrwY4SA3V8cPhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TwinUaksk9R4aDlXsL/hmA5hGjZZF0f1Lc3ebk66pblFU7/YLBM2dnsZoGr3GohZhVnS1MP6Kb5buNqiMSN9W64isOfw19SBT5Z8Wg+oMVkdnCnxyYgg2/AnZ1xjPGf6MBO5zDedIsXcVVc2cTQccZ82QIRQsDgQInF8rFb4F5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gTHxhPyw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gTHxhPyw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A7A3C4CEF7;
	Tue, 30 Dec 2025 02:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767063455;
	bh=mZPhCiEGuhQZnTX/hLxPJDSMGw1z4lrwY4SA3V8cPhc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gTHxhPyw51sxj3aFJxPPtceSmKmDzNCA8UDtFhlFgAT+7byLdOqpy4SauMZZeBg+W
	 lwKfpzDJCdFv2Omu+LeYDtgFe3muAL+TfpDcYVDrP2muXD3KmHM+0lnK+V1tHPnE6r
	 wBquegnp+3XsqbYVTFjXC5RjnDlzU/iXvIP+jQ/SjtPW7DbS2oU2aQgeXTsvvtWq5u
	 BGNnUm1cg0e05VmGEzB/mxsqLS/Tdrpf3RXACuwzbiCeC3BwAlrfqdxPzzRY7+YwhI
	 +rmkWjmUUUdQ7iV+UaROqOBb2dED+9U2EhbAStGxlTX9zPlcirp29b+3ruKT89MIh/
	 sx8KciWNOMzoQ==
Date: Tue, 30 Dec 2025 10:57:31 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Stefano Radaelli <stefano.r@variscite.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 0/4] arm64: dts: imx93-var-som-symphony: align DTS
 with hw revision
Message-ID: <aVM_m_qAo91E5oKM@dragon>
References: <20251205182258.50397-1-stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251205182258.50397-1-stefano.r@variscite.com>

On Fri, Dec 05, 2025 at 07:22:53PM +0100, Stefano Radaelli wrote:
> This series adds support for several peripherals available on the
> Variscite Symphony carrier board for the VAR-SOM-MX93 module.
> 
> The patches introduce:
> 
> - GPIO aliases cleanup to better expose available GPIOs
> - FT5x06 capacitive touch controller
> - USB1 (OTG, via PTN5150 Type-C controller) and USB2 (host-only) support
> - LPSPI6 controller exposed on the expansion connector
> 
> These changes describe real hardware connections and make the exposed
> interfaces available to user applications.
> 
> Tested on the Symphony board with a VAR-SOM-MX93.
> 
> Stefano Radaelli (4):
>   arm64: dts: imx93-var-som-symphony: Update gpio aliases
>   arm64: dts: imx93-var-som-symphony: Add support for ft5x06 touch
>     controller
>   arm64: dts: imx93-var-som-symphony: Add USB support
>   arm64: dts: imx93-var-som-symphony: Enable LPSPI6 controller

Applied all, thanks!
