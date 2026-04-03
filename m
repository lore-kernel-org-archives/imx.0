Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A74D175A7B
	for <imx@lists.linux.dev>; Fri,  3 Apr 2026 08:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775204397; cv=none; b=VCeTIa15jsO8zBgJf0MNNwfO8/evj7w6hYGpaf2zT8nWJlopCDgiz6j3EupooI0/Prc8ZCQ6bxhCxaUoM0T+qHNvHPCGNUgbEJ4heSph1Yefxd14JPm0+KsZh906w2+YQKcOPO8QlfVEbsqVjiCnwtx3ArjfnGgrwPk/C/xOaFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775204397; c=relaxed/simple;
	bh=XJ9LQ4s6TnrkKaXwodpZ5o36l4ySGjegAn5TmdzxXGk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=U5ihci/8WnaT77/8f1+EMJgx8S9Fu27bdlPCglY2aFcBSmfsJflUFxGfJHVQV9ZQ6KasBqGjXZllyZN1c9GNQ+D8os4vsif14Z5gj5rjM7YshWP8bLmaCp2Ij+QExZUedNhrDxcgPweIBzCSIHNNVd9Z/OxdUi3fDx8pwvcNu7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=F6hB5Jdr; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="F6hB5Jdr"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 625ECC59F5A;
	Fri,  3 Apr 2026 08:20:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 88482603C1;
	Fri,  3 Apr 2026 08:19:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 44CED104502AB;
	Fri,  3 Apr 2026 10:19:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775204391; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=Lxv/KM4QBdN+qoM0q8jf+z4WWd2AC3JR0U0nTb/A3eA=;
	b=F6hB5JdrwfXSjFksrqsxC11MQsaSmL6BKBsVvZH5aUela+3KlPzq839s8ek97RKs/WzVeI
	xxKyMBR0Xln+0TyX60Wuc7fmAa7MiL15fQhX/A8yHHk+vkUjCrVWLFUwMW9Y4rxxrZ167n
	ejqwX0AQN+QACuzHGEdisip9P2cGjtbE4ZG7OfxV1hAvdRVjB5aaJJhX6TxuoaSzzfvvNO
	L5Xckmw1pQNXNUtUI6nodJ01+GTXVefs/ldLo1ZXo4UssopIpv/r5ij7p1ozSxBc+ghQ3S
	/913bKKZ+QTRojt5olYEFRrEILngT65R2T15t48P+/B/wE812eFxDVE35Dukeg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Sascha Hauer
 <s.hauer@pengutronix.de>,  Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,  Daniel
 Baluta <daniel.baluta@nxp.com>,  Shawn Guo <shawnguo@kernel.org>,
  devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS),  imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC
 ARM ARCHITECTURE),  linux-arm-kernel@lists.infradead.org (moderated
 list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
  linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH 1/2] ARM: dts: imx35: remove empty clock-names for
 nand-controller@bb000000
In-Reply-To: <20260403074634.774234-1-Frank.Li@nxp.com> (Frank Li's message of
	"Fri, 3 Apr 2026 03:46:30 -0400")
References: <20260403074634.774234-1-Frank.Li@nxp.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 03 Apr 2026 10:19:47 +0200
Message-ID: <87o6k05ucc.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3

On 03/04/2026 at 03:46:30 -04, Frank Li <Frank.Li@nxp.com> wrote:

> clock-names is empty in nand-controller@bb000000, which is wrong.
>
> Remove it to fix below CHECK_DTBS warings:
>   arch/arm/boot/dts/nxp/imx/imx35-pdk.dtb: nand-controller@bb000000 (fsl,imx35-nand): Unevaluated properties are not allowed ('clock-names' was unexpected)
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
