Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324DC2BF019
	for <imx@lists.linux.dev>; Thu, 12 Feb 2026 08:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770886562; cv=none; b=WNWANlR7Of4KursP9PJLTjXa/Bb69PK/n9wjpUhUkre/zdMCbeb6KZLfsLNPM6SaQysrLDUIrzjQqS0Qf+njNupLqWXC5TCAFhszggJ4uq9KXo4YkECLlCJ1j3QZq4j0ckZq0F9CSEPNTEVcrt6pupLZF1j+qoopyuNtS/zOuYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770886562; c=relaxed/simple;
	bh=tfvyWbx4/2UO4RM4LomfCL3Hut60ss0HfqHmEuIgIi8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=suj22qPXh2j7VKz6iicCu6g9q1XHidfUwP4kJyXq9mySsgX0mLs8Ggwm6dgUhBDjFTQnMC4RlpTKwVH0zoiQuZBWZxYmmcPh5ybS+gAfSLIrgQ7PVrlwzhPolRBkD+Ern1r2J55dlnZtqfnfcu72YVbk4cqNdDmgio6qTTRtqWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=2CJ/TI6f; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="2CJ/TI6f"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 76FB01A0E3C;
	Thu, 12 Feb 2026 08:55:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3D1B5606CA;
	Thu, 12 Feb 2026 08:55:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1CAE7119714B5;
	Thu, 12 Feb 2026 09:55:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770886557; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=DDNoaaEfwFU2nsc6h/m5gjTCggQVtwmmt0PAUYALLLU=;
	b=2CJ/TI6fiRTYG0KHUKvYNl6G6WRWp2Ju5O8x+MeEy28lPp2fe4Yaij4SinsOddzSwh6Qyz
	kTpDbA6FmHQABgb67N/JnGY4kHXoxiy9wS8ZcAOaet6MKsBQfFNAiSlp5epGwWRDvoTFzP
	JjOw6iFDPUQMfp7wOxc/xPdY2nkldA9hJh2RTqB59HNK5d6KToqZM8G0WMAA4KZVScLkBG
	GcFYFgPfYJTyAT4677Tob6xvQYDNeojpu0D8vKuRNEO+tO/el1Hn9P+0ViYjwL19vPWNTF
	d+iJSaXUiBtGLHhTtmxlLSl47EG+6OG7NKkcKEYv7zUuhndA+mNV8NVAmOUIVg==
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
Subject: Re: [PATCH 3/3] ARM: dts: imx: move NAND properties under nand@0 node
In-Reply-To: <20260211-imx25_nand_dtb_warnings-v1-3-2f06aaa1e3b9@nxp.com>
	(Frank Li's message of "Wed, 11 Feb 2026 16:19:41 -0500")
References: <20260211-imx25_nand_dtb_warnings-v1-0-2f06aaa1e3b9@nxp.com>
	<20260211-imx25_nand_dtb_warnings-v1-3-2f06aaa1e3b9@nxp.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 12 Feb 2026 09:55:52 +0100
Message-ID: <878qcyz6g7.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3

On 11/02/2026 at 16:19:41 -05, Frank Li <Frank.Li@nxp.com> wrote:

> Move NAND flash properties under the nand@0 node and place partition
> properties under the partitions node.
>
> Fix below CHECK_DTBS warnings:
> arch/arm/boot/dts/nxp/imx/imx27-apf27.dtb: nand-controller@d8000000 (fsl,imx27-nand): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clocks', 'nand-bus-width', 'nand-ecc-mode', 'nand-on-flash-bbt', 'partition@0', 'partition@100000', 'partition@180000', 'partition@200000', 'partition@280000', 'partition@300000', 'partition@800000' were unexpected)
>         from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
