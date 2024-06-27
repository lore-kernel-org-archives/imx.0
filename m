Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B2DC20B33
	for <imx@lists.linux.dev>; Thu, 27 Jun 2024 06:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719469730; cv=none; b=PcJ1zSTuoiLY/Q3g+acE6HOBSEbAbeB45I9UVBM0RaIdkc3E4or6TU2M0bXcg1p5wflIMC3absxr7HjbfXdvap10sN15FwqDIT76Jc+RvmIiZg9G24UF18Yg7+JIDfXyWH4fDKZWlMnKU7vOiKWoswz2w3SiwLeJSnLZkamiD64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719469730; c=relaxed/simple;
	bh=bJJt0FeM0KbEJPLYk2tCjgBeMwoyVLEpB+8s2fa5LfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I1sj6eW6Ihciqxsh81DhVqW2eGKatuoxlWZumf+IBQEpt3+WLShkUlWOdwnviGsSyGiphNGNJvw8te6II8YTTvx0uw8uanZS47KPuZJ9w7HhzXttlf9KrMuWxF9KpXhN+VIoDFYzF+y42GKkPj+qkX9MGbhcsptdo619ychtNKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=dfzvGqDh; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="dfzvGqDh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=4E9CM/5/mBeIexGZwjxuNqelU9W/5r9P19OkUaKlST4=;
	b=dfzvGqDhDzW8CIUfGN8u6wD8w3rvXo2pAA6zlf+rQX4lPDA5QpbZ/I6YFCAH/R
	AtSNZnRznbzJIxQX9GYN1yCEM9d2DlnR33U0XRfkg1QxcmeuHPWSm5pAfp63ZeJY
	YZZj9WZvf9XhghQZl3e5rxftZCaCaIcC0bxl20ZTq6rCI=
Received: from dragon (unknown [114.218.218.47])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDXP5t6Bn1m600aAA--.26605S3;
	Thu, 27 Jun 2024 14:28:12 +0800 (CST)
Date: Thu, 27 Jun 2024 14:28:06 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Han Xu <han.xu@nxp.com>,
	Vinod Koul <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 5/6] arm64: dts: imx8-ss-conn: add gpmi nand node
Message-ID: <Zn0GdvvigLqcGXxn@dragon>
References: <20240520-gpmi_nand-v2-0-e3017e4c9da5@nxp.com>
 <20240520-gpmi_nand-v2-5-e3017e4c9da5@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240520-gpmi_nand-v2-5-e3017e4c9da5@nxp.com>
X-CM-TRANSID:Ms8vCgDXP5t6Bn1m600aAA--.26605S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUaK0PUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBILZWZqryB7ewABs6

On Mon, May 20, 2024 at 12:09:16PM -0400, Frank Li wrote:
> Add gpmi nand support.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!

