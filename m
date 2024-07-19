Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC2E8002A
	for <imx@lists.linux.dev>; Fri, 19 Jul 2024 08:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721379124; cv=none; b=logIcgm7XAe+Ctz+llVFdP4S/djuLOxdt/jf1XE2LXFpXxyEQLdFv9k+rcoKjaakoNGCfMQF77zRYZsyLPxmd5tDj66bhoRnQe1Lq2iDhNCjxjTiSZMGKNo3fOBclp4blle+ce+jpZxEDBSfWbTQVhGsRRpvjbV/f9we72MzXXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721379124; c=relaxed/simple;
	bh=r8oFgF9hsmNmGc0Nc9AK6CXg8ie6rgCUDmSyIstaJLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hrTiwE0JqebEEJpQePq8UPjgMbAQt2ToxgZ/p0deXVyG5fko3tBN3T0nyHuNjPvJRhw696kv0pwXRchEn7u7mRG54Z9v3wVOVQr/uBSJo2tuFFnsqk/sxs/uSddZpv4udtxuMdtCVfSXQqwpg5J0dJpI9Wti03DP1wYsQyJlFas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gimeYn7d; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gimeYn7d"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-36798779d75so589483f8f.3
        for <imx@lists.linux.dev>; Fri, 19 Jul 2024 01:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721379121; x=1721983921; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8oFgF9hsmNmGc0Nc9AK6CXg8ie6rgCUDmSyIstaJLA=;
        b=gimeYn7dAkMCRCnXx1F9UxqxuGzpB3QSLuxmdtStu0GFt/QPkOnKWdCYc4vFXh0p7x
         SYVbV4NKmI4jeqOvZjA+0JQE1TyqrUlEqTI5YmUztgsx8Jmjb9pOm8bRajAnJBoNLNFL
         TrKqspcSOzso5dx8LiXyFKSKIN9A59fBQayMhyDakb8I614iuNY+BISthRn0CN8bg4qA
         t51lbajhXud5F+pZvqYIVBrVzar7QheWKSN7WG35dUt1MDTouXQWcVU4aQNM5D5asYbt
         Bqyrq5BVkEyjzgqSXYI0RfDEIXHsgQJX36m7Zlla2zZyNiXjUukYeS0VzUtBKOiFyUqO
         Lwxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721379121; x=1721983921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r8oFgF9hsmNmGc0Nc9AK6CXg8ie6rgCUDmSyIstaJLA=;
        b=Pv5c4NS9O35QBl3b1n4DOtdp8tEPh961z2CnH/8RevO/eJvLjysfiQQ1XYpxjkkQku
         z0aaQ4Ab1OO7JKGmvaVr6cyw7XbC1j6UHhQYeM1oGWlhczlCBK1SJAu0scZxyT7uxav7
         N2vvZfw0L07QgkoBdp5zEdRCiDZ2ouKAPf8ECFNBXgZTzazb2bHP3qNM32Q8Uulebz/P
         /GnIcU9LdS+D38/S359lyUM7CYgfmN+H06qDNy4xMFdWvH+3Xzi/y/5+FKIp2LIXfuq3
         ALJ1BvyX7fMuOdQP6Jke2vbrvhhy1KXyIAwCeUxb2mEBokyhCHbCuHVtHQmDJ4yRMSl8
         Mzwg==
X-Forwarded-Encrypted: i=1; AJvYcCXvoLJC6w9HGWHXwLg+Ms8fEbEyyKsCyBT55ZOXX8LqWPv0CumWjjfOYrZE38FYJIWWt7BV4/8S99ZMXPwWDbPh4p+7
X-Gm-Message-State: AOJu0YzwyYfL1SvXHSE+Q0sSoV9tdnisSgmHEf+7EOm9u4l/YACx5yDW
	FI7jO4wVQKr5JXKHYUDaS6IHUB0WP8Pc6iy5esdVuRunIJvIyv9/6wsachCLWCjWS+v1V1JxDFU
	6g20Wi2wM6Jrw454aSFSlBMUC+gg=
X-Google-Smtp-Source: AGHT+IEv3qCK6lAidNklfBcgIVXCYYSmSxxXgW/Dm21GqZIiZZ5HailN4WXo1vsVLga8IxfI0D2fv7nNamOEy/sdeQs=
X-Received: by 2002:a05:6000:2c8:b0:367:9c46:198 with SMTP id
 ffacd0b85a97d-368315f1ef5mr6492142f8f.1.1721379120874; Fri, 19 Jul 2024
 01:52:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240719-imx_rproc-v2-0-10d0268c7eb1@nxp.com>
In-Reply-To: <20240719-imx_rproc-v2-0-10d0268c7eb1@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 19 Jul 2024 11:52:44 +0300
Message-ID: <CAEnQRZAh1P0i+Uj1+vrvZM4vVuxuYR9tN9FMm+khSSvwyz7hhA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] remoteproc: imx_rproc: various patches for misc
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, 
	Marek Vasut <marex@denx.de>, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>, Terry Lv <terry.lv@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 19, 2024 at 11:27=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.c=
om> wrote:
>
> This patchset is to upstream a few patches that in NXP downstream for
> quite sometime. For patches directly cherry-picked from NXP downstream,
> I keep the R-b tags.
>
> Patch 1 is a minor fix to DDR alias.
> Patch 2 was sent out before,
> https://patchwork.kernel.org/project/linux-remoteproc/patch/2022011103333=
3.403448-1-peng.fan@oss.nxp.com/#25144792
> this is just a resend
> Patch 3 is to avoid mu interrupt trigger earlier.
> Patch 4 is merge small area to support elf that has large section
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Neat and clean.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

Thanks Peng!
