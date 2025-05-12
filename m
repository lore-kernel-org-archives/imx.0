Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76927081A
	for <imx@lists.linux.dev>; Mon, 12 May 2025 06:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747029843; cv=none; b=LZwB6hna5W0XbYt476xTYPzTe6ErwjTFAmr+G4XsAuXLhWFeipcxS98C2ynr/DTTfWKEU3IYG4RFaxTvdHkTZd1LCEfCMc2rIUVcDz4/TK2ge2HpZ3/mfPhe1QmWGSmbKNJa4fn6tAAYlBYTuioVC6iiIPB/jgkvWz6MJA/sJms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747029843; c=relaxed/simple;
	bh=MWK3dai1bx1uNnosTirXqmYCIhzUUHUxore003m0f3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PzScStksteoEklwLjKP6wTj5uWVnW8ktPJP40o5Ey+f5HumJfhdxm2mUmWwkV+YXk7X0GZZ/yVZF4wqXpjn4h7GHZ2PZ3lisVFKgp1ORcfctRXTzPcU/hTBUxI3pyvd1PLgDIqyD6fmLR9asMncEC/qIYmutB4XsDbTBNImVmbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1uEMGB-0008I9-Dc; Mon, 12 May 2025 08:03:31 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1uEMGA-002JtD-2f;
	Mon, 12 May 2025 08:03:30 +0200
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1uEMGA-000RAK-2B;
	Mon, 12 May 2025 08:03:30 +0200
Date: Mon, 12 May 2025 08:03:30 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Denis Benato <benato.denis96@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] arm: fix imx_* defconfig
Message-ID: <aCGPMvP6F6r-57KF@pengutronix.de>
References: <20250510011806.13470-1-benato.denis96@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250510011806.13470-1-benato.denis96@gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Hi Denis,

On Sat, May 10, 2025 at 03:18:03AM +0200, Denis Benato wrote:
> Compiling the kernel using affected imx defconfigs lead
> to a hard CPU crash that reaches a state where each register,
> including PC ends up in 0xDEADBEEF.
> 
> That is because the SoC support depending on CONFIG_ARCH_MXC
> gets disabled since CONFIG_ARCH_NXP is not defined while
> said feature depends on it.
> 
> The default arm defconfig is unaffected as it defines
> CONFIG_ARCH_NXP=y correctly as excepted.
> 
> These patches solve the crash causing my confusion:
> https://lore.kernel.org/all/c84e8246-8104-4409-8d95-389d61bc07af@gmail.com

In this mail you say you want to start a ARMv8 i.MX8MM board. The
configs you are changing are for old 32bit ARMv4-7 SoCs.
arch/arm64/configs/defconfig is for you.

Sascha

> 
> Denis Benato (3):
>   ARM: imx_v4_v5_defconfig: define CONFIG_ARCH_NXP
>   ARM: imx_v6_v7_defconfig: define CONFIG_ARCH_NXP
>   ARM: imxrt_defconfig: define CONFIG_ARCH_NXP
> 
>  arch/arm/configs/imx_v4_v5_defconfig | 1 +
>  arch/arm/configs/imx_v6_v7_defconfig | 1 +
>  arch/arm/configs/imxrt_defconfig     | 1 +
>  3 files changed, 3 insertions(+)
> 
> -- 
> 2.49.0
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
