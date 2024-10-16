Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16CA815C147
	for <imx@lists.linux.dev>; Wed, 16 Oct 2024 03:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729051062; cv=none; b=My6d6Tq4hmCIx2P7qFVP0tLfhG635jwjghZAHCPFNKt1knlPituZIn1Q4uAgeOEq1LWN8QkavGGd+S9faS4Nlruh773wlYoCLSm1GyDdcij0W4SPouGdgcJa6WWGYlcNRqYZLM0c9rjmbcu3dkUjeqJAdOe11K4RFvOsfIHP4uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729051062; c=relaxed/simple;
	bh=AUrvuR2ymd8Mej9q1LGhcoC/J9ZSPaVJkk7ksDlHK94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CWzkZTUMvjwQDotaH7OtYzzNlBDA3ahk0o0bTD6C+ubao1yN2NIZTaaqqK14MqNTs/aiQmEz/AfrhgTVd0nTTjqt1rDrUs97mGKkJNyb+Re5f+QbnqzPnerg4mTbfCkwH4IFjyDYP0dJSLPvvdECzQKCy8YhvX69Kc3PcRKH2cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=To5K0PkP; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="To5K0PkP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=DOiS8h2BdFO/CzAOb+ly1+17VkRnItoKFb4CSNHU7/4=;
	b=To5K0PkP+aAh0eS8cUaZESBOEvL5b/GVvuoxymfP6rdRIlaTV8mt6J9xvHsREx
	W8Kf+DJz4jkPabb0Tr1LogxrkdI1bvR1Z/6Ya50oL/6+9s8kt2mEbGJXsoGt2hIo
	p/wgtfGfQaPAtpZaftySRQ+XA0qMVeAjnQ5sMw5Cgz5eQ=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgC3fqhQOQ9nq_UVAA--.261S3;
	Wed, 16 Oct 2024 11:56:03 +0800 (CST)
Date: Wed, 16 Oct 2024 11:56:00 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frieder Schrempf <frieder@fris.de>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Gregor Herburger <gregor.herburger@ew.tq-group.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Joao Paulo Goncalves <joao.goncalves@toradex.com>,
	Josua Mayer <josua@solid-run.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Mathieu Othacehe <m.othacehe@gmail.com>,
	Michael Walle <mwalle@kernel.org>,
	Parthiban Nallathambi <parthiban@linumiz.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v3 0/3] Add support for Kontron OSM-S i.MX8MP SoM and
 carrier boards
Message-ID: <Zw85UEd7R5bU/S6P@dragon>
References: <20240904085415.645031-1-frieder@fris.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904085415.645031-1-frieder@fris.de>
X-CM-TRANSID:Ms8vCgC3fqhQOQ9nq_UVAA--.261S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU7fHUDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiERV6ZWcPEbaO3AAAsG

On Wed, Sep 04, 2024 at 10:53:18AM +0200, Frieder Schrempf wrote:
> Frieder Schrempf (3):
>   dt-bindings: arm: fsl: Add Kontron i.MX8MP OSM-S based boards
>   arm64: dts: Add support for Kontron OSM-S i.MX8MP SoM and BL carrier
>     board
>   arm64: dts: Add support for Kontron i.MX8MP SMARC module and eval
>     carrier

Applied all, thanks!

