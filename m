Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8CC1B87C9
	for <imx@lists.linux.dev>; Fri, 11 Jul 2025 05:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752213278; cv=none; b=MwSeOeCj2pO6RH4Bbw/uQJALhe8lWzOFBGpM0T/OeIEFby6wpN4/8rf55gqJA+72PlD78GNJmmfbEd7vmqocGuH98ZvxArLqChJ3OfTDr5OK4SMF2AovvYN68pE3oSmFJ5dvNFsaoRvlROsFHXFFAAIFSb0C2QYGEns5y31D1y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752213278; c=relaxed/simple;
	bh=sjdOPV0hLXQwoBTOcCwn5qWdkG5GleRK8fMScamA74U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tUNP+N0O6o4AYaDEKoD5P6x3Sk7ON8jdh08HihWWTGLnvHxIaafdNPsGQxhBgulKSPFD0ZwTZ5H9WxDe0VuPliatEZRnPkqLBSqhe2D8LaZRvyXwA0UxjjJMq0f/KHncOHphr6UX7VxvSaotHhCj2i5IIZmcgqUvNwGjXKi3kvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=JEOHwPFK; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="JEOHwPFK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=IGfVJrIs+Pij/SWFkdNGobNKoCD6jqjK+ey/0S2BwBY=;
	b=JEOHwPFK3FtaliTRrTP5o4Cqu5ZfZCa+gFJwL4S1tbP2OKpX9u0Q20KeDXG+GH
	LtoaIm8kpOAWLfQXXIldIj75eZpmfT9+Q5rhuj53yiOHuurlyhMaEDgalIoX6f4H
	lGksK+Ydj27yG6QYfbjOASlv5/r1Cr7/bIJeKVICSdywQ=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCn1rL6pnBopvJQAA--.25092S3;
	Fri, 11 Jul 2025 13:54:05 +0800 (CST)
Date: Fri, 11 Jul 2025 13:54:02 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Robert Chiras <robert.chiras@nxp.com>,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v5 12/13] arm64: dts: imx8q: add linux,cma node for
 imx8qm-mek and imx8qxp-mek
Message-ID: <aHCm-sAwdHHlbzdM@dragon>
References: <20250522-8qxp_camera-v5-0-d4be869fdb7e@nxp.com>
 <20250522-8qxp_camera-v5-12-d4be869fdb7e@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522-8qxp_camera-v5-12-d4be869fdb7e@nxp.com>
X-CM-TRANSID:Mc8vCgCn1rL6pnBopvJQAA--.25092S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU5l1vUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBB6HZWhwjvpRUwAAsW

On Thu, May 22, 2025 at 01:56:50PM -0400, Frank Li wrote:
> Add linux,cma node because some devices, such as camera, need big continue
> physical memory.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!

