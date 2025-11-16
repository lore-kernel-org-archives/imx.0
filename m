Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8102D8779
	for <imx@lists.linux.dev>; Sun, 16 Nov 2025 12:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763297477; cv=none; b=ksXa6wtB349NA27yhagHEK0/hAdvXxIJTbzAg9HU/HoyCGknjT0fD8aacRz26J3LA+TXKG+4CQ+SosCtMz1DRWnfChOHNSI67AVLjULgaXhyL+UL6ITuP8VVBB04vNEjh1XbLCSErzuduQGN66+av0V/GPPKKbohIRqqr4kpmgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763297477; c=relaxed/simple;
	bh=0Yl91qGDqMNtl8Ry0vdas5mX8PXd48t/0w6edCjjdtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R6O0YHB1ykM1dPdACXJd4f9aam8f6RWYdCfE9/0AjCyqTBwhytVEnqh3zqjeGRW/MLwM7WvlZ0pLwawFNpKSNt1CNh6wgg4wZO5kodiqPgG6D7cZFm1ZAEtd2Q/nFo9Cq0BG9HorxXB/S83uwtca0EO4PPh2qZw/RAuWFaQrL0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=RuCZW42J; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="RuCZW42J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Mk5nILU1OOxZoG9axiju5UWDB4le/DG2DDfAwMEADGE=;
	b=RuCZW42JHwTLrOOBZ8/hs+jxRpwB//vO35CplNtWw2LtiV4Ku43XmEw/2dc5OU
	rIN2rRU0C4eNDFehQ2/2O8bRkLFCBUscViADsKrbDfEWExRXyTJJW2v86XIMwFoW
	3MYgiFMmPkEVD4pNPf3ICTUZx0jyRZehLB7eR0rB/AZi0=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgA3RNeoyBlpbN47AQ--.8201S3;
	Sun, 16 Nov 2025 20:50:50 +0800 (CST)
Date: Sun, 16 Nov 2025 20:50:48 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: add Skov Rev.C HDMI support
Message-ID: <aRnIqLtW7285gY4a@dragon>
References: <20251107-v6-18-skov-revc-hdmi-v1-0-595549e5b496@pengutronix.de>
 <20251107-v6-18-skov-revc-hdmi-v1-1-595549e5b496@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107-v6-18-skov-revc-hdmi-v1-1-595549e5b496@pengutronix.de>
X-CM-TRANSID:Mc8vCgA3RNeoyBlpbN47AQ--.8201S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUFxR6UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNAr8YmkZyKoc1wAA35

On Fri, Nov 07, 2025 at 03:49:51PM +0100, Marco Felsch wrote:
> From software perspective, Rev.C HDMI and Rev.B HDMI don't differ since
> the panel is connected via HDMI and the touchscreen is connected via
> USB. However, the bootloader firmware expects to find a dts with the
> correct revc-hdmi compatible.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Applied both, thanks!

