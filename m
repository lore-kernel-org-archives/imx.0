Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B096713B2B0
	for <imx@lists.linux.dev>; Mon, 15 Jul 2024 08:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721031771; cv=none; b=XDCUko5jemsIJWNTe+YPel2gG1BetUO+cb8+2J9dTsyVGimsyCjd8XK7nZKTX+g1ojXE4h5EJLUZ9tDFuZNM3Nsspp9kjFUXs6Z/vr4l/uICjaO1k2aHES71JTPahPExfQps/gLehEZbBUnJzNBAJk1P/BfqbKrE0MY5L6OGvCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721031771; c=relaxed/simple;
	bh=L36mM9kQrS9p/p4Y6qIxqqLG5IWaYsdwHYYb7f0HXRQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H3RXeMHbtKFkYy3ciIc6IwpnaJthPoWc1xR3Bz2RFOf/dt1/r6wGiT+Ulc7X0DcRfkPl9atck3rTZ4pzcu030FoEEdactinTU5rjR7r5yvgHpL/HObagjT1reumxw5qaATt1LnTYlJl3sfA9aQjCvwAhJI/W8C6xvvXcXcmdJE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QqnMKwgl; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QqnMKwgl"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-58b0dddab8cso6284012a12.0
        for <imx@lists.linux.dev>; Mon, 15 Jul 2024 01:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1721031768; x=1721636568; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UxvuVs2RYdJvTG90vVQNL3KW5LdM1oQjpCuXib7OYPg=;
        b=QqnMKwgl/b3hUWR/rFrtfhkEP5MMRRpU3xObZ2KshWahN5OouX6zVHhmZaJBqQojIo
         Cbx2iDbq77vAdZErH0Pt5AezCG4HTT5XfPb2eQXmQLDz3OneTUzbgZwo9qU0w/0r3K3a
         1Z6Ptwb9HlbJI3K/QmyNg2I25IIt03d+gQ62o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721031768; x=1721636568;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UxvuVs2RYdJvTG90vVQNL3KW5LdM1oQjpCuXib7OYPg=;
        b=C+sFQ+Eox0e3WPiD4nAEAqjVGjHcM8kwaWhxbFExcQbELnV7DJus42uZ6rIcETc+Cj
         xaMEJ6p09vXT6g6K6O8KFI/Y149M0St5KE316XqHniRxK+UowbnbH7M78EVIxlvnH79W
         EQHG3du36psVKmmSLBZSh6HNMm93f8peyXqci1O/hhqbHizwk0W3msHWZhHhtB6FMbXJ
         ASTNJeYmET3bI6Nbw91Dj4stJUXzlbHlYUhZkV7ojZNJ8ZG2vMFX3x2mRM9Il9iw+dZR
         TnFZ/71WXUrLnT4WTq3xCqN8qX5fW6B4jvzRy3hSCioFrxgLKVL9yo7DE4Awxv212qDx
         esrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkLMqPAAMX5XYZNxRcsT5gJZAJRy1OzT+2lsu/zKtMqHQYCx4fQnUuAJ3pc+zqhkK5FsD0pVjxu9C95b3wt3obg2vh
X-Gm-Message-State: AOJu0Yx2DmEbx+Lh9uBZTVul4WpV19LIT+jt7jhs0cy93hJ2lEw8fjni
	gr2Q5ozU4JtlCARmSNDcK/nfjjB48v/jC9VLccu4af1lk/AGVeSTwU89x6bjrnH/li6Ww97iWgF
	YTw==
X-Google-Smtp-Source: AGHT+IGG1o5SCdelgPzwUcpQFQNPHbfXD6KRrX3fYUFkVkuh57Pd0En0tqL/iFG5fZHdjGYKA15G+w==
X-Received: by 2002:a17:906:2481:b0:a75:3f38:e0a4 with SMTP id a640c23a62f3a-a780b881c56mr1172676266b.47.1721031767885;
        Mon, 15 Jul 2024 01:22:47 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc5a3a52sm196751166b.12.2024.07.15.01.22.46
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jul 2024 01:22:46 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a6265d3ba8fso443398666b.0
        for <imx@lists.linux.dev>; Mon, 15 Jul 2024 01:22:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXMmuUbQaj7xQ2dassUbBQkNU6WfKeA6eUNdd6D2Txo4bGd6w9d3/O2a8tmljtdV6uuYvtuhlOrjI2iIWgkdK3WoaRS
X-Received: by 2002:a17:906:46c9:b0:a77:e2b2:8ec with SMTP id
 a640c23a62f3a-a780b68899dmr1183961966b.3.1721031766301; Mon, 15 Jul 2024
 01:22:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240628-gcc5-v1-1-7cd56f04a6a8@chromium.org> <7dbda1952c9e873823d4e6d2a9534f1b3b945c4a.camel@pengutronix.de>
In-Reply-To: <7dbda1952c9e873823d4e6d2a9534f1b3b945c4a.camel@pengutronix.de>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Jul 2024 10:22:34 +0200
X-Gmail-Original-Message-ID: <CANiDSCvfamZjwOohT8ZFOr-m2SB=r-MCsrXGHtkfEkeYyEo2Nw@mail.gmail.com>
Message-ID: <CANiDSCvfamZjwOohT8ZFOr-m2SB=r-MCsrXGHtkfEkeYyEo2Nw@mail.gmail.com>
Subject: Re: [PATCH] media: imx-pxp: Rewrite coeff expression
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"

Hi Philipp


On Mon, 1 Jul 2024 at 11:30, Philipp Zabel <p.zabel@pengutronix.de> wrote:
>
> On Fr, 2024-06-28 at 15:11 +0000, Ricardo Ribalda wrote:
> > GCC5 cannot figure out that the expressions are constant, and that
> > triggers a build failure. Rewrite the expressions.
> >
> > The following gcc5 error is workaround:
> >
> >  #define BM_PXP_CSC1_COEF0_YCBCR_MODE 0x80000000
> >                                       ^
> >     BM_PXP_CSC1_COEF0_YCBCR_MODE |
> >     ^
> >  #define BM_PXP_CSC1_COEF0_YCBCR_MODE 0x80000000
> >                                       ^
> >
> > drivers/media/platform/nxp/imx-pxp.c: In function 'pxp_setup_csc':
> > drivers/media/platform/nxp/imx-pxp.h:582:38: error: initializer element is not constant
> > drivers/media/platform/nxp/imx-pxp.c:374:4: note: in expansion of macro 'BM_PXP_CSC1_COEF0_YCBCR_MODE'
> > drivers/media/platform/nxp/imx-pxp.h:582:38: note: (near initialization for 'csc1_coef_bt601_lim[0]')
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> Can you elaborate on how this is triggered?

Building the driver with
https://cdn.kernel.org/pub/tools/crosstool/files/bin/x86_64/5.5.0/

It might be easier to repro with:

ribalda@denia:~/work/linux$ podman run --pids-limit=-1 --rm -it -v
.:/workdir  registry.freedesktop.org/linux-media/media-ci/build-ancient
# cd /workdir
# CROSS_COMPILE=x86_64-linux- make allyesconfig
# scripts/config -d MITIGATION_RETPOLINE
# CROSS_COMPILE=x86_64-linux- make olddefconfig
# CROSS_COMPILE=x86_64-linux- make drivers/media/platform/nxp/


>
> At least I couldn't reproduce this by just copy & pasting the
> csc1_coef_bt601_lim initializer and the required macros into gcc 5.4 on
> godbolt.
>
> Can this be fixed by using GENMASK / FIELD_PREP instead?

I was looking to make the change as simple as possible :)

>
> regards
> Philipp



-- 
Ricardo Ribalda
