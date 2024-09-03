Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BF592E3EB
	for <imx@lists.linux.dev>; Tue,  3 Sep 2024 07:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725347062; cv=none; b=CAzunnJZYNKLTg9z4GBGktyaSJnLMQ3XYAiHOV9r9DAB5GqJHIyyE2DMw48IBf6DyphP9M938W3trZmwe2oMty5+iQUszdkCnbQT94JVcJZeMqfhdzeRPZzANvf5Lx0/FGJCgWQQ3EUzdNBUB9jyX9qjcOwIYMX2qyOjDVSKVgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725347062; c=relaxed/simple;
	bh=54woJQz+5ijdRGgHZexgNM1OLDQAS3przto38Kwiygw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XxyTQf29eosSVIjGbjKKUsGt6fJdtBWqIyFuUs5/KV7TvP4sEZpkiHu1KW1/lnSpdaBaAHNsJictb3Pn7B92VKL49zE45tgGlT0FvxZ4WUghfWpuRjpX2cBMXyJwVIgThENGyswKZsX7vBHYCjPJ3UVaeao/8PmTEv8xaObp6H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=ZEfVjjOR; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="ZEfVjjOR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=760U01fPK5vwIsNnOzgMhiCsuAQbyv3hm5HmSlaeDdQ=;
	b=ZEfVjjORGGSryolJTU8/5ucSfYQys3mY88ATn9qGC9JLAD4/eBP97zphSlF9qU
	1I4qmktm7I1S+6R9k6dwrl6qImGQHJvPpSJl7qXZANHDZjfhLLcP7Dsbkv2o4Xf8
	B4zr5CtNfwRBvk+LClFprRNhRzWxxCyolxAwtt/YAT89M=
Received: from dragon (unknown [114.216.210.89])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3v0nbtNZmi3ZcAA--.51275S3;
	Tue, 03 Sep 2024 15:03:57 +0800 (CST)
Date: Tue, 3 Sep 2024 15:03:55 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Lukasz Majewski <lukma@denx.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ARM: dts: imx28-lwe: Fix partitions definitions
Message-ID: <Zta029K48fGUwV4g@dragon>
References: <20240902114652.893272-1-lukma@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902114652.893272-1-lukma@denx.de>
X-CM-TRANSID:Ms8vCgD3v0nbtNZmi3ZcAA--.51275S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUIWE_DUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEQNPZWbWfDOzYwAAsX

On Mon, Sep 02, 2024 at 01:46:50PM +0200, Lukasz Majewski wrote:
> The SPI-NOR memory layout has evolved during time lifetime of the
> device - for example special partitions to keep track of booted devices
> for A/B booting scheme were added.
> 
> Signed-off-by: Lukasz Majewski <lukma@denx.de>

Applied all, thanks!

