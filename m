Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2901E38384
	for <imx@lists.linux.dev>; Tue, 22 Oct 2024 01:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729561675; cv=none; b=NU9RXgWciH/3E+7vQuor4emcOW901Pz4ZNsXUIlPJ74qfnahpBfHkkbI14BWyr7uQANkKCNK4j5iTfYgRhTgZqGHZb86+lnzPf9m4GQbLY5+EdvUEDX3bBrk0Vk9Oi7gpzJ2TiwPzoAZZZvrntEeCSGnNk3X25o6L7L65NBiVB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729561675; c=relaxed/simple;
	bh=hqYD/CBNsaLsrn8FBvCiBFGdvxlp3H8BJorx44bx5xU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o3aA0Oxo69P54Hdn20vMAKmaXwJhjl0KbGr+qfFp4OgSSJnm1XW3trjkXiix+K36YyAe8CrSacoSG5p8zfp2lyr6spPZidVoDqyYtiTGa1SBma70QjqLBaQht4p2RtASZ8o2yIAfOI6P2Ne/HtdpuvIgmkJQnuhhOBR7aAsuCRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=eol339eT; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="eol339eT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=eWBEveVJM0G1RyM83TGGBhWjSPPu5+wqEZFI9XnVW1Q=;
	b=eol339eTJt+loXgGdojJkVLcrpCrYmvbxfw8lfFRrttEejnU1HKsht0B+Gfr4T
	rfbj9cr/5vRhoAL15QRVv3E53VTHvzk6nQ8xA0E3E53eBk51u94sY4eLIJNCnl8B
	ijVJ5BgUHhmKlbKSRFz82z6qJBqeYumEztB9zxiocIYDs=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgCX3XwlBBdnaAaSAA--.5191S3;
	Tue, 22 Oct 2024 09:47:18 +0800 (CST)
Date: Tue, 22 Oct 2024 09:47:16 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, kernel@dh-electronics.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: imx6qdl-dhcom-pdk2: Fill in missing panel
 power-supply
Message-ID: <ZxcEJIZVdMSxbx27@dragon>
References: <20241015232509.101206-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015232509.101206-1-marex@denx.de>
X-CM-TRANSID:M88vCgCX3XwlBBdnaAaSAA--.5191S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU3mhFUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAgaAZWcW3kZhjwAAsm

On Wed, Oct 16, 2024 at 01:24:51AM +0200, Marek Vasut wrote:
> Add missing panel power-supply property to DT to fix the following warning.
> The power supply on this device is very simple chain of regulators from the
> main 24V input, describe those.
> 
> "
> arch/arm/boot/dts/nxp/imx/imx6q-dhcom-pdk2.dtb: panel: 'power-supply' is a required property
> "
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

Applied, thanks!

