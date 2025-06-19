Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0B4230BF2
	for <imx@lists.linux.dev>; Thu, 19 Jun 2025 07:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750319744; cv=none; b=eKy1Y2rNe371sG3hcd42UEmUTzREsnuXhR6GbNRBeIwQSGi+m7FeiqqdPFtUkmgTk40r7jy+Aw+sr6C/zRW3XOtgZk6NbbOjmfgP0sBDsUGGioUDDIk2RysskY5ZsnD4zjbj9X6v7mF1Si3ZfNHudC51HWz/37i+JzlltFk6TRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750319744; c=relaxed/simple;
	bh=oyoPhoyqefrB3p9QqeabaAStTKM8c8deF2hGOQdrLlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AP5YO0LFzs6UV0oPKozsGIswNLrbVPNQN4JKEV2+FG+b3KBvq2gLrFHRJIz12qtfPeER2X/SDNrcCfSFqgVedK9l+jyv0mt8g0QuvOsFySJg1xYssqZPvFke6fSTSkw8RKPx/+97yFKvrm4sq3dX4w515deOSJDhiUnRJUm4zRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=flQ+1SN9; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="flQ+1SN9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=dzI0z+Mor5geUtGLZUIfALB2YqIZPR9sIP0s0VrIuhc=;
	b=flQ+1SN9rSoyu8C/E5IRDER1gqFwqZA+0yErsk5h7gjXXTiptUqS1o5iCkGe6U
	Q+X+kCjoZJV7aR/KWBnTfgu1fKnMcGvIhIkl1CGk3R6uSk2BrTuK7IZSx+5iSHeA
	vcfTtHPg0S+iwTy+aOI3xu9SNU7FTM/kU6zwBhJ/Sbfxs=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3l_NpwlNo_koAAQ--.3468S3;
	Thu, 19 Jun 2025 15:55:23 +0800 (CST)
Date: Thu, 19 Jun 2025 15:55:21 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>
Subject: Re: [PATCH] arm64: dts: s32g: add RTC node
Message-ID: <aFPCaQyXuBlyYcpb@dragon>
References: <20250526162140.2460122-1-ciprianmarian.costea@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526162140.2460122-1-ciprianmarian.costea@oss.nxp.com>
X-CM-TRANSID:Ms8vCgD3l_NpwlNo_koAAQ--.3468S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUnD73DUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEg9xZWhThWPlHwAAsu

On Mon, May 26, 2025 at 07:21:40PM +0300, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> The RTC module on S32G2/S32G3 based SoCs is used as a wakeup source from
> system suspend.
> 
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Applied, thanks!

