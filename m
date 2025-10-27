Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820FE7263E
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 06:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761547622; cv=none; b=ea+kuBk8pxW26KYSztSH4bSuXiEGGp62xoAjjF+StwfsFNVihlylwPXVpBKrr+D1ROhEPRdE91YNDeQA4v6neho5fA5BiOaJrcD6S0g9+ZFrhSU402lGrVLOru8t2Dao34CBJjG+l7N2If/ZdKy/VGd+HuiHJVw0AGmIhSgGtA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761547622; c=relaxed/simple;
	bh=bo3NOIF0t5gaXmQ1xgkCi5tl9D9o3HjrADLeEVuRHXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m8CFR64pRDQe7blICOhaNcE4VZdG6/M62jziADKxfq//iW/KgoYmQ7lHXPVTtj2KMjb0nHhlS0XHbboNiNpXDdNv+hA6e1WgTX5S9IREAQ6Ei8D4pAcIF1umqXgW3WN4Ea2EkAQ+oT9FLc+SCDAH9fANK0EoG6G9DsjrBuV81zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=qVfXX4rB; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="qVfXX4rB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=551Y0v0A1o0aoP7KQKW2C4ibdjJ4FOICqXnj3ewFFF8=;
	b=qVfXX4rBeLJN0ings7Be1Q3eF2slGrTx6sTbjvp9PVatYv8DCe8beRSrrmW1KS
	Fgi8TYY6KNi0zaBPOZACoqrTR2aQh5XYwnWPrATqCHdL+XONAA5CZQW1m3BanhpB
	l6QjSq9MGLzrboCneaBotGd7pjyDeZJR573lh5tcnbQDE=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with UTF8SMTPSA id Mc8vCgDHnlZUFf9oEY8_AA--.44029S3;
	Mon, 27 Oct 2025 14:46:46 +0800 (CST)
Date: Mon, 27 Oct 2025 14:46:44 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: imx95: Fix MSI mapping for PCIe endpoint
 nodes
Message-ID: <aP8VVMFRTeQILNuq@dragon>
References: <20251017203947.2749779-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017203947.2749779-1-Frank.Li@nxp.com>
X-CM-TRANSID:Mc8vCgDHnlZUFf9oEY8_AA--.44029S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUO7KIDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNBZ02Wj-FVZDEAAA3I

On Fri, Oct 17, 2025 at 04:39:46PM -0400, Frank Li wrote:
> The msi-map property was incorrectly applied to pcie0-ep instead of
> pcie1-ep. Correct the msi-map for both pcie0-ep and pcie1-ep nodes.
> 
> Fixes: bbe4b2f7d6533 ("arm64: dts: imx95: Add msi-map for pci-ep device")
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!

