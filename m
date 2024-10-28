Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BFE3A1DB
	for <imx@lists.linux.dev>; Mon, 28 Oct 2024 19:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730144912; cv=none; b=uU8VaI8o/M/XEfTlpNQz1J2yUQhuSpaBl7SQlNqdXSRVP/ed5h8cpnRm9FQNCG9Rn9KCtqnolx/AwP56h3qmBHKPK4BVPE+JWu4VIMrJRUWcNrJ3SQWi2K7BfPgGiMRD8OJ8rZ62rgb2Yo69ppBxp/FFx2J0h2DAW91AOODhdEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730144912; c=relaxed/simple;
	bh=7xLNu9FrVeKEDKB+XHpFWkkAlgiJSL8q8QyE+irsgoU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cKHgJIBwd1KYwHRiaVPkkaNLS3j8Xqh6peKp8xeYJ3dqeQKl2GSoKTFnGOvOXjdbRS1FTlIMRK4owplpy3ZRumHpHWeMy6TZ0s8RXwU9P9G3duKpFZlWrdJcMgp161xT5MpM0MZAdY07uxYvnFRiPLXCJUDWGhKb++sruANs8ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WNVQFXhb; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WNVQFXhb"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb5111747cso43113821fa.2
        for <imx@lists.linux.dev>; Mon, 28 Oct 2024 12:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730144908; x=1730749708; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/kvSrQqqbLNQTUVRHoadSzM2dB0+MrpOREbt1fRDUeo=;
        b=WNVQFXhbTe5idftNhkZo+fzPNZCLITqaZY2fIcuvgi8/h+bPGq6WCCDzphDUAR0FYc
         8ScnidJvXD99JUp0mtHM2iIIKdno43VLu9fcsF7MfiPHym5kyMMnz2mDQ+fPjW74hxL6
         PEmFCamIpUmW1XrWdfwQqXCeiOFOJVuasyIGxLk+CJA/mzaYbxSEIZiE/1MFpLZjJW/j
         3TC452ZXVGILBcJ+noeLtOclJDkDz2fyxRpbt2HaMRd99L+pE7D8VSNmliD5mLOTJhCy
         mEiy8Sng5ZaA8Hk1RHaLb59/y6fL7iNBftxvSqfGn7KnfRfR8T7O1hQ4tintOQp1lqA+
         gVZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730144908; x=1730749708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/kvSrQqqbLNQTUVRHoadSzM2dB0+MrpOREbt1fRDUeo=;
        b=BERzsKDSna70/1M2Z3B2mesrdNIcc4cGD/lv9/TG5U2Css9L31XCoJK5mwgODfztA/
         HuKaFknEr5p1JC1C6qHaAry+OAdaytDfbLGuLJ7rzvGteztVA1QKuZpXW7QiRjMKz4CO
         XxvNVIUICJpVKgtktJ74eLVhkZNWP7LI2wVqW5SWCPb6IHbgYOLrk9L/Vfgl88dNH0K9
         XBRr2NNs/SMEL56Ov3rOK6MipaREwU3pHxmx0cvxJdwsQT0ODG8tacx2asLNkHm+u65U
         wnaz5xDO0Xjgogdu6cvNeyGWO0+2fMSnFaTXmBKv+Wyr1Ne1HCHPk0ecmnUX1wRC0tu5
         dtww==
X-Forwarded-Encrypted: i=1; AJvYcCUSm3x2EI9jqiM3UIuhGkdkCyt+qwcWFNIqmkkkxLeuFvshdSt6U9cJ2S3G+Q3rnIvZSgs=@lists.linux.dev
X-Gm-Message-State: AOJu0YwWSiRrB7IeO7r2Hurh/1gfLu7SdUM3S+tRZKW3gy/dQCNq23pL
	jgaptaGSWMooOpE9N2VV+6f7xZK5Dwp7LdjU6iW7VW0CvpB9RaPtkwrtlheENfp/eIPCUxo0lHk
	LmWo+JOJxQH9DVE+Fej9xpJyUsCA=
X-Google-Smtp-Source: AGHT+IELGhB95rG+9fE7ziAngeTj3KV9sBRB/cO1X2UqxH738DKa/nlaAv3YXumbQYQm4kl2IZm04mlWo9msT3Gf+zU=
X-Received: by 2002:a05:651c:2115:b0:2ef:2490:46fb with SMTP id
 38308e7fff4ca-2fcbe08973dmr38305511fa.37.1730144908053; Mon, 28 Oct 2024
 12:48:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241028180844.154349-1-festevam@gmail.com> <20241028180844.154349-2-festevam@gmail.com>
 <20241028194728.0655edd3@akair>
In-Reply-To: <20241028194728.0655edd3@akair>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 28 Oct 2024 16:48:16 -0300
Message-ID: <CAOMZO5APJM57_ixBiRFZSZex3AiawA=mtqMszdGezVoajaXYhA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: imx6sx: Remove fsl,imx6sx-lcdif fallback
To: Andreas Kemnade <andreas@kemnade.info>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andreas,

On Mon, Oct 28, 2024 at 3:47=E2=80=AFPM Andreas Kemnade <andreas@kemnade.in=
fo> wrote:

> As the devicetree might also be used with other software (e.g. u-boot),
> this might break something.  So if u-boot (or any other software) does
> work with fsl,imx28-lcdif because it only uses a subset of features of
> fsl,imx6sx, it might be worth changing the binding instead.
>
> Same for Patch 1. But I cannot test that and do not have a strong
> opinion here.

U-Boot would not be broken after these series:

https://source.denx.de/u-boot/u-boot/-/blob/master/drivers/video/mxsfb.c?re=
f_type=3Dheads#L388
