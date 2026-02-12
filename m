Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AA82DAFAA
	for <imx@lists.linux.dev>; Thu, 12 Feb 2026 08:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770886612; cv=none; b=nkK30exKC2WYC4zs86tYjVWF5RtC4odqLSfE1hQLcG5HZLydGvRIt/sorqbxlpBzxfoR0TARtkPYw0X7ziYqmcbNHAjm0Hp0JeC5t9cCcChqOcmLGMBnKO3r8KgKnNOyj3FEkESsKAL4WyMIwZoEloWFeksUdVb15zdpIzhEVOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770886612; c=relaxed/simple;
	bh=hDOH8RiBsoa8QQWGvfBy20zXdX9QAWhlDlGbkxYJQGk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SJ5GWAqardZ1uQdyjhNErGorJIe4q9W0wOCvC5SsNJwcJ94Q8MEM+1gUlP706v8SBWoaxRG0p9N0I3IdivVDklUlni9nLK0/nO3VrvsJPzWlVxdsk0ja4/INi1NSClTMRetjo+Bi4hjbiIM4LMU/E1VZPL8bW6EwWF4Oj38PA0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=aae3Ubgu; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="aae3Ubgu"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C1F244E40CB2;
	Thu, 12 Feb 2026 08:56:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 95A38606CA;
	Thu, 12 Feb 2026 08:56:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E9DAD11971525;
	Thu, 12 Feb 2026 09:56:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770886606; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=0ldWFSho7cgvpQS3kw2NKCZEi+w6HLlHSMQtO3IQVz4=;
	b=aae3UbguXIhpWxFQQi5HZqISIhQQGKUqxkIEuntQznrTF4HZSltGDmKmvpmLvY+vPwYccj
	5wAj/jFC3tDuBq+AZpd9eyHLMR0GZwpWGsKGyLGQbfQVu1BX4/+T54klACgBF1DLGxfWXw
	4AjJHrQpukpjOqwat6Moc7G1GVsUOn14tPwMtIt6A0ln3LgfKt9zAUNgx4rTqANZ9JHsd+
	ngJQkUf0qz0VfbQIb4hOEkwoddhYkBNNJMUAdzovu3syPptpSLabzi3WF10KLHwuHvwD4y
	GpLfs+Nw/CPeEbtDQ0u/IC+B6WM7setVLyWqh8ckdKSoWAfWx/TEsfGycX+SFA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Sascha Hauer
 <s.hauer@pengutronix.de>,  Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,  Uwe
 =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
  linux-mtd@lists.infradead.org,  devicetree@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] RM: dts: imx: set #size-cells to 0 to align with
 nand-controller.yaml
In-Reply-To: <20260211-imx25_nand_dtb_warnings-v1-2-2f06aaa1e3b9@nxp.com>
	(Frank Li's message of "Wed, 11 Feb 2026 16:19:40 -0500")
References: <20260211-imx25_nand_dtb_warnings-v1-0-2f06aaa1e3b9@nxp.com>
	<20260211-imx25_nand_dtb_warnings-v1-2-2f06aaa1e3b9@nxp.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 12 Feb 2026 09:56:44 +0100
Message-ID: <873436z6er.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3

On 11/02/2026 at 16:19:40 -05, Frank Li <Frank.Li@nxp.com> wrote:

> Set #size-cells to 0 to align with nand-controller.yaml. Remove the
> redundant empty clock-names property from the NFC node.
>
> Fix below CHECK_DTBS warning:
> arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dtb: nand-controller@bb000000 (fsl,imx25-nand): #size-cells: 0 was expected
>         from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yam
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---

Besides the prefix which misses an "A",

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
