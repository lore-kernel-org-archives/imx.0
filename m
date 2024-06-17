Received: from mail-177132.yeah.net (mail-177132.yeah.net [123.58.177.132])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A2E823A9
	for <imx@lists.linux.dev>; Mon, 17 Jun 2024 02:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718591325; cv=none; b=XMFZ9rV1NAwXh7uErM8BbS+pcKPvtl1Zk3jAtGG5+BPb7lT6KME8rvbNXAfqMLVtJHsyXvkJisJJbAAjjPX5Tx6sU6epJhUhjU8S6+ePPLFhcKbJNoNuriTLSgL1A3FOo1cN/3+VsAlvERGdR2myLSjRBJDVT2tspaTAcM+v3oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718591325; c=relaxed/simple;
	bh=1QXC4KNQMHpF9DSVGVvMCJu94ZNsyCi4w5KcmkvxCMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t2Ki/HnR/ZTWPFk6xVcBNdxO7jf9AQcU1m802bFpzQwE69O16+wCXPMkYeIaZgH8GwFOi+MJLZprzH+Tbg/dV0u3gFGul+1ccRvvN5ZYVbfRXNa414H7PD6/sPHuUwICGbJv0hUf+Ko5CUOyVpXGi+3Br6r+aoTWRd4k91c0mI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=ADO9Yjoh; arc=none smtp.client-ip=123.58.177.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="ADO9Yjoh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=2F2+YpEMxCXymd2z6O6l2Gn8jzxbNXIUvmgbMNydTVw=;
	b=ADO9YjohmX1pXp3VrO7WYLwEUH7dIytsc+lC9kqFlexqHk6HzfiO1rFwRkBMxR
	Nz8HxKPyLr++8v5fXq/vxD6RSgZk6TvMGR66LYJppd5UMPip76TDRgzijF11/UDH
	2rQbFJKKvHJWdNFtxqeWW99hnCIh5Ikqr6XXwvQ99Wo2M=
Received: from dragon (unknown [114.216.76.201])
	by smtp2 (Coremail) with SMTP id C1UQrADHLhhOn29moyjOCA--.3991S3;
	Mon, 17 Jun 2024 10:28:32 +0800 (CST)
Date: Mon, 17 Jun 2024 10:28:30 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Adam Ford <aford173@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8mp-msc-sm2s: Add HDMI output
Message-ID: <Zm+fTrH7Hrkahz3F@dragon>
References: <20240612-imx8mp-msc-sm2s-hdmi-v1-1-6c808df5205d@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612-imx8mp-msc-sm2s-hdmi-v1-1-6c808df5205d@bootlin.com>
X-CM-TRANSID:C1UQrADHLhhOn29moyjOCA--.3991S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUIku4UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiDRABZVszXmPK-gAAsY

On Wed, Jun 12, 2024 at 12:17:27PM +0200, Luca Ceresoli wrote:
> Enable the HDMI output of the MSC SM2-MB-EP1 carrier board based the
> SM2S-IMX8PLUS SMARC module.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Applied, thanks!

