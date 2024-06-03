Received: from mail-177131.yeah.net (mail-177131.yeah.net [123.58.177.131])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 757E915C3
	for <imx@lists.linux.dev>; Mon,  3 Jun 2024 01:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717378005; cv=none; b=awBeGRMB2ulviiG9Nvdc72fVUK/OrfTsG+5GPdzcxx3daH3216k/5pW9zYVnAuqAeumhlHjmeZ3FOLgESj4xyFLb5NldUUiyA+QsX7w3fT7AC5N34aDkl4NTkOxN+jNYtD+nRNTCNZcAjy+JQlRzxCGrtgK+wJ0SwpELuffz1zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717378005; c=relaxed/simple;
	bh=blOXyHMP9eToWR4G3lL6JjYMHa7QJ1WsjA1jVi8WQaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z+WY9Kmcz2WCKnxg2Ciqjfhg+Log0ppeuwuAU+7KtPh0vwMGrFwm/l4LbaLcl8rD1jQLz9G6MaPdz0VSLU9BVt1S9ZB1kqHiKCHMM8ml5JsSK5ssJbYaTl2XsEbRaOd9I90ieClZ4/XfHbz2WXsMck756Lz9QkFgqWLCQSX3SDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=VaheeM0i; arc=none smtp.client-ip=123.58.177.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="VaheeM0i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=RovHC8mcGRzNAGtETqxBmyf7owyCpzoZbO6+2XD5ezc=;
	b=VaheeM0ibtG6P1Jz9+49ODQW5pd4qMIxXBcefx7cSs3z/m+A/IDic3MoFD67Kj
	P+IDVA2/PFw6TWrXy53Sg00uObSnOvyZ7IALYwOuhHIH0yZ1hYDA259qyOBNxGl6
	jZ3cC6rwwAdVXD/vwQ2CyydiyQWCDxFPifk35tMWYVSbg=
Received: from dragon (unknown [114.216.76.201])
	by smtp1 (Coremail) with SMTP id ClUQrADnr0QvGV1mfIUwBw--.36226S3;
	Mon, 03 Jun 2024 09:15:28 +0800 (CST)
Date: Mon, 3 Jun 2024 09:15:27 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] arm64: dts: imx8dxl: add audio support for imx8dxl
Message-ID: <Zl0ZLxda/a6FvoYO@dragon>
References: <20240425-b4-dts_dxl_audio-v5-0-46397f23ce35@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240425-b4-dts_dxl_audio-v5-0-46397f23ce35@nxp.com>
X-CM-TRANSID:ClUQrADnr0QvGV1mfIUwBw--.36226S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUswZ2UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBRDyZVsVCm8GUgAAs9

On Thu, Apr 25, 2024 at 11:34:40AM -0400, Frank Li wrote:
> Frank Li (3):
>       arm64: dts: imx8dxl-ss-adma: delete unused node
>       arm64: dts: imx8dxl-ss-adma: update audio node power domains and IRQ number
>       arm64: dts: imx8dxl-evk: add audio nodes

Applied, thanks!

