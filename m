Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E86078C0B
	for <imx@lists.linux.dev>; Mon, 21 Oct 2024 08:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729499228; cv=none; b=oz8D2t+FLGshkSKzMdFkta76Oe8FCz8DVW6P6IQ6hs24R8oZEaXfuK5bMBJrMNSeZexe2UhSBESzv28PzeXTsLUlyRnYMTk5ODF72XvgYW54mxUuX35G5a04LJaRFijzDfAphiDPWclmPGMd4RGahDPmirvRdlZLxFq+lUOtbRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729499228; c=relaxed/simple;
	bh=fJSvgreziFrsM/vzJrYX8RxnCQH82tj/4bAv1LNlKLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A9lk2K7QYUwqHDBXABCtucD9V8Mm6cf0rU7Kb8TqxeS0uXj0BdyKnRK5Tpjf3NYZa2KF/j3zI6pYcEhZhLlffSVKNV/kobu3QwFd5uu49mWkHmiPcuD+q0hQBB5jIxg6rx7eZ40LnLJjJA9rBr+RmvmR37c/j/vtoh1GItTR+7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=TXhJCN98; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="TXhJCN98"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=RBSlX9CtvwwunttRSdxz7ipVB5jMEtRInO57ObkRLuw=;
	b=TXhJCN98u4qtk94aP8d/7DWqNN2Htkge/IXbNq5TV5gdQP+vMN6wKCQ4nXsJv8
	0MvRohMGlnsZy9dgAzBrakW14uVm7lcmemzH/NWyOHpzM8btw7hjea9X34yvdVya
	vvwirYMrJA9srrRA7279yHrFzEcAgCIgbEQV5wBDnBywg=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgBnjW2+DxZnuuGFAA--.4767S3;
	Mon, 21 Oct 2024 16:24:32 +0800 (CST)
Date: Mon, 21 Oct 2024 16:24:30 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: imx8mp-evk: add PCIe Endpoint function
 overlay file
Message-ID: <ZxYPvoW5LFSJsNr9@dragon>
References: <20241001183748.256607-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001183748.256607-1-Frank.Li@nxp.com>
X-CM-TRANSID:Ms8vCgBnjW2+DxZnuuGFAA--.4767S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVcTmUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRN-ZWcV7NltagABsB

On Tue, Oct 01, 2024 at 02:37:47PM -0400, Frank Li wrote:
> PCIe of i.MX8MP is dual role PCIe controller, which can work as root
> complex (RC) mode and endpoint (EP) mode. Add overlay file to let it work
> as EP mode.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!

