Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C70C1632D9
	for <imx@lists.linux.dev>; Fri, 25 Apr 2025 02:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745547262; cv=none; b=hT0UcW4MveNm5VNs5Am7byDn+hgt7GWb5INWnATKc94jKGR0XHkodfosZuXMbuPlJHQ0Pl2w7AHYlmgIy9rdOGqZSk7Wei6McGB6I1nhBaWEVxivmEhcUwe6ZxQGlOueQhuXqu/KUQZdNz0sqoDUMBXdZYadBab6ZjSwfysZX7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745547262; c=relaxed/simple;
	bh=22mLpVSZ+7h35wRUeBnuNiexnafvBA8zB/TsZyPssX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d3oU13IbmSDn1LNdpKItS2ZaSAoK5MdKd/IDBu3jw4uvLwyJXT1t5ju2ySfbd3R8LFoABVY4pl8towti3HuPB4Fi1pmaNTISFNXeTEsw31pTjEpnsRWFHMbJMxqgr8l6CM6KfTXK3ZdLMI/6anBmlx1/MSUL8oxWtKIT7YESFAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=QeppXBwc; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="QeppXBwc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=sB2QjJ66j3kraGlrqjw6SCUngpcSvfBQPp40F1HnYIo=;
	b=QeppXBwcJBb4ePAeuS1oYCzcV9k1vTQQ7gJQWzlgx855MAHLtommaeAZ8Sx/1g
	aB6pz4zjvbPG5fQUw1qqRCdhpiT/tc5oB84mxjPOrsD6HMIIFpn+XOcsfi3UcfPe
	M2yCOCQJGQIfxJbWxMudbLd5LogR6YFrRxVy1IoI+VjaI=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCnXrzc7wpoPm_aAw--.52709S3;
	Fri, 25 Apr 2025 10:13:49 +0800 (CST)
Date: Fri, 25 Apr 2025 10:13:47 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Revert "arm64: dts: imx93-tqma9352-mba93xxca: enable
 Open Drain for MDIO"
Message-ID: <aArv2yur3ox+RCDT@dragon>
References: <20250417081522.1145586-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417081522.1145586-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:Mc8vCgCnXrzc7wpoPm_aAw--.52709S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUsmFCUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiARY6ZWgK0Y2F8AAAsD

On Thu, Apr 17, 2025 at 10:15:19AM +0200, Alexander Stein wrote:
> From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> 
> Using the MDIO pins with Open Drain causes spec violations of the
> signals. Revert the changes.
> 
> This reverts commit 9015397c2f2d9d327c0cf88d74e39c4858cb4912.
> 
> Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied both, thanks!

