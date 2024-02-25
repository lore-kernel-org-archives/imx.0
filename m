Received: from mail-177131.yeah.net (mail-177131.yeah.net [123.58.177.131])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7F6279D3
	for <imx@lists.linux.dev>; Sun, 25 Feb 2024 13:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708866142; cv=none; b=ZqM9h8UH8riByyWJ1ABgb4OyBMv7KrQ+Cmv3SZPzNnwup5YE4mK1NJLXLwlxgz10Hx+a3COWPRZPlDkTsslmNVCQnwXMxkM8Gut5XX5/4akTHZztPWFjD6y0fMoVU0diM8Wo9hb8DsSCiVBpse5j526xU6jyzy1iMrsYPUJwq5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708866142; c=relaxed/simple;
	bh=LfaFd7xa4O/kyRU2JhoKAQWv0B28M4wAVsMs8U7J3gM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hBLSfgO7rofqERkjty+KsGNjsbn+TtXSn6YktvCcrXyxrfTu7ICZjj5oJUixXvmAPzX/7XF+tRdjtwdFatgPw7U+fh33IWIDAwpnnmm7oC3EiyYiHavwuVzu1NvWexmtlahVmAuV870vU+LWa9hwVW7wzHeSjUmN9ZylqK7f4mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=f569tZBG; arc=none smtp.client-ip=123.58.177.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="f569tZBG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=yi04CtgfSgT99pyoULTKBD0Hf7AH2US1TZogXp+f7yI=;
	b=f569tZBGNh8n6yVkI8Z2LRG4TnAJkrDYps2PUphpv41EfCn/aJSR/iDmpNtBXm
	zSBFkjLoeK6grwuavDhHjmB6I0LMI9/eKeiCzdgBkU/BENzsek9LygPDRAe+0awD
	9H4fbHu+wOCjb5BgXJ9i7HM718e9wcvkM7jyaHzgYGpr8=
Received: from dragon (unknown [183.213.196.200])
	by smtp1 (Coremail) with SMTP id ClUQrABHQ+QsOttl6D9XBA--.12411S3;
	Sun, 25 Feb 2024 21:01:33 +0800 (CST)
Date: Sun, 25 Feb 2024 21:01:32 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"moderated list:ARM/FREESCALE LAYERSCAPE ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] ARM: dts: ls1021a: Enable usb3-lpm-capable for usb3
 node
Message-ID: <Zds6LCtHJ2nEzIkP@dragon>
References: <20240221221510.3762096-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221221510.3762096-1-Frank.Li@nxp.com>
X-CM-TRANSID:ClUQrABHQ+QsOttl6D9XBA--.12411S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUIq2MUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiGA+PZV6NnjVmdQAAsW

On Wed, Feb 21, 2024 at 05:15:09PM -0500, Frank Li wrote:
> From: Li Yang <leoyang.li@nxp.com>
> 
> Enable USB3 HW LPM feature.
> 
> Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> Signed-off-by: Li Yang <leoyang.li@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!

