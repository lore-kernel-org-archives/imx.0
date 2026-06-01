Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2AD3DB992
	for <imx@lists.linux.dev>; Mon,  1 Jun 2026 15:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780327213; cv=none; b=rOziOtp5zxNBJcd38DLHTVdpgRrZtiZhtbabwfg8LIgxCOgkFftY2Auwyh6+kam7WqAncQXXo8XGdWak+ZKsojFtiWlhSa5mkET+R+LvH8rfr+J9jaJ/3RR4VsXMX+8HYwRxU2fv2hOViyhYAwuo/9iuZqA50Y8n8XaFqOmxOho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780327213; c=relaxed/simple;
	bh=z2vzzUU9AdhfZh4TpPBi0E2NHAyN0OiZYk7GbkDEDFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MeEY2lFq/sluNqbEx2MwIMc/xk0OovJEWMEocztdmfecBMWUZM6ydbMbhBz9OpnfoXQXbZYGkmxzJaDJD1ROPwoRgnAAh+OOUFUFRDRnwiBSFs7KFkHtjmm6jOoJMkKDxsuZP7twwc49Ym1Q8WtZl6af6iELtSPAkhWFfMocJ2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ceLi48Wo; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ceLi48Wo"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-43d16405b54so235912fac.3
        for <imx@lists.linux.dev>; Mon, 01 Jun 2026 08:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780327207; x=1780932007; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EXR0o/ax1hkvEGDJ8bUniOsmAfk5/s8y29rVFNL4VdY=;
        b=ceLi48Wo4RR7Ltkeeua7gXYm2ZFYKLMix9DfK8cBNyjM/54i5yx2VEavNf8m0cphf2
         YQ6L8urshGXBQaiuwyW7ruxggnXioymAHXuiH85iZHYblWQ2Tzb6lzdHUeqYx/VYST+z
         gwWLpv0xjTQjmJSMPIGU/LqDmk4aVaTGoYgze+x3O+vsaXyEu1hz5DA64h7mxjdZUlTN
         BOFC554QBVVIch4owgac2+BjY036BxMUYX/AsNfxhMZaBQ94GKXg8exliREprYSKp2uh
         L6I/2x+VEQEbPNEkMNRN14e1mFS0DoB9XHMMsBeDZw5k2R+U+LXozJ1VYSMazeoxU0cS
         gjMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780327207; x=1780932007;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EXR0o/ax1hkvEGDJ8bUniOsmAfk5/s8y29rVFNL4VdY=;
        b=sduPW8UZD5Vggn3R9TEuF+qABRrhfc99849hd62JEegvpQCD+95HfP/So4WHHrWkp+
         mY2ATC3iZzk7oEMyFut+Z6t673M/PDwYUwIQNexEi5HMKbK7maTk0hZGVTBlAhBFqr+/
         nJjNLvQIJ6ZJegsoYiegqwawCP1J4vjy16d24FyknS2uCI4LnMk7q5jK3SgGBu/x+3+l
         lV3ymamu4GS0sYRnQcCgFRxvkSj/fiFKQjwooUHDWwddWvGDCkVwVQjnpPGGUaIVSLgP
         vdKVgak+YdBsABl+D/kXDFHeIs3gkMYYTUJE4bpYpJ8u634tRClB0mKygV6A2EyS65SU
         1itA==
X-Forwarded-Encrypted: i=1; AFNElJ8luJCTx74PdYH8+tgXnMuZrqc0yGVGJWDXeZxk6UHAR8Fx5fEzARQMVihLX/+Am+60smQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzf0ZxyUPBtZIVAC6JZvN3JNBXC+CHhS1XpNiUE8GlXQFDPkxwg
	RDLMp4sIxJn1QNrelNrZA0ZcUGrXblfdMAi83ZWPfL+mI05rTb+E3kcU
X-Gm-Gg: Acq92OE+te07GBvkEvqFBkdnga9nezmEtibdyAJbRiiJO8p4T7JzbducJapk9xd6ovw
	KZ4XUdLaSEy56BD8b8F82ndsdvK/+MC2zCALdDAteoQJ8xknIlY5n3YjyIXxI8coe+Qa0pAwfoW
	tpk0uCXhCgnk9AT0fbycxYCfb48O6e+fcPyfpj1fGDRPHwGB+Q5KBZ4J2uzhm7S2qI8AKfYRy6W
	91ZIHAWYLSz1u+GepE9cpScLAPl+KFsq1EiJ6gHmGkgLiqRHDELSlkjybzHpSazqiqGwtg8yYuh
	YAj8AWeLH0A94GEO19en/OS70XZg5jv7XIVGH5Z+D9aW9JIMbNjSUw0oRAoyXPMluko3lozAu/C
	CZs0Px2ePPtHk+CEf0kzS45CJPKpaRLodES6r1VxApFT0muZty0mkKzDBrJSKDBgMVdO5+wgxMp
	ovscwG6WhjEbejPVmfpXR+IJ4r/Sjo3fmXe9UE0YUAuxGn2PCbzu4b
X-Received: by 2002:a05:6820:c82:b0:694:8fb2:2c35 with SMTP id 006d021491bc7-69e104765bcmr6510105eaf.2.1780327206868;
        Mon, 01 Jun 2026 08:20:06 -0700 (PDT)
Received: from hoboy.vegasvil.org ([2600:1700:2430:6f6f:e2d5:5eff:fea5:802f])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69e06587eecsm6357598eaf.0.2026.06.01.08.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:20:06 -0700 (PDT)
Date: Mon, 1 Jun 2026 08:20:02 -0700
From: Richard Cochran <richardcochran@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Wen Gu <guwen@linux.alibaba.com>, Jakub Kicinski <kuba@kernel.org>,
	tglx@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, pabeni@redhat.com,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	jstultz@google.com, anna-maria@linutronix.de, frederic@kernel.org,
	daniel.lezcano@kernel.org, sboyd@kernel.org,
	vladimir.oltean@nxp.com, wei.fang@nxp.com, xiaoning.wang@nxp.com,
	jonathan.lemon@gmail.com, vadim.fedorenko@linux.dev,
	yangbo.lu@nxp.com, svens@linux.ibm.com, nick.shi@broadcom.com,
	ajay.kaher@broadcom.com, alexey.makhalov@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com, linux-fpga@vger.kernel.org,
	imx@lists.linux.dev, linux-s390@vger.kernel.org,
	dust.li@linux.alibaba.com, xuanzhuo@linux.alibaba.com,
	mani@kernel.org, imran.shaik@oss.qualcomm.com,
	taniya.das@oss.qualcomm.com
Subject: Re: [PATCH v2 2/2] MAINTAINERS: update PTP maintainer entries after
 directory split
Message-ID: <ah2jIt2DqI1ZZJx8@hoboy.vegasvil.org>
References: <20260407104802.34429-1-guwen@linux.alibaba.com>
 <20260407104802.34429-3-guwen@linux.alibaba.com>
 <20260412084704.743482ad@kernel.org>
 <4B889ED5-D1F6-401D-B753-89AE2037F316@infradead.org>
 <20260412095301.4fe1fe65@kernel.org>
 <ebf19246-91af-4887-b2aa-d9007921f7b2@linux.alibaba.com>
 <1088b07d760491deb461d6d01abca631e8f8d86c.camel@infradead.org>
 <ahzQZg_v4bxFfGdj@hoboy.vegasvil.org>
 <3908843460c4864eef79cced40d897f793c7ae2a.camel@infradead.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3908843460c4864eef79cced40d897f793c7ae2a.camel@infradead.org>

On Mon, Jun 01, 2026 at 08:03:26AM +0100, David Woodhouse wrote:
> If we move all the plain non-network PHC drivers (which, as noted, is
> basically *all* of them) into a drivers/ subdirectory, then perhaps we

Sorry, just catching up here, so the idea is to have

 linux/drivers/ptp/drivers  ?

Thanks,
Richard
