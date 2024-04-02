Received: from mail-177131.yeah.net (mail-177131.yeah.net [123.58.177.131])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C9C2BA3F
	for <imx@lists.linux.dev>; Tue,  2 Apr 2024 03:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712027824; cv=none; b=NKRccE9LAcxxTYxQEmdCXoUq/DMwX4xCBfVWl70FPFt4LlcB8fTpMpFtzYTs1X8uLijJfILghRkTweIPy7IP52TkdMpNWRT9ozOORhmq4rsPxThus8bAQGazu8Ekw/pt9Jrg027clQeT1Aruj44KgrzUoX4rAY/Kx7q/aMf24Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712027824; c=relaxed/simple;
	bh=dMH9vORuwWvwTqUAi3thmc6kwkAOHpjo0zF09ECStt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GapwSAqf1x8pC1ehiWuKnRQpFsheSN7oF+wiMmZ2R55wuakdyLWPuwJlv0xkA9FC2LzL5cqxA7QE5NBiHXBmuloMgof75b6WLZl903S9jPULt4XhZ0aDlxjcoRMacLVQlhwyIMsvfpdaqDYXfhiXom/tPFzmKO7TfQrvsRgjT2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=aQ+lyo9F; arc=none smtp.client-ip=123.58.177.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="aQ+lyo9F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=8n8tkL/NqEOagZLJ/lnvko5XZLhwikWb7adGasKWrqU=;
	b=aQ+lyo9FOjUfRx5qk5mzx0IOHkgRjIEmcUW/34+hXQaFgtw0Y2MrGTczDGikmQ
	RlBjBMLD1dFDV/5kDID0Tk34TwIbE5e8SXFTkIyP1QnWjjZJCcWfc4unDVM0S4uI
	IGMGcYOwOXEztm1tiaJE4zzAQV6al7PHc5rIhrh1v4Uo8=
Received: from dragon (unknown [223.68.79.243])
	by smtp1 (Coremail) with SMTP id ClUQrADXP0SeeAtmq+6dAQ--.41039S3;
	Tue, 02 Apr 2024 11:16:47 +0800 (CST)
Date: Tue, 2 Apr 2024 11:16:45 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, imx@lists.linux.dev, kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH] ARM: dts: imx7s: Add snvs-poweroff support
Message-ID: <Zgt4ncXn08GLxyOX@dragon>
References: <20240321143115.1117060-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240321143115.1117060-1-festevam@gmail.com>
X-CM-TRANSID:ClUQrADXP0SeeAtmq+6dAQ--.41039S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU1T5dDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiDQC0ZVszXXxq-gAAsB

On Thu, Mar 21, 2024 at 11:31:15AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Just like other i.MX devices, i.MX7 also supports using the SNVS
> block to poweroff the chip.
> 
> Add an entry for it.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Applied, thanks!

