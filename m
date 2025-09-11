Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829E222DA1F
	for <imx@lists.linux.dev>; Thu, 11 Sep 2025 02:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757556249; cv=none; b=OLVzGNBi80Li0lE0sWq7lame22n5VwAElqLcXZGnLynt4I4/1FM3PJn0Ah68OoqJ+PGJyemVMKhFQDBc6voegQXWzeZH2yzAH5Ig9zsSxD2vN4qgzWJ5TSRmRAuZ19T/xNSLWOYfgkcOwthyHPDNuUkm6ZJejdH1V6HIc82Twec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757556249; c=relaxed/simple;
	bh=ormrv/kurQQ3uyKZks3x990bi2mrbiWK19RpJlCssQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gJDJvGKhVEV6ZAXKiGSGmtT5G/KVKP9aZUKeZAweJH/PqiXjcKYdKdg3kdSykX6PqYgAEsQCcFaMaX42R46hetA8t6qqsQit7ZFlKhIjvEpeZuLIrDp0CJVgvQnBJBawPoUaJylLORyUOd2jt/8v03Dia7kkjDKiYrRk7vu5W0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=TgXMS//u; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="TgXMS//u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=/ovddB11c5XSfbN+IkHJ3Pb74oXCQSIbUsT6dab88c8=;
	b=TgXMS//u0UN4LXuhEDFiSmVTQVOmuO9rWuV914TrFeefb9eLpMKvnY4/aI/7Qr
	KkM5Cmy5sy7+4z8djApZG7eCUIn28DQPP68UnJgbyAX8pFSk9hFdIbBS2otTcpjO
	8Qdh3H+CjydhZRQ/igAFVOzpFTyezJoGCT7TfgHzZI/R4=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgD399gHLsJo9n5OBA--.47148S3;
	Thu, 11 Sep 2025 10:03:53 +0800 (CST)
Date: Thu, 11 Sep 2025 10:03:51 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Bence =?iso-8859-1?B?Q3Pza+Fz?= <csokas.bence@prolan.hu>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Csaba Buday <buday.csaba@prolan.hu>
Subject: Re: [PATCH v2] ARM: dts: imx6ul-tx6ul: Switch away from deprecated
 `phy-reset-gpios`
Message-ID: <aMIuBwgtrWDe-5Fk@dragon>
References: <20250825-b4-tx6ul-dt-phy-rst-v2-1-0d3ba9736b0e@prolan.hu>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250825-b4-tx6ul-dt-phy-rst-v2-1-0d3ba9736b0e@prolan.hu>
X-CM-TRANSID:Mc8vCgD399gHLsJo9n5OBA--.47148S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUc1xRDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBLFZWjCB7lcQQAAs-

On Mon, Aug 25, 2025 at 02:52:09PM +0200, Bence Csókás wrote:
> The Ethernet PHY's reset GPIO should be specified in the node of the PHY
> itself, instead of the MAC (`fec`). The latter is deprecated, and was an
> i.MX-specific extension, incompatible with the new reset controller
> subsystem.
> 
> Co-developed-by: Csaba Buday <buday.csaba@prolan.hu>
> Signed-off-by: Csaba Buday <buday.csaba@prolan.hu>
> Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>

Applied, thanks!

