Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802181ACEA9
	for <imx@lists.linux.dev>; Wed, 18 Dec 2024 12:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734526796; cv=none; b=RIpAFIMSIM7mWKc/TgptYzyLUCyV1G0r9sUMy5zIEZ/3bRUBZSUWj9A5DKSrExdb2PO+mxig3A9zqSASLmrdNHRpI1pGFST8WAjAZNCcRxmQVMgCfzSB+KIUHXETMC1cwLYFvQtInSP66vLeFVzPfMjFfwyzDhxiSV/+9Myeelc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734526796; c=relaxed/simple;
	bh=/qWCv9pXBNXlSLTUOgXh7xlzBdgLrJ6tkCgRkmuCAqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BCJ84Eqa2djSeUlyRwnY8o9ZsQ8AAbCY5+BiFUO4TBIp8EAItoX5N76Kx8uC3Ap8qOyTxn3kvaZma8Af8PC3v8VcGY8X1RbKHjM4wu5ISa07tdBRVU4tSwVGCY3qpRi49rx7m8U0Scih/mucR1OioUQ/wCzu50adu/SIbenXxJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bqvPn6CK; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bqvPn6CK"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-8019338c2b2so4159592a12.3
        for <imx@lists.linux.dev>; Wed, 18 Dec 2024 04:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734526795; x=1735131595; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/qWCv9pXBNXlSLTUOgXh7xlzBdgLrJ6tkCgRkmuCAqU=;
        b=bqvPn6CKZnsce+DEux1dJwAKDhjM4Owc84YjqOXEBVseuM1kOTtHpXiSFddsLjrsiy
         WElIUFZPlT4jzxa/Rh8fBElyoaYebdZ0xkw7JjHq/vdnZz9DNQxiTEujO4vbyFWLsP54
         iC3aguPFuzbqIx0hcmXxqdsHEkhS4QsDL6tr0K4N4hkD5Bu5dCl7vl3qQYuoCba+D59P
         xQCbZez4t8oQYYVsN2tilWKOq0fE3gr6IFXINxXExT6uDbNCax0XsQvmgcGOB6/gziYC
         pBSzyHeA4joCgrvuJHlZkFKc/nKV99loyKPMyHOFrooWvP8ENghpwNXF7rUlgJsWxK8O
         UU/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734526795; x=1735131595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/qWCv9pXBNXlSLTUOgXh7xlzBdgLrJ6tkCgRkmuCAqU=;
        b=mPZd3DuPH368/nd5tiqQt8EDijaO4lcHPEIYzVzke3J+s/dTEudFRUeOI0vA1gZN+G
         MYb5JvcSn9URAVCyYszzu4k9/y17FcjgjLmBFN2c1nymzrr/i9zLBaTQn0O7EmGg/R5s
         B52lAicTZso9XIQ40Ns2Ojofp6f+mo+JRAFi0TBJg1O5+pIV/F69AYaZqIh5ave3/YHJ
         z63dXSZ/h0emPl8pM1yTzS2lZC/1EcvMI9727UgjGWJEeeSgdJ6+jt1Lpg9pMNa3tKHk
         Teje+l7mWK3xaoSUpvXMtj7Xze5EUnuuxSdcePSMrsdYOqB5Uy1D5e4uXx66UTPvVAmA
         vHyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSd94PPKeX9t1wxDKjdQQOr1KS0OSKg/if7SgepizFhk/D8AkyLzGiyV2HSwZH6uw54as=@lists.linux.dev
X-Gm-Message-State: AOJu0YxsGFPv+hur6ecRjecI4vCso7PTZLZrbOI3iKOGnJdkqNjAG7zU
	NXkKWP6COz0GFLtuPCzGWi+zzB2jEBduytv/mZnMfbQ6eDn6L/+ODwiR8juxivH8fizKEoHslZ6
	g2djYhrTy1llEb/udi0fZjkH4nt0=
X-Gm-Gg: ASbGncvd3P06cNZ8p4MfL+js78mC85I4+yfMVb/9lTbC4QrC/MLvlMvzONBYvZ7jOqc
	tlvod/ueOcPaiWNBZhKg1lcX4+qay5PTUpA==
X-Google-Smtp-Source: AGHT+IHrwBpS6CcQxAZmukcsGo476EQmoqWM2slhHPAXzThtNb2IK1NBH/tbUgYtw/82HwemO/owjrylht1ANbiMZYg=
X-Received: by 2002:a17:90b:380e:b0:2ee:f22a:61dd with SMTP id
 98e67ed59e1d1-2f2e9374547mr3475436a91.32.1734526794842; Wed, 18 Dec 2024
 04:59:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241113195240.3699-1-laurentiumihalcea111@gmail.com>
 <20241113195240.3699-5-laurentiumihalcea111@gmail.com> <ZzUJQCeWclsrr/lr@lizhi-Precision-Tower-5810>
 <c47710a5-7e53-48b1-bd6b-c0123865aee5@gmail.com> <Z1r9hWH1ioR5vI5H@lizhi-Precision-Tower-5810>
 <c3c9389f-5116-4a5f-99f6-1b37c1e8c457@gmail.com>
In-Reply-To: <c3c9389f-5116-4a5f-99f6-1b37c1e8c457@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 18 Dec 2024 15:01:11 +0200
Message-ID: <CAEnQRZArKSOtka46A_SOiV2=8bs9B36ubAJM3GqYJZkKyBt_4A@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] ASoC: SOF: imx: add driver for imx95
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Frank Li <Frank.li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Takashi Iwai <tiwai@suse.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Jaroslav Kysela <perex@perex.cz>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> >>> Frank
> >> the SOF drivers do indeed have some similarities, but each of them has=
 their own quirks which IMO makes it a bit harder to add the 95 support. We=
 need to figure out the common parts and then move them to imx-common, but =
I believe this can be solved incrementally.
> > You should create common part firstly, then implement equal function wi=
th
> > existed part. Finially add imx95 part.
> >
> > Frank
>
> Yes, I'm aware of how this _should_ be done, but, like I mentioned, the c=
hange is not trivial and will
> require tweaking the other drivers as well. As such, I'd like to get the =
95 support in as-is firstly.
>
> Are there any other thoughts on this?

Laurentiu, Frank please trim the emails and keep only the relevant
part for discussion.

As for this matter I think we should go with the current version Laurentiu =
sent.

It is inline with the implementation for imx8qxp, imx8qm, imx8mp and
imx8ulp which we already have upstream.

There is always space for refactorization and improvements. The
current version of the code
is simple enough to go in as it is.

With this,

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

thanks,
Daniel.
