Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73693348440;
	Thu, 12 Feb 2026 11:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770896828; cv=none; b=PkRu6kfmJN5X1f+VcaJ86kSA3Iy3lw04aIVDDE0qIglfF9mFdF6YooD3TlzLblUWu0KfgQN2uf+aPSDwmnyG4ptVLUxQIKuM0tRp9ccmiqvj2RZ89x0AYAOWNExKKD1rWVg3AgGG/ygA5ymAF5Wx359Q2qrCELXxgZpyzqiVpQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770896828; c=relaxed/simple;
	bh=P/53ajElvHc7vqbcskcCH2T2/52dFDfgSUodst1Vxxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qG3Cv2Abjymz7vqUcdBGp7LeTN4WCmHOXhNMS0mb8XlwjX8NiYxpTtz0OsRtu2rMi5OfEoDDcdMiiFEt0mg2jRu0SDxiMKprWU3UoGZLrPUVaBEKiIstIz7Wukk6cyacfOvdHOFAfw6Yynoaqdx/MwbBVFFcAzQARc8ywZedTp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N1OegvXw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N1OegvXw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5813C4CEF7;
	Thu, 12 Feb 2026 11:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770896828;
	bh=P/53ajElvHc7vqbcskcCH2T2/52dFDfgSUodst1Vxxs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N1OegvXwl/1GZ0wUY3UWF/Y59BA1Nk1mXaiLYp1XBaVqKpSWmPkYaWRaIQbo1L/RD
	 ROgS+Nxt06ULAkacYYvUHV7Xhje6Hn8F9fogQ5i3bwaDQTlvTuAioVSmVOfrjsg8UQ
	 NXsuV9OZdH2sqxsYNuLwt456l1RWzwX6oqlazQ/KnYSB5wxcAQXNsQesBjgQ9kA0ee
	 kOB0+lXnt5DKycrx7QlGFdl0jCLNQ7GAPG8Z3YVNmbvjChasqWmHScJLbKUN/2bYGG
	 jc0kSpqkq4WN/dg5FiKMLZLhJuSTtiwifH/ImUIgPTXKys/YSgEcjxcMaJqtq/BMH7
	 c03WTuAfn9dIg==
Date: Thu, 12 Feb 2026 12:47:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: mtd: mxc-nand: add i.MX25 and i.MX27
 nand support
Message-ID: <20260212-sloppy-pygmy-ermine-1b2fd6@quoll>
References: <20260211-imx25_nand_dtb_warnings-v1-0-2f06aaa1e3b9@nxp.com>
 <20260211-imx25_nand_dtb_warnings-v1-1-2f06aaa1e3b9@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260211-imx25_nand_dtb_warnings-v1-1-2f06aaa1e3b9@nxp.com>

On Wed, Feb 11, 2026 at 04:19:39PM -0500, Frank Li wrote:
> Add compatible string fsl,imx25-nand and fsl,imx27-nand (over 15 years
> chips). Add one optional clocks for it.

... because IMX25 upstream DTS defines them? Or according to manual the
hardware has clocks but they were missing?

Please extend the rationale. Assuming you will find one:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

