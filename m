Received: from mail-177132.yeah.net (mail-177132.yeah.net [123.58.177.132])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B058A48
	for <imx@lists.linux.dev>; Sun, 16 Jun 2024 06:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718518976; cv=none; b=Dq7Cl2djz0aPpntHs02f1RoagDqHxdmFI9QNyucDenr8yrraYze2MbvU8cV+7bcGasKEI3ExoDYycsUzJvqKH1R1h2hpqrIgkrQ9N2NH4W1ODav0t4XzmWK7iRU3SIItq44GAieyo9KHyCdJsIbY32SW+yPs8BKRfVGUYTMDvIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718518976; c=relaxed/simple;
	bh=Mknlk//x2xNtEoqP8k9y55wgH6UtIrOZ6sg4zR/FQyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CynovN+PMuTEh2GDW5/eeh7X8tSVQkk3xoFxTh+qmnWFJJQmY8cWCosi52DrcXzCxgomSMcgUfBdh8u2By9p6jEHY4HzvADiRsm7zVH88Dqh7cbOKW05fx71d94WV9bD5kdh+Fh0KuJ6EkwjUUNHOeesIHXzr3ek7HpS+TZXl7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=k9iEiJnw; arc=none smtp.client-ip=123.58.177.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="k9iEiJnw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=a31zCvY9cwbcKQGBKnLRpRlPlfGDPY5SQt+DrzR2m0Q=;
	b=k9iEiJnwKtM6yYKFZ/qYzFsDLAa/wc2/c94N4cJ+/sPJTPxsUAPxuebmrc38xf
	KULhF4qmeuXMV4M9pC7lchA3mN3354SVCMfA2oM9VoNb7QztOy9NYF1Ycg2bkzBA
	xR8OycM5dYvYhArGGknjOEsSwYZdyTCl3KFlH6hw9gqqQ=
Received: from dragon (unknown [114.216.76.201])
	by smtp2 (Coremail) with SMTP id C1UQrADnL2mghG5mpb_ACA--.10294S3;
	Sun, 16 Jun 2024 14:22:26 +0800 (CST)
Date: Sun, 16 Jun 2024 14:22:24 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] ARM: imx_v6_v7_defconfig: Enable drivers for
 TQMa7x/MBa7x
Message-ID: <Zm6EoB/v4eSTknVU@dragon>
References: <20240530143722.834264-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530143722.834264-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:C1UQrADnL2mghG5mpb_ACA--.10294S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxhihUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiGAIAZV6Nn4x5FwAAsR

On Thu, May 30, 2024 at 04:37:22PM +0200, Alexander Stein wrote:
> Enable drivers for devices/features used on MBa7x.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied, thanks!

