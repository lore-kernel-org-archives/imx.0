Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAD21487E9
	for <imx@lists.linux.dev>; Tue,  1 Jul 2025 13:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751377054; cv=none; b=f5gHFqTnRrrUQHtyn1d4rs2BErFLl7K8JXW35ONKPWKU7/S5L/Gl3il16QiX1e0msTf/DYuJe1mfK/vqK0NCE6NCIYKIamBwZmGCy20UIJr4XBLl3eY+mvBRX0vKQ334w+ZhEtQZPJ9awyZYxdumLQHsux0KJcduvtltDV6FppQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751377054; c=relaxed/simple;
	bh=xXJ+4r/mndrrBd4NJCUWqI4Iip4PrylMZolQjOynkGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GFQgQgKJQUG+syVwAvsLsG2IAU/prgxnwQ4WX6UZugOtbGpl63n1ry7dwCv7zN3m9jh0MGYJFYK0d+i34ZafNMuQ8lx5s+qOTaVtSLNnqnzJwgjmNzKbEcYwLkN327JOuQIrhUKezYbkRZyv9DP3m2F3uexfbeYQ+zdkDnv34wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=gzWZYDLf; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="gzWZYDLf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Q7ztE35OyDH09bsd9BKX6KL/UpDZEx4le33a86DXqi8=;
	b=gzWZYDLfLHUZsX+mSJguhIdK6R3/deiH2vVUhnxK86Bxmat3zJL7GJIA62+cZB
	fXxmq4o3DNa0S6axfUXcS+tIUX0+fFrcqW+iMoF1WtxTbyyp2ZJw1z+jJRr2aAP8
	Ouus4i/MbTKOZasV2nPBiBnYKHLdF3NLtg2qGNIp2sGfs=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3vwmB5GNoGAkcAA--.36385S3;
	Tue, 01 Jul 2025 21:37:07 +0800 (CST)
Date: Tue, 1 Jul 2025 21:37:05 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Tim Harvey <tharvey@gateworks.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2] arm64: dts: imx8mp-venice-gw74xx: update name of
 M2SKT_WDIS2# gpio
Message-ID: <aGPkgXt9gP0sAnLl@dragon>
References: <20250604225104.1429156-1-tharvey@gateworks.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604225104.1429156-1-tharvey@gateworks.com>
X-CM-TRANSID:Ms8vCgD3vwmB5GNoGAkcAA--.36385S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUOksqUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIgNMsWhj5IMU3QAA35

On Wed, Jun 04, 2025 at 03:51:04PM -0700, Tim Harvey wrote:
> The GW74xx D revision has added a M2SKT_WDIS2# GPIO which routes to the
> W_DISABLE2# pin of the M.2 socket. Update the gpio name for consistency.
> 
> Fixes: 6a5d95b06d93 ("arm64: dts: imx8mp-venice-gw74xx: add M2SKT_GPIO10 gpio configuration")
> Signed-off-by: Tim Harvey <tharvey@gateworks.com>

Applied, thanks!

