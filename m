Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122692F4A16
	for <imx@lists.linux.dev>; Fri, 22 Aug 2025 09:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755855974; cv=none; b=Om1ljT3lQ9Gb5+/0kBMFfNo4iC8bYeZG1twAHNUCu494W62pao3BRBeorsmZXwddcyZ5AkHrMuU4UT0q8wB0wc2D9I59s1a/3X2dOdIL4OBS8/XbSYUGnAQedcaomrOU56BRsvuEBaNqJ7bI/YMaiMy5zJ/fi9GoGFp0nweteBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755855974; c=relaxed/simple;
	bh=hZIFeZM9VhRbmPOPc61DxNlifcA9CMWh824SMbcFkIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OW32dPXyJE9xcaIC6ADlJaMOLnwNHVdXZs3G79s2uCkgKFy+Iyxttet30mBgiVcyfuZRHMTZwLxwYsmIqD6XJxAe8E8mns9axXMHIID94Yc0V3J9NDpkudpMkiGKTCQlSr8DRR2xrjjpNOgZULCkP18/ZoPXIbI/S/UK7dhPWm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=p5fo/eP/; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="p5fo/eP/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=clS6Cdmf4KgVVXMdWWXj4Q3e/QPaKy98Ok5lrn1DW90=;
	b=p5fo/eP/9e7BjfxyPpREoZ4SPwJdTa20+LUnauDJb9TqbZLH4JrYuqBmItEJl2
	GjhaH+IKU6bJz/WEA+U+Mr2qXX7yb1n4hfT4bwpOg/lKjANdSyLYBZGVO3qIBeY1
	ySmc4cdeQlEQl2E9S+MsLaJftTyJH7D2wVCYokbcymweQ=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDHr_hJPKho45soAw--.10809S3;
	Fri, 22 Aug 2025 17:45:47 +0800 (CST)
Date: Fri, 22 Aug 2025 17:45:45 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH] arm64: dts: imx95: Fix JPEG encoder node assigned clock
Message-ID: <aKg8SS5X2t_jXnDh@dragon>
References: <20250820162747.209626-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820162747.209626-1-marek.vasut@mailbox.org>
X-CM-TRANSID:Ms8vCgDHr_hJPKho45soAw--.10809S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU2LZ2UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNQtlymioPEu4JQAA37

On Wed, Aug 20, 2025 at 06:27:26PM +0200, Marek Vasut wrote:
> The assigned clock for JPEG encoder IP has to be IMX95_CLK_VPUBLK_JPEG_ENC
> and not IMX95_CLK_VPUBLK_JPEG_DEC (_ENC at the end, not _DEC). This is a
> simple copy-paste error, fix it.
> 
> Fixes: 153c039a7357 ("arm64: dts: imx95: add jpeg encode and decode nodes")
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>

Applied, thanks!

