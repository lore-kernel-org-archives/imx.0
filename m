Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EC8371D14
	for <imx@lists.linux.dev>; Fri,  3 Apr 2026 08:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775204413; cv=none; b=hpdsvl2qkjR9/iM934y9ixtFGXZcczNt9ikEDU9K0IAjZTmkoLW9GjSm2mfYgiuzdqVr84g+34KEI+QqofXvtS197FUvVkpcx0N/+sv1eHCBXP9Gfgu9ZQJKYVtBgKZWXziOYe6ypbNa/hmvaY8GgiLeG2Hq6qE5ymXV7Bl83qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775204413; c=relaxed/simple;
	bh=Wk39R5GHYD6wYOiYd+T5UK3erJyg4bo4XtH0Z9D8Mms=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PFlLFa6Wi01ZVNa6Za5G9p5RuHMVHd7+BtYrcXu7XOYT7b0/0FCIDOTPGHW3UE//VhcjIsNj0xSRYxnFKHt8Nw1eCXqetVaVz3oSuX8p/q5sP6edL3b8hLe9AIRoPnH7Mp3EMgwQXh8f45IxSSt+540T2Lx8IPrgPkuV1KTQvfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LZ7oUbaE; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LZ7oUbaE"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7DF884E428CA;
	Fri,  3 Apr 2026 08:20:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 51CEB603C1;
	Fri,  3 Apr 2026 08:20:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5F7671045013D;
	Fri,  3 Apr 2026 10:20:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775204409; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=1lEA07+/hkDJ8JJLpB7l06BYU/2a5Curlp04Uz301j4=;
	b=LZ7oUbaEToEHCxN6FYUkEf3my3laRHBinlvDgV4xdlrX8K+3GjBUPsQB9rlYaWP958Yxgo
	NZzqarCO2SP05QFWNYxgU/BT54wResKkf5ahC+kntJltW+vIXNrzqKd2NgMfuQO7IVU1T1
	DGa2C7nWnv9BdDHqEQFEjwGBgYgzeXtmnqOlyt/QiT4j82jdYqN9vLBufpBgQFSOjeSbfA
	GOrjauNWJ9k7m4NhYl4MJ0K34Kc6DRnUGrXknnKqCbta0P7l3/EhiA05Bjw01r9BAXiVB8
	6iKIZzPpj4vWxPVS9uDlpwCbtFNNzuxcMGLj07LqNBnm8aNDtTnYKar1sefn9g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Sascha Hauer
 <s.hauer@pengutronix.de>,  Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,  Shawn Guo
 <shawnguo@kernel.org>,  Daniel Baluta <daniel.baluta@nxp.com>,
  devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS),  imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC
 ARM ARCHITECTURE),  linux-arm-kernel@lists.infradead.org (moderated
 list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
  linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH 2/2] ARM: dts: imx25: remove empty clock-names for
 nand-controller@bb000000
In-Reply-To: <20260403074634.774234-2-Frank.Li@nxp.com> (Frank Li's message of
	"Fri, 3 Apr 2026 03:46:31 -0400")
References: <20260403074634.774234-1-Frank.Li@nxp.com>
	<20260403074634.774234-2-Frank.Li@nxp.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 03 Apr 2026 10:20:07 +0200
Message-ID: <87ika85ubs.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3

On 03/04/2026 at 03:46:31 -04, Frank Li <Frank.Li@nxp.com> wrote:

> clock-names is empty in nand-controller@bb000000, which is wrong.
>
> Remove it to fix below CHECK_DTBS warings:
>    arch/arm/boot/dts/nxp/imx/imx25-pdk.dtb: nand-controller@bb000000 (fsl,imx25-nand): Unevaluated properties are not allowed ('clock-names' was unexpected)
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
