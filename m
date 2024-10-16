Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5B405221
	for <imx@lists.linux.dev>; Wed, 16 Oct 2024 05:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729058259; cv=none; b=Z/+wEX9IxuUKVM3+xNBiAQd6ciW5FDOm02ukjwxln1c6kmp3yO7BUb/Tn1EEjcrhOO2zUB2rpWudRZ7ByhR4lu9pcHQF/PvHprabAIrrVL1XVKfVwaUBEcTQJiU9rkp0ru5JB2hVu+el7yK+G68gAPnZxTWs8BSs0zOty+cB9qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729058259; c=relaxed/simple;
	bh=FBN2kl/WzmXyuFZE/grMu57N0gK5+Swu06SfieOmINA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WbjjTDlb1VjveOiuWP4o+3GuMBw4GFIKI3ZMtXsQQIMoGaqW69r0wXW91dIR99Rdn5XC/u/RbGiQ11bsqTSkbphxFUceOXZhlHo9kAyu/Xy7T6m/WjQfEHUBkKl0aM6Y2pm2NcG6kV9Ho7Gf1URV68vBbseXuYeXXYi+1Ew2rww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=eh5M4We4; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="eh5M4We4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=adk+fAx+LK097goAKszCL9jLGtGKHbBuW0Xq1csUd1s=;
	b=eh5M4We4ZrSRQ6XHkEyQOQsFrZN0zs56RS8tQJYH/F6jEj41ZoOFMDo2fOdf9s
	V1O5a7uI0Bv7TMqYSr28ZAA0GMs5BHE/gbYo3lsjuO0Vll0/B4xn9mmSZktVV9T7
	HBgd5jGe347X0PS654cvnHVbPIOtSY4KWFuZpavrQMa+Y=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgCX3b2dVQ9nRewXAA--.356S3;
	Wed, 16 Oct 2024 13:56:47 +0800 (CST)
Date: Wed, 16 Oct 2024 13:56:45 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Tim Harvey <tharvey@gateworks.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8mp-venice-gw74xx: add M2SKT_GPIO10 gpio
 configuration
Message-ID: <Zw9VnRyNss59AD/F@dragon>
References: <20240905183228.517422-1-tharvey@gateworks.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240905183228.517422-1-tharvey@gateworks.com>
X-CM-TRANSID:Ms8vCgCX3b2dVQ9nRewXAA--.356S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVpVbDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEQB6ZWcPEbbV8QAAsl

On Thu, Sep 05, 2024 at 11:32:28AM -0700, Tim Harvey wrote:
> The GW74xx D revision has added a M2SKT_GPIO10 GPIO which routes to the
> GPIO10 pin of the M.2 socket for compatibility with certain devices.
> 
> Add the iomux and a line name for this.
> 
> Signed-off-by: Tim Harvey <tharvey@gateworks.com>

Applied, thanks!

