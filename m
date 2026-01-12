Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1107D296BDB
	for <imx@lists.linux.dev>; Mon, 12 Jan 2026 15:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768230996; cv=none; b=sCUEPW1YYc6MiTEvvtI5MpW/8LDB2xXw0K8KSCncMHu1xPE5OArTrm+Mxnn1NzzBRh6iMQU+MllwjJ/6afZ/aEPS2S48wiD02g8fLdcQdOBxbl6EcVqpThYh9mGFvQAjxIsOhqjLJGv/IQZcmbF2XEV0W16vKx9p1yLY0/2i9vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768230996; c=relaxed/simple;
	bh=fZlUD5xt/Oc8vtyWy3eYw8xb/B+jFgzZv9qyjWg7ggg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G/O3jMR5zQkzKjvhK2C4XBAloqFF4Hflh5IOv4NlrSq68M6AUBIZaBGXXkfYuAU6+wdBI4M24u9q/VGnERsqrXD0U2D7ZRCjivPdFhPXz0dnwcJnh1rrrWQX7nvad/XR96d/pzhYvD0ECFB/foZnRef6ha3WHAXYlPxvNxeFDBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ezm31upm; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ezm31upm"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-11dd2370722so1823150c88.1
        for <imx@lists.linux.dev>; Mon, 12 Jan 2026 07:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768230994; x=1768835794; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjpZhhJ244VWi152mVXLmo02ttK8tRkSgyHzO6ob+m8=;
        b=Ezm31upmPdayA7iB5tAA/x9VVLlS6YlttThmkBQyHSKfBHHgacafDyrhRA71oClk/I
         Qy9y8AYS/6s5CcQYSsGTZcSwWe/4QcgNp462Q80XbFt9qsocKEzg0/aX4mfVEnI80h5N
         LmbF6ydjEtScy2YADzIvqcbKSAG0XwoMIJuRF3hWLzl11H4PCQguIZDumBrVZZbFrHmq
         uIaf78EIXTGg0nvSp4IdgRX/Kvn5WHpgfd6DkiIYFUQ9PJWVeNs40qFu1aSL8wK3kuvQ
         oSr7YFjIQQel2GMiVps+DiAcHRPW9ParQg52Isz4IDfUtZ8IH/QD0O4tzHEKt+n0ikIg
         uJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768230994; x=1768835794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tjpZhhJ244VWi152mVXLmo02ttK8tRkSgyHzO6ob+m8=;
        b=OsI02d57in9DNxk1lPUGdPHdnj9L3lpYwwPS+qio+TeAb6kKhPY1OT6RtnhNDisqSw
         UHZ2/vhpEEKqsG3dpqIOAhO1BWQzOim02T3ewiolkuPXE1ctgDU12WQurcrRtO5wrIvx
         z+w6c0Jen1r+Ri2nmYcGqv6FDPRrwDG9xg/hF1owDLAqs+NXG7tpuZ+Zc7+anZyUifEm
         piSMUtdtLw2/Ky7TByzxRXq4pWb+6silVl801zAAeChtBbiabi3x+VLZnu6qLfzd985j
         K/CBYwBEnpMhO0UKrzsHQfd03JVC1l3lJ0hAPlZo11UdqLd+9J8KcIGSNvSI4KlCnhaW
         V68Q==
X-Forwarded-Encrypted: i=1; AJvYcCVjqJ16hL3D27s52x0Mt64No5Vr1KcXD4JXp9u5SagikwwsS648aJT8lnZhom5XXTjBjYQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5/9twd5x+ijWFSBryVfpcBr+U3M01KAQL90Dt37bOh83qWZfu
	lu+jN2cdmac8wpketSR/oDR8KZXxENXyeNB8tsyRFHNpdDg2NOxMrItcXcgCxfjnJLQ+FWcqVXC
	634Q+7+NPqQ+5uAcPeQ7/wo/6qiZNikg=
X-Gm-Gg: AY/fxX4iAyDMhc1NTyxwtMUrnY0NfAgLUe88M67B9K/LouH24cYmvKzjMmaij152XIB
	AZi6rthXyKsyz/4yXG0+YCjkO2cffCpGQq4/D+6jD9zBfNhRP8STWhrbF+QMEbFHioSrofsjufn
	5Hsjq2Y2XudnCazVrffwPFFcVHz3vykRZ8DL1P2wmPd2gcqJOVVDrrc3XStLdBCn6NOksz3QUPP
	V4KayV30apXgbQ0CvLOdjsZCfFRol9broH2GZutOZ2iYwQQyoNiZbcpBXg4YWXEaVKyoO8O0sSv
	+3XSClUtaKNh+CD7XjIm8Xo8qDbHoT/fGIVKb2o3kji+In0GULKS8UMp6tPYYXSkHvGiWZCrdGI
	ljQJ1GyAt/Q==
X-Google-Smtp-Source: AGHT+IFHlbgIEWud1+76aPHPsc3g08WULKUxffQ2bprxJjF72yS3WxmIzikQjlBxRi1qrqgHsYBgta6WOtv1vz8/Clg=
X-Received: by 2002:a05:7022:698b:b0:122:2f4:b24b with SMTP id
 a92af1059eb24-12202f4b38fmr14259478c88.25.1768230993994; Mon, 12 Jan 2026
 07:16:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260112135612.465325-1-daniel.baluta@nxp.com> <CAOMZO5D_YMfsPpqB4zB4iL+ENO1X31Go2CcBdK+JcmsaZ_HNNQ@mail.gmail.com>
In-Reply-To: <CAOMZO5D_YMfsPpqB4zB4iL+ENO1X31Go2CcBdK+JcmsaZ_HNNQ@mail.gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 12 Jan 2026 17:19:02 +0200
X-Gm-Features: AZwV_Qi0Oev2XLPh0w5afRLy2ZMfDu1SdsID0r_7FwML4hd7i3jYVe7anPJW1e8
Message-ID: <CAEnQRZAU7xEGtK-d-KM5e3RcW2ayASAqwZsU2VGLAzvJZwzQng@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: imx93-11x11-frdm: Add MQS audio support
To: Fabio Estevam <festevam@gmail.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	kernel@pengutronix.de, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, haidong.zheng@nxp.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 4:38=E2=80=AFPM Fabio Estevam <festevam@gmail.com> =
wrote:
>
> On Mon, Jan 12, 2026 at 10:53=E2=80=AFAM Daniel Baluta <daniel.baluta@nxp=
.com> wrote:
>
> > +
> > +       sound-mqs {
> > +               compatible =3D "fsl,imx6sx-sdb-mqs",
> > +                            "fsl,imx-audio-mqs";
>
> Wouldn't it make more sense to use compatible =3D "fsl,imx-audio-mqs" ins=
tead?

Yes, this is a good catch. Will fix it in v3.

Discussion for future patches:

1) is it common practice to always have a more specific compatible
even if not used now.

e.g Use

compatible =3D "fsl,imx93-audio-frdm-mqs", "fsl,imx-audio-mqs";?

2) The current compatible:

compatible =3D "fsl,imx6sx-sdb-mqs",
            "fsl,imx-audio-mqs";

is already used for imx91-11x11-frdm.dts so I guess we should keep it like =
this
as this is already ABI right?
