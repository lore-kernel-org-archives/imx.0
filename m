Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA431D1E60
	for <imx@lists.linux.dev>; Mon,  7 Oct 2024 12:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728302859; cv=none; b=f6TuKmTUbDTh3uaWVmpRApF1Eoo3V/XhZqDHy9YYbN+zQHiK/dd6J+NCkmhzgGBbjlNa1d8AkGsDVvgk8DK2JUm/2CZcIKpoaBp/Caid34QEJ7XSKr1fLhSczDYaoppbWfabRQ9ILnm2sYIZng+DLjHiPFwY/VYHF0bMQCwdSvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728302859; c=relaxed/simple;
	bh=jJtK3/1jT6FQ4smG4wOvY5N7/OUFqcmBnVKtNz/UvoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CKessvWltBZeO1todrs5YFhXUB2hwOY3KaF47pDU4+WMoX0tVxq17sPz52JizllAee3sVBv88CqBV/j3BQ0YmtW5HuftYFMIia9GvaVgJ/S3GSysQqD53sQotgr2JpD8klkXIc8tVXD8uOsrtm/8WRq/dUGanttfF8dRw9qgK1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nDpso1Yh; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nDpso1Yh"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5366fd6fdf1so5768376e87.0
        for <imx@lists.linux.dev>; Mon, 07 Oct 2024 05:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728302856; x=1728907656; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJtK3/1jT6FQ4smG4wOvY5N7/OUFqcmBnVKtNz/UvoY=;
        b=nDpso1YhVH6rgb07UfB+aoy/Ni7Zxm5BWC/VhhE31tTzhTegirYvAJ72aDp8tCwcsq
         ++SDBC/NTuwuUKN2262V58HVWvyhi30QkgJCyGsXjGYE18mUuQMbUKnGyKphTY0lIOYh
         U5FKsOEMyviCR80aHtbG/qyIeNgfifqbxw23qdJAeHEUAHdDC19Y+wzTBrn5aZdUyO9i
         9cr0FhGIISCLQL6t0kRgg4NAe9R4DPr3G85ZZqin1oDHVQAhw3uOo3MCxJxrM7FZCzpM
         +zy/d+hdCWtEuy4iEGg6xTLEwsPDW1YhXb4+d5h99b/d9pJD9L/qF1T4bU3PNgiL3tGG
         8/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728302856; x=1728907656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jJtK3/1jT6FQ4smG4wOvY5N7/OUFqcmBnVKtNz/UvoY=;
        b=IOsLyZXQJ3Lpp6jYNJXkzwc6RBPvWrJhCKBBqOmt/vnY9Y79mEmzv2Lu044xUWdDGJ
         5TdoTrUFDx4ei7o/MuJJvE6OdaaeIDHVIWprmzK0KVyBptyL1cvRWakOWufnrnY7fP8R
         cays1/BwOKNwIbMgnRigw9b1h04tgP/AFsZYT/a0svR0MrC5Q4+hno6Qf0rO2ZgPieA4
         4zBfaUAuROkJCbRUsHgqNHbwirX/0tD1nDvr2blGHSCuSYkDk1zyPFuTDLl/VMmF+gUk
         YT37IDBjZV7TMl3Rzr1jLdsEwwwwq8LxhD+8lg5ehlaBpFTTqsBY1KKdxVOOZhantuL7
         msmw==
X-Forwarded-Encrypted: i=1; AJvYcCV5OkqJmFhkb8jEJsCVL43kBsvaNzy710ByslSMwvIa9UB3V91HRV9Jjw0fLcvEX/BSltI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxtZmNC68h+q8ta14/y7/DzgHsLAXN73CpaDZT1i7AqsRtRsz4L
	7bz7GKkupHl/0SS8/Yq6aRrfOlKCZ7DOyguD6HwCNwLqa4ALBU1+t6cUGfbBy2iIsrFwqYpjAEX
	nYFG9DHvMN+aPDh9OXK/IZu85uQ0=
X-Google-Smtp-Source: AGHT+IHv2V9vub5HIh9lhXIcbry1CPZSpVF/bne5Y3kiIxmSAE1tBTwFr3QA6iadU2EJq70+P647NMtgXwX8zocTlKY=
X-Received: by 2002:a05:6512:159a:b0:52c:d626:77aa with SMTP id
 2adb3069b0e04-539ab8c4e45mr5287290e87.58.1728302856091; Mon, 07 Oct 2024
 05:07:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZwOc4o2i-Wzp5QIV@mail.google.com>
In-Reply-To: <ZwOc4o2i-Wzp5QIV@mail.google.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 7 Oct 2024 09:07:24 -0300
Message-ID: <CAOMZO5CXm+d_2uXE+37SU8x0i-oU2ynj2PSfKF5WRAJxcGhqYw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: imx27: Fix redefinition of 'PC' in imx27 driver
To: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
Cc: aisheng.dong@nxp.com, shawnguo@kernel.org, ping.bai@nxp.com, 
	kernel@pengutronix.de, linus.walleij@linaro.org, Sascha@mail.google.com, 
	Hauer@mail.google.com, s.hauer@pengutronix.de, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paulo,

Thanks for your patch.

On Mon, Oct 7, 2024 at 5:33=E2=80=AFAM Paulo Miguel Almeida
<paulo.miguel.almeida.rodenas@gmail.com> wrote:
>
> The `PC` macro in `drivers/pinctrl/freescale/pinctrl-imx27.c` is
> clashing with an existing `PC` macro defined in
> `arch/mips/include/uapi/asm/ptrace.h`. This leads to a compilation
> error when building for MIPS architecture.
>
> Rename those to use a more specific prefix (`MX27_`) to avoid
> conflicts with other platform definitions.
>
> Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.c=
om>

Linus Walleij has already submitted a fix for this problem:
https://lore.kernel.org/linux-gpio/CAOMZO5DqwcM1U8FtybUHbHYZjLi-5BO6nGfifHX=
guKtcEY4DrA@mail.gmail.com/T/#t
