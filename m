Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810674;
	b=l9sc0O4c6n7A0+A8FHaSM3gPRr8mP98B4vsLyjYqKjIO0t2N2+W9+6uSeWgUFQZfNCYw
	 Vg6IZ93TjRpIDnSyzHoCSh30kXg9jY0K6hGGHANy9GQBaPo8DKKqCpBk+GujybHnKrYHp
	 DkXuudQbMIjSeM2VYMK3JxWcFNM3ScWRN1tvK9hTKt+fBoM6SiuNt4VEs8Saf0LHLTCbT
	 ANOBuPGsow+HkJUieBVlSrArLz0T4R/6NF8MWeCPRYOWYKjv6Q1VtTsXnYF7eDuPkmlPV
	 V/WQgAEDv6D0SGmF+9cB8nG6zps94z8/RVqosVp2P2xr2o48gALzCgweIcqcvR2yrhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810674;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=v85/dxSKl2fjZlg4NNDW7kCAXPImgdYEhqBglpB1Uzc=;
	b=Rpq9Xonlr+i98PLj9mbqet6chS1quBOpfCzFMzHs0a8H/6JlyvPl6WPFiz2zhXBR7m9w
	 MjUibY6W7HDeVSbrfry6ze+q91skAn5vVlPrF+la2FYSK2lMoNAsz7G3ZDvwEs9GvSJ96
	 nDIFAO3g0jtTFZmJFZq7+nGSr4v7ytyrWxnVWq+wb8T/apd+qjYoxhDSp/1xt/h++ebes
	 zlQ7NAN6yEGG6Swh2xKYZ0jmf+SLp3e4qHWQtTd7RGW9D3DnYyfXadsudol8BptclHRKZ
	 57Y7BkbQ+8psip6tW41iaiIX73H04MvFZj3cKUogJSVzuocgmdBZ5anhfgW4ZBjvubg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=D0yJCtGU;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25FD606A328
	for <imx@lists.linux.dev>; Wed,  4 Nov 2026 16:44:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D25FD606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=D0yJCtGU
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e98798cbddso4946455ad.0
        for <imx@lists.linux.dev>; Wed, 04 Nov 2026 08:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793810673; x=1794415473; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v85/dxSKl2fjZlg4NNDW7kCAXPImgdYEhqBglpB1Uzc=;
        b=D0yJCtGUvUn2JsMmjZNgxN6Mhz4rYlR30U7cfatClHiFh8E7kotos0F/l5OsjbajgW
         weRyNiuPKTrEbuLdHP576X+6YTqIAuOZOeGFLTuab2hkSnKvsYEb8VSPypQ3MBGQgw1H
         z2/9c5dNMoZDEPWlTH0u+3Tffk+jGeD2EJ8BdzaSCxCwVv5xnA34eW3H5zEkmmySCs5u
         1tHzZRZBDQpbh25ajpleTTOYzpVofileUQ/kwd/pznrNjgIm77kGxc33T4kfOSDdPF2f
         fhQNqCY47TLfWYvKAhfnBSaw8pyj6U2303gLzvsV/qJxtyXkoJ+ZTyx+ULhovmrlJcXy
         vTIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810673; x=1794415473;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v85/dxSKl2fjZlg4NNDW7kCAXPImgdYEhqBglpB1Uzc=;
        b=gglomKyJsDShPvjyCBfj8bDpJCculen1Z4+b4+J4eQELcvB01eZCvk5XoGIaGFAMfq
         rWjXSceSCFh7Vidh82dPrX/RmNTuakAoo8sheT6N6+cwV7hpNTJ85sVGlCeM1KL1CccB
         RO4XQTxubnfuEVxCt+8yPApEzMz9pw/lPw7kfB8daqjJJFQQZM3KcmV1Bgjh/kCD2wMH
         6Dd1i/8g2IF7Qq0rZzzIgkjvnk4M+BNTLp1JC+bCrGBbDupTHDekRP49z+ri6sEGziPI
         S0ioT8kBHBz7/i25PZyGN46rYjbwF5RPvRONddoNtIfttIIYuZ4VceG7c9/YBVnbjI02
         GZSQ==
X-Forwarded-Encrypted: i=1; AKwUvByElnJoHeCERqgZCTR5Wo9X08tjh6apxoBIO8AE0UGspfaGxk5ZFoOWFIfvJ3/77d/aVGI=@lists.linux.dev
X-Gm-Message-State: APuU4Z9ggb+egR33Jgj/Vcext9ES3VnJDG2dF4+rQ5OXuabIIhYIQ9pz
	m2wI3lKEf+s1ZggxaaSipqcKmFCnn85KfpjJsRzi09nOIEGhdnFIE7NrfDzR81sv9JQ=
X-Gm-Gg: AYBFou0HuKrwkltATyuuSiHvOc3W+bHmF2lZBrPhXH07bc+/4VH6sj/cKVXWaS9kv7I
	sEqXGzJOIcPxCdNetWDFvpBAQPQFZd5qOad3ruRIG9oGTfT/HTLIsTWOAXesE9cLnPu+V0a6kW/
	t+jd708V9APuax4QAJF8XWizfbSV34paMyNhPC8B3KixZ3QYNJG1dIjurIeDK1ncItqsrUn8Uv1
	Tmp6CnqUPFIgJEqKRfVpDn0oOzopjJ2HntAQ6nAjuru2b/AOrjehZr79TuZrnytSgT7FLtzqag0
	/U8cOz5kBBBxOpl5TiAMJmX1qMDqpqgVOrC8POvQgpkjSe+Bb1yuWigHaD32+AbboQ+QD60SMtq
	7vVqGSZDqIaQRrBNBL6lr9kpglAR2tF2r/iA6BDRg3VTUnbpIIa1PkrcA7jyO+HepaSisTSJLU3
	3iIAgRXtBfvJotVW0mMF1o1Jejq+YQntX1TZ7p+MGNi5EKvkMRiRTmAOwP48jxg2047TjRtZYfP
	tSQK2K+568kqcauZpl1D3tYnfmUL7or9mec38q0H8k+Bz8kRbAvDl9SXIODr80YIRK984JQLc2o
	VArRTFkvUcF26XkQeT5jF56W1mdE/06fy+xXkKgttl5A4HZQLXws
X-Received: by 2002:a17:903:37c7:b0:2e9:cd03:b432 with SMTP id d9443c01a7336-2eb36501f0dmr158595375ad.60.1793810673005;
        Wed, 04 Nov 2026 08:44:33 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:bbc3:cdac:2cd9:7fc5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed0910faaasm10192365ad.47.2026.11.04.08.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:44:32 -0800 (PST)
Date: Wed, 4 Nov 2026 10:44:30 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 1/2] remoteproc: elf_loader: Create new callback for
 copying segments to remote cpu
Message-ID: <autg7vGliR7-lH-V@p14s>
References: <cover.1793117996.git.u.kleine-koenig@baylibre.com>
 <15d90126debc21c116c9e862a007afa4d81f704c.1793117996.git.u.kleine-koenig@baylibre.com>
 <auoAZs66RA5OYjJo@p14s>
 <auod0uYPow76TEb8@monoceros>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <auod0uYPow76TEb8@monoceros>

On Tue, Nov 03, 2026 at 06:49:59PM +0100, Uwe Kleine-König wrote:
> Hello Mathieu,
> 
> On Tue, Nov 03, 2026 at 09:40:22AM -0600, Mathieu Poirier wrote:
> > On Tue, Oct 27, 2026 at 05:25:20PM +0100, Uwe Kleine-König wrote:
> > > diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
> > > index da3cddbe7d4c..3c749a39e5da 100644
> > > --- a/drivers/remoteproc/remoteproc_elf_loader.c
> > > +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> > > @@ -227,35 +227,45 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
> > >  			break;
> > >  		}
> > >  
> > > -		/* grab the kernel address for this device address */
> > > -		ptr = rproc_da_to_va(rproc, da, memsz, &is_iomem);
> > > -		if (!ptr) {
> > > -			dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
> > > -				memsz);
> > > -			ret = -EINVAL;
> > > -			break;
> > > -		}
> > > +		if (rproc->ops->memcpy_tova) {
> > > +			ret = rproc->ops->memcpy_tova(rproc, da, elf_data + offset, filesz, memsz);
> > > +			if (ret) {
> > > +				dev_err(dev, "Failed to copy segment %d to device address 0x%llx: %pe\n",
> > > +					i, da, ERR_PTR(ret));
> > > +				break;
> > > +			}
> > 
> > I really like your patch, but I'm wondering why you decided to move
> > rproc_da_to_va() in ops->memcpy_tova().  Right now it is called in both path,
> > i.e with and without ops->memcpy_tova().  Wouldn't it be better to
> > unconditionally leave rproc_da_to_va() in rproc_elf_load_segments()?
> 
> The reason is that on ADI's SC846 the memory for the remote processor
> isn't directly accessible by Linux. So there is no virtual address for
> the given device address and thus the implementation of .memcpy_tova()
> on that machine won't use rproc_da_to_va(). 

That is a valid use case - please add something to that effect in the
changelog.

> 
> Best regards
> Uwe


