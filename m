Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A50D13B285
	for <imx@lists.linux.dev>; Thu, 27 Jun 2024 09:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719482186; cv=none; b=kyPCaRNrdiWuStnOkJyuKgyuuCaBe0dQX3z5IdyD0KuIOAaXLZ5Gr0ILF8KbCO/ChRydvKWfFGz0GhNoiLRvUgVMMj0HymwDllDFDItzHVMMwCEdQL1nhaTTTayXfwowFIQ3MArgeLY71aMkRH6UQwBiWb8o+TnmpE6s7kEwBpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719482186; c=relaxed/simple;
	bh=g111cGAkJJTUrT6/h3T0ahXLLEM8F6CtuB/wl8swSwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NIm9HXeXY75Bg5qFDdMbsLlT8optX+UU2OAv7ED/GbLlRZNPwcNTQZKjTc5SQAr/J2h6v4i0naii9xKNEjGQq1g32u2TcnBhyolYujTJiTdlNmnd15wNUkCbrMQhS43M40iduglT4eMQ+vixHZ2tq/FJQejQn+FUJo3ctO7ua7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=dEcwHAM4; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="dEcwHAM4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=QgffzqFvBeb2vCh8ycMNWRHSaKdYSTlWByp7ExuDxWc=;
	b=dEcwHAM4Wwu7kzOdABbHPJ5sxhgJ2mFAWpGLyeuQCXD1QVZpoazQi+YYxs2BPY
	R63YQxC3a3nmBlGsTzKjknJRfa1RBqfsgTS84jBEvQE6u0Z7hl/uyZFB6Uyn2M+U
	R1ThYetEeLkD33Y2OJW5FgIAUvMc8IPwRzQxep0BsXJWg=
Received: from dragon (unknown [114.218.218.47])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD33x0wN31mYjcaAA--.52891S3;
	Thu, 27 Jun 2024 17:56:02 +0800 (CST)
Date: Thu, 27 Jun 2024 17:56:00 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v4 3/3] arm64: dts: fsl-ls1043a-rdb: use common
 spi-cs-setup(hold)-delay-ns
Message-ID: <Zn03MAkHz4sqWYfk@dragon>
References: <20240624-ls_qspi-v4-0-3d1c6f5005bf@nxp.com>
 <20240624-ls_qspi-v4-3-3d1c6f5005bf@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624-ls_qspi-v4-3-3d1c6f5005bf@nxp.com>
X-CM-TRANSID:M88vCgD33x0wN31mYjcaAA--.52891S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVeTYUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEQYLZWZv-cysUwABs-

On Mon, Jun 24, 2024 at 02:55:29PM -0400, Frank Li wrote:
> Use SPI common properties 'spi-cs-setup-delay-ns' and
> 'spi-cs-hold-delay-ns', mark private properties 'fsl,spi-cs-sck-delay'
> and 'fsl,spi-sck-cs-delay' as deprecated.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!

