Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F3D18E76E
	for <imx@lists.linux.dev>; Wed,  9 Oct 2024 11:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728472129; cv=none; b=pUN3ARvRqLKNq8q2PZrrnS9IuZXsg9lcp+r6K5nLJG4z04S/JlFk8jjSzpVTzlZICAEgdpkNPAVcbEUBeIk2qSk096i1WlKDud9Wu9yYXdcn1jMxl1bBgI1iGlTalKvSmk3KkLzLkZcCUw6fDaBVWsnlRnm1mhThYdeGBTVEsXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728472129; c=relaxed/simple;
	bh=UIAyPl+9jzUQ22laObGiczjWDSev9JKsaGvbNx7tjdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fd5ksoDng+zc5cKc4s7Jo6QSwhHfymCcuObE0YrPGySZBXfdW++DtkTjrBfMSljvDEeq/WjQhPwXjRs5YbeR9xXFz+O0aCz2C76TO8pKupNizx5si/dWTbLdTLY2RHFPaDM4p6TTO+Q9n5bO/ri/giSjC295HeKvRthf0HOLBF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZsLowyIY; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZsLowyIY"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-37d39bb5a9bso24932f8f.1
        for <imx@lists.linux.dev>; Wed, 09 Oct 2024 04:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728472126; x=1729076926; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I8QUDh52m9TNIJ0PZ4ww5a968ccrK59qbkwAoVHWIJQ=;
        b=ZsLowyIYC8lJ9S2eGO5K3SnRrQfSJBz0X2IA6EfHO9U871Z3lSYafsZVQk4doE9lO3
         dnwvdbQoFM7WncRVofJND6lUqd4IBWWDUqamPIst/3ZhMnFbM9IYR+WLIdSJV6NnWT0D
         XhFm5HAA+7yIpARIozivRlxvvBdtjlTRTcL84ttDj1ckNjJXeBjUKNgFRHuRRUEV4HZL
         dwbnpiFqBvtv/9pKgY1leMpbBzJs0lghKcXjOypIKJvOFnxqWtYyvxdQYpOO/MilybR6
         1QQOpnhBcXrLk4pOLcjfecDRZNLq2zLVeV4iSu9nmKKLyVEva97cccfjEUcDsrL+8DsT
         cBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728472126; x=1729076926;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I8QUDh52m9TNIJ0PZ4ww5a968ccrK59qbkwAoVHWIJQ=;
        b=SijMeDwQ4ePGAOHh8/IFfuDgP3pX9QnWgw4W8kV4WMyuFALfDdWGRqbCx9ByWXzQwl
         GFFJIVwi0jrjwoNFiBZhF9IlpxvVRon4JAiVa2qZTy/eUPsDcqJd1KkgnNcqjtHMPpnC
         /pi+Gt1yhzerkqE1BCn0WwOM06nfwC/3ZqGduqWmo18ih3BEAUbNNPjGRaO/BVfC0cfM
         pwP5JMwnreoA2eadv7biVQ4EnU0W9urh6ZEcwVAP0CMrHOKpJ8pbU1XaHzhs3kkiSfQH
         cn7fyYb38FwqqVM0dhrBU+pbthKOPY0SQVK2P9UXOoOjE56Cfwz4/1+FA628kkbt3nL0
         4oQw==
X-Forwarded-Encrypted: i=1; AJvYcCUMU5y+exGyeKQEm7689FBpHDr8+yzUr4TraUc9JIla3TL3y5c5qipXkAjRL+Mjn4HLLXA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7dryrfFwC6vRyxcGpGnPdVNhC4B/ar0pzIkA5X6A/dN0thiOk
	blptBPJDYHAldgKy9Bq0pg/gMiKcFs2mGSjUYc/oqknaVfi0Udbw
X-Google-Smtp-Source: AGHT+IFDU5slgFFtiAB4ooSgNPxJIbNKZJJQlZQlPymnfSlop3jhF82LyfZTOAynRIvkGDE48V/9ow==
X-Received: by 2002:a05:6000:144b:b0:378:955f:d47d with SMTP id ffacd0b85a97d-37d3aa7927amr779886f8f.11.1728472125581;
        Wed, 09 Oct 2024 04:08:45 -0700 (PDT)
Received: from skbuf ([188.25.134.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a993897cd3csm597381066b.78.2024.10.09.04.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 04:08:44 -0700 (PDT)
Date: Wed, 9 Oct 2024 14:08:42 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"frank.li@nxp.com" <frank.li@nxp.com>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: Fix Sparse warnings
Message-ID: <20241009110842.jhtyt6ckbfp6medf@skbuf>
References: <20241008055644.4900-1-hardevsinh.palaniya@siliconsignals.io>
 <20241008-impossible-mysterious-salmon-e1b8bd-mkl@pengutronix.de>
 <PN0P287MB2843E06597DD5D64BE93A8A7FF7E2@PN0P287MB2843.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN0P287MB2843E06597DD5D64BE93A8A7FF7E2@PN0P287MB2843.INDP287.PROD.OUTLOOK.COM>

On Tue, Oct 08, 2024 at 08:43:51AM +0000, Hardevsinh Palaniya wrote:
> >Have you checked the code on real hardware or compared the generated
> >code on the asm level?
> 
> it's just resolve casting warnings so....
> 
> No, I haven’t tested the code on real hardware.
> 
> Are there alternative methods to verify it without using hardware?

"Comparing the generated code on the asm level" means running
"make drivers/spi/spi-imx.lst" before and after the patch, FWIW.
It's about the most you can do in absence of hardware to test on.
