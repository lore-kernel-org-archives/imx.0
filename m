Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30BB05661
	for <imx@lists.linux.dev>; Sat, 31 Aug 2024 14:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725112838; cv=none; b=YPK9wVe7KMJeDA8D3feJeEokdpss+vxjjUdm7hswNAIX3h5IMMQiXT3LXaiSgXyJNXJhQdK3b2B6ZSh+NQMBlMABUyk53w0JgQwDFk4WjbUsv/IhaA3aiyUEFlG24CTV/DgOSVIPF8l5iBxhuHiEV1pWoMERh6qzm3DQbqz7OWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725112838; c=relaxed/simple;
	bh=y4Qdhjn0FN8uf9zeE27PFL4cEPKOHqWUGu3Z9m6rDXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ro2Fa3yfSorHg2kSNhOZUWZ/Uh9UQ8uo4Zy2D4KnRZAr9dIoBbM2/Hn1V5uZuSMcLFi+Jphkn5CuKG5WfkOl5MUcY/0CuOfBdNQ0DZYoZRe/7xcBE0sd9yrC+HIrc0RnX5+gwZYiZ6PEOQs7gLwD8QODrh3VERnPZcQ2GDPbA3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=h/JZnhP5; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="h/JZnhP5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ZHMlLxBV6WiIADgN4jDjxhO6TGFE1s5YKCIdS8a3q+A=;
	b=h/JZnhP5twlgQ7wbNgfW7av4FiiGw5reDcjYIywCCqLHLTy69k1WVGSFcAB61j
	yT5HFdYy4p/CgcDxueLOP6m8HSbm5EzuZQKw1ro6uI0n1tKR0eNOAbB1XDhrVPDF
	b6llauRWk0rQETPITjzD14QnmahhYodc5gM5m1CZBuBK8=
Received: from dragon (unknown [114.216.210.89])
	by gzsmtp3 (Coremail) with SMTP id M88vCgCXh9XoIdNmkpo6AA--.14294S3;
	Sat, 31 Aug 2024 22:00:10 +0800 (CST)
Date: Sat, 31 Aug 2024 22:00:08 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] arm64: dts: imx8mp-beacon: Enable DW HDMI Bridge
Message-ID: <ZtMh6J9pUUTPdWo9@dragon>
References: <20240819231814.120053-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819231814.120053-1-aford173@gmail.com>
X-CM-TRANSID:M88vCgCXh9XoIdNmkpo6AA--.14294S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUIksgUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgNMZWbS-GZHsAAAsh

On Mon, Aug 19, 2024 at 06:18:14PM -0500, Adam Ford wrote:
> There is a second HDMI connector on the baseboard which is routed
> to the DW HDMI bridge through the PVI to the LCDIF3 and requires the
> HDMI PHY to be enabled too.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>

Applied, thanks!

