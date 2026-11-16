Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794845544;
	b=Bn3cyoZmE2ZUGD6sku8uThY6fzH80tIoFz4e2nVXH2/m9B23gUPNh7BO+nsbLZsjeTUP
	 +cmZ6HO3BRylnpI8bmST27lT2kKd0TbPBEVD5UaN8ShPESvgi++vHGiWPbPA9DjTj3sc7
	 50QnGzSoWleHS2Hu8ee5Y8o6erBVhKu+rYPtHVoEegSiqZtVJem1dFcO3zrvi1IX21yiy
	 HlDTzF1wBGGt53IO5R/QnnWIB0ycVLl/rQkbHso/rWy5o1uAlxDoW+UuqRuaUihhHmDNK
	 cy+YlsdvtTtGmQJeBGKRjxAxK7PoYsbAxi3532Oc17QtZXfxii4NVaXzRbC8NfMG8tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794845544;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=WL42cWBPuyCFWlEF/5Nn+QC5AN/XCgSMhpRtAl3fZBE=;
	b=S7vFwcqY+WgnyzepBT5yTErTzunCKYRHoiCmR0jbw88vjA33tkLbG52RUOar8zXbxLn/
	 wUJQUMG155WgT7WLcrATfVXE+1bpcNMMBpmriQjGNDmU053k0hMa9Nj5XKPuDhTwWX86n
	 8oLtO/H0vO80JLk1dwKIKF/GjRXblt9ldqW4cQCK4Fko3i5HZIJCdyQupdogRJSndNiVc
	 XIEuMdq25Md8KpvYEPgALy9dPDnH47SZ57I6OWQ/QiyOzrnIKntObHUz8set30inEo0aG
	 3FBGnD3ymayPG2q6wEw3fqxXL6nve3rga1yHfcTSpRJYxpvxf3pwhAdniCrXS/fj6kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="riGSXRd/";
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B7E606A332
	for <imx@lists.linux.dev>; Mon, 16 Nov 2026 16:12:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79B7E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=riGSXRd/
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 09F72C4EFDB;
	Mon, 16 Nov 2026 16:12:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 017136023F;
	Mon, 16 Nov 2026 16:12:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 043D111BC146D;
	Mon, 16 Nov 2026 17:12:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794845538; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WL42cWBPuyCFWlEF/5Nn+QC5AN/XCgSMhpRtAl3fZBE=;
	b=riGSXRd/myHb5u8n6/BiinflJE9PCHCIQkASe3+enQEEMPlS7Ns9BC/mT0H8WJG0Wjjh1w
	f+lviNzHVXBT0Y3e+PoiY/lYOA/3wT6CQkvrsuECFuKu0vR9uZy6Ex/ZRAd9fOCJxlfhph
	6IjvX4jHgGcTfDtre56AbRQF1YEtTtLhNRxeh9fqdiMetaWEJ+aZMOiIbzhf3q0/Ta59Cs
	qN+sCfUXAnfDG/obKM035JktQEN8+OYExdWfqteguehklPj4DwfQMU3W5KYJfQPUVRl/+h
	s3eNdFnAFvuaIU4aqN5ts6KXvkmm45MfkBKEBJfOcwzNJGQN1OzX7vtpu/n2Hw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Stefan Ghetu <stefan.ghetu@nxp.com>
Cc: Han Xu <han.xu@nxp.com>,  "sashiko-reviews@lists.linux.dev"
 <sashiko-reviews@lists.linux.dev>,  "richard@nod.at" <richard@nod.at>,
  "vigneshr@ti.com" <vigneshr@ti.com>,  "s.hauer@pengutronix.de"
 <s.hauer@pengutronix.de>,  "imx@lists.linux.dev" <imx@lists.linux.dev>,
  Daniel Baluta <daniel.baluta@nxp.com>,  "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>,  "Frank.Li@kernel.org"
 <Frank.Li@kernel.org>
Subject: Re: [EXT] Re: [PATCH] mtd: rawnand: gpmi: Fix possible NULL pointer
 dereference in gpmi_nfc_exec_op()
In-Reply-To: <DB7PR04MB4474F2E3C2C31984F1A0C8299D772@DB7PR04MB4474.eurprd04.prod.outlook.com>
	(Stefan Ghetu's message of "Thu, 5 Nov 2026 10:49:48 +0000")
References: <20261105103410.4424-1-stefan.ghetu@nxp.com>
	<sashiko-outbox-198870@kernel.org>
	<DB7PR04MB4474F2E3C2C31984F1A0C8299D772@DB7PR04MB4474.eurprd04.prod.outlook.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 16 Nov 2026 17:12:14 +0100
Message-ID: <87se10pxgh.fsf@bootlin.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Stefan,

On 05/11/2026 at 10:49:48 GMT, Stefan Ghetu <stefan.ghetu@nxp.com> wrote:

> Hi,
>
> The review is right.
>
> Moving the !desc check out of the loop lets the loop continue after an
> intermediate gpmi_chain_() failure. That can submit a truncated DMA
> chain and, once get_next_transfer() has returned NULL, index past
> this->transfers[] both in the loop and in the unmap cleanup.
> The original concern does not seem reachable either:
>
> * the continue in the NAND_OP_CMD_INSTR case only happens when the next
>  instruction is NAND_OP_ADDR_INSTR, which sets and checks desc;
> * a zero-length NAND_OP_DATA_IN_INSTR only breaks out of the switch, so
>  the existing in-loop check still catches desc =3D=3D NULL;
> * the core helpers drop zero-length data instructions (or reject them
>  with -EINVAL), so ->exec_op() never gets an operation without
>
> So the Coverity report looks like a false positive and the current code
> is correct.
>
> Please drop this patch.

Ok, thanks a lot for the feedback.

Miqu=C3=A8l
