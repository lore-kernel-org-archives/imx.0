Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB7C1DEFE2
	for <imx@lists.linux.dev>; Tue, 29 Oct 2024 11:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730200647; cv=none; b=Zrh1Fwfw1k600EPAoytyXo+fkdMgT81eLbgDF2bo9Qs7sRSFj7PZUYcXowTTlpGESEMRXYzQmXYhOdKNv8qmAXgvGAHoQ0JENKm/WktvF0wYWrYFV3G6J4qJVjamVsYOmLUzFioNDRNRzYDQzAwnNZ7GaiIcPU7XtECQAew4Uvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730200647; c=relaxed/simple;
	bh=0Y3lWwBLaNSuSrYHVXg8RSL1GdlpeH3OKXRkXftMX10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P0npFigs5M6w498p5TF9C5TdZtJvFaJ3DEXsyWwi1PnmU0Q2REiXbH5IIl91NwE3EWHTjyDUervSjv+w3N4dC+XDvRBlv6Eg8FOtt7FkS/ANyfVzKJ84MpItJP3vyG0njMUGpfK3N378ca0pxhH52k0dlH8+yK6EKlXXuXrFCW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z/GPS/q6; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z/GPS/q6"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fb518014b9so42977011fa.3
        for <imx@lists.linux.dev>; Tue, 29 Oct 2024 04:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730200644; x=1730805444; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Y3lWwBLaNSuSrYHVXg8RSL1GdlpeH3OKXRkXftMX10=;
        b=Z/GPS/q6LwGyRqM9xUx+8iFMl1kFNBxN8xX55O8cGVlE4RDcz2s3+C7zDeqkrsTdBK
         LIKfLjwU4dqpA1je2ooByYx/2T48fIaccQMlVvhD8a76NXXY6uX1s6yylDtFWwdd50rp
         C21J0lHsncxDB2Y9lqoC+WdwV44IxrqTpc5pJWgOXWcDHSV42+M3Y2+3U8DwjOSQdMKg
         GiEI1jDfRWJ3d96ncM7oHNuyX5msSSRJTEyyxU56tVZ+RZnnPvRU0QrbfQbsPXggWDde
         +PmebEDxFbpzk+a/J6vxBd29Ce+SSGnPLt8DYfQbrXQFSm04AJ+LQeRIWKrukqIQ1AOv
         VcLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730200644; x=1730805444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Y3lWwBLaNSuSrYHVXg8RSL1GdlpeH3OKXRkXftMX10=;
        b=fBmOQRYTEgkik22jnoMwDauUxKU83zgoYVjuIZm90mkeSPW5be31XLXh0znrMcsRMG
         2vkOBq5WArBv6utU5zkaRepPoVFBi4U+WgcdBYwOSVcKfohfM/KWLGgVbAqGmCKur13f
         j8gmw62WWtbNFjaOB1J/RZO+hD/9zeYkXY49vOcuGpWJqE3re6rQmVO6gAEndlT38NM9
         suNz+qjku8I7i/6CnoIjHEGiXEn3QOWb+1ZIxV3VoRWwegL+DN0/D+fvOty+mfRrZVDt
         tfu/E7NANxcGR7gfoYiyeF8+lCiUfGLy5JxSmUUEn6aF8g1wfjgl8Dfrx5unMoDofDG3
         pyTw==
X-Forwarded-Encrypted: i=1; AJvYcCUCH6tXDLpSe+yfW0PraGr+4AeYh2hyYC9V+inb4i799lVA7csOLFfrPRCFlUWsue5lI6s=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+PzJQEmm7xLwfq/wKacyA5Zp/fZtXUQ1tmks6jE6fanOVMNAS
	2nG8XrK+2fIdlU2cYDQqYrs200BucS86GlAIG8qTQa35KjtdI4u9eqHc6vOyDSLsQ8PsPnyDSLb
	LKrjUXptS8zNAp0pjkI3Ydm+KTO0=
X-Google-Smtp-Source: AGHT+IGsU6uHMBv+O6e4BbQ7UJDSfYHHZAkZqCwn67mMrBXMiocwqn/285jyQOio3gIiF1T/G3/0V4DT4isdy5AAHHY=
X-Received: by 2002:a2e:f12:0:b0:2fa:dc24:a346 with SMTP id
 38308e7fff4ca-2fcbdfbab66mr39852531fa.21.1730200643976; Tue, 29 Oct 2024
 04:17:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241028180844.154349-1-festevam@gmail.com> <20241028180844.154349-2-festevam@gmail.com>
 <20241028194728.0655edd3@akair> <CAOMZO5APJM57_ixBiRFZSZex3AiawA=mtqMszdGezVoajaXYhA@mail.gmail.com>
 <4addc413-dd13-4867-8c49-45539af7b45b@pengutronix.de>
In-Reply-To: <4addc413-dd13-4867-8c49-45539af7b45b@pengutronix.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 29 Oct 2024 08:17:11 -0300
Message-ID: <CAOMZO5Bu5U=MGq3gzOjaeWuhnowJ-TN=ktCtw_eXDO2Q6Kxbmw@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: imx6sx: Remove fsl,imx6sx-lcdif fallback
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Andreas Kemnade <andreas@kemnade.info>, shawnguo@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Fabio Estevam <festevam@denx.de>, Marek Vasut <marex@denx.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ahmad,

On Tue, Oct 29, 2024 at 6:50=E2=80=AFAM Ahmad Fatoum <a.fatoum@pengutronix.=
de> wrote:

> With an eye towards improving device tree stability, I think it's more
> appropriate to adjust the binding to have three compatibles instead.

Yes, this makes sense. I will adjust the bindings accordingly.

Thanks
