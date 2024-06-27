Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D24C3F510
	for <imx@lists.linux.dev>; Thu, 27 Jun 2024 07:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719474391; cv=none; b=ob/VOYkf837EqP/TzBiB+85JEULxW4HW+DDQLejQGOo8rF3HlKkqGlmY+qjr8GtOUxWlDYVEj1V5b3MMIgR24xvapVBstmYcNy0TD+5Sclbk+6Y6UOAaBaKftZUtXEcIs/6zKMb2dlV5arG4+0e0lk0NNM9ak2tVEbw5I1XKP6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719474391; c=relaxed/simple;
	bh=9hl7XdfnuxgUw05Lbi8M3SRy5tjEHn4ou7phLlGIhMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f9khnk5S++mfbis9YlcNwQBg7ldl/T0vu//QKvZ3j5A8jDx+9GLwqyw4OLNDg8KoiVlO8nNb/ydjCeWfcI4u7kBx9nD5H+gKZwCzDftg7lvFjIzQwR6Gx3i6qqyuds7f85ZI6Sv/T/JGbgMTa2kSWOXlxbmDQD9kRBjRVwteRMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=bCWTjkhD; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="bCWTjkhD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=C1NFCWVTqKYT4fBMlQ95dp2+wCWYKMyTvR27OCmpRt4=;
	b=bCWTjkhDJp+1GNbMEsyeXp3BqUuD2s0Sg+g2ZvZeYtH3OSszrS/dF1faOx6mWr
	hzR6gskkfBYJvAHwxyO1FFh50/3uOM+2JhQ6AMtMkdgVRgRGtT3fmppDoG/gIquL
	6t5ZyvE4C/21yePuo+LmozmOLjlEDTQSzepOQjy3rMZLI=
Received: from dragon (unknown [114.218.218.47])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3v5m6GH1mw6caAA--.27497S3;
	Thu, 27 Jun 2024 15:46:04 +0800 (CST)
Date: Thu, 27 Jun 2024 15:46:02 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com,
	marex@denx.de, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8mp: Fix pgc_mlmix location
Message-ID: <Zn0YuvkauzX7FDOQ@dragon>
References: <20240617223952.1899201-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617223952.1899201-1-aford173@gmail.com>
X-CM-TRANSID:Ms8vCgD3v5m6GH1mw6caAA--.27497S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU-7KsUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRsLZWZv-cxqVAABs7

On Mon, Jun 17, 2024 at 05:39:51PM -0500, Adam Ford wrote:
> The pgc_mlmix shows a power-domain@24, but the reg value is
> IMX8MP_POWER_DOMAIN_MLMIX which is set to 4.
> 
> The stuff after the @ symbol should match the stuff referenced
> by 'reg' so reorder the pgc_mlmix so it to appear as power-domain@4.
> 
> Fixes: 834464c8504c ("arm64: dts: imx8mp: add mlmix power domain")
> Fixes: 4bedc468b725 ("arm64: dts: imx8mp: Add NPU Node")
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>

Applied, thanks!

