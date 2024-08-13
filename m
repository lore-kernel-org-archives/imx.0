Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F28788485
	for <imx@lists.linux.dev>; Tue, 13 Aug 2024 01:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723514052; cv=none; b=E1n+C1qpczi1JGbMpM3VsqMgHohoSGHUD5thsq/rD86iWhVjth5PgsRmvbmJpAs28dsrwaMgx/Afs/UBUq2cTEQKFTuHSPtVYZtJDQpZVoQf0e+7Jo2+G/z0UH3JstyQTmx8jxdGYE3j0GVLJU+b0tRiSIN+sIheHd/Bj7OVE5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723514052; c=relaxed/simple;
	bh=akMXU70pK8hT9LhVoCYs6vNxj5TFyaPo9utkufjeggk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uOLo4i9tkjU4YNFOROi8GgM4VV1bPXkncG2DeriEdD/rFoiaudY1kU6BT37XXMjkRszBoXZklSGEYJKn+OfrCmbjeU3F9o8aV8opvB/YieN+BpE9VSRyZUzjXZVqe0D+3E7xbMTAeJ6x6r0ptuityjN0JMgxuV7V4GAROIyUPdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=IHlD5uku; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="IHlD5uku"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=5kPfqD68TfyrjDXHavXG5xz+7qcCkFKuvLVhShQxrxc=;
	b=IHlD5ukuMBCiIAeWlEOImgZxFAGtQv245UzKop6QxrJvXNSL2kqdiFKakDoU+x
	Uzrkzlc/B/Q1PMTZT2fox+uqWGle6gLNBXAovGWSAvbhghcXQbMNau+DpW4mPxFc
	ctNiqL+/soX3T2mKXRmBIginVpOKkbpmNbTqfz20CpLrs=
Received: from dragon (unknown [117.62.10.86])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgD3X4igvLpmL7ZRAg--.33993S3;
	Tue, 13 Aug 2024 09:53:38 +0800 (CST)
Date: Tue, 13 Aug 2024 09:53:36 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/14] arm64: dts: freescale: imx93-tqma9352: improve pad
 configuration
Message-ID: <Zrq8oIxUw6C2g8Zc@dragon>
References: <20240724125901.1391698-1-alexander.stein@ew.tq-group.com>
 <20240724125901.1391698-3-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240724125901.1391698-3-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:Mc8vCgD3X4igvLpmL7ZRAg--.33993S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxCJmUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwk6ZWa6Xp3TZQABs1

On Wed, Jul 24, 2024 at 02:58:49PM +0200, Alexander Stein wrote:
> From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> 
> - disable PU/PD if already done with external resistors
> - do not configure Schmitt Trigger for outputs
> - do not configure DSE / FSEL for inputs
> 
> Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied, thanks!

