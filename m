Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834061BDC5
	for <imx@lists.linux.dev>; Fri, 20 Oct 2023 13:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RPknoZfe"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4F0681C0009;
	Fri, 20 Oct 2023 13:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697809860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LEJdh2dlht0YbkjGiXzj0O1UFXr5Vq+0OYseTVm5gD0=;
	b=RPknoZfelsjqVnX7ujKayYxTjgpay25KcKrzIsmenLT/Ui3+XA2AWDhTG+mBuOUh9nP0CY
	JEFOgENRhrNcQ3L57X5oK5O4+Oqm2XdXmCDLbxbGvpypRHVlPUlHslOlxbH83G1L7pEQrp
	ClpVmJXFXM2i9IkHNJqwynQ6hfuL6PYO3PgQkc79hFwJAioHedmAPC8U7vC14IYtbz5fQm
	uB1WjhVbU7LHV6u6lap1+mbVFztdN8T/f+W7GpFZ1K+GRwIr9SSxRv4f1SyLolsRDlG6T6
	v9440lfZ4lvyfA7GGImIAjb23Li7gJE2+g6/gT9iudLRSD9lDSOjWEUM2CMj0g==
Date: Fri, 20 Oct 2023 15:50:59 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 imx@lists.linux.dev, joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/6] i3c: master: svc: fix check wrong status
 register in irq handler
Message-ID: <20231020155059.4dfd4109@xps-13>
In-Reply-To: <20231019222725.3598022-5-Frank.Li@nxp.com>
References: <20231019222725.3598022-1-Frank.Li@nxp.com>
	<20231019222725.3598022-5-Frank.Li@nxp.com>
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

Frank.Li@nxp.com wrote on Thu, 19 Oct 2023 18:27:23 -0400:

> svc_i3c_master_irq_handler() wrong check register SVC_I3C_MINTMASKED. It

This sentence still needs to be corrected, please read carefully my
reviews.

> should be SVC_I3C_MSTATUS.
>=20
> Fixes: dd3c52846d59 ("i3c: master: svc: Add Silvaco I3C master driver")
> Cc: stable@vger.kernel.org
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---


Thanks,
Miqu=C3=A8l
