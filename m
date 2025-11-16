Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B091DDC33
	for <imx@lists.linux.dev>; Sun, 16 Nov 2025 09:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763285777; cv=none; b=lubQFR9xIj3JNpbCuAj+um+7R+B04pvmUEiYnnXYj0KYvp4/0xsJp9Y4QONAPePiBukxTTl/5xjEjvQTEPLLifJO6+3JSzKCGxzrVRYjc6xoJ66cRMrFIrRpW51AYrY5VTUcQbw2MUOAl8ccLn/aOHyokNixlNNVcm2X8WSpufA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763285777; c=relaxed/simple;
	bh=8RwSnANmatYjlp5vdhEYio3NFN1JUOIqrxvEBrOcSwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ed/iqMblheU4yHAnhOlQibNDe6ZEvtK4FYFcdSB+jblHx6AOVzsQtGHqtdFm5uWPbBIsqgIG1HieqK+Beap9yaERksnpPDSBTLIrBUIoNxSRSC/V0v2zegV/4fEwFPsPVW7Zp3DQQv66X+FXtvUs3IJRereih0WOWnbhp8ZMbvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=IVc2HGu4; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="IVc2HGu4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=sEt7eA3uP6JAyccJIcFiTdXELf0PynanwGq4vjPPSgE=;
	b=IVc2HGu4fS3G946024aDdYz4IhPJuGR4emT5yUIUPd3KmRCS2wCIc/YXfnBQqo
	MwPOuy3Lrzpmc5sbROCW/OerDrMNJgUYJpmCHqKDN1TkRdfM8N4rj9MIs3fU++1o
	1aukII4O0epi64l+Ii968fOJd0SMswfxZyyX2SgkZ4+6c=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgCnAwPumhlpSzUWAg--.7823S3;
	Sun, 16 Nov 2025 17:35:43 +0800 (CST)
Date: Sun, 16 Nov 2025 17:35:41 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: fsl: Add PHYTEC
 phyBOARD-Segin-i.MX91 board
Message-ID: <aRma7QLJIplT_cck@dragon>
References: <20251028043244.496662-1-primoz.fiser@norik.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028043244.496662-1-primoz.fiser@norik.com>
X-CM-TRANSID:M88vCgCnAwPumhlpSzUWAg--.7823S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUzSdyUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIhCD6GkZmvDOBwAA3K

On Tue, Oct 28, 2025 at 05:32:43AM +0100, Primoz Fiser wrote:
> Add device-tree bindings for PHYTEC phyBOARD-Segin-i.MX91 board based on
> the PHYTEC phyCORE-i.MX91 SoM (System-on-Module).
> 
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied both, thanks!

