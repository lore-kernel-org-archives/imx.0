Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CA321D3FB
	for <imx@lists.linux.dev>; Fri,  9 May 2025 14:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746800237; cv=none; b=KH09+FV8FiIygTT79pnNCwJVehnkEb/PhFaiOINCfGfWjL5w9vvw52mgKaMOI0vRmwqiAVyeyMpWdorF+wHoKlx5H/r/YpkHi5m0xtTqOCXUAjji0YAdMW3KBL59Ze4BF4wfdqGcfAK/QRylThgA8Z3DHtHIyvhsLaougpvewtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746800237; c=relaxed/simple;
	bh=8YpPIiJRES6y9U9nDUVsp0fNxxDECRqz8HdY8Iy5l9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z0WFKuSn2uIxsw0+6T1a5wkb1q1VqK/RJpqejP3ISTWxUNf1Fe6H9gac2e0BH46zQ4oklmu+GLJ04WjcvuGwnsMj9wgCcBpHu9ObyYuSzM6PiLHRzhXBgrZ3rveSsQILTiAAy/IC6z7Cu+AqBxdtMUxzZcZbeK8srT0ESKsTy8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=SSkA9rzG; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="SSkA9rzG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Kg1lOsicIGwMurHHg1lsBFSLBs1lOtH7DCGaQFmSoc4=;
	b=SSkA9rzGzQPYLCmZq3aIZxQoDYOHXIIkCeFrJsIqAmFW1LByq3EGP4MrFBeYD/
	xNj44kpFFaqkqBEvtsiUciWqUrgnVuTLwb+qqUUAkNWpUY9S6/X3SbQCVdyf49eJ
	FOXSMjluCBPH6r+Ma45DCZmyLC4QNvMX16DqwHTgH/4iU=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCnB_pEDh5oyTOqAA--.49231S3;
	Fri, 09 May 2025 22:16:38 +0800 (CST)
Date: Fri, 9 May 2025 22:16:35 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: add TQMa8XxS boards
Message-ID: <aB4OQ+sVXz1Qima0@dragon>
References: <20250424075533.1266435-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424075533.1266435-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:Mc8vCgCnB_pEDh5oyTOqAA--.49231S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUYD73DUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBFIZWgd-c1QIAAAsN

On Thu, Apr 24, 2025 at 09:55:29AM +0200, Alexander Stein wrote:
> From: Markus Niebel <Markus.Niebel@tq-group.com>
> 
> TQMa8XxS is a SOM series featuring NXP i.MX8X SoC.
> They are called TQMa8XQPS and TQMa8XDPS respectively.
> MB-SMARC-2 is a carrier reference design.
> 
> Signed-off-by: Markus Niebel <Markus.Niebel@tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Applied both, thanks!

