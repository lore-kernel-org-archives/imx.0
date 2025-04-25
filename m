Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AFF7483
	for <imx@lists.linux.dev>; Fri, 25 Apr 2025 02:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745546627; cv=none; b=tMMfuGhAVixE+Y1w/3dWhv9zjl5iwo4MWEcXVm57JaOZWju/QxWqu1p6+goOyiiCFW7B2fKXfPsopFeuEXip4lBfpXj/6WeqlOk7l8V9zQ/KkYynK7d11vM1Woh9bX116IByib8diD+DrOYz3q9heuIDzillGWqco386IKTbrzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745546627; c=relaxed/simple;
	bh=JJ8rxowVDQuzei/jFejrAlW4KLdrj6AXuBhBx69i6hE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cV8MAPc9QgkcbfCjV4K1vJc8QP09YmWAU/oSgQDLJ+2IxkkYfl888gHlJPtnvQgGPR4WiBZ3IvKTV008tDvIjfFNtagbxsFop5Lw1HNFfcMjxB3dnJoQ8NiW9ZFJDhmyno7cySsw9oDLuMtOcZuyPyahEQr+wXfVJH9aGP4yMCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=ozwY4w83; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="ozwY4w83"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=A4Rq8oM0lfxwGxHCxGHz5nvQEWnfy10Mn/MUqJBAsDI=;
	b=ozwY4w83ev7WrpOBi/KKnBVlxt0eSYZGRLhNKOfKLpFjx4khFNj3Ruhu9OG77i
	MtkWK2jRqHjfGE8pTmrBJo75KbcWLjzfQ7SL6Y2FKg/AOue7urCWkDHFsmtAAlMW
	JebPiLShAF99fK3llREW7xanCG6IQYN1iS2j00WNFAb5Y=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCHhtVe7QpoHU_aAw--.28202S3;
	Fri, 25 Apr 2025 10:03:12 +0800 (CST)
Date: Fri, 25 Apr 2025 10:03:10 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: Re: [PATCH 1/2] dt-bindings: arm: add MBa91xxCA Mainboard for
 TQMa93xxCA/LA SOM
Message-ID: <aArtXhus7Q+Qa+Wb@dragon>
References: <20250415125947.429121-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415125947.429121-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:Mc8vCgCHhtVe7QpoHU_aAw--.28202S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU3YFADUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgQ6ZWgKtVvRfgAAsq

On Tue, Apr 15, 2025 at 02:59:44PM +0200, Alexander Stein wrote:
> From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> 
> Add MBa91xxCA starterkit base board for TQMa93xxCA/LA SOM for
> parallel display evaluation.
> 
> Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied both, thanks!

