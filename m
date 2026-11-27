Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771423;
	b=2h7Q1wo3p35Os+FYFrij8OHfpUqdrOJNT4vOAGmNa1WoPsj6pg7Y2Bjh9h5TF1LfiZ3N
	 OkRGo4eRqvb08VfBhEAc0WP8I6590j8gRsh3mAwxQL6nkrxg2y7OEq6ATQpwDPhFTObUh
	 rk73HiPtXASSTQUbFnUwQJFwy4fsuq0WnOUiBDJ3BTIZAHTrA6rw4nrl2dycD2bKWFZ0N
	 VVv34E44hvpQyoVIcRV3o80GoMVZzf8t0CP+lnoH994Sua/2K+bYW7k97ZnyUWucytAuQ
	 uWMIKzxZDIMLmLyHVOUtBvXqAVW1MzQPpcdY6qJgxc7K81GC77+bnXb0NOkFTpb4Ldw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771423;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=PH+l0IfQ28b7UEDSOlC/cTnR6aoCEbyBOr2fiW8TlTU=;
	b=5Vk0AZvm1UxQkPu8NIJkRqkH3AN3HIHu9P08Vr6f7cBjLm1sTDXs4HbdWbBdj+BF8J2i
	 9Ov5lylZZbY7WQmxXCBl7afd3dzrI8+eVrA+3T4Lpy+32nlqX6HAItRhOR+MwZMWCTTXs
	 KnSpv3EzP+Q9dK5yn/Ry72WELpQzYqaWanNeZU69cQ34+CYUG+/zv7eZInTcxLbtJ/DVZ
	 vtxMJ6gPPd6Z0EqKR0KrmYVBVg9XqBYDBk0mGAyClQjuSefmV5rQKMRTPvzDaBi/k1URl
	 XCWssd6XzAjcS1FtTHGJe2IVFeKvzbzGZQHBHxcwGKALx3HqMZvl+VWqpb1EM68EN/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ff2U6hPn;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2E9606A31C
	for <imx@lists.linux.dev>; Fri, 27 Nov 2026 09:23:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A2E9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ff2U6hPn
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6BEF04E41795;
	Fri, 27 Nov 2026 09:23:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3FD5D6049C;
	Fri, 27 Nov 2026 09:23:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 997C311E69295;
	Fri, 27 Nov 2026 10:23:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795771419; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PH+l0IfQ28b7UEDSOlC/cTnR6aoCEbyBOr2fiW8TlTU=;
	b=ff2U6hPnfdWAVrHeE+QURp8p7spbk1dJChI6RpTqx3eZ6Z3NSmqEVqcsrKBWqUpqwxoqWW
	zc/fJA/3RG5rOfbi3GI0F41sSS9iHwSig5LSCGt1aXBDcpRxI3DT8e8RJknK0sQbIl5kfU
	fdQvbBmJgmrJbK1tkN+JTKCuLjWJUt8EV3cO/KgSmj55J+HF2kejPGpxpzQJlPHmgFegnn
	gT98jrBXT2PzOH6AL4wHjqlAbY+tfPkFyNcwy0ZMUmc8pSVOvdPYHQMXQlEU96yCUjPdH1
	ZbVOCf20wWo+PSdFfV0SZC2WzOlKgPtH9tgx0ynelI4M7dV1719v3WkwGWwZmw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bough Chen <haibo.chen@oss.nxp.com>
Cc: Mark Brown <broonie@kernel.org>,  Liang Yang <liang.yang@amlogic.com>,
  Feng Chen <feng.chen@amlogic.com>,  Xianwei Zhao
 <xianwei.zhao@amlogic.com>,  Han Xu <han.xu@nxp.com>,  Conor Dooley
 <conor.dooley@microchip.com>,  Valentina Fernandez
 <valentina.fernandezalanis@microchip.com>,  Daire McNamara
 <daire.mcnamara@microchip.com>,  Haibo Chen <haibo.chen@nxp.com>,  Jyan
 Chou <jyanchou@realtek.com>,  Yu-Chun Lin <eleanor.lin@realtek.com>,
  Maxime Coquelin <mcoquelin.stm32@gmail.com>,  Alexandre Torgue
 <alexandre.torgue@foss.st.com>,  Pratyush Yadav <pratyush@kernel.org>,
  Michael Walle <mwalle@kernel.org>,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Alvin Zhou <alvinzhou@mxic.com.tw>,
  Cheng Ming Lin <chengminglin@mxic.com.tw>,  linux-spi@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  imx@lists.linux.dev,  linux-riscv@lists.infradead.org,
  linux-stm32@st-md-mailman.stormreply.com,
  linux-arm-kernel@lists.infradead.org,  linux-mtd@lists.infradead.org
Subject: Re: [PATCH RFC 02/16] spi: spi-mem: Stop checking the dummy
 buswidth against board wiring
In-Reply-To: <20261127085359.euu6z5rydr655ycr@shlinux89> (Bough Chen's message
	of "Fri, 27 Nov 2026 16:53:59 +0800")
References: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
	<20261125-macronix-upstreaming-spi-mem-cycles-v1-2-fd036402fd37@bootlin.com>
	<20261127085359.euu6z5rydr655ycr@shlinux89>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 27 Nov 2026 10:23:30 +0100
Message-ID: <875wxivd9p.fsf@bootlin.com>
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


>> -	if (op->dummy.nbytes &&
>> -	    spi_check_buswidth_req(mem, op->dummy.buswidth, true))
>> -		return false;
>> +	/*
>> +	 * The dummy phase implies no actual transmission nor reception.
>> +	 * Its buswidth therefore does not matter much.
>> +	 */
>>=20=20
> Hi Miquel,
>
> With this change, do you plan to add the linked patch back?
> Setting the dummy buswidth to match the data buswidth is more reasonable.

No I do not. Doing this would only paper over the problem for certain
cases and would for instance break many of the SPI NAND cases. Those
chips currently derive a number of dummy bytes based on the dummy
buswidth, which is the same as in the address phase. So changing this in
spi-mem or drivers would break this assumption. Either your controller
has a cycle oriented dummy phase, in which case there should be no
problem once converted (see the patches below) or it is byte oriented
and the mode should likely be refused.

But maybe if you tell me what you have in mind we can search for a
solution for it.

Thanks,
Miqu=C3=A8l
