Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3201EC018
	for <imx@lists.linux.dev>; Fri, 11 Jul 2025 07:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752219071; cv=none; b=Oo01Q9dgEtFAOA+HjMDl1vDQWXe9o91HAPlYFpKR2wHNqxIohhC5SOeY8KCAyQ0vDhB1zdReTKHfJyePghVxHj83K9NEaJn6h+Qfp3mOIwwENlKsazCikQRyz1hjN5gY7pDd29ToGFlLK4OxEMYxlP8Z/hxG5pNgDArMCpGpQaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752219071; c=relaxed/simple;
	bh=PzAlFYF97tmH4Q1sB1fM6SfqzavHRnm7smVxl6tRI7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c2wAfcvJEuMI7c06I3NC9LgwJABHNLubgeJPR+jVSqMh5DRoQkqxqq4lctbuXv2rh+inPgVqCVdrLCVJ9Wx64qPAorhXQDAfDZ/Y0WvAegJMdW1qaH1kS9f13iuTEHkHoHUax31OSlBVOFkavcyqo8o0Wz8xPmhlaDv5h7SAe0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=fequOfXY; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="fequOfXY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=JNeAFkTOa1f+sfeTOkNeMLDbT4+cizlqIq1w2Nummzw=;
	b=fequOfXY2pAeMgEV0LiAITGHkYg5DOCykh/xML6CvDMa6d/8Qv1Ec/kwTOS0up
	satE6eN2Q6cSJ2EY6c0PLGWWbjt9h064/2WEGYFXO98aigN0TNt6hxZ5uQh7JQhM
	BXzd3Z0W6E3s+RknH+6Lk3Sqk3FZQScaaefG2HeLI7O7A=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDnzyKbvXBoKrdSAA--.57380S3;
	Fri, 11 Jul 2025 15:30:37 +0800 (CST)
Date: Fri, 11 Jul 2025 15:30:35 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Yannic Moog <y.moog@phytec.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, upstream@lists.phytec.de,
	Benjamin Hahn <b.hahn@phytec.de>,
	Teresa Remmet <t.remmet@phytec.de>,
	Yashwanth Varakala <y.varakala@phytec.de>,
	Jan Remmet <j.remmet@phytec.de>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 0/2] Add new imx imx95-libra-rdk-fpsc SBC
Message-ID: <aHC9m2iHKhjjXKjI@dragon>
References: <20250611-wip-y-moog-phytec-de-imx95-libra-v3-0-c8d09f1bdbf0@phytec.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611-wip-y-moog-phytec-de-imx95-libra-v3-0-c8d09f1bdbf0@phytec.de>
X-CM-TRANSID:Ms8vCgDnzyKbvXBoKrdSAA--.57380S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU7lksDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIR3MMmhwvZ1PAAAA31

On Wed, Jun 11, 2025 at 03:05:29PM +0200, Yannic Moog wrote:
> Yannic Moog (2):
>       dt-bindings: add imx95-libra-rdk-fpsc
>       arm64: dts: add imx95-libra-rdk-fpsc board

Applied both, thanks!

