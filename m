Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A50681DF26B
	for <imx@lists.linux.dev>; Tue, 11 Mar 2025 02:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741660148; cv=none; b=e8PXM8EOrDeWh0JPMh/c/U2LUYQotj/grOWyKCQFryXe0+OESS3YnomwqKzkwH7g5IOkKsy3N4CX9MuIY+XLaQ2JhhhpPg84HkBR7Q7aFARBj6QmROy7Cvhv/+XE6LA9vJsWWAEldqLs/fM8ZjguaphHmRCbTITD4v1VGvPHwnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741660148; c=relaxed/simple;
	bh=874v8COafl3Qhv6xKrbErRRlovnYAQlx9ser4aWd+MM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f1S32ayt/NydOe5Ton3ChjDhuR6SIsv2TCYYz55Zitr1GNed++sgu9eMAZTJ+XwSVclpyTta9U9V9AuHVLnUlWm4xGn5LDZlZy46V/eHBBuPs0i22bpkzIT1HMpqIs/++mEi9VMCPr69eWIFkhXpwohB86/Kt/h+VrHLesHvFw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=VhMpyXWu; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="VhMpyXWu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=IUd1uRT/xLiAftfidXKIq5PpZVoa+Ty/sg4D9wULGPE=;
	b=VhMpyXWueRjMCzQuQzyXA8/6J8sU6SRwpZn1XOlJH7FejxOxo2i8eYYtRjDFDs
	FcWD/ydRINoqPyZHI5bd6d02I+6n/NxCufbCaQUYYQY/TDrym/maZfJKeedlfNc1
	biv8Ug1kgoyhFEDs+KoLbDoWyw1c1buG6xG3QK1yt87fo=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBXC0+Hkc9nkneuAA--.826S3;
	Tue, 11 Mar 2025 09:27:37 +0800 (CST)
Date: Tue, 11 Mar 2025 09:27:35 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	patchwork-lst@pengutronix.de
Subject: Re: [PATCH] arm64: dts: imx8mp: configure GPU and NPU clocks to
 overdrive rate
Message-ID: <Z8+RhzwHNJvUcF+P@dragon>
References: <20250204182737.3361431-1-l.stach@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204182737.3361431-1-l.stach@pengutronix.de>
X-CM-TRANSID:M88vCgBXC0+Hkc9nkneuAA--.826S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU4db1UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwINZWfPUl2s+wAAsR

On Tue, Feb 04, 2025 at 07:27:37PM +0100, Lucas Stach wrote:
> A lot of other clocks on the i.MX8MP, including the DRAM set up by the
> bootloader are already running at overdrive clock rates. While this is a
> deviation from the configuration of other i.MX8M* family SoCs, overdrive
> is the default for most i.MX8MP boards and only some special purpose
> boards will choose to run the SoC at nominal drive rates. Up the GPU and
> NPU clock rates to their overdrive level to be consistent with other
> clocks set up in the dtsi.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Applied, thanks!

