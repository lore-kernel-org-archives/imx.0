Received: from mail-177132.yeah.net (mail-177132.yeah.net [123.58.177.132])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAA3513FF6
	for <imx@lists.linux.dev>; Mon, 22 Apr 2024 05:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713764451; cv=none; b=KUXYAkmhGnRnTXRkwz6uWZ4me4KiIevgHFjTnF5vHkBaIj2m06NtJ2DbTbzWKgVufpCQ4iZ6w50e4C3yXjZAzkLQxMA5jcB4YAN1eNjiiXcbin+Tov1T0WQ19ZXDiVu0VXinHoFX/OxgLwC+I8U/8MVSLLGB/Dgvst3qxQqBlc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713764451; c=relaxed/simple;
	bh=hh9RxN9jBJ/DfMTBb2xuz2CdAScdEVGGXxdNxLA1rU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qQuH1tnY6dEnIANe3jN5z3PmNzZTcgtiSy5vLQQOKIkL1pNPxzYXpuLIwZjiTq0h3RcM9L2/BDXSNSkiilzEILcU50qq47bXJtJPln0vBvDd5EyRQPXoTaBiRb9Yxeux36u8X/NI7YSB3HCetLWmkIV8OPIADZS49YVExyEpzJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=MMBSo7FL; arc=none smtp.client-ip=123.58.177.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="MMBSo7FL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=OrzKwWo/B3km3LkyErimGK53sAtA8Zcp7tLaY4gA2do=;
	b=MMBSo7FLbUHcHrW6dPX57C0nc2sc2VQ/eYtsJEo1GQova8T4sM0bSCbMrbBKdc
	pywqcGCFuuKai+pqluDVzNgIH/0GZDg1tqRzK47hsNqmCD89Kb3bSfqwZQuoSNou
	CsETwKZGpeZqJIwr7hVoQZrqYkg2iBhuDLgFBw3SMReKg=
Received: from dragon (unknown [223.68.79.243])
	by smtp2 (Coremail) with SMTP id C1UQrADnT5FM+CVmDc8zBA--.51929S3;
	Mon, 22 Apr 2024 13:40:29 +0800 (CST)
Date: Mon, 22 Apr 2024 13:40:27 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux@ew.tq-group.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: tqma8mnql: Add EASRC support
Message-ID: <ZiX4S/H98e/lQXR5@dragon>
References: <20240412132021.520666-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240412132021.520666-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:C1UQrADnT5FM+CVmDc8zBA--.51929S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUsPfHUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBQ3IZVsVCfBTAQAAsA

On Fri, Apr 12, 2024 at 03:20:21PM +0200, Alexander Stein wrote:
> Enable EASRC support in tlv320aic32x4 sound card.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Hmm, it doesn't apply to imx/dt64 branch.

Shawn

