Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2684413BC0E
	for <imx@lists.linux.dev>; Sat, 22 Feb 2025 11:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740223018; cv=none; b=F6x21kIJGlpKSu9uAQQiL/UC1Yn8woo765A/qg95K53qpsIMgXDqjTo880QCVg3ftMhLQsgQjjxmFhCZjhRy9n9dAfzW+hK4iwqh95htpXDLNUKomnyeYl93BMK3Yh75ZisIWGHFNDnbLEQV86N1CWV8TOZUppAY3yL4Rp/ZOdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740223018; c=relaxed/simple;
	bh=dflH2HmHUuNcWroyDa0Zen2AU1YwDykE3SoAGJ3oM4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GCaw3S5r6djhp8NEGmv9bLO0ZhzPLxpTEzjdfu3ijrE5fon9NDbsgOlMuLg7ENCHyIUX0X0E5cWA8TuwQQOk0gw/3pPpeIG+NrxxbU1vaml8cYCKhrbTKuLcBHs7asufCJ2dM/+e+katwJ/ewHxBxoC+lfbjBsgTuuMEkqXvghE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=dnNUa52A; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="dnNUa52A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=rNlxsLndcPoIjInqZQdWVtvA9nkiN43ptPaG8BsfZ0w=;
	b=dnNUa52AOab8U1KTcJ7nMJIHMBnmOg0V1hp15vozqOPeCdXV4K00B4vFD67E2G
	9O8NMmWNBI3VcmqOPk6FAeZIt055WcW/d7eiL2uIlAiPkF2U5ELx8DeviU4Q4SCm
	W1KOYzkj0VlbRPzDOMLO9Bb0k7/WGgu6rILuf78NwfDn4=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAXqg74sblnHryPCQ--.22155S3;
	Sat, 22 Feb 2025 19:16:10 +0800 (CST)
Date: Sat, 22 Feb 2025 19:16:08 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux@ew.tq-group.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] arm64: dts: freescale: tqma8mpql: Add vcc-supply for
 spi-nor
Message-ID: <Z7mx+KwMrvYNRGuu@dragon>
References: <20250121103026.1404856-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121103026.1404856-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:Mc8vCgAXqg74sblnHryPCQ--.22155S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxuWlDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBAv7ZWe5p-wfsAAAs7

On Tue, Jan 21, 2025 at 11:30:22AM +0100, Alexander Stein wrote:
> (Q)SPI NOR flash is supplied by 1.8V. Add the corresponding supply.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied all, thanks!

