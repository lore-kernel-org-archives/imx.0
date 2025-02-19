Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836141F868F
	for <imx@lists.linux.dev>; Wed, 19 Feb 2025 08:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739954830; cv=none; b=TiOX/Xg9N46VOw8b8OLS1yiXa2j3ZT2IXa3L2BBjG0hzruLgAF5nEyaIiobPxgx09FW2yCTq3aT3UsL/WHfL2cPsljAzYVS8wykYmaXaXdJS9kop5o8mvq3qtW2iHuz7hxykRsATj6PkN8N+7gu+hxqaUB5Kq3XVv09IHXOkpNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739954830; c=relaxed/simple;
	bh=AgIkmTOMFIiQ/yYf+qwHjFoT+UCJ7JkbheTv56rMQVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O+1d4DczCFbNOvM7eKpPSMtPnXFIfhqYzSHgBmqHk0Al0sM9pT6LpG3tTnAGiuVFTyMX35S/e1rxRNbFL3CiQvjFfMStBNFudHzcZDGzu04Vkt6yqRn/POuduOtBxywNIMLHM1iz1r30yqz9hStOyiD9SGu+639F2C/5sfpCQHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TM9CuE7l; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TM9CuE7l"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2fc3fa00323so8365309a91.3
        for <imx@lists.linux.dev>; Wed, 19 Feb 2025 00:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739954828; x=1740559628; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Lm6ot2bmZKY4yplCPn3FScSqX5mEiwAZVgVtm575nD8=;
        b=TM9CuE7lESF7wG7fo48c3nP2ANDK2yJG2+zPsXvkIWnsyWthDIghd+45eZSJwBkZKN
         v83kLPandf7/la1JyfvuiKdfBdTsxC1wmrsfT0TDXxPC1t2blmxaKNXwFgAMcQ66SD8p
         inlrggjw1RMn+vbBPu8c6+ZFsBFFWpPmirrQ1PXeYrwBqRoQQke/AQHbHSHTwwjAvrtm
         cATEna6zAkoNIKPzz/CslHnve5m0/3xjzpjGKS+ZF82dV5iYgHqeh2mn3T0GrpJDxLLR
         aZ4EzYRlp59m0riknchTTSaZQFhWY7HBQU3p0cqQ0k2741wkM89iOAcH2lQJg1q4CE3P
         htqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739954828; x=1740559628;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lm6ot2bmZKY4yplCPn3FScSqX5mEiwAZVgVtm575nD8=;
        b=XiH5v5mFhaMvgpqRvSAFo4umZKZsBhcSaIHgjPMjfwJY/QHIvfxDTnDEuovshXuxj2
         b7l3RycDfW4nwGq10FJ7riptVkZ/fY8cWcwHiqX7FIz922RxobhAu8GApPmmDxRk9LZx
         1PQlfYg4KJn9LM/Zlc7FNXqux0rLesuyO8HL3xUjs/h1XqMtGrCiqz87FFcAxzkiZkTn
         t6+6bhj1aK4qWeDywFFKZ86EOPz68NpzjC323C/knVqvNCSbASJ4+KkJTwe2EIeV8/3/
         nl2gIP3zkhWHUxm+bY6eVjknGhIn64Wm3BmZCEdfwd6F8e8x3T/4Ilzs1NpvRlA/2fd1
         RGlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgSgYkVZckMOdLG81eRPN2lGCox8J//6XAgsOWzA24okXvFNKqNjuY8zAoJ6tX5VofUQs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4Nt6Du977rNmanVpnxm2x3qbAl7QXxTOtaHrDxpiRL4ArC/nN
	VchEyj/aikQnX30Noy8ZxDii4XWNUkWKWdt/rvxaOM/EHpV2c2s0ckW/72vaoXXvWG0SbpBgnf7
	mL3jfxPg4ujynZpU5TBKW3xQF0hHtpFE125o=
X-Gm-Gg: ASbGncsdFnOJxlmoKSAr3aN2ie56qQF1oHO5XRAjB9BY9YSYFHnFFISjCvLcaI7kg97
	cpVgJowkrjocdXDC97agi25QVRYhh6Ilx1UKTck276RlKDWiXTkZrmVSjffD3hWPOma9HcYo57l
	GHJwFIdcbh0flFJbIOz3BXDJCeMHYQ1zA=
X-Google-Smtp-Source: AGHT+IG+metsRNLMCZZs47flBptl1mN2HTXJMmlH3rhFkejJqD6kI7GKh4odcp79LiYNjAbxr0qV1WFbSYqoQepjiGU=
X-Received: by 2002:a17:90a:ea17:b0:2fa:d95:4501 with SMTP id
 98e67ed59e1d1-2fc40f21c67mr30436208a91.18.1739954827668; Wed, 19 Feb 2025
 00:47:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250218085712.66690-1-daniel.baluta@nxp.com> <20250218085712.66690-6-daniel.baluta@nxp.com>
 <50c7055a676fb7f1bf27cb33a914df641c56dd15.camel@pengutronix.de>
In-Reply-To: <50c7055a676fb7f1bf27cb33a914df641c56dd15.camel@pengutronix.de>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 19 Feb 2025 10:46:55 +0200
X-Gm-Features: AWEUYZlhtQ6N4279fN6OqZAxKAvbZZ0SsWRbMIXuyMNnTZ9yjwFgBR8L58MeFwg
Message-ID: <CAEnQRZCSL2ieQQFoHHpRwR5XfErZCm8nDMpr6rBVBWXiFKbm1A@mail.gmail.com>
Subject: Re: [PATCH 5/5] imx_dsp_rproc: Use reset controller API to control
 the DSP
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, shawnguo@kernel.org, mathieu.poirier@linaro.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, andersson@kernel.org, 
	linux-remoteproc@vger.kernel.org, iuliana.prodan@nxp.com, 
	laurentiu.mihalcea@nxp.com, shengjiu.wang@nxp.com, Frank.Li@nxp.com, 
	krzk@kernel.org
Content-Type: text/plain; charset="UTF-8"

> > +     case IMX_RPROC_RESET_CONTROLLER:
> > +             priv->reset = devm_reset_control_get_optional_exclusive(dev, NULL);
>
> Is this optional on purpose? There is no mention of it in the commit
> message. Where is this resets property documented in the dt-bindings?

For this particular case on imx8mp the reset control shouldn't be optional
because the DSP won't really start without it.

I was thinking for future boards that might have a reset but which is
is not mandatory.

Will document the resets in v2.
