Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908051;
	b=ztFpmefSK6fussJmX5yBn4OevITYy8CTYSx2VkDhbF4ypaEOSRmvgVUiUBW7z4EN5V61
	 +b6GF3JnMVvTtiZu2e7iLszrrvBiRHttb9H1iaX+SZgopu66QEEf+8OzFtTpifjWaAHWb
	 Ci1PIg571k+7Tepjs2N0iynT5Q2qzCBdrzhRXIeB7Ok0v87WNABbJVWppQPKy9B/I32Mp
	 jCaaaUovPC2cFi4rAOzACJUDYFkCcLKMhJbWjcVTUiis9UJBXUO54q6AOPeNZDwuKaOYW
	 JZ75lFXdaEtV5jSCUYdhW/MhI1JYB5/kyBOe9d0i8NG2bm1kS7OQCWhjqJEnSRBM0Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908051;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=AuE4JfXLFzUDx+6R1OGPPSSy0rX3ecyLORLK9C1d1XU=;
	b=cVzWjfPuOjkkto75hYuIrzvgOTepsiZDRSHMYQDSiRwF6cpARoxTPtpykRMQnVqOcTmK
	 wqproUQaspFM0e7Xg37u0jWHQ0Pu1DI3R29dEGJhNRZvLxrmV7BStAhpmly62GCKzyPoE
	 md1tiQqixtOyvBijfFsgOTRR7IrKPoapYxpN8RX7yR87rmMOBrc2Esn4cvd8v20oR1kg9
	 nnVtaUZy7etV9G2A9YBVZPcmMSXb9ec1f6SOOOamwY6QNZ8AvuiM2UQ/Hi3xfykrY/gIO
	 JrEkCKJJOGClNyqHf4uYwZaciqa94PzCW69eSdXZmRLXBBvv082hYeu2SzJHuzqaESg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=TLKYfy8l;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883FA606A323
	for <imx@lists.linux.dev>; Tue, 17 Nov 2026 09:34:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 883FA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=TLKYfy8l
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5090DC4EDB9;
	Tue, 17 Nov 2026 09:34:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EDDD75FC81;
	Tue, 17 Nov 2026 09:34:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4C65B11BC0B8F;
	Tue, 17 Nov 2026 10:34:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794908048; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AuE4JfXLFzUDx+6R1OGPPSSy0rX3ecyLORLK9C1d1XU=;
	b=TLKYfy8l/wEs4kMrr/zo8ahpXceqadQAJ3lSoKzU+PP3cGXWGNaobo2soYFeX/USVBUsEH
	M/kXRlVKhdLTzVjUJ+ctKfvQqB33hTp6RWZPgF3fcfA9uD8okIs445vyjFERlUKamWHA0h
	uXJmVU9ny/3w70n44TNL8h4d4mSIXyAP/VDUMJE6+VmOLlTZKBja+UPS2OfOFFPBEY13J+
	2P289S2EFGjPoqg6Nm7s/E8RSJQ8mfyxQLGJiixtL6ANFHK7Un+dQIDwkGHzwDGXO4yeg+
	YeQavABR0p0PREKt7Xd0qj7ky30Yzi9SmrEocSuSLmHiLVFv8PjOmy+gbAZpYw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bough Chen <haibo.chen@oss.nxp.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  imx@lists.linux.dev,  michael@walle.cc,
  Haibo Chen <haibo.chen@nxp.com>,  stable@vger.kernel.org
Subject: Re: [PATCH v5] mtd: spi-nor: clear the default read_sr2 opcode for
 Octal DTR flashes
In-Reply-To: <20261110081355.5d7ubrgulopr7qvm@shlinux89> (Bough Chen's message
	of "Tue, 10 Nov 2026 16:13:55 +0800")
References: <20261023-spi-nor-fix-v5-1-bb6e0ce21169@nxp.com>
	<20261110081355.5d7ubrgulopr7qvm@shlinux89>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 17 Nov 2026 10:34:04 +0100
Message-ID: <878q2rol83.fsf@bootlin.com>
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

On 10/11/2026 at 16:13:55 +08, Bough Chen <haibo.chen@oss.nxp.com> wrote:

> Hello,
>
> Just a gentle ping to the MTD spi nor maintainers.
>
> Please let me know if any changes are still needed. Otherwise, could
> it be picked up?

Once agreed on the patch (I'll let SPI NOR people decide), I can carry
it through mtd/fixes rather than spi-nor/next.

Thanks,
Miqu=C3=A8l
