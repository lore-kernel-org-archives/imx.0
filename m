Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F3129428
	for <imx@lists.linux.dev>; Tue, 17 Oct 2023 14:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KpTFFW95"
Received: by mail.gandi.net (Postfix) with ESMTPSA id DA0A11BF212;
	Tue, 17 Oct 2023 14:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697551411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eiOs9YI1ID+7xm218JICttAfUAvK/5UkhYCx7ePCGkQ=;
	b=KpTFFW951zuT+F79MouKuHxWBk54OyHi5B/wOsPLTPLH8ulW9GAY7Nkwuq56og//cO7Mgo
	eG1H/dfvAm5Q4Ept/hjOz1VrnIiDy2V5iSu0IJqtoGN/gLX7l6sTwvlYGfJPYF98jUWlyh
	0EJiKJoRx+ARTVlkcHUNdXqg6DxPl1ym2MISJ6bPqhvNrFjSO+B3q8rT6nFy2Bu3I/wwJY
	oFL3+/ElyO4kLHn59CvDF58uBUdZIhncxwsN8NojCuBBAgmsGpF1qfP2luPb2V4TkkiByM
	dWOFfQXK+WI96tqw79289nv6x1yOZxrVfYNyLzeqiAP8tPL68AtIdGswJ1ixqw==
Date: Tue, 17 Oct 2023 16:03:27 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: krzysztof.kozlowski@linaro.org, alexander.stein@ew.tq-group.com,
 alexandre.belloni@bootlin.com, conor+dt@kernel.org,
 conor.culhane@silvaco.com, conor@kernel.org, devicetree@vger.kernel.org,
 festevam@gmail.com, haibo.chen@nxp.com, imx@lists.linux.dev,
 joe@perches.com, kernel@pengutronix.de, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-i3c@lists.infradead.org,
 linux-imx@nxp.com, linux-kernel@vger.kernel.org, peng.fan@nxp.com,
 ping.bai@nxp.com, robh+dt@kernel.org, s.hauer@pengutronix.de,
 shawnguo@kernel.org, sherry.sun@nxp.com, xiaoning.wang@nxp.com
Subject: Re: [PATCH 1/2] i3c: master: svc: fix compatibility string mismatch
 with binding doc
Message-ID: <20231017160327.569043e0@xps-13>
In-Reply-To: <20231016211854.2901427-1-Frank.Li@nxp.com>
References: <20231016211854.2901427-1-Frank.Li@nxp.com>
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

Hi Frank,

Frank.Li@nxp.com wrote on Mon, 16 Oct 2023 17:18:53 -0400:

> In the binding documentation, the compatible string is specified as
> 'silvaco,i3c-master-v1', but in the driver, it is defined as
> 'silvaco,i3c-master'.
>=20
> Add 'silvaco,i3c-master-v1' to the driver and deprecates
> 'silvaco,i3c-master' to ensure compatibility with the documentation.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l
