Received: from mail-177131.yeah.net (mail-177131.yeah.net [123.58.177.131])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C89AE10957
	for <imx@lists.linux.dev>; Mon, 22 Apr 2024 04:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713761245; cv=none; b=C4jnjjW0CHWMjXSw3gBb4nXZSjxDk8qc1M9zNfNh3dsqCZnPpPSFp6//y/6F4zk3LvtyNsJpyNmPAx7GJCJCIqXCcESjVZuIg1OXjS95vtbKj+qMAhGLbUsNk0A7s9wsDOCyxGALC8H6pyKG3gBcl5ZBbyKl5GNwEFt32XuOYDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713761245; c=relaxed/simple;
	bh=O5AhC9Oai8ejuwYTbIzKPn+tBGuRCa6rVo1NLxcf7PA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u9NRpCNLY7hMCXKkg506cNoO7YtHgP60XI3iq0YJGPIqkKjBkcvgS8i/HeizqNaqOsTyTvofE9B5rj/OyZOo1Goqrl1btLysY6Z2dpEezrzqoMhr5XdYscf50/BRwQgJMdR6vLxigw9Kovlg7IOM88rnGIQgHHtMLT9Jtv92Ouc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=AOQxH84i; arc=none smtp.client-ip=123.58.177.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="AOQxH84i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=bruPpaRPsO8HMCfcdLVi2EDHWOtroBLaqQU/MSt+mkc=;
	b=AOQxH84iMDt0Je0aFb0rExZqJ4XofJFrwTqY7uLMl4/hTySVMPwVx/L0K0Nnp4
	RfUnNDlSWeMSanAL9kWc7+cdkhvWD3IR8feUHQ3NrFgz2XEq5Xw+TInPtOlD/a3g
	s2Sk9LljrS57Cqztvr4WPN/ijpLVjgHNqbz43N5qFwOP0=
Received: from dragon (unknown [223.68.79.243])
	by smtp1 (Coremail) with SMTP id ClUQrAAHbvrH6yVma04sAw--.24483S3;
	Mon, 22 Apr 2024 12:47:04 +0800 (CST)
Date: Mon, 22 Apr 2024 12:47:03 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Ian Ray <ian.ray@gehealthcare.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 1/2] arm64: dts: imx8mp-msc-sm2s: correct i2c{1..6}
 pad drive strength
Message-ID: <ZiXrx9I7YcB7tSWW@dragon>
References: <20240410105612.982-1-ian.ray@gehealthcare.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240410105612.982-1-ian.ray@gehealthcare.com>
X-CM-TRANSID:ClUQrAAHbvrH6yVma04sAw--.24483S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUI5fHUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiDwjIZVnxcqAlJgAAsT

On Wed, Apr 10, 2024 at 01:56:10PM +0300, Ian Ray wrote:
> Adjust i2c drive strength based on latest Avnet BSP.
> 
> Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>

Applied both, thanks!

