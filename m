Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7241B1BDC5
	for <imx@lists.linux.dev>; Fri, 20 Oct 2023 13:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="D+JciAcn"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1997EFF806;
	Fri, 20 Oct 2023 13:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697809778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zngJBNWL2s7OHwgwI6RJ9msvZIk+5luBA5kk8oImGe8=;
	b=D+JciAcnqlZuF76qZVOF5SM8B14odr1sM6EJw8msPu/PEyekNWKje1U2T4IwDyVNvutB91
	1q35bNriijP0kNYB3tSUTbYrUNa6fd7D8O9xCcScJmbITe3wP2U/p7tJ9GVpHtXIgKpKiZ
	bXV2jnYRWhGmSyrVS6dWXDYUarbSCj7/fexplyk8URU5lfhR3fFn29W5byFUl1Kr+LybX7
	QuPs4M980mam62m7/CewDtVhWvmIRzmoWLLBXdiA6smON/srCOLnZQubN0oWKmAu+J3dwJ
	a7WMxdBgWVny0Y1DUrpuiXNWEqCvI9gj3CHIUJjtj1TWsdlbh0aJHv6dXzSvbg==
Date: Fri, 20 Oct 2023 15:49:36 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 imx@lists.linux.dev, joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/6] i3c: master: svc: fix ibi may not return
 mandatory data byte
Message-ID: <20231020154936.55a499ad@xps-13>
In-Reply-To: <20231019222725.3598022-4-Frank.Li@nxp.com>
References: <20231019222725.3598022-1-Frank.Li@nxp.com>
	<20231019222725.3598022-4-Frank.Li@nxp.com>
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

Frank.Li@nxp.com wrote on Thu, 19 Oct 2023 18:27:22 -0400:

> MSTATUS[RXPEND] is only updated after the data transfer cycle started. Th=
is
> creates an issue when the I3C clock is slow, and the CPU is running fast
> enough that MSTATUS[RXPEND] may not be updated when the code reaches
> checking point. As a result, mandatory data can be missed.
>=20
> Add a wait for MSTATUS[COMPLETE] to ensure that all mandatory data is
> already in FIFO. It also works without mandatory data.
>=20
> Fixes: dd3c52846d59 ("i3c: master: svc: Add Silvaco I3C master driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l
