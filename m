Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DEEF433CE
	for <imx@lists.linux.dev>; Wed, 16 Oct 2024 07:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729063918; cv=none; b=PyEp6wkXPMwfqpmBhmMERVFVSicQbb9lv1j+wyL/vZec5sLwPJN9PLbPOmdHUHCgwv+YJnsHkIj3NBqT5EKjnrxFBus6OT27KxV/LBL0EqHb3Wum6PFOX8qx/fMkkZnCh5Y88ALWgtvsjaaOvnwXqthI9hei7xiZ5QC8jAn6wiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729063918; c=relaxed/simple;
	bh=1VcKXLqcRWYjptJfOGs0sR3n+z23n4N9252C2R6GmB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g++q3Fu7y27ufTah0hI9ERW2fPwlTM4Fr69OgmHPP7pVEgq7eOYZrI4SE1tkknatHRR8s/Js74RPtOZt3ffgqeBFrtkS5nuyUMwtSuNwcNS1Q9tv9qkUmFk8iRmsXgBGEtOGk1S4LqbjvGK7yZICXhG02mZxqscMQ6hw7KYOG2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=klu0LFE/; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="klu0LFE/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ZIq7bLLD7CDFOySZChcNUEzc38kxhtLroVQls+zB/io=;
	b=klu0LFE/UmhM5nW2BX8vP48bh2I6ObOj2DqUtTmBDSMWmJsJu+njZKAuRVIPJG
	DgTuT1AL+iPCWDY0ge2ezZn3H9voP+1xFKNNCO+fe09zuBuPWCn/TnFSivviC4N5
	oq/omkMo1HdO7X4oBCPEioi+ipGmvY/a9zVX/FkYLjleQ=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCXLX6Uaw9nFv8YAA--.378S3;
	Wed, 16 Oct 2024 15:30:30 +0800 (CST)
Date: Wed, 16 Oct 2024 15:30:28 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Tim Harvey <tharvey@gateworks.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Li Yang <leoyang.li@nxp.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: imx8mm-venice-*: add RTC aliases
Message-ID: <Zw9rlO/x+spy3NS8@dragon>
References: <20240909221501.806515-1-tharvey@gateworks.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240909221501.806515-1-tharvey@gateworks.com>
X-CM-TRANSID:Mc8vCgCXLX6Uaw9nFv8YAA--.378S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUsBMNUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAhJ6ZWcPZBUaEQAAsd

On Mon, Sep 09, 2024 at 03:15:01PM -0700, Tim Harvey wrote:
> Add aliases for the RTCs on the Gateworks Venice boards and on the imx8m
> SoC. This ensures that the primary RTC is always the one on-board
> provided by the Gateworks System Controller (GSC) which is battery
> backed as opposed to the one in the IMX8M.
> 
> Signed-off-by: Tim Harvey <tharvey@gateworks.com>

Applied, thanks!

