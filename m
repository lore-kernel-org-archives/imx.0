Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE4637FF5A
	for <imx@lists.linux.dev>; Wed, 25 Mar 2026 18:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462262; cv=none; b=qhIcYqwM8kGPqgH21uukge2wGyp3TANS+E0MeRpEHbcsLOWmIToGdOBk6nVa51bb2pe1myIy6e/c3rF6It7J4IoerndrKTsdcl7eQDVUnn3A+SlmqIiZnSSgAfCkvO4hQmxIg00ZmjFPrE4p/u+t02fC0PCC6zc97NXYYMiFH/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462262; c=relaxed/simple;
	bh=4oQhPIsk8s+gU+3OK/VIznAuU6Se1gTBR1Cbpou/cBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qv/U002NcjQ8BQJoUUqkeAvgWWkTntXsApshRUvK2ddoPFNjpGKoFgOCq+ldsdp1fEKMonblBdMIle6GTLjHKvusYjRMgPnYcQUiMBLDIJGcgAgK/DCYK48cdcexNVuJlAVjDtl+zGdEbber3yM4bT9ArAeFBWj5viEOTQL82/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=HTPL/eyb; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="HTPL/eyb"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 85DE4201FE;
	Wed, 25 Mar 2026 19:10:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1774462259;
	bh=PCkaHroi7JtzDDzze2vqbAGbk2FNNhsqXTmz4G6Yku4=; h=From:To:Subject;
	b=HTPL/eybTJsPutz99rLH2Kc9XS4yCKQ9tVvt21D/Dny52UiEPN0dwgsarYfUsCclo
	 HUEZrkXRQ3dWgbNIfhphDb1MDgEBR3uTaC5SvK6gQUs2m/kaZtPBT7DBrAcieKcSLp
	 6qR9DUeyTDM8T6cQ1VaR//JHQLsvD2YG/0FT6l6q9cEEgtmM4GW61ReIkxl5vk+pe4
	 VCl7KK32sRv5RtZLa1rpNi//kTvBnN00RZywG7SHxqPhEVNnsXMY3auZHlwSqfjuKM
	 j5xt4vSS3t+FFhFhwxchbv/INVOC9stGTSGlNFEMMvOpGFxU03EmKid9TGJgwwlQgP
	 j3ancjOf701Yw==
Date: Wed, 25 Mar 2026 19:10:57 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.li@nxp.com>
Cc: Franz Schnyder <fra.schnyder@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Franz Schnyder <franz.schnyder@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco@dolcini.it>
Subject: Re: [PATCH 3/3] arm64: dts: freescale: imx95-toradex-smarc: Use
 gpio-hog for WIFI_UART_EN
Message-ID: <20260325181057.GB2972@francesco-nb>
References: <20260325-mainline-update-imx95-v1-0-b5ebe976655b@toradex.com>
 <20260325115513.707914-1-fra.schnyder@gmail.com>
 <acP3NiGvRCc1SgjE@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acP3NiGvRCc1SgjE@lizhi-Precision-Tower-5810>

On Wed, Mar 25, 2026 at 10:54:46AM -0400, Frank Li wrote:
> On Wed, Mar 25, 2026 at 12:55:11PM +0100, Franz Schnyder wrote:
> > From: Franz Schnyder <franz.schnyder@toradex.com>
> >
> > On the Toradex SMARC iMX95, the WiFi UART signals are shared with the
> > JTAG. The WIFI_UART_EN signal is used to select between these
> > two functions.
> >
> > Configure the signal as gpio-hog and drive it high to select the UART
> > function by default. Add a label to override the hog in derived
> > device trees.
> 
> gpio hog have problem about probe order, are you sure gpio device probe
> before pcie?

This is not about PCIe, we are talking about UART here. Specifically the
module is a combo Wi-Fi/BT device, with Wi-Fi over SDIO, and BT over
UART from NXP.

In any case, this DT is going to be used also by the boot firmware that will
configure the GPIO hog way before the Linux driver probes.

The DT files from the Linux kernel are used also by other projects.

> I have not seen any place refer to wifi_uart_en.

There is none (as of now). This is there to make it easier for a user
that needs access to debug to adjust this node enabling the JTAG
functionality.

Francesco

