Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCC11C5F12
	for <imx@lists.linux.dev>; Thu, 23 Jan 2025 10:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737628455; cv=none; b=fYYl7SUTgj6du17i5tonvSZJ2CzXSOUdRObthpKKld0ecPYjVkXf962Fz24y9HSvQ7ateTpm8tJj4Bg3KJ/Ykt6bkSjHZs9Jp/fB+FicElM58gBNPtyKyTdY6aiiVxtKNphrTEYb9g0PLc1Blljs5Vi0Tl8otejJGaNfLzJRyOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737628455; c=relaxed/simple;
	bh=gsyxcjrfPRlVRrzpZn06sndNy0fCEKZf+MF9IrWJVv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f3dtcgAAXRVXmM9u61b2lAvxByc2f079MJisl0SIIC3aCTAAhOShx4FI7NGfDSaBtT+oHPLx2GtszJdHIeZuLu+hE0+xEZniHpv/IXxKteKH/jre87GTPH3OOMtD3330OpQvP1fgJFIT4uIJE0m2NQv1RjD5xfCDBzJwgOCXoZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jugbr3Qf; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jugbr3Qf"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21649a7bcdcso11462915ad.1
        for <imx@lists.linux.dev>; Thu, 23 Jan 2025 02:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737628454; x=1738233254; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kta1kpUGyKQ79E+obX3jn+pQXvGIiJLwWQQsshofAyo=;
        b=Jugbr3Qfnhpg+QEwag3b15GMrwWgFTtTbrw6HtB+I2kcsuQbpxo2qZzyK/iGs4YhQC
         cFxp7rXI3mMiSivX+7G68ExfaCCpK9qkVbXNgMtrTpHpqT8h8o3y9gxILZjUGTiFScaX
         pIeyG0ne6dhxoZnw1A819izYTYTdPNgSb37JxWAwFZ82gi60YZWQ24jvqiYn0wgcqZcF
         8pa8AlSJFhwk95hqNsmkWWIfE3nmf+DZ/6tiIMk4RxfX8/E8kkRlYnnCpT40YD+2wM7/
         pq2lpiKzw9Y9SJROrz+ErkwsdxR0Yu5+5F++S1FXICoCN3rEO0mOc9rFo8tJOs/IxZOO
         WHVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737628454; x=1738233254;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kta1kpUGyKQ79E+obX3jn+pQXvGIiJLwWQQsshofAyo=;
        b=pJaUQjs3p/pAtWxDaAhnE1DSs50YgqDLM/pLWf4xunN6nhNvnmSA0PXrFKT/Wg1HDK
         7Z4Y6Ngd01DRT7XVd5K9nMxUCWalyiGgPshTNjdmC4K+kc0G1loy2KoJQvKTE0ksnRpz
         xVgTdfcnPaxPbFQD7N33+FNA5+zPsGtyyHzW/cC9lRomh4woW4ZhnF3tMlnTCzU2xBJo
         /bepSKFJRzN8ICNhMLO4OLVRCHcFhI5F9ZXbKCINjK40a1b2rpm0QiyBl1ZI1m/u5Bqh
         l7NNSHxk/Q7yCAvBv3xpF10z36iv1IOZ9+vsuY1+krJeWBalfokXCn3msFaxR9XlfkOU
         rHcw==
X-Forwarded-Encrypted: i=1; AJvYcCVFt5do3riYXIL2KINJySkMRAatCl0RSAe0v3gDLSyU1vNk45zA4nK0CMYgmRVRPN4O8ys=@lists.linux.dev
X-Gm-Message-State: AOJu0YxveoVLFEWnOtyddr0p3lNr+yo3By2nXa/SsrmpxoOVuAHQJSNa
	baL3IAuM32JFIfnXsjVxLm8WJm/txYKrh6PWmQ8I89rH+yOlpgVW
X-Gm-Gg: ASbGncvUy6cmzESJKtgAgw1wHTYZSK5IiO349uVrbg9/YHrjAMxNuGyIODvDt7mCo34
	EkBGhHRO3T88NVMDUAvwV8Iv8MbkaoWXvgHGMB91BRbjZ/NDyJHXjiZAPT7POX4sbTJd7woPX+J
	FFxlCxB0+O4HBNnMpaLPl6+UFP/g3gVflVFnBRCf3EoOWZv30pDfyYdia/B70ZXeXBPa6nB/9mm
	z0yTl9zZGUW2L/M3vavcuadM54cAdHhQozsi1/I6iHj08UXajzUPkfHkRfNUc0dbXmqfxVLs1em
	6abaGfGh
X-Google-Smtp-Source: AGHT+IFQdN/5La2w5kfygfWxH2hklatSF3XsJgt3pGVejkBczyJ0ommryHlN7Qz3ElnZcfB2zwuP0A==
X-Received: by 2002:a17:902:ebcd:b0:21c:7e22:7844 with SMTP id d9443c01a7336-21c7e22789fmr246273405ad.51.1737628453532;
        Thu, 23 Jan 2025 02:34:13 -0800 (PST)
Received: from HOME-PC ([223.185.135.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3e088bsm109217575ad.173.2025.01.23.02.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 02:34:13 -0800 (PST)
Date: Thu, 23 Jan 2025 16:04:09 +0530
From: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net] net: fec: remove unnecessary DMA mapping of TSO
 header
Message-ID: <Z5IbIeOxrkMoASdJ@HOME-PC>
References: <20250122104307.138659-1-dheeraj.linuxdev@gmail.com>
 <PAXPR04MB85106CE97288D52A04EB685388E02@PAXPR04MB8510.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB85106CE97288D52A04EB685388E02@PAXPR04MB8510.eurprd04.prod.outlook.com>

On Thu, Jan 23, 2025 at 02:58:32AM +0000, Wei Fang wrote:
> 
> Hi Dheeraj,
> 
> I must admit that I misread it too. There is another case in the TSO
> header where txq->tx_bounce may be used in some cases. I think
> the most correct fix is to make txq->tso_hdrs aligned to 32/64 bytes
> when allocating tso_hdrs, then we do not need to use txq->tx_bounce
> in fec_enet_txq_put_hdr_tso(), because (bufaddr) & fep->tx_align)
> will not be true. This way we can safely remove dma_map_single()
> from fec_enet_txq_put_hdr_tso().

Hi Fang, Simon,

Thank you for the feedback. I have a clarification question regarding 
the alignment of txq->tso_hdrs.

In the current code, txq->tso_hdrs is allocated using fec_dma_alloc(), 
which internally calls dma_alloc_coherent(). As I understand it, 
dma_alloc_coherent() guarantees that the allocated buffer is properly aligned.

Given this, should we remove the alignment check 
((unsigned long)bufaddr) & fep->tx_align and the associated dma_map_single() 
logic entirely from fec_enet_txq_put_hdr_tso() as you have suggested?

-Dheeraj

