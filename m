Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4B35675F
	for <imx@lists.linux.dev>; Wed, 17 Apr 2024 06:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713335367; cv=none; b=pyDk/KfBWAUVkRkAHhPgEylyv073av4W7tUCJ7DS9W92KxCC1tZ9zVsaDVAcj5zUgu5CpVbUPKhAybhkTkIDJ++iWrOvuK1GD4vWKqSR4MddJr4ikPID1fNGwCEcVrK/h8qcj7i0n5FaNWj32wwZ/Ygr4+gwEaTt/qi1uG/Uf8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713335367; c=relaxed/simple;
	bh=zOuw1eJRYDZNmaVdVjGYIu581bMf2HS6hcsde8LTzaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZM3yd55n3a++5GJO4VXboccwB116WW9sR/BD3b6paaekABGDB9ocG6ItMi7L/lmKFAwSWryT6FS9GI/LhW1wQj8HW/E48d4ITaTiwR2EaekJ34aG5hCfyMu1IjmN9OIx0oMBKQ2jLnab72/FaDPojr5hNRXlWwlv4G55Qp9V0GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kHzb5i0M; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kHzb5i0M"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4348110e888so204491cf.1
        for <imx@lists.linux.dev>; Tue, 16 Apr 2024 23:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713335364; x=1713940164; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UyngQvsvNX4IVjE6EtxACZNPOHV77/T++2RB3m9+N3E=;
        b=kHzb5i0MSYo4sFmpUsLQFOS1IfDqb5oek465z6+q+Ji4rYHPCBhtea4dGjtvOpPdEn
         wnhel7wcDdRHfdbLgri2YOgxeA16ZVZe/YYX7+T/a/n2Y4fy7hmIG0g9WXq4uw5plJ/F
         3S0EDtR8aaer9ll0xAT/nU+DlMxyQDNhM/QSH6JOvkxQShJf22FKwiUxAv1VDmcqbgYo
         ShShcZ8lMJlFovT82uRtMLKpvcBO6Fp1C+bwMHQP5/6TLTT1f/95Vzx7JaWWvsxwsbfd
         aZICaDEAuefUqPLZDrOMe+TOqEm2DyKBK2knVaYxfCwxFYCJeKWTRaXu8sRFDljVLujo
         hCfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713335364; x=1713940164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UyngQvsvNX4IVjE6EtxACZNPOHV77/T++2RB3m9+N3E=;
        b=o08+lGn5AY2wu1KCdajw73H/V4nK95xqDZPa24TghXC1BL6BDAqnD0BUWfOv+66pIE
         CkE3+McpHSwAeEHf/hRwXVh5RqjeVT0Y/2sNxGoNhN58Lnu5Ab1nwITZse9/vWEL7fYe
         5RWw5JUuV1UXHJlNEJlOFNJonIONyzzTMB5S0KaRZ13tpmBB5I25cv1/6FC/CifpvMMr
         X9DF3fsO9gs2HJE5Qf8d0dCG69EwakbsyNS0WOb301g+qDMFmN2HaGw8rnwJlKoZji+R
         PXIONcWvVs4rAO4zj/uc+SUkTUqDm5aSnEyHAwpJ3z7P69AkTJJq/Hbyv6sSPa+++iLK
         YCCA==
X-Forwarded-Encrypted: i=1; AJvYcCX+UesYyNl8niHf0TXo3vGC6V4ZVSTkTDXmH87ry66sTp58wxiWMN30IBMP814LBl6Jq+hMddEQQfhUoXkY1hcoVxXf
X-Gm-Message-State: AOJu0YyESNutXDAzY1dQiu/KFf70SO9pgDTh1eV/gLH/j/CQDR+8knnm
	G8dxJyLHkJBX1T810y2t+FTeauGWfxc01zZhn7BRwyZWTfOLo+p6kfSiuLPFMT8bO69JRkj6NRl
	VnRKP8Hf6PdgGLSfum/ZFAhEhaJT3lSyJUcH2
X-Google-Smtp-Source: AGHT+IGHXQ5c36NdPnQ8e2OzYJ8YGPtp3VigSixmG1sd9NrQgjUSDxsXVn1v8tti2TbzQ+n3DGTVwYYT2xmvyD/Cdj8=
X-Received: by 2002:a05:622a:24f:b0:436:4015:1d82 with SMTP id
 c15-20020a05622a024f00b0043640151d82mr176693qtx.24.1713335364329; Tue, 16 Apr
 2024 23:29:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240411235623.1260061-1-saravanak@google.com>
 <20240411235623.1260061-3-saravanak@google.com> <CAL_JsqKRVVNzgQk6PETfJ9RrDuzT1CTjHWW02Twc_T4C82t__Q@mail.gmail.com>
 <Zhx9qqiymJdXwYQs@finisterre.sirena.org.uk>
In-Reply-To: <Zhx9qqiymJdXwYQs@finisterre.sirena.org.uk>
From: Saravana Kannan <saravanak@google.com>
Date: Tue, 16 Apr 2024 23:28:48 -0700
Message-ID: <CAGETcx97QjnjVR8Z5g0ndLHpK96hLd4aYSV=iEkKPNbNOccYmA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] of: dynamic: Fix overlayed devices not probing
 because of fw_devlink
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Herve Codina <herve.codina@bootlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Len Brown <lenb@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	kernel-team@android.com, Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 14, 2024 at 6:06=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Fri, Apr 12, 2024 at 07:54:32AM -0500, Rob Herring wrote:
> > On Thu, Apr 11, 2024 at 6:56=E2=80=AFPM Saravana Kannan <saravanak@goog=
le.com> wrote:
>
> > > +#define get_dev_from_fwnode(fwnode)    get_device((fwnode)->dev)
>
> > I think it is better to not have this wrapper. We want it to be clear
> > when we're acquiring a ref. I know get_device() does that, but I have
> > to look up what get_dev_from_fwnode() does exactly.
>
> Or perhaps calling it get_device_from_fwnode() would make it more
> obvious that it is a get_device() variant?

Ack, I'll do this in my next version. Right now I'm waiting for Herve
and Geert to confirm this series fixes their issues.

-Saravana
