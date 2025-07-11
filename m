Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EEC3FFD
	for <imx@lists.linux.dev>; Fri, 11 Jul 2025 08:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752222168; cv=none; b=lw9yiMOwyNHeOiDLKUadFOekGPFaD7Xk2CHdIRAcIiezNxTNO4LWN4y6Yl4zpCYPJ5bAYxJ5UjyV3y/nl5/c0YeEsYR6T5ZlVFNbz5iErBmmB6CM+l29FwwHOPhV/FK4ftQ1mcRFcfsh0AOGvn2Y+09DjiMsQ8m2WHQm3ZIvZoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752222168; c=relaxed/simple;
	bh=Lq/q2JgPlBbP//yLhoo03as611t7+47cHRA79nVw/gQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LRIRhQIWpYkz0UQCaBMAppBr85+IPr2b8Xxp5TA2cmiXMCZAUQLoJ5Rw6gpwOW2h522ZatrHow7oTAbdlgfJzSyJ4inSnyqPqIWIlxjEC4EX0lWc4SJT0KY2G4UToIDYCnu1nVz17CZ9d3yKNo6fFBtI+DHg/SGiWSYUykMgm60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=CJGcPeIR; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="CJGcPeIR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=5DNNk/IFBr7dWHafFiTpxKVod8W0wZpsk+DYFpT8gb8=;
	b=CJGcPeIRE536pGuDchS6MFgy7xfKfvIHrm9oeN67Xg7F46TetVArLXzWE2RXjC
	JyQ5FoXFDyQ8yG7aGTOwSZyvJ2C58D5ZBZh94bBfGV03NlYkRVN7QNrxIkGB9jzr
	qQF1+kQMuHItotKguJqj9rq87mCfEk5gHdN7PpRjF+EP8=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCXx8OuyXBoQ7lTAA--.14846S3;
	Fri, 11 Jul 2025 16:22:08 +0800 (CST)
Date: Fri, 11 Jul 2025 16:22:06 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frieder Schrempf <frieder@fris.de>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Eberhard Stoll <eberhard.stoll@kontron.de>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v3 1/2] ARM: dts: imx6ul-kontron-sl-common: Add SPI NOR
 partitions
Message-ID: <aHDJrr-zjPxXvMu8@dragon>
References: <20250709071557.20602-1-frieder@fris.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709071557.20602-1-frieder@fris.de>
X-CM-TRANSID:Mc8vCgCXx8OuyXBoQ7lTAA--.14846S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUoYLvDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBmHZWhwjvrFiAAAse

On Wed, Jul 09, 2025 at 09:15:54AM +0200, Frieder Schrempf wrote:
> From: Eberhard Stoll <eberhard.stoll@kontron.de>
> 
> Describe the partitions for the bootloader and the environment
> on the SPI NOR. While at it also fix the order of the properties
> in the flash node itself.
> 
> Signed-off-by: Eberhard Stoll <eberhard.stoll@kontron.de>
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>

Applied both, thanks!

