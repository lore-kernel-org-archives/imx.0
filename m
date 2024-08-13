Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D32227FF
	for <imx@lists.linux.dev>; Tue, 13 Aug 2024 03:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723518599; cv=none; b=QSIv9ANkQ2LhgMYXEKd7owH3JjmhYSnF9t2rJ3Yvfklhy14EhdsVk6eN417id8gXp14V27cTv/Z/V2gyQi85mN/nQQKKBn4AAt1EAIOhtJvIy6hnqLR7QFz34DYlqx9+FqmSC2sIOMD7/CPg3mH7RZjcX1kh6L7FqWpVLv5pDM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723518599; c=relaxed/simple;
	bh=3M91t14B3gmhekD1hskxYIbTlw8UDZSkyAnFI+JrdzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XLDhj9KeM/e2LhnAEbB354s7/qEhslhYA9tItoLPBVy7Z4Hyz4Ee62Qi6k0qLBQ+VFbP2F+HcBYwSuBescoUa6kWnqxaRa7VxJu9n4ntGKw7ewzFIIpuWEXcvK3m9Nc0wo4ql3P3XBAD7a+94Kq1OYncIntwkqdGfF44FtVEtNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=BxhyfcpT; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="BxhyfcpT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=IPuRpYSKipGaUbv6mIhpbBcqwqxErWZg5BKVBR9kFRs=;
	b=BxhyfcpTzeTvTTs5lO5DusfL8tzvpHSHTiEU38Xthb4JV3ysyiqIJmr0PkAjcu
	on37p24maTIZQbk9N2mG1/ptzd6TGHY3rorhv7gDgK7TJGNy4QS9U6yJfNTBxQXC
	YXoF3Es7oA7ID3gs7GfW5/06mLiMhboI9s/iWIGTX7iok=
Received: from dragon (unknown [117.62.10.86])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDH7ydszrpmqXxSAg--.41459S3;
	Tue, 13 Aug 2024 11:09:34 +0800 (CST)
Date: Tue, 13 Aug 2024 11:09:32 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Clark Wang <xiaoning.wang@nxp.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] arm64: dts: imx8-ss-dma: enable dma support for
 lpspi
Message-ID: <ZrrObJSIaY6u/g6f@dragon>
References: <20240731060959.897105-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731060959.897105-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:Mc8vCgDH7ydszrpmqXxSAg--.41459S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUaeHqUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAgo6ZWa6xHErEgAAsH

On Wed, Jul 31, 2024 at 08:09:58AM +0200, Alexander Stein wrote:
> From: Clark Wang <xiaoning.wang@nxp.com>
> 
> Add DMA configurations for LPSPI nodes on i.MX8QX/QM/DXL.
> 
> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied, thanks!

