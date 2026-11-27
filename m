Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795784593;
	b=yszLD60kirMC2+NLZiWEE7aEZtKFTRNDGRnlHKCbIdHvJ028q3XwaUaU4vXaVD6hnINt
	 1yWyWlFJ9Zl0OfODt9ZnoJwwuVMFvyuu0xH4evOhuIN1NsIzanAT140EqDtTVSdRf3LYq
	 +r64s/exzwJL87CEQiZKE8vk7DyCsXrEuHSRnSkJYqntKlbzbT0QFxuVIFrsIfMPO2W30
	 O5rE3SF9lAXyFsDh6c+cwzc8fcUyBYJacps7SUtZPzfupkSQPCFtsp4T27F2RbO9lGaiG
	 9g2UCfuflIOd0ycSQWfQsUWKJZowcbBiVRC8ahIOvNUxrYNmpKLl/7rbADrM4XUssPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795784593;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=7UVakvOp4wpiznroxVZYXkTEATKSGQujHq3lj0XSlRk=;
	b=CokmzbNiryLtNxuxLXo0KcXQBBrv9Hlyk50qt8CRYXXf3SXplXaRZSN6uHmG/o5aanN+
	 R0YI8LRNDFPauRthjSlC1o+bjf5THg2rvEfSw7jmo7EHDYNjl5AzpaeZlWMtXQxftpXc2
	 S6uGXG6MgAdF8AgM/+1z3HvIz90MPg01Okd+uNuaFFyo1E9DU1egCZDN9c1GCuRQF9pMs
	 VqTVrZrFF7fgqAxEcHk45RZJti/6EhH+EYUqTsva52na7V7Z71mbZC2DlvE9RXAtdhHYY
	 skwntQRJXykgOig4/DkyUCrHK5Ntwd0ACD8wzwuKKXzRUe+QqvEsbARj27RB2tQsKPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=cM5VgeY6;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C02606A31E
	for <imx@lists.linux.dev>; Fri, 27 Nov 2026 13:03:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0C02606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=cM5VgeY6
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7F5B91A1839;
	Fri, 27 Nov 2026 13:03:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4DDF06049C;
	Fri, 27 Nov 2026 13:03:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5F79011E68760;
	Fri, 27 Nov 2026 14:02:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795784584; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7UVakvOp4wpiznroxVZYXkTEATKSGQujHq3lj0XSlRk=;
	b=cM5VgeY6Qci2ljmxqJH2dWDlf8hXi2XInC/iuzimk3N43ziiTXtiMMiKedJf5R5pYNvGxo
	Ba144VRx1Z4nzcfrgeAwVxPCnf67yr8iKuUVCrqJhp8X8vYXfT7cuoRwDd++MeDSNAYXqB
	dcrSTVCBTamAakYw3wbGqr6fxQZufiwpAjnm1GQh990665j2EmAE3ONzv+S26KrJozd0CU
	uE5nvBl438K4yS5xx8AciV3xr3B1IjR5frJp3hnbF2Fbsr7xDsk98qp9HhCPupN0sWxEzN
	XAe4fBjrLxm8X48WHk4LSNUBBZvWJApyARHisZtjduTr56v2v3QlnPTY4BIAbA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
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
Subject: Re: [PATCH RFC 00/16] spi: spi-mem: Express the dummy phase using
 cycles when relevant
In-Reply-To: <41962155-e78d-46b2-a58d-45282fdf1cca@linaro.org> (Tudor
	Ambarus's message of "Fri, 27 Nov 2026 11:33:09 +0200")
References: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
	<41962155-e78d-46b2-a58d-45282fdf1cca@linaro.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 27 Nov 2026 14:02:54 +0100
Message-ID: <87cxrqtojl.fsf@bootlin.com>
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

On 27/11/2026 at 11:33:09 +02, Tudor Ambarus <tudor.ambarus@linaro.org> wro=
te:

> On 11/25/26 7:51 PM, Miquel Raynal wrote:
>> This is only build tested for the moment and sent as an RFC because this
>> topic has raised a lot of questions, there may be things I have
>
> There's no ambiguity that this is the right direction, change bytes with
> cycles. As a matter of fact I tried this in the past as well, posted

Thanks!

> something and then couldn't allocate time for a new revision. You may try
> to search the set, if you haven't already, and check what the feedback was
> at the time.

I haven't found your series, but I found some of your answers to Sergiu
(iirc).

Let's see until where this version goes :-)

Cheers,
Miqu=C3=A8l
