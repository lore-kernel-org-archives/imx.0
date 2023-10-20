Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9816112E65
	for <imx@lists.linux.dev>; Fri, 20 Oct 2023 13:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="biU7ESoH"
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id BF717CF3FA
	for <imx@lists.linux.dev>; Fri, 20 Oct 2023 13:45:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C67564000F;
	Fri, 20 Oct 2023 13:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697809531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lr/z7uihQprUld3MCX8m2TxbGzxLF1jBcFQtsJ1q8Lc=;
	b=biU7ESoHpgUw+DDQz7V86GfiGC9KtHEliOGtPOBH2lqU8v9/dKa7TpQRy/qtWhw8nFH2iv
	SPRudRRN8PXjnJSt1sep9Vyoc2uvua23p4NRnADvgbOFKXF9mYrqgSa2XYkuvqGRMkXqih
	2Djs7z08wehMsdbDIskMWYzd2tv3SX+rYNAMX16zDcP03I1XMldDNv98b8aUIcFRx3QMyx
	L58Kusya/Twsickg6kRU0wnTpc5bksBZaWwlRxkmITvRWxHFGXzc/hIhcgXO5l8bd5FHp4
	9vTzCJC9Nr0T8VqOiewC15HTEuoOlfOBaNkbhdeIfHIBRzw7WnBR4SGJnvgOnQ==
Date: Fri, 20 Oct 2023 15:45:28 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Zbigniew, Lukwinski" <zbigniew.lukwinski@linux.intel.com>
Cc: Frank Li <Frank.Li@nxp.com>, alexandre.belloni@bootlin.com,
 conor.culhane@silvaco.com, imx@lists.linux.dev, joe@perches.com,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] i3c: master: add enable(disable) hot join in sys
 entry
Message-ID: <20231020154528.2f5f68f5@xps-13>
In-Reply-To: <57efe6de-cf65-32ed-fd1e-a388e1676c70@linux.intel.com>
References: <20231018205929.3435110-1-Frank.Li@nxp.com>
	<20231018205929.3435110-2-Frank.Li@nxp.com>
	<57efe6de-cf65-32ed-fd1e-a388e1676c70@linux.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Lukwinski,

zbigniew.lukwinski@linux.intel.com wrote on Fri, 20 Oct 2023 10:55:27
+0200:

> On 10/18/2023 10:59 PM, Frank Li wrote:
> > Add hotjoin entry in sys file system allow user enable/disable hotjoin
> > feature.
> >
> > Add (*enable(disable)_hotjoin)() to i3c_master_controller_ops.
> > Add api i3c_master_enable(disable)_hotjoin(); =20
>=20
> What is the use case for having HJ enable knob in sysfs available for use=
r space other than for debug stuff? In other words, does user space really =
need to enable/disable HJ in runtime for other reason but debug? If it is o=
nly for debug maybe it=C2=A0 could be move to debugFS?

I don't think hotjoin should be considered as a debug feature. The
problem here is the power consumption which is higher if you enable
this feature (you need to keep everything clocked and ready to handle
an IBI) whereas if your design is "fixed" (more like an I2C bus) you
may save power by disabling this feature.

A module parameter does not fit here because it's a per-bus
configuration.

Thanks,
Miqu=C3=A8l
