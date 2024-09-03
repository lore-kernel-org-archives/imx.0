Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1711C767C
	for <imx@lists.linux.dev>; Tue,  3 Sep 2024 09:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725355010; cv=none; b=TCVygv+yAmCcU6h1ZtOCCjdr3T9xqelcSKf5+C7ZG1pmNmyw6KVlYc0m7QWgORfbJh1YYTfJOpR9RI3O85uNslR2jlpKJmInP2OVe8Eqa5Uqt1Q5a4WZ1E+dvdMRwsfCddI7QLbKv5HBFuzQ9KydZyd1A7+nvhp74QBdZyNQoFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725355010; c=relaxed/simple;
	bh=wq41NyGesv5AiC3lz0mAa+Qwn/W/Aee7WAkCJ0rGTuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tzfygoqsz98yq9t5YIFPPel8hQjY/ZTJSmR/App0iM8R8pV8lhKSkr0KTMRrFR63+JI/0jajHUgb0zuv6HJ5lqSYAPcvMef3SgfW/lSacSV4RNfC5G5/kXdicz0lGxJADZKdLaVoriwMrDhhByO8L5IuI3p0nJTUxnVdN2x0KyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=CfUET6Si; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="CfUET6Si"
Received: from francesco-nb (31-10-206-125.static.upc.ch [31.10.206.125])
	by mail11.truemail.it (Postfix) with ESMTPA id 64CFF22A41;
	Tue,  3 Sep 2024 11:16:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1725355007;
	bh=V1pTTV07r2NfNzXvB7UF/0OyUgDKTfKdvuu61Td5x2c=; h=From:To:Subject;
	b=CfUET6Sijl4iBdpA33iyK3zf+5ljUrPiYBHVhHvSTayEB7HzHdkcRIcJW2jHr2xI9
	 Paozik73jl7zkvBSErv3gP6zvvEJ6tCJ7D/6jROw2qhRkWcgNXmOtYaT71CRbnb9lb
	 e8o1yj23QyRTpwdy/LpleZaoiSokRgmeF9hXBddIkPtcGHRA4c8hX9t2Ilf9W5NUNP
	 Lzm2FMX117ijzxybmb7C7ccrXpY6gN4xaxoyIXeFxogqrmfOsDNtnZ2GrGhww2Nysb
	 0kKNxh3SiZ6vYCpFWv72QDsbiLNxC7cGDLDoNBXOae3bJdq+wXl2A8WbP2A0ayMKIs
	 RgLU2ZwdwWNeA==
Date: Tue, 3 Sep 2024 11:16:43 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/5] arm64: dts: imx8-apalis: Various improvements and
 additions
Message-ID: <20240903091643.GA20172@francesco-nb>
References: <20240826221541.15669-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826221541.15669-1-francesco@dolcini.it>

Hello Shawn,

On Tue, Aug 27, 2024 at 12:15:36AM +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> This series improves Toradex Apalis iMX8Q support adding:
>  - correct thermal zones
>  - analogue audio
>  - USB Host (Apalis USBH4 interface)
> 
> In addition to these it also removes the adma_pwm from the i.MX8QM SoC dtsi, as
> this IP is not available on this specific SoC.
> 

FYI, I just sent a v2 of this series to correctly sort the I2C nodes,
this is the same change you requested a few days ago on colibri-imx8x.

Francesco

