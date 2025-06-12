Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275C32744D
	for <imx@lists.linux.dev>; Thu, 12 Jun 2025 13:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734220; cv=none; b=hZi877E4O4zGTZcesNAD+aEg1unvwGOl3TMrJIDUsEKuTVqQ1EZuYpXaQJJ9HGlKpQ9hTjqjvrFdusJmlwV8lbkKqihxpAwT5dTX1mD0ySHFuIX/owhxzLankRdO2NBZ4BM+vQxtbTQ/1D6Xjh9yuIyV+feIdcIBv2zGta793Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734220; c=relaxed/simple;
	bh=RHhiRFKcHKgeRTnfo5JIZcEtHjLnVz8NV9ckZjMrgUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OFQQnLSkAGECCG3fMAtxSF9G1eZK+DGADd5MFnw538oLEUdtswr3thOSkjxQLlmE6oN7mxk2fbUwYMlA/lQoswqErDmEL+C9hOSPhqa8Sk5TbpxZ3oHfvoaBLYEHcTrdEjucUHvlOt1qCudCogMsdzXduoJdqDbbLjGPK03MFac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1uPhnS-0002jo-Lp; Thu, 12 Jun 2025 15:16:46 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uPhnS-00389B-1F;
	Thu, 12 Jun 2025 15:16:46 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uPhnS-008vXS-0v;
	Thu, 12 Jun 2025 15:16:46 +0200
Date: Thu, 12 Jun 2025 15:16:46 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 4/4] arm64: dts: imx8mp: Configure VPU clocks for
 overdrive
Message-ID: <20250612131646.be2mad2hqeh33wqx@pengutronix.de>
References: <20250612003924.178251-1-aford173@gmail.com>
 <20250612003924.178251-5-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612003924.178251-5-aford173@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On 25-06-11, Adam Ford wrote:
> The defaults for this SoC are configured for overdrive mode, but
> the VPU clocks are currently configured for nominal mode.
> Increase VPU_G1_CLK_ROOT to 800MHZ from 600MHz,
> Increase VPU_G2_CLK_ROOT to 700MHZ from 500MHz, and
> Increase VPU_BUS_CLK_ROOT to 800MHz from 600MHz.
> 
> This requires adjusting the clock parents. Since there is already
> 800MHz clock references, move the VPU_BUS and G1 clocks to it.
> This frees up the VPU_PLL to be configured at 700MHz to run
> the G2 clock at 700MHz.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>

Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
