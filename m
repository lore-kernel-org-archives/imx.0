Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3272F83B5
	for <imx@lists.linux.dev>; Fri, 16 Oct 2026 08:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141086; cv=none; b=RA2/nyA07oVssKXYGzB/dq0YbcVU6GCNDpNXdLXxcS+4NTR3gWS1Q9nG/R6cBFStNq/3Wu1ctvR1hT5daSN52xLnv1DUwHBDoL7D/g+cCq8L/XF5cdYzqu/4RPO4EPYbAUX29FUS4yn1WF2D1d+n5XNrYaPovLdPUYEVXXBY3PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141086; c=relaxed/simple;
	bh=ddwXXS94V1hYrv1+iJwdR5Vr6S9+vc+haoqBYE6HjBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ES7fPOumjbVBo9JcyFA384J2f8dVkpV+x4E9hY0zUy1FERVw7jIFYmci2gNwSP7NU8QoijX7ckM/sptNEPenstHf+o5YVQNuaq22RyY7NpbPd3k134y0V0/jIuQIe70jHN8vYHP2it0CbuNZ8vWB2skeXL5krkrEM4PKtbcCIj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AyTEVUcn; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AyTEVUcn"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso24008775e9.3
        for <imx@lists.linux.dev>; Fri, 16 Oct 2026 01:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792141083; x=1792745883; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1iCpWI4gds7IUpWviVdywbLiMJoOXNKnvhlY7AZVvYE=;
        b=AyTEVUcnc3KijcjvdhbX93xnf86X0HtBmMz9zJMViHcKL7x1MPLFgEClZr/2o0AutM
         6UP4HaTRsSFoCH/o8sG1l5YfdcX91bRC1dY6aDxHHiNtsGhlry9LSFYtw/7PNcjeXGjg
         DK4FhNAje0hn7Njk3q/Dz2teSzOMNJcDLROuJ2MPtv3ZA76OsKVzh80hhI3n4NGauAkU
         2sDK288DHa4rMtY/Emmo+Yab+BbeErxBfM3LDnB4bsOfkmRXY6WUib8wr9iirNxFA5Ow
         ltYAXZCGd5qtWnZjU79FrCWAZ6Nzxhx0RlBjvUwozigPsQzpR9be7AU81a9BudVaz8KU
         DiIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141083; x=1792745883;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1iCpWI4gds7IUpWviVdywbLiMJoOXNKnvhlY7AZVvYE=;
        b=OLKGE1/eNm3x5TJ5vrSzKcA9kjhnldBjztwjLKWnTYePMb2B4eK5mFaR4Pb/u/wdDB
         kf4yDYmUQBiYFuiL6TdvIxzg6dqHL0f0pgc2mfN1IASwZpWB3GXCNw+bkpjoSvfTlH3A
         B6lyMtng044Bfntni9R9+h6hmxHXBcAbeTh5+whb1KYOHtBKv7X5mc3jzwXJURHRlCsJ
         J6hU7XcK4oEG2USD0OUvHMy84lDrc73Pi+CV3gpkhcSyNNqsrbVkXssUpr0zebUmgTRv
         WVQARZCBpyxL9Es8sRLjl/ef4UD5zfJpqiM50o619gGhGV1ahbn8LVGct9ay4KmOvzMh
         EPkA==
X-Forwarded-Encrypted: i=1; AKwUvBweNrp1mDGmJ8hiTI3xVimZ0stvCev4lzMxcbHzYasQANlapnmZBsBtr0A//O5LeNoYkAo=@lists.linux.dev
X-Gm-Message-State: AFq9FYIREr0Cgf38OOqfdL1K2bVew9tMpjxdbptfjEBREdzLU1peBMsZ
	Ba6f1hGkI8gehO8vBcmVer9FlZ7QMl5LS0QJpdZ1UqkddpAPAq1jTruJ
X-Gm-Gg: AYBFou0J3DIXjz3ZWP8uNwvuSQQUgop7K5AfaEVyAZBTw/6KhvBL/VHaPRIWddcQ4WF
	vOLlPmdphjukks9e3m742j7YDvtbnW5pOeg7TPXBZSqmHaSlLrwPKy6LV9zy2Wr8ncgSWpeFu7a
	X7mQcIDX+b4THrFxzSjvNTqtJw4siK4YDRBUzHVcj56PAmcX7DKxk9Wg61WOo2uPDJOphvm+nq8
	tNnCvdJn9/mOZweMcXjzkGUcwq8R7Q/5jpzu+KpGLjnCyr8WUBxu6EjtMa0YRObdnuLMlqZibGO
	ASmvAatSrWbh08G9TNZ8Eqbc9ZC7ZvO1FkPw50OQdyKy9wlQ8I8WFse9ZMeGgRR4v6AL4C8YO8q
	LxqlcybafqCmcd25PBxpJDlrY5S31xPdETPaLjZKnfX0LOOA+pnejTDqXtA+gKppDpjcqrHrTMh
	eGhjW6JyVkPwk0Js4YgxV5lXSIlA5ftZRawwRr/kKCwB74Q2BUy79reDum3/lXAo/r9RnwLiHse
	KDerTdN/waP4iTZpMjwQl5Ahk2k5TaN6p7sM3E4IPUluwRihxCy56IJm7pbSOnWytNBAg5SioMh
	v/q8uEjcQBRSLN7C06FZKq6ZtaMf
X-Received: by 2002:a05:600c:a01:b0:49f:ce72:e931 with SMTP id 5b1f17b1804b1-4a18e4fe3e1mr454263055e9.35.1792141082627;
        Fri, 16 Oct 2026 01:58:02 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ce32absm27971455e9.1.2026.10.16.01.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:58:02 -0700 (PDT)
Date: Fri, 16 Oct 2026 10:57:58 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org,
	conor+dt@kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH v1 1/2] arm64: dts: imx8mm-var-dart: Enable WM8904 DMIC
 input
Message-ID: <atHnFpMVpoumQ4UX@Lord-Beerus.station>
References: <cover.1792139809.git.stefano.r@variscite.com>
 <5309337578f99886c804c8e4ee82643574f1c19c.1792139809.git.stefano.r@variscite.com>
 <sashiko-outbox-174034@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-174034@kernel.org>

On Fri, Oct 16, 2026 at 08:49:52AM +0000, sashiko-bot@kernel.org wrote:
> 
> [Severity: Medium]
> Does this patch also need to update the simple-audio-card,routing array in
> the sound-wm8904 node?
> 
> Currently, the routing in arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
> still maps IN1L to "Microphone Jack":
> 
> 	sound-wm8904 {
> 		...
> 		simple-audio-card,routing =
> 			...
> 			"IN1L", "Microphone Jack",
> 			"IN1R", "Microphone Jack";
> 		...
> 	}
> 
> Exposing an onboard digital microphone (DMIC) as a "Microphone Jack" causes
> semantic confusion in ALSA userspace. Audio routing daemons like PulseAudio
> and PipeWire use widget names to distinguish between built-in microphones and
> external pluggable headsets.
> 
> Leaving the newly configured digital IN1L input tied to an external analog
> jack breaks userspace jack detection logic and presents incorrect routing
> options.
> 

“Microphone Jack” is the existing DAPM widget name; it does not select
analog operation or enable jack detection.
This board does not configure microphone jack detection through
simple-audio-card, so I do not see how retaining this name would cause
the reported userspace jack detection failure.

This patch adds the missing IN1L DMIC configuration.
The same configuration, including the existing widget name and routing,
is also used on the Variscite DART-MX91, DART-MX93 and DART-MX95.

A more descriptive widget name could be considered separately.
I would prefer to keep this patch focused on the missing DMIC property.

Stefano
