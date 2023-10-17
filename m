Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C7543AA1
	for <imx@lists.linux.dev>; Tue, 17 Oct 2023 14:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YRgT2TIE"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4569D1BF206;
	Tue, 17 Oct 2023 14:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697552220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rzWYE5zWxR4YaYmFe+0XGWID7PzfYYmmrvNow3aY3S8=;
	b=YRgT2TIESp421HGFWArNrytq/Jl2NLfZZUDtPgsnpvAXKMgNPOn644HqVy/S7h/WBrZpCl
	gP3ZJ9sR0xFF6u/yJ5tIsFdO3zTMxGsYXZCfap+NHZQcfuF9fcyBfmI4ucniHIRDIXmwr6
	afJk1w1IXCYYvuA7PmHq5yHmdxQP3/++Lfgm4X7vgu0fCuAgNak27fJKgnWsfVgYc8zkM9
	JSyq+NCIKjQnhbWjS1TuOeYQdyf9Fdt8SDeYsqhcPUiRclkZYDPFCxba7Can1G13X1cEQk
	0466Xg/zkf7/AvLO3xRi+iiseuh9MPORjWcCohrv00/N1TUbMaDqGi3w3sqn7Q==
Date: Tue, 17 Oct 2023 16:16:58 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: conor.culhane@silvaco.com, alexandre.belloni@bootlin.com,
 joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/6] i3c: master: svc: fix race condition in ibi work
 thread
Message-ID: <20231017161658.2de6d9f3@xps-13>
In-Reply-To: <20231016153232.2851095-2-Frank.Li@nxp.com>
References: <20231016153232.2851095-1-Frank.Li@nxp.com>
	<20231016153232.2851095-2-Frank.Li@nxp.com>
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

Frank.Li@nxp.com wrote on Mon, 16 Oct 2023 11:32:27 -0400:

> The ibi work thread operates asynchronously with other transfers, such as
> svc_i3c_master_priv_xfers(). Introduces mutex protection to ensure the

Introduce

> completion of the entire i3c/i2c transaction.

Did you experience faulty conditions or was it reported thanks to
static analysis?

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

>=20
> Fixes: dd3c52846d59 ("i3c: master: svc: Add Silvaco I3C master driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---

Thanks,
Miqu=C3=A8l
