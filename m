Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC4FC2AF05
	for <imx@lists.linux.dev>; Sat, 31 Aug 2024 12:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725108849; cv=none; b=sMERJu57cC4FHwQMrFJeNLOXTpuPjekZK8tam9busLb10sPWH0Fu83AuWBjkVxMh/vXqRxSyBTVqe9PgXlB2Yx0Gm3QtagS5dLlcHJ3pKc9bRn0eSU4nuU5SAFDK8yALHkAA6QSLpPVL4Z2iUN6vp5E0PD9q+YzNVJgsCBZdZM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725108849; c=relaxed/simple;
	bh=2XSVFmj/9f7JSvMOYvkAM8H9FENNi4eZdpDjcsZlUS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FOi4L/tJqIznUHZ6U+LahYK4bTZs93kUXc/Sq0TVW/ZdDMuqeptyuC5m/Wa5cqGOV8nUD/QdcRex4ggcMF1Hz2iXOg2bEinwgapTWAsdMio2UbVcU7zQEqmxwCFgAu2O/9E68d0wJj4PKsXfJyYORSrs5U2qhShGNZtU7tzx8N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=JP8WMB2p; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="JP8WMB2p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=11hKmzHQAJSyR+Fny0gB8RizXyDsH10V73RfyavEu7k=;
	b=JP8WMB2p0lRzfm61Ko6UqrRr3tBdqswahKYPqPmLKWBOSdWAenUmS7D9jem9Y5
	r18itIEMTQCrQRuKMG+0G1+/cGy+Q3Za1aBJ7Rm9wbp9wKZBGf0mp91Xt4t6/HpW
	0GTMinGlvBTivooLudmBxMG6fhkAQKdcNfqF43Gv4p9yo=
Received: from dragon (unknown [114.216.210.89])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDnzwIZEtNmbRI6AA--.20347S3;
	Sat, 31 Aug 2024 20:52:43 +0800 (CST)
Date: Sat, 31 Aug 2024 20:52:41 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Joao Paulo Goncalves <joao.goncalves@toradex.com>,
	Gregor Herburger <gregor.herburger@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Peng Fan <peng.fan@nxp.com>,
	Mathieu Othacehe <m.othacehe@gmail.com>,
	Michael Walle <mwalle@kernel.org>, Fabio Estevam <festevam@denx.de>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: arm: fsl: add fsl-ls2081a-rdb board
Message-ID: <ZtMSGV7vIVRlIsB/@dragon>
References: <20240812200816.3828649-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812200816.3828649-1-Frank.Li@nxp.com>
X-CM-TRANSID:M88vCgDnzwIZEtNmbRI6AA--.20347S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVTKZDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAghMZWbS-BorEgAAsI

On Mon, Aug 12, 2024 at 04:08:15PM -0400, Frank Li wrote:
> Add compatible string fsl-ls2081a-rdb for ls2081a rdb boards to fix below
> warning:
> 
> arch/arm64/boot/dts/freescale/fsl-ls2081a-rdb.dtb: /:
> 	failed to match any schema with compatible: ['fsl,ls2081a-rdb', 'fsl,ls2081a']
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!

