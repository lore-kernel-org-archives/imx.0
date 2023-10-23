Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB0E22321
	for <imx@lists.linux.dev>; Mon, 23 Oct 2023 19:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VfH2RE8f"
Received: by mail.gandi.net (Postfix) with ESMTPSA id EBC2940006;
	Mon, 23 Oct 2023 19:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698088231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MQTqFxA2htUn59dyviXFE3afEYPNmc6FuT7Pc/5oDXo=;
	b=VfH2RE8fu683n82J63fAWnyh0YZCsIKYktyJuucgqGBGaWQPg5j+AZjEi8ci0on++E8J9G
	dZVeeNTfESapIOvknDZCI7ObRjEfDo07U7oFh752U3lhkS2j62PgqRUAxEdW3qC9n1XygC
	QzsSCYYK6nkRLs61j00m83eE/c8PEgZff6DCS7pRK1ov1/WMdLO69S10bQZgr5v4zE0CFZ
	uTwXkFVnrMPvsDbk1e2yUgWpSpy01s5iJbgZ8Vpb7pSDACu39S9AFdP82lhgYsf55cqdXT
	U3ZFtzbjaNHJRCRJL/eveRMBEq42GpDxtQvQdEcPw2IDZVZc5EPFgENxrXIKeg==
Date: Mon, 23 Oct 2023 21:10:28 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 imx@lists.linux.dev, joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 6/6] i3c: master: svc: fix random hot join failure
 since timeout error
Message-ID: <20231023211028.3a4613df@xps-13>
In-Reply-To: <20231023161658.3890811-7-Frank.Li@nxp.com>
References: <20231023161658.3890811-1-Frank.Li@nxp.com>
	<20231023161658.3890811-7-Frank.Li@nxp.com>
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

Frank.Li@nxp.com wrote on Mon, 23 Oct 2023 12:16:58 -0400:

> master side report:
>   silvaco-i3c-master 44330000.i3c-master: Error condition: MSTATUS 0x0200=
90c7, MERRWARN 0x00100000
>=20
> BIT 20: TIMEOUT error
>   The module has stalled too long in a frame. This happens when:
>   - The TX FIFO or RX FIFO is not handled and the bus is stuck in the
> middle of a message,
>   - No STOP was issued and between messages,
>   - IBI manual is used and no decision was made.
>   The maximum stall period is 100 =CE=BCs.
>=20
> This can be considered as being just a warning as the system IRQ latency
> can easily be greater than 100us.
>=20
> Fixes: dd3c52846d59 ("i3c: master: svc: Add Silvaco I3C master driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l
