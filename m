Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EC7188596
	for <imx@lists.linux.dev>; Fri, 25 Apr 2025 03:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745550235; cv=none; b=saaNBG1E+5WOMTB9zOOW8HZKjqCC/DcetlWGaRIkC2vkxNvL8//xDdth/+2UPdXOZTb5JzVnwciIN2out9OtRg7/ECVSmbB7h31CurJjSaC52e9Jf8LwdjgSEKqft3Ocv9qjMytcOZCeCZL5JRSZPwevEFLeuGl5ShyOHKw7bOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745550235; c=relaxed/simple;
	bh=YUh/cuAE81XqoCZ65QZiyr1IrGQd8iZowQB2p0pWx2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LJIKrd/VW6H0G6nhKNTZxES19GCgdEG4xYPLc5fXa/xjLk9bey/xg0qIQTdLop0bcL3VekhTO7c9B2EcH1hpD+kTItVa+ia5utGrEoo2QjWXTNqtXng8KoEVDY00B3vYtmMBtGIpyS/F+evxY5XG9KFnNk8Na0I+Y6ZIxudMwmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=VvxJ+dhM; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="VvxJ+dhM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=qxiKMycuA/S/b4aduDKHTJVt95lznX3mP7Vus3psjjw=;
	b=VvxJ+dhMu6cRjtBkTzfZ+9gf0j6+3tBsuLq/z85fsYxjPQtBrikxTqdRjlaAri
	E27qhrS9dWDA2Fy36ElNxP+fB3I/aLI0C96hOTSwR29LWDMxkd8j0lnDjyTR51fd
	GylpjBrEnGjkmhVbR8POr+R5wE1dY0PYyP2FRHHqW3UrI=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgAna+J2+wpoIiTtAw--.35636S3;
	Fri, 25 Apr 2025 11:03:19 +0800 (CST)
Date: Fri, 25 Apr 2025 11:03:17 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: max.oss.09@gmail.com
Cc: max.krummenacher@toradex.com, Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: imx8-apalis: Add PCIe and SATA support
Message-ID: <aAr7dQH5O3VY7+N3@dragon>
References: <20250416151353.1692373-1-max.oss.09@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416151353.1692373-1-max.oss.09@gmail.com>
X-CM-TRANSID:Ms8vCgAna+J2+wpoIiTtAw--.35636S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUx7PEUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBQ6ZWgK1S+unQAAsk

On Wed, Apr 16, 2025 at 05:13:41PM +0200, max.oss.09@gmail.com wrote:
> From: Max Krummenacher <max.krummenacher@toradex.com>
> 
> The needed drivers to support PCIe and SATA for i.MX 8QM have been
> added.
> Configure them for the Apalis iMX8 SoM.
> 
> The pciea and pcieb blocks each get a single PCIe lane, pciea is
> available on the carrier boards while pcieb is connected to the
> on module Wi-Fi/BT module.
> The SATA lane is available on the carrier boards.
> 
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>

Applied, thanks!

