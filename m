Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A8B229B35
	for <imx@lists.linux.dev>; Fri,  9 May 2025 14:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746801221; cv=none; b=BcMCNUHP8kag6Vh4FuyAAIKRZ9ie2RkIs6lNtmbH3OsazcMlnSrs4bIEnIbpLbF3wyX6K/i35sYa5UDD9YuDFtaXMRP3dEIzom9r2g76FZp1qY22jQtd2Oi8WWUp5PtTe12jgXGRfBRGl9pGjC5LKcztkqUkGoNe8t7/gaQONsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746801221; c=relaxed/simple;
	bh=mhyldcst/FwlgLhc8mUZwssOs1OMGla2sLaQ1bVesSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AJC+Cd1NTiNByqAxKops4y/H83V4Do713Vz0uHgsWjZVz1YPAMSVan2avF1g1pL5DLaFWJlBoN88dPvOVgpw8NuQ0RA0bsq6O0DNlPScoX2cBeCu1CAl5CufPPTzUcJmlrniyfUEFXfkIf6oSQ2f2EpoXLDUWjZr0nYJIANkYCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=pAXhJYTb; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="pAXhJYTb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=KZet+ff0CAqKdEihq0J4KoIwRL/wzE3KoqwUIYv73Sw=;
	b=pAXhJYTbNRJtQHK6fCd0ea3DhgtshwYydPx04PrJS2UaqOYzyginNzWLkXJq1F
	exjsqMWvuiU4N54hvvVh8NGwq2HSySo67N5rqG2xBPbmO607qao0hMED2UpTyKdB
	CRolNhVdC2YvbsiKfZ5BVqqovzV6OaRrgMt9YVsxYeJGE=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD33xEbEh5otAutAA--.15781S3;
	Fri, 09 May 2025 22:33:01 +0800 (CST)
Date: Fri, 9 May 2025 22:32:59 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt: bindings: arm: add bindings for TQMa95xxSA
Message-ID: <aB4SG1a8A2OvIBNB@dragon>
References: <20250428135915.520432-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428135915.520432-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:Ms8vCgD33xEbEh5otAutAA--.15781S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUcg10UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCR5IZWgd36zXkwAAs4

On Mon, Apr 28, 2025 at 03:59:08PM +0200, Alexander Stein wrote:
> TQMa95xxSA is a SOM using NXP i.MX95 CPU. MB-SMARC-2 is a carrier
> reference design.
> 
> [1] https://www.tq-group.com/en/products/tq-embedded/arm-architecture/tqma95xxsa/
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied both, thanks!

