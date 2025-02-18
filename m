Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B0681B042A
	for <imx@lists.linux.dev>; Tue, 18 Feb 2025 05:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739856419; cv=none; b=YgRi7kQhDJhpNl0aMq9YkHkUmxk0r68Rf4Yh0UFwRQ0aOdCqH0DQY+P/aqZS9lH+bWOSgk7NWNRI85ACYTQTkDyuLgAc0QZ8EbsL89zCp2FHCEo/noAqo7Gs1ROThduibfmoLuAAtZuZAwJMbh58LlpG4D5TOXFVyBzIZgVFP74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739856419; c=relaxed/simple;
	bh=tZ0HpU3MZgiWbBVKSa853kjFuS+3oWsTAEhBNwlQ3YE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q8h6T6zKneHpMS5p+Bm8ENzOoHlqsnz7wyOR4Cq93mBSw2XfZzeaAAWFUqzRSkuVHSznllTAuQZZsaMSUqNlWrnpytgS7mrG5sqlcr1+KoaUfsMxTf3snlWiGjFA4hTh/YSNWRR+L3MeGbdN3g8mAoul0Bm/iXy0PGKOvIWLKZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=a7+hdU1D; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="a7+hdU1D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=5Z/rv6kgbqoEOS86d4A1Y0Ox+de8Jp1ZNiq3e/n2Z+0=;
	b=a7+hdU1DqXwpOZMxiVczG6MxPp7lyP9gTrPGKiYsFe6vyVLv6puTFoIxIja/Sy
	Laq+l91Au5+e6XtMLnv8steg8BnrNC27fF9OShYZvPVakLzXCLzcyWcfpIyN+476
	VX0/hc0rO0snjY/aXe3/kOAFzD0cnMv/LWEmplhkNfWfc=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgC3WloFGrRnlE02CQ--.18058S3;
	Tue, 18 Feb 2025 13:26:31 +0800 (CST)
Date: Tue, 18 Feb 2025 13:26:29 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Subject: Re: [PATCH 0/5] TQMa8Xx update
Message-ID: <Z7QaBZ4kWTBrVOEo@dragon>
References: <20250107140110.982215-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107140110.982215-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:Mc8vCgC3WloFGrRnlE02CQ--.18058S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUsmFCUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEhj3ZWe0E1YVmgABsA

On Tue, Jan 07, 2025 at 03:01:05PM +0100, Alexander Stein wrote:
> Alexander Stein (5):
>   arm64: dts: imx8-ss-hsio: Wire up DMA IRQ for PCIe
>   arm64: dts: tqma8xx: Add vcc-supply for spi-nor
>   arm64: dts: tqma8xx: enable jpeg encode and decode
>   arm64: dts: tqma8xx: Remove GPU TODO
>   arm64: dts: mba8xx: Add PCIe support

Applied all, thanks!

