Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53050380
	for <imx@lists.linux.dev>; Sat,  2 Nov 2024 06:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730530112; cv=none; b=LMm7cnuh4rnOZNg/Dq1nd8sT1/DBxVwM6sTK+nogdvp//dQO6ECRoY/fbh0ynvyEw1dHx2cAGRC+3upeTilXp5pAj91wiQfEqCXqorjq5pjc/Goc0sYqzblWi5j14H/gWdlzECKxGVozK2uibh14q1n3q2Tl00+pfx7A8DbPe+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730530112; c=relaxed/simple;
	bh=n6Ym9nl5ofu4kHAJL5/w2BJ6rjntnfm7Mkviq67cZYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CMtzrWIneufNwPRtoYn9Lw57jhFBfKrg4qgyOgQAROoxlLI6Xs5KttEBVBu0Dkn6cMG9zfuvZSbnoUgud99govaJkEx5xH5I3ErljSBAGzEdKwEpdaRLMvWSzETSTtECzsqtJUIIV5xp+8FfYzUKtN6FwFwpvkCf/x2vvp3E374=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=mpYFZX3E; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="mpYFZX3E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=0VIcPO/qvZo2Yecv6kglkByNG81C4qnffnZZIqE0ty4=;
	b=mpYFZX3EkeqHbGE6w69j1mVPnOKV0cTtvf2l9CHxyPE3mRWdV/8O9bRu92EIht
	LUN9HixVth3IQ8gnMwACWp/HRoHaGyRwg89YKnHiXtKrflsE64Vk3n99ZAZoIgHr
	5WlnD49YjNwJi0BGftdbXhLbV0kYqCix/9D9u8OcUlMU4=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgBHi8gnyyVnUm9+AQ--.14872S3;
	Sat, 02 Nov 2024 14:48:09 +0800 (CST)
Date: Sat, 2 Nov 2024 14:48:07 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] arm64: dts: imx8qxp-mek: replace hardcode 0 with
 IMX_LPCG_CLK_0
Message-ID: <ZyXLJ0RbHqCIym3R@dragon>
References: <20241025220810.1833819-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025220810.1833819-1-Frank.Li@nxp.com>
X-CM-TRANSID:Ms8vCgBHi8gnyyVnUm9+AQ--.14872S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxtxhDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBOLZWclrIE-mQAAsw

On Fri, Oct 25, 2024 at 06:08:08PM -0400, Frank Li wrote:
> Update clock settings to use the macro IMX_LPCG_CLK_0 instead of the
> hardcoded value 0. The first argument of lpcg is indices, not index.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied all, thanks!

