Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAB911C90
	for <imx@lists.linux.dev>; Thu, 31 Aug 2023 14:21:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 698991BF212;
	Thu, 31 Aug 2023 14:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1693491696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aByMOVFmM+SkUtrpBTr+ttq0hQzvoU/QCipPW40qS2o=;
	b=nvJAln9SgXRKA5Lz+jYUK/tvyRDj8d4nXwORPilNm7f2P56SAK0bEnDKXouUpvtK+wX6XX
	GwapBu/sS6LpjH0UHlteMJUFELqVM20JGwx01yuxCCsENH5lMe1QKZd7JX7GOAk0Qw/0DI
	Pj06mWEPK3PZDRC5TMcUZyzBhcUTZw1XVIhmKIwbVm361RxvBHsgloX74JjeidFd5Zg0pL
	HFPdJf6X50CAaHfYDEa8yGSZmCC5D6wOPKshWtlLcLGipYYSJS0Pa+USRDpOxDlddTQs1/
	QXWYHZP/rWv88h82GM3/o6jKZJKjjiQ4cw7zwfif3PDlFSUhelUA45fi+7Gx7A==
Date: Thu, 31 Aug 2023 16:21:34 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 imx@lists.linux.dev, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/1] i3c: master: svc: fix probe failure when no i3c
 device exist
Message-ID: <20230831162134.6ccbaf23@xps-13>
In-Reply-To: <20230831141324.2841525-1-Frank.Li@nxp.com>
References: <20230831141324.2841525-1-Frank.Li@nxp.com>
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

Frank.Li@nxp.com wrote on Thu, 31 Aug 2023 10:13:24 -0400:

> I3C masters are expected to support hot-join. This means at initialization
> time we might not yet discover any device and this should not be treated
> as a fatal error.
>=20
> During the DAA procedure which happens at probe time, if no device has
> joined, all CCC will be NACKed (from a bus perspective). This leads to an
> early return with an error code which fails the probe of the master.
>=20
> Let's avoid this by just telling the core through an I3C_ERROR_M2
> return command code that no device was discovered, which is a valid
> situation. This way the master will no longer bail out and fail to probe
> for a wrong reason.
>=20
> Cc: stable@vger.kernel.org
> Fixes: dd3c52846d59 ("i3c: master: svc: Add Silvaco I3C master driver")
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l
