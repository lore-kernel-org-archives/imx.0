Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F038F399354
	for <imx@lists.linux.dev>; Sat, 26 Sep 2026 19:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790450978; cv=none; b=i6POMshoaUxgH1AIHVjc9h6kr3CmxHjQUSfuq2/C8mKOPWqqZiCqA98j/NYgWzjMlAjSgdoNTcZPttSCIpYkHc43F/VQrOH1+8gOi6x4Fuc5ZHvdSTDZS3hJ6Qa4c0kQ8PQdv1oRijzL5/34I1S0X225BVnJGIXUL7luKMvORrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790450978; c=relaxed/simple;
	bh=1ebgJkP09GKvWRwvK5F2YFranzNOE8JKc24FCxtrAac=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gbQ3QeHwxSU25H4pJ7Ma4sfWOd0DM8f7iLcC5wjnVgMdYvb8Emg3sUq927/EAcL8TQygLTDuDP56wWM2zWTrd/+HiHqMtGxni4DlUivT9Gv5YcpZAhugdPG5vk1ve16H/5gAo8CrpoO/LLycJhM1HMA+FZ4MzwYoNSo7tnL1QTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nbxb1bxA; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nbxb1bxA"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a0abca97c0so989816a91.1
        for <imx@lists.linux.dev>; Sat, 26 Sep 2026 12:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790450976; x=1791055776; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RII7KH71ddmT/n6y6BydIJU7a3otHfuo1n/mYhsl0VA=;
        b=Nbxb1bxAUyXRrrYdhlNPhFgBMWW8zcLTp9xzS2TNiLG5pfuG81VjqioJa12Qgc9gJL
         LUjuF7Y991eBPbbbwF1LL8O3PvKS04ZWwP1xwkjhWJskAw/IQF/EzaXD/WLsdKyQmX3h
         YXqbtxiuCB7bqyMYvBv8e2a0OmrvHiA4Nxce8soPgFBQol4zxKXWBRZXlcEq/F0EUrF9
         HadfN1y+R1mCAPVM5SEA2immHOa5y7ImygsH60er5bF0+hNpFpKR6T+3SNYJ2iBbCXvJ
         x20hY9boMzz798HTjMEB+PS298sc5Kug7PH1si6JmHAJBGrJBVlO4b5EJRiodHeoM6F7
         MMZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790450976; x=1791055776;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RII7KH71ddmT/n6y6BydIJU7a3otHfuo1n/mYhsl0VA=;
        b=AY6ENB9USIZn1om0/QPXAhLwujgbENSwHGAcfILMLFdyHkKY+cBTp97aUkdAaJ6rzy
         q59zly2W15fsq5bLfyEA5q2Xly8ug2NIZso3qxJO8jIfBuDoam6FiDDrtja46Fqh1iqA
         yq4mnU7f8gp7hPJ8yNz4O2GJqwJz91qbPtEVFiTOM7iUdPxFyIOnN8/OEs/5OltBrg+r
         youf4qNpZ7UWWy/nwxIAZ0b64Lhycb0axMBzcIdlDLFiKoOWXnPGAOOcAP7fwdqEgmGt
         5bR1dDeFSjWZ2pk7819tlUKpNCa6ARafxZTJPcN9FrqB61DEJ5ij6EvPmBtVOrdvFHWm
         JW/g==
X-Forwarded-Encrypted: i=1; AKwUvByz2a6QjugVF/HHbHNQ36udyInN+BHHVzKcFutEhAi/rPGWGydtYhEuFOPw2Fb2pldQFIU=@lists.linux.dev
X-Gm-Message-State: AFq9FYICyzcbMpp7lTI94wHEvGtBUuhqbRSI+pVZr77Xj5U8i87sopsG
	ShZegZVTgB0TicGThDNv7MhIkYnjjY8KtRlXNdfK9cN+ayBLYcFUuAle
X-Gm-Gg: AYBFou2Vq05kG4lUuPgtJY7/g9oupgMeaLkBz5VnamSylEB/m/82BZM6tElGcAxqWT2
	97vfv70TM4Sb+f6tMTlxmrhILjSclsidIkvpj4ffRBh0Kkf5nm/Z/WF1+HupEM9kFhzaweX7MWZ
	WIZp0D+tNntJtN5Rt8XGNnc0SEUJreMGzkkiTzh7o2DD0op5m4IZK4Ax/gHT8xwfrnr+kKznYTv
	orASuBsowNFQwBQ7kaFyNF8X5XO7YTtU+ZKENmCqv82WZuf3g06D9cWUlaTf9x00iVVV82vGZbf
	H+MvSmZiVD7SYoDZHl00VPafx7W4nxlJa5FpFBbUcjg3Jo2uHcfkMj988TRSbPb0wOl+6c/4Ugz
	yTQWm8LmnE9ftf5S4MyMUX66kw3RI7mHHEojxWIu34aekFcqSm3VZMiQEDH/nuHR1dRNrqzECCQ
	nHSfY8ooDLhodZlxnvM/+cxSa71CIHZhi49AvxZZyq28B1JPTbsXQLT6+U0zAckjNo2yI8h5umK
	zdTZuRRAQ6Fhm4xHceCOQAIM8AXgZjeS+UiRFjkV+Q=
X-Received: by 2002:a17:90a:e7d2:b0:3a0:eb54:2e60 with SMTP id 98e67ed59e1d1-3a0eb543751mr1574379a91.31.1790450976021;
        Sat, 26 Sep 2026 12:29:36 -0700 (PDT)
Received: from [192.168.11.3] (215.96.231.218.rev.ocx2915.net. [218.231.96.215])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0ba31f408sm3564492a91.3.2026.09.26.12.29.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 12:29:35 -0700 (PDT)
Message-ID: <df064f9e-ad54-43fb-9b25-9e2869506732@gmail.com>
Date: Sun, 27 Sep 2026 04:29:26 +0900
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Yoshifumi SHU <envzhu@gmail.com>
Subject: Re: [PATCH v2 00/14] ARM: deprecated platform removal
To: Linus Walleij <linusw@kernel.org>
Cc: arnd@kernel.org, Frank.Li@nxp.com, aaro.koskinen@iki.fi,
 alexander.sverdlin@siemens.com, alexandre.belloni@bootlin.com,
 alexandre.torgue@foss.st.com, andreas@kemnade.info, andrew@lunn.ch,
 arnd@arndb.de, claudiu.beznea@tuxon.dev, conor+dt@kernel.org,
 david@kernel.org, devicetree@vger.kernel.org, enelsonmoore@gmail.com,
 festevam@gmail.com, geert@linux-m68k.org, gregory.clement@bootlin.com,
 imx@lists.linux.dev, kernel@pengutronix.de, khilman@baylibre.com,
 kmehltretter@gmail.com, kristoffer.ericson@gmail.com, krzk@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux@armlinux.org.uk,
 liviu.dudau@arm.com, lpieralisi@kernel.org, mcoquelin.stm32@gmail.com,
 nicolas.ferre@microchip.com, npitre@baylibre.com, robert.jarzmik@free.fr,
 robh@kernel.org, rogerq@kernel.org, s.hauer@pengutronix.de,
 sebastian.hesselbarth@gmail.com, shawnguo@kernel.org, soc@lists.linux.dev,
 stefan@agner.ch, sudeep.holla@kernel.org, tony@atomide.com, vz@mleia.com,
 thehajime@gmail.com
References: <20260914140821.1805449-1-arnd@kernel.org>
 <17a74e90-27d1-4954-86a8-491267f00cb8@gmail.com>
 <CAD++jL=VJsnk-GzAvR4oR8oKJayQzq9Oes+ZW7K=iHGrQ1jh0w@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAD++jL=VJsnk-GzAvR4oR8oKJayQzq9Oes+ZW7K=iHGrQ1jh0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026/09/25 22:30, Linus Walleij wrote:
> All right, now we're talking! Could you test and review this patch:
> https://lore.kernel.org/linux-arm-kernel/20260910-arm-generic-irq-entry-v7-1-v3-1-5fd90f6859e1@kernel.org/

Thanks! I'll take a closer look at the patch and the discussion thread.

> I do avoid touching the v7m path and it worked last time I tested
> it  (on an STM32) but I'd like to see your take on it, AFAICT generic
> entry is not really possible (easily) on v7m because of the
> pendable service call mechanism but maybe we can think of a
> really complicated solution? ;)

I have experience wrestling with a PendSV-related problem in an RTOS kernel,
so I believe I can contribute to that part!

Best regards,
Yoshifumi SHU
