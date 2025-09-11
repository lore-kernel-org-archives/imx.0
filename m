Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B764A3FF1
	for <imx@lists.linux.dev>; Thu, 11 Sep 2025 02:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757557123; cv=none; b=No1FPreezSRwlPJYEO4ZQGp6xtewqMdFJ0Y6dJCDslrpoIrvqRssQd1hZGMWlm0IkwCmsa9rMKLv4W+5eWWR9e4xVNBzeg5RArKUC299ImoCd/0PCWBuYucI3zwXMXECXteRdoALImHvbmcxxysfAKkBhkbMUnx4OyPw23YMaV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757557123; c=relaxed/simple;
	bh=i92KFh/MlBRwAUuJTW7FDoIG9X1z05XchHeork5ON40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gpm3vI/nqfmQYgrph8o3nVvWmE15s8OwonlnGO3f17H1bSL/jznh8v4NxxaZy6YP1eW7ROJ4kQfP1binDAnIpKnUQKFhLq0Hxp4DeHuEKyc5hgwWMwBAicz5Ky4STfmwXzMHuE74ohnwawdr3ON37IUMpFz5JAj6nMB+VluOJw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=KU++mzmB; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="KU++mzmB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=1sObv9PqypU8I4bvTZcjYI9PEpooVXChWMhFG7PYJt0=;
	b=KU++mzmBdtxEIjEgUkMjy47CTM/a8w6iqjmwb65MHnOWgPQZ8H67yG7JiSCvc/
	v+CgGCTuwTJk/FMfsRfWyLw8Af4k9VhrbEbe+Yz152jcsoTE0JLG21lhW0g/W0mY
	fUNlo6NWrt4ZmqZ84JKpEvMFIb3UraHouj/qLrG9FAfUs=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgD399huMcJoGapOBA--.47236S3;
	Thu, 11 Sep 2025 10:18:24 +0800 (CST)
Date: Thu, 11 Sep 2025 10:18:22 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"A.s. Dong" <aisheng.dong@nxp.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: fsl: fsl,imx7ulp-smc1: Allow clocks and
 clock-names
Message-ID: <aMIxbgrbF4HUy2_w@dragon>
References: <20250827212446.94571-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827212446.94571-1-Frank.Li@nxp.com>
X-CM-TRANSID:Mc8vCgD399huMcJoGapOBA--.47236S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUOTmhUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwvFZWjCG0k9lgAAsz

On Wed, Aug 27, 2025 at 05:24:45PM -0400, Frank Li wrote:
> Allow clocks and clock-names to match existed dts file.
> 
> 'hsrun_divcore' should be 'hsrun-divcore'. But use '_' to keep old dts back
> compatible.
> 
> Fix below CHECK_DTBS warnings:
>   arch/arm/boot/dts/nxp/imx/imx7ulp-com.dtb: clock-controller@40410000 (fsl,imx7ulp-smc1): '#clock-cells', 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
> 	from schema $id: http://devicetree.org/schemas/arm/freescale/fsl,imx7ulp-pm.yaml#
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!

