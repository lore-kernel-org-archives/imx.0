Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27051E5207
	for <imx@lists.linux.dev>; Mon,  8 Sep 2025 08:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757318426; cv=none; b=nLg+Yyoqr3RZRCC6TuUtj+EiraMyLyYHci4C+3j9QE5MCaeD3DfUy/8uczxoqok5dPA6VEL2NGoT+rg7RU/O4tPb3KimIR7nsXEEl6fq5m4Yhj9zgd9EHA2sCLaQklGGBIH2Svxw5wEyUsQO35r0Fm3zOGpYtO9GT526Pi9buNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757318426; c=relaxed/simple;
	bh=DWbX7R/U1GsCtmfMf8n32EQDbuPB/n6EGBZBGmdCfng=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=t8eEOB37HW63Jmq0JQ0XYDVsagUIpCftDrMcZklQj0a6KEj+9UYiyiguHbPFFi2cJM3NDS3LbPn15fyz4uWe52zt2TUOd0WPYzrJLnqsJV5pAZ62BzXxG470P2fY9uhKJkHM45pV1dB/H6uTgPWFFbUgRHwo2ybhgsPb8dvxlm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alistair23.me; spf=pass smtp.mailfrom=alistair23.me; dkim=pass (2048-bit key) header.d=alistair23.me header.i=@alistair23.me header.b=arsNjnY2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NQDeZIXX; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alistair23.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alistair23.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alistair23.me header.i=@alistair23.me header.b="arsNjnY2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NQDeZIXX"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 79ED07A011A;
	Mon,  8 Sep 2025 04:00:20 -0400 (EDT)
Received: from phl-imap-06 ([10.202.2.83])
  by phl-compute-04.internal (MEProxy); Mon, 08 Sep 2025 04:00:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1757318420; x=1757404820; bh=DWNOzXKqqTp6Qc7ppmvAFSQTsEPQo8Ua
	sak//JEG0g0=; b=arsNjnY2JA36AC4ZeTANdtihLjsizPq7R/rglX+ZsyZWya4G
	ps+R+umdV8G5ZjlETptIgKD0fVNe9p0OxF7tph2A3VF3wYdhI6PSXX/uw/ziy/Kz
	XRr+FimyYil34L4lPTH9Hv/7u/fRFtZ+ULOv/g5BMn+7pKIs6Lvkq0NwWd3AZlwN
	+lQoS5LHokRIM9T/bp/u0Qg4L++tW5okC8vVZpVHfOcplgBGQEvHBQmJlI6b9TIb
	c1pqANmeGypXs6HH6n9ZW8HPA2NiA325fxxf/Ky5pqj1AjQwa8pjQYMwYGRD2a2l
	n456vl5+JxhJKCpD4ibgHsvNt68BsklElQKqEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757318420; x=
	1757404820; bh=DWNOzXKqqTp6Qc7ppmvAFSQTsEPQo8Uasak//JEG0g0=; b=N
	QDeZIXXXVm87Ru38VuxsrudvAFO5JqEtImy23mfBBIfJe9QKqNqw6jhicie7cWgP
	kmhQtiKIpqvk4MWos2CbbzTqP0at6KRMPT9ANci5hg8G9yCorLvHXs1m3jvaNlS+
	9hOowVz/LNllM8QfWhRXyNNqJqSBYVAH5tAKXNYBDlyquPxcAg3Ykh3C9GcJd1u7
	S8e6TuTHKukQXkjYyNMVLM+3B4XKmNCzvuw+lbtkVn41dDfTjF2jfOHpvJpwtWFE
	s1P6b1Q7Y6W3qJCuI6lMxme+gLTZt9TsWaVpTR21YBkStuPZ1rpfpFuYj86sk30F
	TAy9Vv937KRLxcVkZI03g==
X-ME-Sender: <xms:FI2-aMNpHoOQEC_4gHBvE53DEZln5ddaztDCh09RSeA7wTj5IL-GPw>
    <xme:FI2-aC9WsgiaJQPMYvb9knDiyc83DMHbh2v1PD_Ee_6pSd4n6tQAzWEdRUjiwnVNk
    uwaUTCC8cgEtCQCSRw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduieellecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomheptehlihhsthgr
    ihhruceorghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtth
    gvrhhnpeehjeffgeellefgfffhteehvedvhfekfeefleeuvdehudeitdduveeggfeigfeg
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlh
    hishhtrghirhesrghlihhsthgrihhrvdefrdhmvgdpnhgspghrtghpthhtohepudehpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtg
    homhdprhgtphhtthhopehlghhirhgufihoohgusehgmhgrihhlrdgtohhmpdhrtghpthht
    oheprghkvghmnhgruggvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsrhhoohhnih
    gvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpth
    htoheplhgvvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:FI2-aNUUs6jpFp7PuNe5HgreZHB8iyBpZuIf3kD-dJsa2WVhdsHR6A>
    <xmx:FI2-aFdH_r3SH9hiec1SSl4QgKjsMDbmfeisYWpjiQupvMkuRxLS1Q>
    <xmx:FI2-aIzpQ0OSfNLYC7pXY4jg1VsBRnByTeTuN8CSqigjO2AlTgsYMA>
    <xmx:FI2-aIHAH3EFzPgzPhJj44teEUkjzxuaVq0d9--olVA3TJla_UA5vg>
    <xmx:FI2-aPmE_wFXsGQhWXvSLevOZPmJdjPUB2FDDwXmqDU6HvUNg5sqbo_z>
Feedback-ID: ifd214418:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E1AD42400098; Mon,  8 Sep 2025 04:00:19 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AzjicS5Bt2W7
Date: Mon, 08 Sep 2025 18:00:19 +1000
From: Alistair <alistair@alistair23.me>
To: "Andreas Kemnade" <akemnade@kernel.org>, "Lee Jones" <lee@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Mark Brown" <broonie@kernel.org>, "Shawn Guo" <shawnguo@kernel.org>,
 "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Fabio Estevam" <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Message-Id: <199908b2-b003-4ba7-8a1e-5ff0472b4adf@app.fastmail.com>
In-Reply-To: <20250906-sy7636-rsrc-v1-2-e2886a9763a7@kernel.org>
References: <20250906-sy7636-rsrc-v1-0-e2886a9763a7@kernel.org>
 <20250906-sy7636-rsrc-v1-2-e2886a9763a7@kernel.org>
Subject: Re: [PATCH 2/4] regulator: sy7636a: fix lifecycle of power good gpio
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 6 Sep 2025, at 7:09 PM, Andreas Kemnade wrote:
> Attach the power good gpio to the regulator device devres instead of the
> parent device to fix problems if probe is run multiple times
> (rmmod/insmod or some deferral).
> 
> Fixes: 8c485bedfb785 ("regulator: sy7636a: Initial commit")
> Signed-off-by: Andreas Kemnade <akemnade@kernel.org>

Reviewed-by: Alistair Francis <alistair@alistair23.me>

Alistair

> ---
> drivers/regulator/sy7636a-regulator.c | 7 ++++---
> 1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/regulator/sy7636a-regulator.c b/drivers/regulator/sy7636a-regulator.c
> index d1e7ba1fb3e1a..27e3d939b7bb9 100644
> --- a/drivers/regulator/sy7636a-regulator.c
> +++ b/drivers/regulator/sy7636a-regulator.c
> @@ -83,9 +83,11 @@ static int sy7636a_regulator_probe(struct platform_device *pdev)
> if (!regmap)
> return -EPROBE_DEFER;
>  
> - gdp = devm_gpiod_get(pdev->dev.parent, "epd-pwr-good", GPIOD_IN);
> + device_set_of_node_from_dev(&pdev->dev, pdev->dev.parent);
> +
> + gdp = devm_gpiod_get(&pdev->dev, "epd-pwr-good", GPIOD_IN);
> if (IS_ERR(gdp)) {
> - dev_err(pdev->dev.parent, "Power good GPIO fault %ld\n", PTR_ERR(gdp));
> + dev_err(&pdev->dev, "Power good GPIO fault %ld\n", PTR_ERR(gdp));
> return PTR_ERR(gdp);
> }
>  
> @@ -105,7 +107,6 @@ static int sy7636a_regulator_probe(struct platform_device *pdev)
> }
>  
> config.dev = &pdev->dev;
> - config.dev->of_node = pdev->dev.parent->of_node;
> config.regmap = regmap;
>  
> rdev = devm_regulator_register(&pdev->dev, &desc, &config);
> 
> -- 
> 2.39.5
> 
> 
