Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90F7FF9CB
	for <imx@lists.linux.dev>; Sat, 31 Aug 2024 13:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725111398; cv=none; b=BhbB2TSgB0et9blzifHH5upVOIYjRc2yKTgNEL9rEdK9pZgRQUpZ2eSXJgeZ54MbMKgctp7gEiqwl6T2brMe4+8rjDDDuB6FZH1RM5HOEScmFhTzPZsJABGcnMvHSZaOWAvgXVzm8QPE2nRy56PQ6WzanzdgIb+K9Gvv/sbfcz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725111398; c=relaxed/simple;
	bh=n5AUtF3wVZ4zwqbNzHcgWSVLZJ+mR04ru7iPNodVzCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YcsBN++4H1YqA2IRf6HIPdSjf3g3aUXOcIXFuSrtpe/RhKutZ8Bdb9BCfG7fLR70FoWsoK2v78dygMU6CgoMxviLZsjnuA4qcxhZC7gd+ZyCqQW7EadEjvgIIQ5/zmMLxWl86vzHRICRmrrdBJ4jZUe52eH/hRRangYMiK/l9uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=oqAx2HDj; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="oqAx2HDj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=qsT7zp/cpYrrsz94pmaUvV+m7ImMKNji+k7TcHWFw64=;
	b=oqAx2HDjYnj+FPZRec5gYVQ6LV9Cm+CQNdJ9zhWTawSy9qeGFpWVpL/F7FdYq1
	OdvzNOWvPt3pHMxBFFLjz5waGCWEnVkAOp9NwAGd/J7DOPfByaXxbiNto+CBxQnx
	SZ6ssvOOY63NDmKaDu5tbSVFIJXHKR/TtVvj3nB1ISz0M=
Received: from dragon (unknown [114.216.210.89])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3Fz9QHNNmI9M7AA--.11226S3;
	Sat, 31 Aug 2024 21:36:18 +0800 (CST)
Date: Sat, 31 Aug 2024 21:36:16 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8mm: Update Data Modul i.MX8M Mini eDM
 SBC DT to rev.A01
Message-ID: <ZtMcUDxUm4ZoMZbV@dragon>
References: <20240818203029.96035-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240818203029.96035-1-marex@denx.de>
X-CM-TRANSID:Ms8vCgD3Fz9QHNNmI9M7AA--.11226S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUIksgUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEQtMZWbS-GE9EQABs3

On Sun, Aug 18, 2024 at 10:29:52PM +0200, Marek Vasut wrote:
> Update the DT to match newest Data Modul i.MX8M Mini eDM SBC rev.A01
> board which implements PHY changes. Keep some of the rev.900 PHY node
> in the DT so that a DTO can be used to support rev.900 boards easily.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

Applied, thanks!

