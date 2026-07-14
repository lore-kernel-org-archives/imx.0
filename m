Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9650D3DBD5E
	for <imx@lists.linux.dev>; Tue, 14 Jul 2026 06:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784012396; cv=none; b=qxNIh2FjftYQtoZso8gAWZRVhY1gCW70dRFcDHVXhzGe55Q79jNq3MeRbcOXx2a29cuWOd5OgY6+fpSB7swRomNKX3U8m+hMfqGQws6S6+qc/VWUgi4Eha6e9iJJ9IMFzKTVHH43I7hQXQ5BdIjWxJ8gCQzOkX+C8nc6tqiBjfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784012396; c=relaxed/simple;
	bh=j499OwKt4tdvIo10kDVb5lcqb/FU4jIpUd+BFE9BuIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SxpM7Gv9s7BXgOYFePUg+f96oH5V1c50GdnQ1fxRkInkMyhcSJ/EVmcob18vk9d704g3qAmRZNN8CNbHJ9VqjKD2JZYN6hZaXM80TLa/XYWjxr2N6CZVqP9goNom79h/khXFAWR4wU9an6GE6OO6HTf0aAkGHA6QVXeMin88p98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=IdEwe8iu; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="IdEwe8iu"
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id A0C421F901;
	Tue, 14 Jul 2026 08:59:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1784012391;
	bh=HZY15Na630cT23+3bnvhccBu3QQYmy/9h6UOo1ApJwE=; h=From:To:Subject;
	b=IdEwe8iuWZ94uJXyoXcJ++1wMCLmuD9eEWQrRYJpNLgy44Z9d0UEaAiotfqJjAVRn
	 w7YW0/qnvJsyfSG9m/t9eNjnBOdvzgWnPEZBHJkHv7nRRg7/4dfK+DEM1wocDil/zp
	 d8ciIJg7hGcp/nK452Z33mg+lOK3xm2rNMZZHK9FXGSIttyle7Grn3EbqH8qfgh339
	 QAoXXNJFbdVmZc9kKGqu/drMEIZRDXmnM/12OjDMHGlr/KSLx5apMcH5sGG1nHXGXL
	 I/WTgVAchHBL0QQlgU1ujs8Te2j3Zz2n8p4R4ERTp1T6x2oKztiecUyAQPnsQHi7vq
	 EiHe4iyzyfyeQ==
Date: Tue, 14 Jul 2026 08:59:47 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Frieder Schrempf <frieder@fris.de>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: Re: [PATCH v2 10/10] arm64: dts: imx93-kontron: Enable ELE firmware
 driver
Message-ID: <20260714065947.GA22086@francesco-nb>
References: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-0-b8266d93514b@kontron.de>
 <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-10-b8266d93514b@kontron.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-10-b8266d93514b@kontron.de>

Hello Frieder,

On Mon, Jul 13, 2026 at 04:53:46PM +0200, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> Add the ELE firmware API node and pass its handle to the OCOTP
> driver. This allows us to gain read/write access to the OTP fuses.

This seems something we should have in the soc dtsi (imx93/imx91), it
does not seems board specific.

Francesco

