Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08B7D2C9D
	for <imx@lists.linux.dev>; Mon, 12 Aug 2024 03:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723433823; cv=none; b=AXKe9Cnb2eytWVrQhly03RO6d3UHX6piKNZVmvoqh6Wg+7k5iVNO3zfeHlI+2+lE0zthQGQoRxw1AVFUCX7Ycj+slEHfomE+CF7ZSGQABhQgsNUTC3axvS6UO8oFvjQk80GI0BcPDA+/i8DBtRuqUSMyMcr2JN5KLk9nDteVNc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723433823; c=relaxed/simple;
	bh=uXuyobOjTnWyOJ8C5OkVOf6A7H0lhKaylh2nIX33f6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u7BgqroaV/86Imvobgq8bV4yZXSqFrbGQjMB5x9rnB2P7hZuLkM+92L1t/5y0NG402IzsUmEBSdCM/CUkerQhVrW2Bv1pjCEqBNuxjeyR/KvUhZNs1rO0410ifVXZIe+dZzeh75uqETePQrLnHYdA7SmhMi8IWfhOov+GfDDN7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=PwOtRoJv; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="PwOtRoJv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=9+5V5XfOCCt35FGY5jqK51yX030o8KZnQmkWpmCbG8E=;
	b=PwOtRoJvrAsqpqvTW/akyrNUhxam7EFnZ0wcC/LHC+RMfdqN8sndUgT0VtQMHx
	YubP5roAcFqBNZt1sLHSSIslqe93N4iDHcr/sJR4DrzNGgGbv6qoyZk56gS8i5pj
	N/r35UYVbSEX3mfVTVKYR+hhLtrJ4yN5A13NTKHhY/dRM=
Received: from dragon (unknown [117.62.10.86])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBHTbdCg7lmvdsLAg--.59373S3;
	Mon, 12 Aug 2024 11:36:36 +0800 (CST)
Date: Mon, 12 Aug 2024 11:36:34 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Lucas Stach <l.stach@pengutronix.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8mp-beacon-kit: Fix Stereo Audio on WM8962
Message-ID: <ZrmDQgU03tf8n91p@dragon>
References: <20240714172017.422811-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240714172017.422811-1-aford173@gmail.com>
X-CM-TRANSID:M88vCgBHTbdCg7lmvdsLAg--.59373S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUcb18DUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCxI5ZWa5gcwF+QAAsr

On Sun, Jul 14, 2024 at 12:20:17PM -0500, Adam Ford wrote:
> The L/R clock needs to be controlled by the SAI3 instead of the
> CODEC to properly achieve stereo sound. Doing this allows removes
> the need for unnecessary clock manipulation to try to get the
> CODEC's clock in sync with the SAI3 clock, since the CODEC can cope
> with a wide variety of clock inputs.
> 
> Fixes: 161af16c18f3 ("arm64: dts: imx8mp-beacon-kit: Fix audio_pll2 clock")
> Fixes: 69e2f37a6ddc ("arm64: dts: imx8mp-beacon-kit: Enable WM8962 Audio CODEC")
> Signed-off-by: Adam Ford <aford173@gmail.com>

Applied, thanks!

