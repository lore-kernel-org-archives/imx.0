Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B5B47F2C0
	for <imx@lists.linux.dev>; Wed,  6 May 2026 14:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778076111; cv=none; b=hfMSnAhW5BhbbCppkcsuTuFLbfO1AFcE6/05Qj3MKAfLYJg20528bQluHYQ8fiqJ92XkJQCjm28isY3NIpqBiEJVRLX93U5u3v+KCJnGWOxe81AFq/tpXTSdR+KLjMEXLRFUakV166NiIQwsnOUNqv9tZVkG7i87RYc4UEOkx4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778076111; c=relaxed/simple;
	bh=pw5M7wHyJF7qGE8EOkabTS3y0p6s5JDD1IostcxlSv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nib/LP8lGj1U9XB4ELtGo1OYJYGItvTeMU3TpySm/kfHe1g9cN+d0hB4g8Ki/nYxWzA+tMJFqNygR7O+6A9NAMkTZ6pb7YMWS8dtTowzc0lJiCA7UHazioijRPlpEGRPL8K82nVQcGxf8h5hhHcKoDGEOC2Jydy2lZfuml0KrWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=E0GFlRfg; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="E0GFlRfg"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D31BA4E42C03;
	Wed,  6 May 2026 14:01:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A74CE6053C;
	Wed,  6 May 2026 14:01:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6FB89107F1B59;
	Wed,  6 May 2026 16:01:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778076100; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8VpBetH3FnMFpP2ml6zi3fZvsO0QOprxF497sdCPnpM=;
	b=E0GFlRfgdvdfui6wsFff2FGJz4F3OVteevBzZRDss8yVpWUh1wped7N0f7uVaAupIDnbr4
	8Mc88MlkQGntEj0sowal1DfNFSuHRORrCiGp0D6wyHk74AFoNTZ6EC1yuRUgAZSkbQFp8C
	K1NZSsKqPIU2q2hTksznzNHzCCsCWzHFcYiDrCNjxJbPSDWrM+VDAvpRoOqmwDkP6J2UVE
	6WLKHN7x1Tg2KfFQ4ReQIDwvC7OSi8HG5/Aj3YOUfyXWJIxkQuB6N7t2BO3Ohe1potTaQd
	YAbscpQGxaiFP/fje6S6tflDZ84gnB0hdVsfOXjnr5T3lL/vr9d2+Q2xCgZ0rw==
From: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Frank Li <Frank.Li@kernel.org>, imx@lists.linux.dev,
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH RFC 2/2] dmaengine: fsl-edma: Support dynamic scatter/gather
 chaining
Date: Wed, 06 May 2026 16:01:37 +0200
Message-ID: <43uRGEDfSHihWPAxby2EOg@bootlin.com>
In-Reply-To: <afoHxJM-s846s6EG@lizhi-Precision-Tower-5810>
References:
 <20260430-fsl-edma-dyn-sg-v1-0-4e0ecbe2df66@bootlin.com>
 <y-kZDXvATLGuBxQOHfCRwA@bootlin.com>
 <afoHxJM-s846s6EG@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3

On Tuesday, 5 May 2026 at 17:07:48 CEST, Frank Li wrote:
> > >         how do you test it? and how much preformance improved?
> > I did my tests by doing SPI transfers with the LPSPI controllers, doing=
 DMA
> > transactions with different number of buffers and different buffer size=
s.
> > Without chaining, interruptions on the SPI bus occur between each DMA
> > transaction. With chaining, the activity on the SPI bus is continuous as
> > long as DMA transactions are issued before the end of the current
> > transaction.
>=20
> Does SPI support issue new transfers without wait for previous transfer
> complete, or SPI transfer already support async queue?
>=20
This is done with a local version of fsl-lpspi driver adding a simple
offload support by borrowing the DMA channels allocated to the SPI
controller. I can then issue multiple DMA transactions with the dma_buf API
of the IIO subsystem and trigger SG chaining.

Best regards,
=2D-=20
Beno=C3=AEt Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



