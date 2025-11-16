Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8757156661
	for <imx@lists.linux.dev>; Sun, 16 Nov 2025 09:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763286142; cv=none; b=SnQin84fZW5pbRluW9NUh41AeflRT8Ln2HYSBKfADomezIy9HCfIX81VHaGRV+h1CCYU1bjWg0nWlSUiTHC3mYfGXT5BwNRl3S7KVCSUdjAN9jase81A/+KhXHYijF9WHSWu7dqz/FGcew2pjHvtdebHCi6JmR7ZxlK3hASErGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763286142; c=relaxed/simple;
	bh=0ibplLhd3v7Iw2zYmlxRjCn8CTztadGu2ZrRMrRE1/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uf8eV0HZHMAiM08GxtdmrDU9shK0b6FqC5OpP4B3vouoes9qijN0p6iQ5C8rHEtwETwTtNGNI55zMipjS/28n0kJGpgiJxBWoqD+4OGn54ri5F5q4AdqhsdJSIBlgPfbKXCh2Csad7FTmGkBsc5yKc+eUgS/6iT/z3jI5SkNLHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=hZF0SMoU; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="hZF0SMoU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=x/0v29LNdkN3c0TsJQzVdp5QigjeZCzTwl5nAgC3p+Y=;
	b=hZF0SMoUF9Nc5zFp+OVBVeCULFLpJkLEXZ4BuBG+Tpv6a3dLAMzAX+YGYWscuS
	nvJ00yMJDdqOS5rmVgzVYuX+AhvO7Vbi2i+klBrByWIjU5AeyNsUl/3IzSyZuaUv
	Qu38lzPn77Cd6G5yekOhEN+IeYviWuAloMJoG3E5AiiC8=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgCniOponBlpAo0jAg--.8173S3;
	Sun, 16 Nov 2025 17:42:02 +0800 (CST)
Date: Sun, 16 Nov 2025 17:42:00 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH v2 1/2] arm64: dts: freescale: imx93-phyboard-nash: Add
 jtag overlay
Message-ID: <aRmcaMwxOUotXx7a@dragon>
References: <20251028115820.3165399-1-primoz.fiser@norik.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028115820.3165399-1-primoz.fiser@norik.com>
X-CM-TRANSID:Ms8vCgCniOponBlpAo0jAg--.8173S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUra9aUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIAvhR2kZnGt6DwAA3-

On Tue, Oct 28, 2025 at 12:58:19PM +0100, Primoz Fiser wrote:
> Add overlay to enable JTAG pins on the board's JTAG (X41) connector.
> 
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>

Applied both, thanks!

