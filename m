Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0DD221F12
	for <imx@lists.linux.dev>; Tue, 30 Dec 2025 10:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767090337; cv=none; b=ErBN7hIt0IarIm78s1xGW729YBLHNXGiBZsJlLibrEKS5HvXXg2nlaEYQBLQYEsZMQ3arxo1IuzrdAuG+M4gkQ0gbwrCEGbGhg/wVDWbwQSYCndtllyn18hUQAYRkK4wuxC1H8Cnyt/0Tls5AH/9S75Sij525CtewZAP+5R7z7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767090337; c=relaxed/simple;
	bh=UaMW4Isg1Ih7YV7hIfUjjn3+wCoccITuuZCbWsJ6/mc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ce0vwzzB49dbjHXtks3xChwh+EP6NxdWy9nvRMLV8DfFhM9xjVjxZ/mKHybsytdfFytFSZDMH5sKKqfxeZu3b3InrsuX/Tikn1ohQ53T6mCT4ajTw9+0Ftl4NBs6ugWIC9NmwdDSmEy6sSuT6hOsOouz8R8MH9xekjf+mkfIYro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=WenOvTcH; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="WenOvTcH"
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id EBFEF22D01;
	Tue, 30 Dec 2025 11:25:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1767090326;
	bh=UaMW4Isg1Ih7YV7hIfUjjn3+wCoccITuuZCbWsJ6/mc=;
	h=Received:Received:From:To:Subject;
	b=WenOvTcH9vJw+rKtYP66MBnWLyrRhFtNlv64tAQWNg1q4Xeaopj37HiNM6B1OlsFk
	 AC8/FqBJs2O+zjGP7z6BAv+MdOr4tF1JwLGp8RaCNhF7omeBa9wb/r99uPOZt0rT2f
	 Fq0uhfCswEluexqkia76aOpiGPgEJ3g4kiSRzB7c+Bnh91FOJp1nplKSIm4WSjvv8m
	 EScwc2/7cnNK5ethxADtvCu2pTO0Itn4JCKwdkfxkuwsyR5oIlch3i6HabkQWQzA5b
	 ay22oD3Q3oOx1JIKMJyUSj8477v7e7HhgyhDrnjmRfTR18GLYYeq0gf81BM/BAqrds
	 6aftgHTauCEIg==
Received: from livingston (unknown [192.168.42.11])
	by gaggiata.pivistrello.it (Postfix) with ESMTP id 8A6227F9E6;
	Tue, 30 Dec 2025 11:25:25 +0100 (CET)
Received: from pivi by livingston with local (Exim 4.98.2)
	(envelope-from <francesco@dolcini.it>)
	id 1vaWur-000000001Ej-1eKT;
	Tue, 30 Dec 2025 11:25:25 +0100
Date: Tue, 30 Dec 2025 11:25:25 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, max.oss.09@gmail.com
Subject: Re: [PATCH v1 0/3] arm64: dts: imx8x-colibri: add additional
 functionality
Message-ID: <aVOolTfi5s9jqG2v@livingston.pivistrello.it>
References: <20251031125003.275033-1-max.oss.09@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031125003.275033-1-max.oss.09@gmail.com>

Hello Shawn,

On Fri, Oct 31, 2025 at 01:49:40PM +0100, max.oss.09@gmail.com wrote:
> Provide a pwm-backlight.
> Provide the 32kHz Wi-Fi clock used during low-power operation.
> Configure CMA from the device tree.

This series was not applied, any concern? Anything to change?

Thanks,
Francesco


