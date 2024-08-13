Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47E0110A19
	for <imx@lists.linux.dev>; Tue, 13 Aug 2024 02:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723514486; cv=none; b=gdGL5YeMr9kIs/6QdRYecIzCwhN4DKfZHozvgE3oA7/zhDBJ+q26j0sBe2ElOHv9/WckvnLcP7Zjk/Cfxu97xh1UQTMT/vmb44XX+6GgzM0FK+uSeFbcyvxisNJQeA0a7hY4ffDFlQ+y+LyDtCOMEyHiCafB6R9lMi1VMrB3PbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723514486; c=relaxed/simple;
	bh=7JCRZRQQtSMtDb+hKr+wJ529jTMTHT4SVrn9dJlFkCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ru4dNRhjFmHfVFvE0eNdRCHE079fkStvA97vtmdmrg48k6a7f6348Y+PildD467iYgvsangiVEt+cjDM/tN4GJrQKbzEAerS0Rzz+S3dLGtNwRf2DyzfxctnTm+ZUrSz5CrR41scKMctlK0BSDWIgPo8bK4mRvgp9Mrtt2kUMNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=EA+QCpq2; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="EA+QCpq2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=rtnsUYVfDy913fLDQSFMZ1QUpp6L6gXlXkwjPiWWKpc=;
	b=EA+QCpq2mQd0vG1qVK2DQZHACobroVmq5MOyrMV2Q6z60xl2dKK5jXSvg70KEI
	1X+WxqsEtCQj4kGHXbUYcBDFQt4rUZgM0G0c+nMK67H0qRcR0lbsfvyF66puiVCe
	wyk+1XHCbpghUiVg3f+L9GgvNp5tyznLPSgCLCw8OGUD8=
Received: from dragon (unknown [117.62.10.86])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3X5tPvrpmn2teAg--.7316S3;
	Tue, 13 Aug 2024 10:00:49 +0800 (CST)
Date: Tue, 13 Aug 2024 10:00:47 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>
Subject: Re: [PATCH v2] arm64: dts: s32g: add the pinctrl node
Message-ID: <Zrq+T1o+EqLI/oYE@dragon>
References: <20240724132415.1700386-1-andrei.stefanescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240724132415.1700386-1-andrei.stefanescu@oss.nxp.com>
X-CM-TRANSID:Ms8vCgD3X5tPvrpmn2teAg--.7316S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUIlALDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiER86ZWa6XtbgagAAsP

On Wed, Jul 24, 2024 at 04:24:15PM +0300, Andrei Stefanescu wrote:
> Add the pinctrl node in the device tree in order to enable the
> S32G2/S32G3 pinctrl driver to probe.
> 
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>

Applied, thanks!

