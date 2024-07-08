Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A59179AD
	for <imx@lists.linux.dev>; Mon,  8 Jul 2024 06:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720421603; cv=none; b=P5dkXolkC6rUo2/pDW1WFL9EKuACS/jPk2zpu9DOzCmkyIv/mb8ttAJAQWzwRJ1r6Y+eWTAjdwnfLKBd2eaSuAJQIHaWr7CIOtxVp2kdv/S0Nno0+OFw7COKpE27PvcF/T7Xo0YiuHhuAVA1s7ECR/Vv/Gm/qeHGSQibVO2fXOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720421603; c=relaxed/simple;
	bh=2gOxvTARcszf3iBwQgiDWAJPwtR8spwla4JS1RdvN9U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dj71LURsPG7zRWsoHG46hm6Mn3bkFEHjOPSJeKRVgB8rz6Iejrz+OVd4M0XHLCqkPbkak4rR4s86ahM6N4EGEGmRmGNTSl/IKut33buqZR/5/YmUrUl+sbYmJU3QsFRd9t3NtPd809rgeE8ISRk15fv8yh+D4OnbwXSZp2/AovI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=G+eS1cnw; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="G+eS1cnw"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 32C3CFF804;
	Mon,  8 Jul 2024 06:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720421592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SMFmnL/yAUUG6X+1hGqY1449jjRCP0JB7dfM2mH71JA=;
	b=G+eS1cnwWy/kpo+W77MWv7QMdS4sxK/FA205kGTWhaSzI0CaOQXd3Zrr4ECLccJp0oJYkx
	hiObDCuj0ECY1QXzcliauBamxh5813oArqpjgjgJ+dAtypnrddj5a9f9QdHVv8zPI3psa6
	nmoSvpzanrlXNJElSe5L4IVqGbmlgL4HA788gj8YXBvqrF+/JE5OYVqOlWJUEogFGkrCb9
	ZNQtcEV4n44+OSKxjtanVFCBVJGw3YuXiR6u8Zz0Sv4+ADGXUH+vELt13EcmgpBWSL1rI6
	Eqplm4d8Vtr56d5KkWNukMM+hbVwCISfwXeG0vyzxLrjNJDIQalXsH3ZJv+pQw==
Date: Mon, 8 Jul 2024 08:53:10 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Conor Culhane <conor.culhane@silvaco.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org (moderated
 list:SILVACO I3C DUAL-ROLE MASTER), linux-kernel@vger.kernel.org (open
 list), imx@lists.linux.dev
Subject: Re: [PATCH 1/1] i3c: master: svc: Improve DAA STOP handle code
 logic
Message-ID: <20240708085310.5c5f5521@xps-13>
In-Reply-To: <20240702223107.403057-1-Frank.Li@nxp.com>
References: <20240702223107.403057-1-Frank.Li@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
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

Frank.Li@nxp.com wrote on Tue,  2 Jul 2024 18:31:07 -0400:

> The REQUEST_PROC_DAA command behaves differently from other commands.
> Sometimes the hardware can auto emit STOP, but in other conditions, it
> cannot.
>=20
> Improves the code logic to better handle these situations.
>=20
> Hardware can auto emit STOP only when the following conditions are met:
> - The previous I3C device correctly returns a PID and ACKs an I3C address.
> - A NACK is received when emitting 7E to try to get the next I3C device's
> PID.
>=20
> In all other cases, a manual STOP emission is needed.
>=20
> The code is changed to emit STOP when break the while loop and 'return 0'
> only when the hardware can auto emit STOP.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Looks sensible to me.

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l
