Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 174962CA5
	for <imx@lists.linux.dev>; Fri, 18 Oct 2024 02:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729219393; cv=none; b=BYuRbDXYHSMDO7G5bPDQ198N2I6wqDJSYsU/8pHqbBX8X2mavpyccxg8GN0nGAkaiYLcsiVfXa1x3dJfK0jTTeXlgZnb02w5Q0HC7mD/efY4VOli7WCdHsrpvuoPnssdExwaIrp3z4kM7H/+w44gkueCen3oW4Ldi+ep1WiEpEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729219393; c=relaxed/simple;
	bh=gDpTerw8HpqCtWNZwAtMPRgxbLPsqXWZDuimu7QRBy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=epcJRICMHYDqEs7uWMLNu2UAfCUnMOJxq0fEguWLexGL0iq/mo9cQkrXIWQEDrr9vRqSf8wcowgIPgH7kwf2Br+SSiW1swNgt2KR+BdSdXH2CNRv7aiph9QT/m/y8Yb55Qi7EG5YAg8lw3ubHLVkeXT6eqVLGD191XBGtEMptpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=FWLH4Go5; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="FWLH4Go5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=6FiyOV1NzqEGFBu6tBoFwS8FcBgdWmn5Api3fwFEEFE=;
	b=FWLH4Go5UMA/bMp7Q7vthQSSzqEdwVqAZNQAUUZNtGKewyEy1tbYmDsL/uWc6g
	gU1yuys3a0RPn1WpRnrl0dtqdo4nLlJD4XGLqDbE7IKUOCf3s9oP1ZBxu+Tq1paM
	V/5ad/lO61DmIjdOgkJH/4cspPD6z1U4cX/cRJAgnAsLU=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDnD8IoyxFnCf8_AA--.1970S3;
	Fri, 18 Oct 2024 10:42:50 +0800 (CST)
Date: Fri, 18 Oct 2024 10:42:48 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Benjamin Hahn <B.Hahn@phytec.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Teresa Remmet <t.remmet@phytec.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH] arm64: dts: imx8mp-phyboard-pollux-rdk: update
 gpio-line-names
Message-ID: <ZxHLKP+jXl/sbL16@dragon>
References: <20240927-wip-bhahn-update_gpio_lines-v1-1-49aca212e25a@phytec.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927-wip-bhahn-update_gpio_lines-v1-1-49aca212e25a@phytec.de>
X-CM-TRANSID:Mc8vCgDnD8IoyxFnCf8_AA--.1970S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxCJmUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBZ8ZWcRVdzy9AAAsy

On Fri, Sep 27, 2024 at 01:34:16PM +0200, Benjamin Hahn wrote:
> Update gpio-line-names. Add missing and remove unused.
> 
> Signed-off-by: Benjamin Hahn <B.Hahn@phytec.de>

Applied, thanks!

