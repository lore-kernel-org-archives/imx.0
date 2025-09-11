Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07451DED5B
	for <imx@lists.linux.dev>; Thu, 11 Sep 2025 03:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757561194; cv=none; b=Q4AosOsCwvCAtrxSYN6ov4nI0J79SoZp2ppbn8UcgMWSEyyVK+RIdsX/1vNWsqeoYuPImM5kCM9uKooGbCRlt7htAj1YecG0YVBObE96ZlSVtztEt1TIRlzU3JP0YKus8pxY5ckSbE0A8yn33L2evvXJE+9Pbr3Ej5P/RpPbEfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757561194; c=relaxed/simple;
	bh=opmYNSL9Bkg2+AhPMnSGWCNt7L49Bfmo1aHWyinNS20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y9/QWqpwJKYkiOHRIDyJf1iTPmhgR7PpMH6+kvhgDSPufgTPmd6wnC2fOJHotnT2YWrp9nnTDuEg0yEBLiOLCAq+9QichnUJQ/+dWfEEg5g1lQDOcuYTbA5qkwmQWMdOvvGygTC9z+vJhu0RCc0hzYFZvRu5A0bCICvYjRuJZ/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=WmGY6S1t; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="WmGY6S1t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=y0emQFrKhNRaK9F8r9wT8+xRJD7zvWcKi6l+Zuoa3vU=;
	b=WmGY6S1tqjFy/BldE2CA52isqt8G20G5GJV0T5WeYkKUgwJ6DNMyfUi+jg8g9w
	sEglbfjRxxm46O72IGqWPhkx0prJDjJZzpAiiKTV5x5uIVBYCChyKzqtnhMn6RwT
	2qw0falr7x80qRxvDOCJYszSSrGW0GDVeVm0mT4N/N888=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgCXnvYzQcJor49gBA--.42817S3;
	Thu, 11 Sep 2025 11:25:41 +0800 (CST)
Date: Thu, 11 Sep 2025 11:25:39 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Peng Fan <peng.fan@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Amit Kucheria <amit.kucheria@linaro.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8mp: Correct thermal sensor index
Message-ID: <aMJBM3GANP3NtJkK@dragon>
References: <20250905-imx8mp-thermal-v1-1-64401ac8edb0@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905-imx8mp-thermal-v1-1-64401ac8edb0@nxp.com>
X-CM-TRANSID:Ms8vCgCXnvYzQcJor49gBA--.42817S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU7jg4UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgnFZWjB-SqphAAAso

On Fri, Sep 05, 2025 at 11:01:09AM +0800, Peng Fan wrote:
> The TMU has two temperature measurement sites located on the chip. The
> probe 0 is located inside of the ANAMIX, while the probe 1 is located near
> the ARM core. This has been confirmed by checking with HW design team and
> checking RTL code.
> 
> So correct the {cpu,soc}-thermal sensor index.
> 
> Fixes: 30cdd62dce6b ("arm64: dts: imx8mp: Add thermal zones support")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Applied, thanks!

