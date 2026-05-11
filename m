Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44F23AB286
	for <imx@lists.linux.dev>; Mon, 11 May 2026 08:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778489184; cv=none; b=DMw7iiyVZGZuQ73tzCw2oee50u/fCJqBOBQjMplxB2cxGUZ8hqiaoeColMKx/ph/2Mwyq8MlzyH5XCZmR7vkuBxQPCeqBIAhVZhTgfTr08SNlYZuuhhnCHoykphGCqz/b9YvkZ7fY8hpVhkPMvB/w8jIniU3xDJCkGyghfRyZwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778489184; c=relaxed/simple;
	bh=RdSBpaqet860zCtTuyM54Cs+0V8Gz2Qgpm7xAl4gNyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HQksirBlx0J5A4Y8UqbGvEoMl/ioSQ0aNRtmAxo7mhpaMnnPTzW1H75hf5BA4175StAcaPdyd8oGAvLcndQbhBSTV4EDeaekDo5hFfPpfQ4ZIRTOrdbpTZj5Ns1TmYQgokdHbJz8Er5AJRzkG7ob1tuCW++Nktetwbbj99VEu8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=S1PGxoAP; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="S1PGxoAP"
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 879791FA0B;
	Mon, 11 May 2026 10:46:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1778489173;
	bh=TA048/r0Me1GXrKVGIUon2gAJMRu+ZNYAkK6UX0cWiQ=; h=From:To:Subject;
	b=S1PGxoAP3piLZ7dZMj8FXJl+rf4h1YA5JiCz3IsNc+7p62bpLZfRAH1k9+zRQyRro
	 MV5UM6lVg64H0CdA1nDiEPGYOw91wCbfrdVC23X/vER4iQdQnU3bfHg7sE7eGEfOyU
	 Lr4NSSFTVLKdkGSQxaLsJZ5RyZZEqqm4cDSZEZfp/5Q0hGK0kMyrKplbQm68e5ZzMI
	 djsZ4tVUa30rcat3IHv0F1+YpyargJt1c47hKYjGMYNJy2zLtX8AlV6nqGmnr0plL0
	 A0NloMnEj4mYJVyeV5MDotmyTzYrvwG6FANxIwA10wUxddgBHGY20kQCEM1mGimmGt
	 CG8LfwEk15WzA==
Date: Mon, 11 May 2026 10:46:11 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Antoine Gouby <antoine.gouby@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Antoine Gouby <antoine.gouby@toradex.com>
Subject: Re: [PATCH] arm64: dts: freescale: imx95-toradex-smarc: replace
 deprecated gpio property
Message-ID: <20260511084611.GB29876@francesco-nb>
References: <20260508-replace-gpio-property-v1-1-ec67cc64e576@toradex.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508-replace-gpio-property-v1-1-ec67cc64e576@toradex.com>

On Fri, May 08, 2026 at 01:26:36PM +0200, Antoine Gouby wrote:
> From: Antoine Gouby <antoine.gouby@toradex.com>
> 
> Replace deprecated "gpio" property with "gpios" in
> regulator-vmmc-usdhc2 fixed regulator node.
> 
> Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>

