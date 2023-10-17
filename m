Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BB943A93
	for <imx@lists.linux.dev>; Tue, 17 Oct 2023 14:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="L4flTNur"
Received: by mail.gandi.net (Postfix) with ESMTPSA id B55831BF209;
	Tue, 17 Oct 2023 14:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697551651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3JN4ZGYYW38xpilPMmfTxgTyQKe9+4lxOfEsytKMKEQ=;
	b=L4flTNurZT4xkQl7CucQ+PvtwH2F8NnDAKIONZsu0uTx1usez8MsbvwKOrNqE9FxoxexVW
	5Ym2R8s5dttxQwt1tcvV6XGoKVB4t63pRBUCKPs/gXo4Fa3f8FjTEepAA0F7qjxueiZxpJ
	Q+fceWvpci8O2Uiz5/wPUzULytih6A+96MiPVSTYViwJnPC2vbt2IaAUfUzO0FzyX3CEGC
	DdVthaYI9pJOTQ0decuNvrb/Eg8MukKnKAe+Y7fFYiJ3cF80YAk5UcvAngF/isvMHMEC7s
	qsj8w3Z5sdXGYXuCGh4wM7wx4Z92wGAKDJjVoYNlnCyJ2EgR0Jp9taqtohA6Zw==
Date: Tue, 17 Oct 2023 16:07:29 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 3/5] i3c: svc: rename read_len as actual_len
Message-ID: <20231017160729.58984467@xps-13>
In-Reply-To: <20231016154632.2851957-4-Frank.Li@nxp.com>
References: <20231016154632.2851957-1-Frank.Li@nxp.com>
	<20231016154632.2851957-4-Frank.Li@nxp.com>
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

Frank.Li@nxp.com wrote on Mon, 16 Oct 2023 11:46:30 -0400:

> I3C transfer, target can early terminate transfer.
> I2C transfer, target can NACK write transfer.
>=20
> 'actual_len' is better name than 'read_len'.

I don't find read_len confusing because it may mean "how much bytes
were actually read" rather than "how much we need to read". But if
actual_len sounds better, I'm fine.

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Thanks,
Miqu=C3=A8l
