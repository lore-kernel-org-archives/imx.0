Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 919EF154454
	for <imx@lists.linux.dev>; Thu, 17 Oct 2024 08:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729154848; cv=none; b=X8thL7kQ8SBZwDX4iosSLfB8g1piyAXqCHJeiCIynEw9d/phBdEKZDSODNkFywn0v8J96jzW1vP07CPrYnJAecA8NxchBsHmtK6bAodPPbKPPgo5SeP1F2UEq3pDFwWgv9bPM3tMVZBN+uwo0PSbc1oGwLjGlrA8ZaEw8GXuL18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729154848; c=relaxed/simple;
	bh=1ESagQClO2AWMP+Hg8twSTNPEQ1rgZEFFyRT9VoZX/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gLSHCSZHsti4NngwmkI13GCQjVQdHtaD2x70GKGGOd0wYtiYtAT0p633y2PhhDUQdMpMRaPO0Qb/EOo4EwfqQpB6wPExhoQF4DMZ74EIfFwgos9HwbqHEZDOQm9G2/A562DnepJHk0V+IRbn+hLiN0q1eoZodCMPdRQaMo5PJAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=IAPob5fr; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="IAPob5fr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=4lsm30lYRi4dwTD4J9fQ9TfYvcm5Gfz4W7SeXm0DybE=;
	b=IAPob5frcFBuh99vbolYyAQRuUGs+LMfdFHOyCGoB0bqq7loVBX3OgOt4jtOaw
	YxqUIqzYYcBccwSAE5k0YXpNxX/O+2w3O8dmQ84XVxYyR5+RD0Vn64HDDl3yM2EE
	qldzw1wTidHgsL3mHWhuVpqjWS3y96WJxHMHdxxDISMOM=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3fgP3zhBnfzswAA--.1282S3;
	Thu, 17 Oct 2024 16:46:49 +0800 (CST)
Date: Thu, 17 Oct 2024 16:46:47 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Yannic Moog <y.moog@phytec.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH] arm64: dts: imx8mp-phyboard-pollux-rdk: add gpio-fan
Message-ID: <ZxDO9wPQZOsXcJ6b@dragon>
References: <20240924-wip-y-moog-phytec-de-phyboard-pollux-fan-v1-1-9ea6ec43f27b@phytec.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240924-wip-y-moog-phytec-de-phyboard-pollux-fan-v1-1-9ea6ec43f27b@phytec.de>
X-CM-TRANSID:Ms8vCgD3fgP3zhBnfzswAA--.1282S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxCJmUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgl7ZWcQs0ZXfgAAsu

On Tue, Sep 24, 2024 at 09:53:04AM +0200, Yannic Moog wrote:
> A GPIO fan may be connected to Pollux fan header. The fan should
> activate at 60°C and stay active until critical SoC temperature is
> reached and the board shuts down.
> 
> Signed-off-by: Yannic Moog <y.moog@phytec.de>

Applied, thanks!

