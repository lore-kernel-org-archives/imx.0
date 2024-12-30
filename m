Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E53F419F406
	for <imx@lists.linux.dev>; Mon, 30 Dec 2024 08:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735548236; cv=none; b=FHF2gx9TNq6DzZqFFEMVkuenqtEAdookVgYz/K62gh903xXX0SPQ6qazOFgsW06o7e/qsKE8thneYJOq7f02k0QllmKUbcC/SaFTwHCLnG6ZA2bV/32GfvErf4sIu98oJJvEO8EVtfL7wSIWpf6UYVvb9Qx+eWljncXdht87xVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735548236; c=relaxed/simple;
	bh=YT9lnLedSNkO2SlS1J8/pyvwTZaB9t5DYRUomBQDWSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gW8m/ZooQryVxANZoIF9I8+4IF8Te/XaCL9jym0fDVc/W5w9chpKzXPaI1PYCbv/MDMooqbTzvLWctj24qAtGzXqI7n88F30JdnAbBmWLnA88n38C9mJA79/UbU1GCJnIePDVkmeZzGpe6+tvkRz1uSYhZ+g8nzR9s+XIMEQ0ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=MPikmNnp; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="MPikmNnp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=BLeO9F5Q+Njficg3yc+UmSZTCyWn6/lhNy/KSLHUNig=;
	b=MPikmNnp9SQzEMyfR06wJUthMESw9N8wNjlTfzzXzldu38dlKjGeLjtI4HfLg0
	wg3iDDSUIGnuo/7fC6LiIJte8pX4hyrumvIOD5BCSVsHhg79cuiJi3Ao7fGAAevv
	Wm3epvDpEhXFNPBh1wL/Bbj52q9/SmNpc35QyuvLm0Y0Q=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgCnD9aaWnJnUNX4BQ--.60363S3;
	Mon, 30 Dec 2024 16:32:28 +0800 (CST)
Date: Mon, 30 Dec 2024 16:32:26 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 0/3] arm64: dts: freescale: Enable wdog_b trigger pmic
 reset for i.MX93
Message-ID: <Z3JamnfpYpHO+UM1@dragon>
References: <20241224-imx93-wdog-v2-0-622709cb63f6@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241224-imx93-wdog-v2-0-622709cb63f6@nxp.com>
X-CM-TRANSID:M88vCgCnD9aaWnJnUNX4BQ--.60363S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUaknYUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEg7FZWdyVMgVHgAAs+

On Tue, Dec 24, 2024 at 08:33:35PM +0800, Peng Fan (OSS) wrote:
> Peng Fan (3):
>       arm64: dts: freescale: imx93-11x11-evk: enable fsl,ext-reset-output for wdog3
>       arm64: dts: freescale: imx93-14x14-evk: enable fsl,ext-reset-output for wdog3
>       arm64: dts: freescale: imx93-9x9-qsb: enable fsl,ext-reset-output for wdog3

Applied all, thanks!

