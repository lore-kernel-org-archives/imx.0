Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286A143711C
	for <imx@lists.linux.dev>; Mon, 17 Aug 2026 17:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786986976; cv=none; b=lpX1k9jjcZZwGSWF6FUKU0JsfwB3lGhPG8WXMELZHHLQTcu4Q8dTe4nlFLkV8uOoMnPWslWnEB1fXmFJ01Wg0ZlgmQP1CckOL5DI4VLiVLZD19MazPZ1tuzg2S63WIxbiW7vPfI0ICbgGAdRlp6eiCJCphoMFVuBgE7ZRILk0YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786986976; c=relaxed/simple;
	bh=dU/hih0hnP3rkicxnLGzGzbvz5NWJvf7JF/NG7uN72w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dX5kKpRFNaqfumduDOWSPQIoV4tz8L70lbxSRWa7tFxAifDIIHnMqAAu7N2ep/X+lqHPiQ5PndIBoX+/7mw+FdxdbKPeXKqBzEH4kLXXQG8ZaLyk/vKOpjdsoxvQm7NFekjRHzp+DwUTTtpHEO9I3clGzTGqFeLbHS8d5VvG/Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gk2VzpjV; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gk2VzpjV"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-472326ca506so2573055f8f.2
        for <imx@lists.linux.dev>; Mon, 17 Aug 2026 10:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786986973; x=1787591773; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7vHVmK2OakVdQp/KOqM3ZoyU6wCsebXeGNivr98rrpc=;
        b=gk2VzpjVkws9ZaqfSt1z4CNbtdym4rmQ7KozaP1FV0Z3wMQJQSLRShmZwXVGMBfuP8
         ZOYed+qAgj8HaZ+6l1N083LHIIu6PZY4rkqFSEZoy6fBqrH8eYsu5b5zg0rFDNHg/yRJ
         Lr5cLayBzA83uAz1UaN+6fJUHvB33CqI8g6SJP5XTXa5q6r8EcI4SOnPpTyvh47o1BQY
         ENOsu85gNhqgvTbWBcRV61hVuW8gqtZKh97jV6Bh40lLDeF8MwE+brK7xbZhgW3889zJ
         S2/cLGUwp1Zn6lLlwJukqVGrBZfuArrXYymXC3BBUSwQYJP98EVuXks45dYXmCVvzu2a
         y6Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786986973; x=1787591773;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7vHVmK2OakVdQp/KOqM3ZoyU6wCsebXeGNivr98rrpc=;
        b=fBQQx3LmETFW9SccHgThF8tjAcU664gMDzNpbhz1ePS9cDesBCTZg1My35h7BQrBni
         2M/X/jBmexgKkaO5CeDiO1Cxpjo6W488qaQx36Iqbn+8ltuk3Mmi4/vdlMhriCTtO2JH
         SMSL4/LgUVZE3y1bG/digBfMZW3QSDuwpm9MunpGTDOQHiA1hcopZSNdBb3Fu341rt1I
         1Hlzw4kInNqLJSIFiCdMeLKYfcNZOHpfXaCNH5wWmzyI58DO6ZH8sF6b2o/w88H4+DYi
         +Kvwo9eSglF1SInteJdlI+n1Zh+oaYY4WIOGETLXNmcPQkGoPb4Hpj9WL8Go85Q16QVm
         UubA==
X-Forwarded-Encrypted: i=1; AHgh+RotmsnGbKAANG8PDL7ryzhHe2Tbnhd5oDF7sB7Fxo5F5irz6H7NR11PqOFOblNkGIFdGMk=@lists.linux.dev
X-Gm-Message-State: AOJu0YylOQUWT4VvpKzKp/eVyoblJZX1sP56BITuvu+F2NGTsrXCHItN
	uh7xm3oIIspGG8eG3oeuKnueADkjsA6KyFE/dHlvghs2YLFXp+TcJN9A
X-Gm-Gg: AR+sD10awy/82B+Txs67MRJHHmjrm/B0Zo8SJch2pcIRCJrkYz47157JmrYRscvNLwG
	KeoyNcEuviW4KJ5vLAajkRSUm0FSmjTwy/HNqyoZcIlOYpGjF4Y6V/lBOx+mvVbj4tT7QZT+cts
	YMC01A7kvbNPyDVSdcgZqHrjO+4kaOAwnW3fB73Spu3kxmykdAye3xAnpCr+rmH6JSB/X3N+sSc
	O4HfshZxOVQj2qQi7GOroxNUZ7V3oBNQixpBSyjRBZ4X/M6Jtdh9cN2MjYXsK/RiKRiQnf8SCFk
	uixywwury0LZTrNCQVdzgCeXcODrnKZKaaD+jmFhixnw31ZqYp4SegGd5VCsWHIhDYzEgqzwruh
	LwTyiQsBsinCQoHOihVzeGwZe7oe3Q+qZKFqkZ3F5iW3d8YWTsqajdiC3gXZZlUbH3uXFHIzUvW
	wdioa1P3iqQVW/yzID09dmpaMSmHUztUMv+A0kyyY8rnKrCiFMRUo0TvQJA4LpTXkKe/s=
X-Received: by 2002:a05:6000:46d7:b0:47f:9aef:5515 with SMTP id ffacd0b85a97d-482a9002c0cmr2267004f8f.13.1786986973156;
        Mon, 17 Aug 2026 10:16:13 -0700 (PDT)
Received: from foxbook (bfg7.neoplus.adsl.tpnet.pl. [83.28.44.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5b783d1sm5445518f8f.25.2026.08.17.10.16.11
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 17 Aug 2026 10:16:12 -0700 (PDT)
Date: Mon, 17 Aug 2026 19:17:31 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: frank.li@nxp.com, corbet@lwn.net, dmaengine@vger.kernel.org,
 hch@infradead.org, imx@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 lizhijian@fujitsu.com, mst@redhat.com, rdunlap@infradead.org
Subject: Re: [PATCH v2 1/1] docs: dma: correct dma_set_mask() sample code
Message-ID: <20260817191731.104171a3.michal.pecio@gmail.com>
In-Reply-To: <aoMty9Dvt2bnWm74@SMW015318>
References: <20240401174159.642998-1-Frank.Li@nxp.com>
	<20260816071044.331a2c51.michal.pecio@gmail.com>
	<aoMty9Dvt2bnWm74@SMW015318>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 17 Aug 2026 10:50:35 -0500, Frank Li wrote:
> On Sun, Aug 16, 2026 at 07:10:44AM +0200, Michal Pecio wrote:
> > No realistic chance of the dev->dma_mask check (below) giving -EIO?  
> 
> dma_mask is pointer, which already initilized by bus driver before
> call to probe.
> 
> For example
> 
> https://elixir.bootlin.com/linux/v7.1.8/source/drivers/base/platform.c#L634
> 
> If you find one, which bus driver have not init it, please high light
> it.
>
> > > dma_supported() will call dma_direct_supported or iommux's
> > > dma_supported call back function.  
> >
> > Aapparently, it may also use some 'dma_map_ops' and there is a bunch
> > of those spread over drivers/ and arch/. But I gather they are
> > expected to behave similarly as the functions named above?  
> 
> I grep it and checked at that time, all return 1 when >= 32. Now more
> powerfull check tools avaible, you can double check it.

Thank you. Sounds like it should work then, though I think that
checking return status won't harm, just to cover unusual cases like
regression in some obscure arch or people with buggy out of tree
patches (which they "forget" to mention they are using).

Regards,
Michal
