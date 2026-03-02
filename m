Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78EB425CDE
	for <imx@lists.linux.dev>; Mon,  2 Mar 2026 17:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772470936; cv=none; b=JQE5in8td0klVDfgMMKvZhogxYUe3xPnWDoHWL/TQftKqV9JWj25y0+znBSSv+a3RDkPQTXWmmep9IjBGv34mIjpWfZhy7d72raRE1ZY/+He2+zkmX59yowa77/WT+KHSlZy4xMQSvJLPHnhvLcXA+tPwZPK6UZQQliP38Wj7rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772470936; c=relaxed/simple;
	bh=zMnCw1GpmTZEPh8ioUPoTvQ7T/FR4oKatNjLKI9czoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ris8IM8Yt0zdG9nIdlsux0LEsUQ++tobw+hUjQjpEGhnm4P+jIb5Li+zwvv0AtXajPA6g0Dk5eFx2cVeuQDmRTwuWJs0a5uFXBEnc+75T+EADFyjOdCdK+L2cDL0xi4pxRVEDadlRG27rf3OKPLirsbFe5aS7cgwyCvKrXt1Bm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1NBIAKT; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1NBIAKT"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439b97a8a8cso1094664f8f.1
        for <imx@lists.linux.dev>; Mon, 02 Mar 2026 09:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772470934; x=1773075734; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QaijC/p2L1n1TZ0ZHl3fOCy3J+kOaUlNmbkDRGgocyM=;
        b=d1NBIAKT5g2pOMsObFLQ1suGHBMW4kjGKfA2kEyfiRXs3I2ZM1IPVpf7fRAddwXy1a
         boDACkwgF33lJxk5rK6avrSiMPL1F/nAc7haPkCDlyvx7Faj05GqSdWChMyUniBfkY9p
         SYZQ1xpaqe2+tzYDviLuOGToLHAELu1AbikOwjYMLr0qB+PoJuEIdwPcvAL1kCQKNS/5
         7DRtlqxieR598LjQjXK76u0r2C8Xe66RH26D6YNXkLE3OEAhtMfd1mQFpVcCvfoG/NTt
         1ZZiGacQRqukQ5LTPN+ut15QgLz91EBeYNDslcmdnA3lWuZ6F5r4dwvyQh0sJOd8whke
         BcTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772470934; x=1773075734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QaijC/p2L1n1TZ0ZHl3fOCy3J+kOaUlNmbkDRGgocyM=;
        b=dcnOmHvH/hYDkyFAq8Z8H+EX06h3G7VX0XhNfeLkOYFj7amOb1H7vuUCnLPU594qaZ
         +Haw92GxFk1rlNizxaJkjHYOyE0hwWMtsTZQbrRAjyHzl6BQ4OUPwogbKRpGgK5zmm33
         mPozcTbFdnL72tHi68RRdt2DJ4wOY0wtvfiq5iK4UNvz+zBXG0f4GAjPqOed9X+MKoM4
         q2SeMWYhHBAFRbdgo4p8JVOfSoAkmE0l5KdmMI1mnnjNezoHlHjjZFqFy+EtFmGAOZ18
         8Nog/K/l75ctpGhWGBhrE+XL1pq444hqYTWe/ZSW+6JqXXsrPiojd9v7xAYoXmj7Yjst
         D7yg==
X-Forwarded-Encrypted: i=1; AJvYcCVTBUN21OemXIVybYMDyTxW9a2tk7FxwIJjKSfMpaD/Ca9gK4d/26Fk49bIXwTYwqdnBuw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx97kVl4d5ODAhC61R+WAvo/NuJJKVjiCEZ9XPdbRqUtJc8ssBk
	V8WUzlZNG/wd9GSGn2yOp15lV6B8dY7grYyS9djYzY1UTgc3K+0Pom8B
X-Gm-Gg: ATEYQzzuaOm7mUf/PO9P+iP/a8Faby3a5gqW+P/VzDV0cTSvYbU40I02Z3gCGjkKp7h
	5S3AANa8jxd/CBMRJA1LwTrZYH/G9nQrvQNfoOjDwk0JeC8XwvJbq8pfLT1s1/5zP/2O87i2xM7
	ffazvwUeBQrL4p98iCD63hb993tkwTXQzbqgKdmDD0AWC2k6j9Jp0aKkFIMgdJc6YgHW4aMakVp
	wUtz1ekpRbs3hTk+u1gpuYFt+kScWKPBff1KfwuG2EXrbg+XMXdPEbqJj+PtryCzeS1OwWs//gz
	Gc/D0+tSLUzF9LdeiXKLdP2lF6ikhZ8IJLqN6On2EHgx2mrY0azp/y4B3PknsUgAiXuSmy1Y7ZP
	EujeIc4QI6vgYvLoXxI6Ve1RNhajonrl/jA+JcfSbrJGVFJXYnRIjWIrmXYA8WQulDqIqf7hGgc
	1XK+AN5UnWiW1QJOZhLOwC/L5uscaE/BCZCyQSZyj+hys+kd8G1lUR5hpkPog09q+FNrp/fTh4K
	yeZ8mxhaWsMO8THzqzOg5nFDwqq/UDItadxBFovdgVqPNooabES+MOG
X-Received: by 2002:a05:6000:4011:b0:439:b922:8479 with SMTP id ffacd0b85a97d-439b92285dfmr5706628f8f.36.1772470933596;
        Mon, 02 Mar 2026 09:02:13 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ac9f3e5bsm19606933f8f.37.2026.03.02.09.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 09:02:12 -0800 (PST)
Date: Mon, 2 Mar 2026 18:02:10 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
	festevam@gmail.com, alexander.stein@ew.tq-group.com,
	dario.binacchi@amarulasolutions.com, primoz.fiser@norik.com,
	Markus.Niebel@tq-group.com, y.moog@phytec.de, josua@solid-run.com,
	francesco.dolcini@toradex.com, maudspierings@gocontroll.com,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: freescale: Add support for Variscite
 DART-MX91
Message-ID: <aaXCkswynHreRURk@Lord-Beerus.station>
References: <20260205100125.9095-1-stefano.r@variscite.com>
 <20260205100125.9095-3-stefano.r@variscite.com>
 <aYSzgRRGewX6uSlc@lizhi-Precision-Tower-5810>
 <aaW7EpLmhxk3elmd@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaW7EpLmhxk3elmd@lizhi-Precision-Tower-5810>

Hi Frank

On Mon, Mar 02, 2026 at 11:30:10AM -0500, Frank Li wrote:
> 
> dts part can't apply, please rebase.
> 

Thanks for the feedback.

I rebased the series on top of the current mainline (Linux master tree) and
it applies cleanly on my side.

Could you please let me know which specific tree/branch I should rebase
onto for the DTS changes? I will respin the series accordingly.

Best regards,
Stefano
