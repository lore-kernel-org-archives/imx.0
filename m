Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425D22F547A
	for <imx@lists.linux.dev>; Wed, 13 Aug 2025 11:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755084227; cv=none; b=SztGWwvy/H6xs4crvQKOFQKXOBSs7uFBJp1aZlcs7BNAaMZxzRmrSPoVV0KOVB0YPZLd8SPayCQ2VOGb9oTMywEKLTy3ASOZlkFCr6psAJfG46xSgyp29v6ZH5X5Q3LQdSGNvXYz5Y8GwRo269QKIvtUuGNfh/rtZomvukgVAuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755084227; c=relaxed/simple;
	bh=F6iNjiybXN5jpIdLHNT7Kv1VWLq9o4UbAXi7u0ZBlRk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ETfGBRw0a/jFJNEaSIXPgiOHfnOYlvQ3rhaQ+iO1yTWtyYTCEy1bXjpY3qLShd2dUHYyoV0rlFGO5g0JuNeXXKriSIlKFTeABRXTbuwaJN1fH0nwt4Gf5sLmu5mE9kXck3UknzMslwHq0UQFJilNXXO2l3hHLWuzUcQMxQNc2qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Usk/nNNd; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Usk/nNNd"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55b9855f671so875603e87.0
        for <imx@lists.linux.dev>; Wed, 13 Aug 2025 04:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755084224; x=1755689024; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6iNjiybXN5jpIdLHNT7Kv1VWLq9o4UbAXi7u0ZBlRk=;
        b=Usk/nNNddNyv2vb8+q2yzVciW3pCeeX/fjHlzVKpyz1uMxzsLwKyL12ImDgHkY245w
         aaJu4j0ghGRLX/e+w0crKF8i96tyO3bqg6CSsORGsu6IPcB/fPWCkRexHdsZCgBfelLC
         jLzgTpjSOCjzff0rWPZNgqvHhoo3XFVHg/3zaDPz7X4ffqwliwzxUMU9lfJ2fJiRCT3r
         OMau/fOPPpyuqkA8bEoVm9HcrYAPSvPTi+ISm7qmWCkGM+xb4oblIVfIFgGXqaVsVIld
         8jLWf4s5fD2CyUvllE2Axxd0qgj+aEIDtaEpNJMSd020L7OrjFoIxRhMF/y3S/WpztwM
         kY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755084224; x=1755689024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F6iNjiybXN5jpIdLHNT7Kv1VWLq9o4UbAXi7u0ZBlRk=;
        b=inQ6yjGKqnwdVNevDVe8PQSrIpLfpL8wqae4R1BeWtzJ01/L9blq35ULbJccYQf6jl
         ARkBH3UQtGdENChNC2f00BgWLiG+RUw/Hjm+6QmcwRKmDWaELDR0xgoiwn3tTK6B/7xc
         c+xPLvLr2JfRxp0pqJ794WulgEkyAlu36fO+bw8n40ulyXVLmMC+g3uWgR1ERyO+XYKb
         wCrJ411UiMgnwmsaOud7RqoX/o+Ubs+gAb9x0IkGcmTsIB/oWYDFKLkvb82OEYZjAUQy
         sZVJhCXmQ7zgDKAg48l8qFBAvOORHJ0w25mWzJq6KGSJD045HN9xorBLQPZAT1m9YfPl
         6RTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcJhejVCOg3c/VC+iVe8DoYcvxeEgoACheaWUp0vlZ1w1+FfYw++uVm6EKRgmkbJ2LOP8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxtoc+/AJ6LawvX+OHYPGrRJuZBm2NJJ0IjtXqKNyAE7hNPox1S
	/9Lqlu383LYf7I5EaXJuDj1j2l7YH0ceHBmFZO9S48fp+wb001efIBjnZpzTDBrNNku/V1lRpVA
	imtqe8OkwmkdpZ3hjQzSeG9pGTo/nN9Q=
X-Gm-Gg: ASbGnctuiRxnVBe2l4A72nloq5ie/8Lg+HYCxNO+woLa+OYakFC/SSn4DYsHgGqg1dN
	2Mh5ZfvqaOt/gUNprwjXhiena3MgXg1TCRFte6YukQqZ5OHYJDbvRvE7TGoNKEhq62YDYYh+Dmy
	8AdmWdsrv5m8drElZEBGK+86rH/Vcht/TeD/2qQHqda54C2A4SJwoHFe9ZE48uQniJFRBpoYQ6U
	axkkr93py4TS9h29Ib8
X-Google-Smtp-Source: AGHT+IFZaPNI23uD5KHPb/dAWadx5ONVsp4l8t3fYZlqnhk0xz2AahKAWju7F0kIKbXo7NQu56Q6kUJjybCLGKZeFW8=
X-Received: by 2002:a05:6512:1149:b0:550:e8b6:6996 with SMTP id
 2adb3069b0e04-55ce13f7406mr603858e87.2.1755084224054; Wed, 13 Aug 2025
 04:23:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1536a61b-b405-4762-9fb4-7e257f95e49e@gocontroll.com>
In-Reply-To: <1536a61b-b405-4762-9fb4-7e257f95e49e@gocontroll.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 13 Aug 2025 08:23:32 -0300
X-Gm-Features: Ac12FXxkf0FpQ3-QCxYS4XbBrV3yz9dhb7qIwsnTTE1WBvlxo9QXP7ql1oRWXhE
Message-ID: <CAOMZO5C3o+UaLRaXfB+sfmgB801mNTLztE_cy-e5duKDAL-1Hg@mail.gmail.com>
Subject: Re: Kernel Panic when trying to capture camera with ffmpeg on imx8mp
To: Maud Spierings <maudspierings@gocontroll.com>, Tim Harvey <tharvey@gateworks.com>
Cc: Laurent.pinchart@ideasonboard.com, mchehab@kernel.org, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-media@vger.kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Maud,

[Adding Tim]

On Wed, Aug 13, 2025 at 8:12=E2=80=AFAM Maud Spierings
<maudspierings@gocontroll.com> wrote:

> My devicetree setup is practically identical to the one in
> freescale/imx8mp-venice-gw74xx-imx219.dtso (different i2c bus and
> regulator gpio only)

You'll need to configure the camera pipeline using media-ctl commands.

Take a look at:
https://trac.gateworks.com/wiki/venice/multimedia#MediaControllerPipeline
