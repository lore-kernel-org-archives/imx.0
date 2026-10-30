Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793372436;
	b=gvxSPHmrQ8gONLZ13ZEicaPXc8Czoikv10etxuWqpp4ft53BASSRTKy4ufoD0D0UhzxS
	 FT+o7s2cefosWsEOm/WjwoL0MoJVrDgc7i0n/kqh1rR4AVNSjB6obV4aEAJ1MC3XPew3h
	 /68XxDWFmAMGGTVBs92JqEPktCvai/D7lsXzBdBu802AR8jo/Yuvgri6yfXKwd+IuAhYN
	 hqbtEC5vk12WEQyslD6ON30iKhZR44Bm/THZI/D+K+oZvR2h4Dvi7IAVwVN6sxJOL9vba
	 6+OGVzUbZoARiW/u5vUuHJrq5ZRoNuC484JNfAxOLttZZopv9p1RY5ei/Lu+2a/f1Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793372436;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=dDd4BvTxSR0uBUQSKnRsKxmPO1GwP0bmDkHq0sbZkg8=;
	b=rfJSHweeeuN6ldndPhNIOmCCJCN4VB/iqzRPWNpLY81RMGpZTIRiUcu06dIZIoyJ76S+
	 B1RzwlSg21tVJyqkxwGo2aNb5DfJbmvFBQXAKYoSf0zc57uP8YvhRA/9p9tBnvdoxJ75z
	 dyrQp2ozkm3aN2T1oWOfV0CtPSPZWmWb8jPbp0T+p9e96+uibyzTir1/Z/LYp0M8U89YF
	 ZYvv5W1T3DzntdCfB7n0LBAJ5HqIWrjErg+L3+lLmqW+porZBkVzJs7V3YXz8JhRCCMJZ
	 ER5ftMknLryEkUE00cMMqSZEs5SPmyAyD5RATs13b9kg0hiaqbPffoSx0J3qBNgIa/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="tT/ippcm";
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BEF606A31D
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 15:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0BEF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=tT/ippcm
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A9C15C49F62;
	Fri, 30 Oct 2026 15:01:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AF7B1603C2;
	Fri, 30 Oct 2026 15:00:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 58361103290E8;
	Fri, 30 Oct 2026 16:00:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793372427; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dDd4BvTxSR0uBUQSKnRsKxmPO1GwP0bmDkHq0sbZkg8=;
	b=tT/ippcmnCNVkD9eNIMcwRGmgxafKoPkU+RG3W6+YYfU0nD9mMZlbMUs0P4gsz6LrhbyMN
	rYA8UPWtheXltmOKXmEF6gK1qBiKb4uPhX/DLGrTj/uG+Ha9tnYveuAort6dkWRxAmObGI
	S8CViDNR6AaeTEc00Bdym1et9NikSbzEsgcWNXbbXByt+bPDDOIQWqiW2ZLJ5srVW0JIWQ
	D9me8mITD7M33g+Yb9nT2LdtOsjjCIvkJyc3n85Z+9s/o2R0CBhfEcyNFWDzEJtxWlJWqd
	g86fonp5h9z9byzlHsKwez18YWY3yojofoL2lmvdx9ujBCWwtZMljrWJT13saQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Samarth Narang <samarth.colleges@gmail.com>
Cc: Han Xu <han.xu@nxp.com>,  Vignesh Raghavendra <vigneshr@ti.com>,
  Richard Weinberger <richard@nod.at>,  imx@lists.linux.dev,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: gpmi: terminate the DMA chain on
 completion timeout
In-Reply-To: <20261030143945.2923554-1-samarth.colleges@gmail.com> (Samarth
	Narang's message of "Fri, 30 Oct 2026 14:39:45 +0000")
References: <20261030143945.2923554-1-samarth.colleges@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 30 Oct 2026 16:00:23 +0100
Message-ID: <87zevvcjy0.fsf@bootlin.com>
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

Hello,

> diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nan=
d/raw/gpmi-nand/gpmi-nand.c
> index 527165ccc..a8106de2c 100644
> --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> @@ -2659,6 +2659,8 @@ static int gpmi_nfc_exec_op(struct nand_chip *chip,
>  	if (!to) {
>  		dev_err(this->dev, "DMA timeout, last DMA\n");
>  		gpmi_dump_info(this);
> +		/* Retire the APBH chain before its buffers are unmapped. */

Please drop this comment.

Otherwise fine.

> +		dmaengine_terminate_sync(get_dma_chan(this));
>  		ret =3D -ETIMEDOUT;
>  		goto unmap;
>  	}
>
> base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907

Thanks,
Miqu=C3=A8l
