Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2A1B4D8B9
	for <imx@lists.linux.dev>; Thu, 27 Jun 2024 07:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719472453; cv=none; b=kg3OhQprmmn5+Wn+Ey0QvLXoUaCwJDqCTDPkye0S/9W1MTmoMxcYTX0z98ufG5nLhb+XaOVG1PYS0/TG0qS2pczPchPGi7ukexdQsy/hJORrq2aO7pPfEmavLApzS4ckHBD44EibwrU/z4vl0y8kvr2LStFmfUtoqPt1Vfw6DfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719472453; c=relaxed/simple;
	bh=2A1/2HrTKjDsWOcr0jMGmUfyKlVQymgD4VQxvVVU4YU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BSwh4Gk5ZcOyYJiqxZm4c3s9/xbL3vduHQw8eITAk5e/W+AsHUHp/lU1Z9+eMZ9D1uLOOKzZDkfFK5M36FlQ+vzmjF3UW1Onfn5mIRLZH05hnGxipd9qMULmvV0cgcc9M4d2P2rNLGfQNOu6xRWQIeotePB648zSBWU/X4Im/ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=WfHVKnWo; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="WfHVKnWo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=RL696Ekw/RfvvXhAh6mLeEdJy7RchRYI7LZ9WoWmZmY=;
	b=WfHVKnWoAYdQIAJaPD9LbvEr4LBWowDXNKWrgvQCvFNqObT3c+HJfMfpdwhJsj
	W8D3HzHSO0ttGMSjOw8/RQ1TpAn3HKejlOrT9cnrXlK1+TVmI8GrQ2vQVfmUCouf
	C4ohkUnREifqI4O3lp4E/haofiKgiUMPX4mlOwu/gvHa8=
Received: from dragon (unknown [114.218.218.47])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDHj2qQAn1mR28ZAA--.25037S3;
	Thu, 27 Jun 2024 14:11:30 +0800 (CST)
Date: Thu, 27 Jun 2024 14:11:28 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] ARM: dts: nxp: imx6: convert NVMEM content to layout
 syntax
Message-ID: <Zn0CkGMPJ/piux2Z@dragon>
References: <20240520060222.2980-1-zajec5@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240520060222.2980-1-zajec5@gmail.com>
X-CM-TRANSID:Mc8vCgDHj2qQAn1mR28ZAA--.25037S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVG-eUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBILZWZqryB7ewAAs7

On Mon, May 20, 2024 at 08:02:22AM +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Use cleaner (and non-deprecated) bindings syntax. See commit
> bd912c991d2e ("dt-bindings: nvmem: layouts: add fixed-layout") for
> details.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Applied, thanks!

