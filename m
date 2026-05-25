Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BE8381B1A
	for <imx@lists.linux.dev>; Mon, 25 May 2026 14:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779720751; cv=none; b=dujSjZr/0xObxe7gkLaIlxsAr/QVKerBxJ3YxJt7Lh2MvX2nL/7FdAhikVvuPdWsqS5aMS/BdSeORxvP0ZZ7roR5m0Ilo1M5sgcNuaCwsSdoe3QgAjvl1mIP7z81kZ5aKFYPhNgmjpe0U5NRLUilYwAXilyqEXzFFCHH1S64wY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779720751; c=relaxed/simple;
	bh=B4KVrUQ7tVwcm9ysslsg1SoUXgtzP4XMPnnmGqIi9Qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FUfEdhYcw1gynqC0mRFdSu6MT/N7farimgJaxoA6D2xTC7qzTuhayJThfiKcIeB3bFyQcruKtcfB8dLZMzUrrx/1dP3+4IygmQTx4o69UIO7vzOCKji+51Rs0qaB1l7TrBzPmJzfypqHtLLxl9jjQ4/eRaYjXtxu9H5QR51Gx5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TLEkZJEL; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TLEkZJEL"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2bd2c147abaso57739805ad.3
        for <imx@lists.linux.dev>; Mon, 25 May 2026 07:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779720749; x=1780325549; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PMxNLv05fM25q8J30cDMAB5OgpvYercmYEs6tGB59ds=;
        b=TLEkZJEL+72W7X2gBMpcRR/EYDoGANxok0S1ZflB+ceIdux9H3YKPkFzDd/PSKwBm7
         jD8XypLETI6s1cjQrDsEib3RQx44LNrXqcGNUA7EVwcmlGQtpw2eM0FYDPcgpxy1SPoD
         VPSqyy6hwr5xIuqKyEfVXN269man/9YAt9OBQvA/MRGheWMtc8lT8FjhGHGnHYPvNQuG
         X2rYbDlHCierNBFptZGBRzMUZ947a0Ro0xllS9miZ7SEoP73VPDiHW+39CHNcy+mxMqy
         KQ2p0UGQsTxhWSSLqMcbMW958qXY6b6d8kpHUIbMLI037cm/V9r1uOUDD8gTL2jYZOc8
         u2aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779720749; x=1780325549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PMxNLv05fM25q8J30cDMAB5OgpvYercmYEs6tGB59ds=;
        b=lGEcUraq723zvX3M/ovBmFba1aFUtoJGamURABCJPjVRqG/okuC2Zen0q85U8F6dY/
         O2C29zhTwTnBEt43mhWHrj9LCmFjAEHexdoWKFaFnOBy1y4LRKmneTE2ZNLdcwvCFwPW
         lkeNuznoAWCk34teV1EtMy1iIVSPyr54mFEYcHRCq4IjiN5baBH0CHjqUR520GTghqj3
         SerfGp90U/4gd52S4gn6B6POzNQesFwJ7qJow3cyCZt+VtklIu0CQuakcrW5WXt/iiMl
         QxacnZa8tksKsWOCHlJr58TPk7oS2vDA8mdLKz7RGwxiYpsAQyYKHCF32+vFi7eKhqhp
         Nz7w==
X-Gm-Message-State: AOJu0Yyt2XjA38DPTkQ7psfKYz2mGq3Vn0zvjGkL9XoKF0MtshOT+hfs
	buTXcCLQtPQe1LJucXM6Zlm/9IET2OApfruDwy6FDgbWVqm40P73vc6naKqmpDiPCOI=
X-Gm-Gg: Acq92OFsrscUhpnKidAa3NnX2wNgRTtfMBAtbxhYJeMPHcXVzbdBSi2c72Y7GI5uBg1
	epgGSoHyKnXV2UOTTiDrRj/3lNcrSSz4YP+TON9fiVlTZqElY/EKBPCGVjgqlw8jFQCPdzC/fEY
	z88m1djM6y+IIFBJPwcErDandzfHcsNkDHsIxAjLnud+LdGnFgOCXX8tnizN1mjr3d1v9Fakcyn
	s9KHV1YsmaThWHRm/qp4ifcF2lc4Hw1ZTcY8jVwIcm3MtpZUj3O644HQBItWJKMzntzPLhyhAKT
	6JEpmpG0G68I6CNX6P51JkPLwyn5iibckN9O8tllf1HPkkA6l+JahXNfxt1Xisw8mok6kXN4cMZ
	Y9MGwTjZnyD8tgpjgocpEG1XJ1E9Vb8uexr6EJivMa/25hkFhHMl7u8wNtff1oD3wiVardt/4Qp
	b7kHpPFt7CG2BsuDpNtXaKAvOlUT0=
X-Received: by 2002:a17:902:ebc4:b0:2be:9659:591c with SMTP id d9443c01a7336-2beb031ae09mr168901795ad.4.1779720749021;
        Mon, 25 May 2026 07:52:29 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:bf9f:259d:c433:fb32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5903bcasm104765695ad.77.2026.05.25.07.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 07:52:28 -0700 (PDT)
Date: Mon, 25 May 2026 08:52:26 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Zhiqiang Hou <Zhiqiang.Hou@nxp.com>
Cc: imx@lists.linux.dev, linux-remoteproc@vger.kernel.org,
	andersson@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
	festevam@gmail.com
Subject: Re: [PATCHv3] remoteproc: imx_rproc: add missing DRAM ranges for
 i.MX93
Message-ID: <ahRiKmwn8YdHGCyZ@p14s>
References: <20260525062031.24725-1-Zhiqiang.Hou@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525062031.24725-1-Zhiqiang.Hou@nxp.com>

On Mon, May 25, 2026 at 02:20:31PM +0800, Zhiqiang Hou wrote:
> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> 
> The M33 DRAM address ranges 0xA0000000-0xAFFFFFFF(None Secure)

s/none/non

> and 0xB0000000-0xBFFFFFFF(Secure) are both mapped to
> 0xA0000000-0xAFFFFFFF in the A55 address space.
> 

So the M33 has secure and non-secure ranges mapped at the same address in the
A55?  Are you sure it is not the other way around, i.e A55 has secure and
non-secure address ranges that both map to the same address on M33? 

More details are needed in this changelog.

I'm also wondering how this problem hasn't been fixed before.  The original
patch (9222fabf0e39) was merged over 4 years ago...

> These ranges are currently missing from the i.MX93 remoteproc
> address translation table, which may lead to invalid address
> translation for firmware accessing these regions.
> 
> Add the missing mappings to complete the DRAM coverage.
> 
> Fixes: 9222fabf0e39d ("remoteproc: imx_rproc: Support i.MX93")

The SHA should be 12 characters.

> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> ---
> V3:
>  - Added more info in the changelog.
> 
>  drivers/remoteproc/imx_rproc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 7f54322244aca..175c2d3099794 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -198,6 +198,9 @@ static const struct imx_rproc_att imx_rproc_att_imx93[] = {
>  	{ 0x80000000, 0x80000000, 0x10000000, 0 },
>  	{ 0x90000000, 0x80000000, 0x10000000, 0 },
>  
> +	{ 0xA0000000, 0xA0000000, 0x10000000, 0 },
> +	{ 0xB0000000, 0xA0000000, 0x10000000, 0 },
> +
>  	{ 0xC0000000, 0xC0000000, 0x10000000, 0 },
>  	{ 0xD0000000, 0xC0000000, 0x10000000, 0 },
>  };
> -- 
> 2.43.0
> 
