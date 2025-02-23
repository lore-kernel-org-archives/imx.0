Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B07A10A3E
	for <imx@lists.linux.dev>; Sun, 23 Feb 2025 07:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740296315; cv=none; b=BaNc0M27n2o5ek1/Nf80FDbiC8XN3HunNM1ADu7R2tTdVRg9eeMFgY6p138Cry96rIvOO7LS7mwizwhwUhwKhg5OsW+mpZHq1d2aeh6LK56Dwbsdz2yAS0l++AV6aBJkCxVgaUJwrCSZ+rP8XOam4VPceF3MyEcw6g3fsE1ygbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740296315; c=relaxed/simple;
	bh=i2dYoaxI8qTqb4j86RQOLybkjeou1XdI0LVEdkYI/yc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qEggcrk4dA01tIwZB2zcwoGircidB16hEj9T2cY27zQUPS/8XBUC+uYdstSxW5VdasnlU9c18C+H5ByeLH0mj/U3vmlSHqbdK1BwWaRHl0yb+HJfOwGz/KPU3m9GynBx9TONFwCkKa1msFSeI3HU/1+58EFmVSwxqrqUdn7FHqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=NJ25arv6; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="NJ25arv6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=oPXVRdAdTKk+04iwLdlaaflbSGUMVrgPOHzRGIn45yQ=;
	b=NJ25arv6TSaeOvQf8IygctFsn3BzU1ead0BXGkM/ZNb2emKqNBj2QZ7MiKFSRM
	4TEWq7VmJE/7hetNDF693lfCMLIuERGkIzwypO8oW2Rlc58WMkFT6o0lpeWJO+a1
	NUEmVZ4McAIcgXGFYsi5D0N4hL+63Yaza4qw92VJku7I8=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCXS3Zg0Lpnl1efCQ--.23292S3;
	Sun, 23 Feb 2025 15:38:10 +0800 (CST)
Date: Sun, 23 Feb 2025 15:38:08 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: rafael@beims.me
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rafael Beims <rafael.beims@toradex.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: colibri-imx8x: Add missing gpio-line-names
Message-ID: <Z7rQYN06RUFR2Xqy@dragon>
References: <20250210123134.1659719-1-rafael@beims.me>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210123134.1659719-1-rafael@beims.me>
X-CM-TRANSID:Mc8vCgCXS3Zg0Lpnl1efCQ--.23292S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxuWlDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAgb8ZWe6xy0Q-QABsG

On Mon, Feb 10, 2025 at 09:30:50AM -0300, rafael@beims.me wrote:
> From: Rafael Beims <rafael.beims@toradex.com>
> 
> Add missing gpio-line-names for SODIMM_79 and SODIMM_97
> 
> Signed-off-by: Rafael Beims <rafael.beims@toradex.com>

Applied, thanks!

