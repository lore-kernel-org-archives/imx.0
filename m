Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87ECDF71
	for <imx@lists.linux.dev>; Sun, 14 Sep 2025 13:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757855595; cv=none; b=UcVhrdFAWiqRV+W/A9a9bSGC7anPBGjIiAzxymIXOqkksNE2ElAZhXJT5Ia2jJ3iAu7rmEb5PkSPhTdQxGUznuzFvyPSxuHaGPYG12mmlWgIXiQh/147YpydN9k0oH86CtKWG0pJnlDUb3llIrCpVNOFXNZpmnJfd+sIJptdc8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757855595; c=relaxed/simple;
	bh=0XPmVfTGP6Qp7dVJbLuD6IWlVjzLWc2H+trq3wsrpf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l/krH6H2/LNmovFOBtyYrTa7q4IgR18h5c8wVVVcWTU6cMpjRsl7/9zJSe0rWqV/UoThr8MzHZoccwE1TbOVcxY/f2nySjw67mUWgZ3bAAXh4m3/BKmdos6JY+EDYC4x4bIlIJ0UUwQRE4abuXoLwJ1cxYcZoX4A/ihK9DIvpWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=ntULexip; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="ntULexip"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Qesnl5oii1QOIkSSWEC6Lxyh/fvcMrHZx6tpiIPRP20=;
	b=ntULexip2JBn8eoai/wyWKtUjXoVdx1WAQ968RkarSLThtYkRcBmvg7bjeyjAU
	9xzzPIpaT5qfX888MLgg7FwvdaCh9VBfo87pmWKXEi8PI9P7HvBd+O7QErtq+CAn
	lOPCw/K8GnIVOahpaTv0MW5kYR78iYLfSeojju592H/mY=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgCnFdtIv8ZoCC2KBA--.6351S3;
	Sun, 14 Sep 2025 21:12:42 +0800 (CST)
Date: Sun, 14 Sep 2025 21:12:40 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] arm64: dts: s32g: Add device tree information for the
 OCOTP driver
Message-ID: <aMa_SGzdaCS2W38x@dragon>
References: <cover.1757689031.git.dan.carpenter@linaro.org>
 <6ea7fede9642dad10a6270a07e052f7a726f9bd6.1757689031.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ea7fede9642dad10a6270a07e052f7a726f9bd6.1757689031.git.dan.carpenter@linaro.org>
X-CM-TRANSID:Ms8vCgCnFdtIv8ZoCC2KBA--.6351S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUz4SrUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNgrNM2jGv0r64gAA3B

On Fri, Sep 12, 2025 at 06:03:22PM +0300, Dan Carpenter wrote:
> Add the device tree information for the S32G On Chip One-Time
> Programmable Controller (OCOTP) chip.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Applied, thanks!

