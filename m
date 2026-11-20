Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795187922;
	b=Wi/pNFWnO8M/TaVdY94NNLOV3H/VPf05A3v/Vgor74/9qsHXoAmrrE/ln4QKApZOIGIr
	 mvd92Mf5J/Prd2LpPfe0nmsKAVX+dGhHPLNYfy3I/9MIUDk8knxrseJKVds4pCTtv8bhc
	 4+oohTHmhoTr8p2s/i2MfIJB8nqwSqXcRp3w4UvR3El5GjodaGtK0rga4KbLZh2WJo7cm
	 8w+C/e/XhjZLm68NzeLGwaISJXFYq6GMbyPk52OhVdefOmxo3pr09qTZgUQt21ohow0AJ
	 2nriKM2DCpO3VX4bo9ygIX8y+ZC8Dz4pwA1POUIoIMzQA+yltwURXrgigKnEAHYVxeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795187922;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=qAgfBb2bvJuIizWOsW8GgX2po5iAc1jJk7JX8yj2LjY=;
	b=r22rEJHpusVCRGuYajjkhjKy7qFuA+HI/eOJGAavLv/EseBtg7ynmLjk5rWluUnlbHk2
	 UAsuf1yKXtCbXW89uDAzEWJE+579hsTZUAQXdFPKszJQMk/nmvPyfMjj7riwoMbzEQxvW
	 MVACU52zb4z93GPsACww+Gt7o+vJt5fhQ761cmNLgvQmT+n9GUOM3Xt6yNYVf1FYoqdNJ
	 lezlOIHtYyho3+rTg1SAvZXxxd+cDBFOpVMT+AE/1izovmstAVffn6/Nb5HQAwCP5weK6
	 RVPe0eXEHKlUlIZT13iExpYbcQvhhUrb5JF/XQHE6jIu8SuTwWo3dZtbtG+wvl2nrww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="rKv0Nn/U";
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3046E606A320
	for <imx@lists.linux.dev>; Fri, 20 Nov 2026 15:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3046E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rKv0Nn/U
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so564218b3a.0
        for <imx@lists.linux.dev>; Fri, 20 Nov 2026 07:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795187921; x=1795792721; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qAgfBb2bvJuIizWOsW8GgX2po5iAc1jJk7JX8yj2LjY=;
        b=rKv0Nn/UZhOhb8giBkerH02FN3YOzzmo8q5fR5AubEq0x/IL/jzP4KNM8BVEllLB07
         LsIuHruofxaMZmIaCaTj0R+qIHOCrWE+YoWzFcXxCivbxuBRc3xJZIGRoK2uqq0MVog1
         RFdUNIN0Dux6p8+M8uPEqXRARbnUvFuqZ1ykSq28M7Cl3rPpEKivRxfvQJ2z7Y/RzBO7
         4yPB3wd+8bfdsn8Mw5ahK8TbVBk8buFTs8aToFcrR9BTuz6JA5H7m2p57rvNmiuCtYlp
         XtnPmFW9nXC6NMfYRHEdox/X2NQp64pesyED9XsnNNbzodFG4W8IM18ctwcWalYJ2Nwo
         2ihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795187921; x=1795792721;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qAgfBb2bvJuIizWOsW8GgX2po5iAc1jJk7JX8yj2LjY=;
        b=dRQxVst1rBy6rQk4nzR++QMR+PTvBlhvLV2/NW1MTlWg/ejXhuVikyaGk4wW+Dtyay
         YRf+Mdfz1mtPh4V5jTIbPlCq6wzAex9nY795EE4O9VfFcXYUcs3IQ4hi7iyRta47gzf3
         U0wClvEXVv/Zju+iCl++2Pnlomk0I61pDcfBdyfjEk1VDA23Qo/BvK6L09417mdrARD/
         Jf6F1LzKJlMODEPw9g9cFTE8ORlPplstCcnem9G5oQdI8eDeSaX6jq2oOybXVpGak4G0
         rVrT71TnvE49mc59E6un9GaFnkvN/xaiQyrBiuWG0ecs/84Us0qoTeAZdtJmY89U9jan
         qIsQ==
X-Forwarded-Encrypted: i=1; AL+hErF0fa+z52ZbFDX72t2uynr1DBKDqyuAom4C3Iq+B0niNtM3A3o5NdeuR8Nc1ItLeP3ebqE=@lists.linux.dev
X-Gm-Message-State: APuU4Z9LDbjFT4kDoQ0O6UqZqS6Ppm04nU41kIgRKPx2SFR2/2Y977WB
	hTdj7igpG52NgUa+VwvS+eP93o2bHB5EhdxKJfV6hNBqH+9AOZbk+U4HH6rGvQWZKiA=
X-Gm-Gg: AYBFou0uyQ8wamwnPE3+UkTVhXEM1zrPSwNtBm+KgVSFlnY+VxaXuA1NR6C+JTPu8bK
	ra9piFQ1ObS5XFg4ahTCMBFy2MV+PPDu0SHHmh6smBa7v+KU1h8T8vxlekvpr8C0rKVy0JY9XeB
	ZprQdTrft2kKwB5PQvpKLIP0jWKg/lZkKtBD7iNETeJr2cI8H2IeRFg+NJMMx4VKrFetUDLWJ2d
	Ea9juY1RBlGL/11hj2Z6Jos4m9Hu3mSztPCbaDbRpnhpq2i9KGkU9fO6ORKruLun/Yb2zTTBU7i
	tGznAW4T2/AhkdCnj2b39CeXpeR1STHIMiSXCJYOo6XeXEqMDIYnSFR5oBBx9b4vUARb0YP8F8f
	rKDCT4X4th0nbevpZ3kknqZVyEL/IN/2lc9xHco6UeSgaxdvV/cMgaWzaASpLJe2DJviKmU+Z45
	lTh2qRqLp5JNcguUvobYmU478fDsoUqS6SLe6ySImMY9KLepcjEhO8BEEE9f3L67rKXcHG2xPAV
	QusibMhGvM7gEJejS4rrvRxV8VkJR0y+ugIBwimjmA2UAacBxXJTYxlubsksezZvJVVHgjswHZi
	H1Xljl5aG2wFfLkhDoxR26eunEETZJ+5
X-Received: by 2002:a05:6a20:6a1b:b0:3f8:2d33:217a with SMTP id adf61e73a8af0-4014e35c5bbmr3604027637.59.1795187921441;
        Fri, 20 Nov 2026 07:18:41 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:7124:798f:1b98:bea5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6c9c7dcbsm1534544a12.0.2026.11.20.07.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:18:40 -0800 (PST)
Date: Fri, 20 Nov 2026 09:18:38 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] remoteproc: elf_loader: Make
 rproc_elf_load_segments() more generic
Message-ID: <awBkzr_uxBxgeLvs@p14s>
References: <cover.1794483181.git.u.kleine-koenig@baylibre.com>
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
In-Reply-To: <cover.1794483181.git.u.kleine-koenig@baylibre.com>

On Thu, Nov 12, 2026 at 12:39:49PM +0100, Uwe Kleine-König wrote:
> Hello,
> 
> Changes since v3 (available at
> https://lore.kernel.org/linux-remoteproc/cover.1793879714.git.u.kleine-koenig@baylibre.com):
> 
>  - Improve kdoc comment for new callback describing what it is supposed
>    to do as requested by Mathieu.
> 
> I'm currently working on another remoteproc driver that cannot use
> rproc_elf_load_segments() as is because the remoteproc's va isn't mapped
> into the local CPU's memory address space in a useable way. With the new
> callback the amount of code that must be repeated is reduced, similar to
> how the imx_dsp driver's load routine is reduced.
> 
> Best regards
> Uwe
> 
> Uwe Kleine-König (2):
>   remoteproc: elf_loader: Create new callback for copying segments to
>     remote cpu
>   remoteproc: imx_dsp_rproc: Implement .memcpy_tova()
> 
>  drivers/remoteproc/imx_dsp_rproc.c         | 120 ++++++---------------
>  drivers/remoteproc/remoteproc_elf_loader.c |  64 ++++++-----
>  include/linux/remoteproc.h                 |   7 ++
>  3 files changed, 74 insertions(+), 117 deletions(-)
>

Applied.

Thanks,
Mathieu
 
> 
> base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
> -- 
> 2.56.0.rc1
> 
