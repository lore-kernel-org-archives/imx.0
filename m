Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADB43FBA7
	for <imx@lists.linux.dev>; Mon,  1 Jun 2026 00:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780273263; cv=none; b=I8VgAXT534YNnTKmfeFqoyrS1iYV87nbjF1tSBNZ9x0ialX38FTQtO9HuoXhG8u+OSsoWGFtp1MEfwnIR35L8Edsdxgsozb7Kc3CtEtp2VU+xllCJ+J1rJddt1yCLHQNN/Ki7y7fkGBnHpw6RlitO/dWBd+9GD+PltxeJl1BvOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780273263; c=relaxed/simple;
	bh=y5x9VeqDKEmwkx8OrFdnevKo8r2xzK2tzc4l1QYQnSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EXOUKoKkP2rk23uOgjkKga6VZEVLUrA9OG2yWK1nbzya1YMBocCcng7/aMhqOZSzHzF+qsQoXbVRKXA6bGndpRmuayf+QO9D9fByv7HC4HDkEVOs5R0gLazFWyDcWN91htud/vHIHDCrD0OqOQkyoM0yDK6cV8ZV/6Ew1Vz6tec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c0x8Zs8M; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c0x8Zs8M"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7ded779a345so18172847b3.1
        for <imx@lists.linux.dev>; Sun, 31 May 2026 17:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780273261; x=1780878061; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CM1q9ViEK2AU/qrAQZYqabaGPjGPWPy1MZYzvbR6QNs=;
        b=c0x8Zs8MAfnO6pTeC2asgxIyU1AzAzcQ3m13/FdTG+sT/zX2+2EiybXizKY+38DkMJ
         IO+UmHLb4bEBUfuA2K7w7iSm1VwJVj97W0NHvrtBBtFCQ0IPzrLcp43WOfjR9OI4K0pz
         bqJECatPexjdzNDzdyXqsRw+HbHNba0gVVV5IhYOgSo8ZJMORstAWxQlcM41i548TqDV
         N0izE+9X6Y07qIiQEMYnWjjrAjXrPOgpW/zaSSIoLDt6fee5rWoFLoT68XfLMfXMXuRL
         77hAYKAbOMbzdpej0NjJ515C+uabGJnvgwZrIndQ9V8iIot/tH9nSbLo0V5z1+cWmbcK
         q+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780273261; x=1780878061;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CM1q9ViEK2AU/qrAQZYqabaGPjGPWPy1MZYzvbR6QNs=;
        b=M498A/jxprOB3PmkxT7tn2MF46TatbZOf23MvV4AUTBB8SGYJBQyP5c70w/DUzH8j1
         X2F/uSbc9GeHyi8xwbPgexFiltOAAEEXYyVW3q1fN9x18sD6L76TIy/Be17Tf62oGG3m
         3ML4gmm4tglTu0IFxCLQ9Qwj2QWmv1qoaYijoYOxcqYYEeKLzDpLcpeZ2491GF8UJmRJ
         0Sq1g6KezxvzlTalxfYIQKsSvHQgRDDGzdwEz1Ye1SXIUfUiq3LdvzRGwdEcCewm3Bi6
         slD31tHi1JCTJmFAtbbiEUWfK8JI/gxrV5xEtqBxTtvbSj7hulMYz7Xb93imwbqN+zE/
         fcgA==
X-Forwarded-Encrypted: i=1; AFNElJ9QKaNGtmTkdzUt5Q/3FJBdqJkAOUW1hfvEt4es1gdhDodJTvBY2qBjuD4dhX27Or2hTks=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyd9sdrPlM6MC0dua2GohG7pQ5Ce4uV/B+o+sKHJ+8oyLQW5rBZ
	MJyA4vhVkpxVqg40LHbbUFLJDQpwCDsj+4gBFrkMdTG3pbnpq/Y6+pQV
X-Gm-Gg: Acq92OG7U0T4ywc04cgK7nLZX2mNprevOcF8VY6m4yeyKdUGV7f2dT/v1hjS/I8ZpyF
	Xzo6miH0QupZ/DRPLOuU2/PWolObzCh5l/aCo07lj5SyeOyYu6fDK/nkvFwNlxFG60fFGcvWAJd
	Iw1vj8M0oB/jk+emtoLgUnOxMNKPl7uSnXQVmJRcqfX53RFImm/+dH1PrnFLGmLu1Fh+1paEBTl
	5Mhiaxlf78/n894nL/bIR765iQO+H2HPfXQE/m61p2naEy7Fi3OogMTTE0ZL/+yaQnHFUAN70Dp
	Bx/eUzW5rli/fUqsCNY43H8cy2ZZvAKpSIqQUqjR+hf6Awxn3WCqsL31CPKH8TIEyImVyoszXWr
	pMEHDNx/ccdv/LQUUn2aQny/dZtweRUH4YgM+pZ+EKsyYXPXaqPj5S8eVl7o/3eTXUQzrvoWoeX
	O3EQZShADNmflXHh6IvvMgbArWmR8z+2zfU/p7IzjCZu5ngzTNIwZd
X-Received: by 2002:a05:690c:6d86:b0:7bd:7e01:8d89 with SMTP id 00721157ae682-7e05c47bda8mr77291477b3.24.1780273261126;
        Sun, 31 May 2026 17:21:01 -0700 (PDT)
Received: from hoboy.vegasvil.org ([2600:1700:2430:6f6f:e2d5:5eff:fea5:802f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7e17bf00ff8sm30648267b3.37.2026.05.31.17.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 17:21:00 -0700 (PDT)
Date: Sun, 31 May 2026 17:20:54 -0700
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
Message-ID: <ahzQZg_v4bxFfGdj@hoboy.vegasvil.org>
References: <20260407104802.34429-1-guwen@linux.alibaba.com>
 <20260407104802.34429-3-guwen@linux.alibaba.com>
 <20260412084704.743482ad@kernel.org>
 <4B889ED5-D1F6-401D-B753-89AE2037F316@infradead.org>
 <20260412095301.4fe1fe65@kernel.org>
 <ebf19246-91af-4887-b2aa-d9007921f7b2@linux.alibaba.com>
 <1088b07d760491deb461d6d01abca631e8f8d86c.camel@infradead.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1088b07d760491deb461d6d01abca631e8f8d86c.camel@infradead.org>

On Thu, May 28, 2026 at 06:06:32PM +0100, David Woodhouse wrote:

> Apologies for the delay. I have set up
> 
> https://git.infradead.org/?p=linux-ptp.git
> git://git.infradead.org/linux-ptp.git
> 
> But I'm not keen on using it without Richard's explicit approval and a
> clear understanding of who owns what, *and* the taxonomy we use...

The name "linux-ptp" is very close to "linuxptp" which is the user
space PTP stack.  So it is a bit confusing.

Thanks,
Richard


