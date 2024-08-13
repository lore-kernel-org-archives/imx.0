Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B548E19E838
	for <imx@lists.linux.dev>; Tue, 13 Aug 2024 16:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723566181; cv=none; b=Ai3H3tzdn4UduBdG+yvW9CTo8ZKIRqJ0APfGp6qI2I/g/9yhQhJDD0Dd6XlLlweHfdF7x/enkD+bCaWBs3k8kOhzNIRwiaKTd2kCLBlWnstvE7D6f0iS/bZONnKW1+gBhuxwUwzV2qBS82PKhuLG1g8JopFjV2BZvUHU8omMSYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723566181; c=relaxed/simple;
	bh=yQk+RTC6Dxt1y5RGBBeRO7rR22gywMkNtyR//bDgGF4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H567Ea29qGxkMN4JoFzme+1ZugBu/ykwIXAzdrL1GPApgzI43w84+iiLU/o8V9vDt9pHxc9xWLRDhkn4pTpRJ0yxaFfHEkUSC2dvHXnXAyiVTgJy3N6sY/D4oIkurzUPnyFxCgZF8waCky4vy28k/4osGYZH9bt4lLNzZ72bFLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com; spf=pass smtp.mailfrom=gateworks.com; dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b=Oaa+0gfQ; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gateworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b="Oaa+0gfQ"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5a1c49632deso6264755a12.2
        for <imx@lists.linux.dev>; Tue, 13 Aug 2024 09:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks.com; s=google; t=1723566178; x=1724170978; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lxyojJA3xVBWvdttvq0RoDn5RQuKbHWOiyGGcSP2iqo=;
        b=Oaa+0gfQRK6tag1mLpsXYEJILAbc7FyvI10HM3cl6Z7ZBrV0UEvf1j9BxP0ycMIQqe
         UY6jzhDv3Il6pGIa+wCS4jNtQbxsXknXEMgDDgzQY3wMlFfQU5pVbINjiajL50GJ3NEy
         uHwLo5IZJk7yXDy+rA62bhXhCbRKLmM0Sz33xxuMpcMaVAKg9maUZHhXYmc6KA8s5N4D
         5VgmPTlORdDWeLop9RVRZZtkEvQ7Rdm1FVB7Wu0HIU8G8GCTwKW8QdO/FWTH8Z9hX8nZ
         dxCFTDkycyCMOAcYHE6qYv9w0FNzv4BzjupyY9EwStVUI2t/F02An/gbpO7kp1Kt93it
         WdLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723566178; x=1724170978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lxyojJA3xVBWvdttvq0RoDn5RQuKbHWOiyGGcSP2iqo=;
        b=T3SyQflwE9fDdB6qE6R32D7XC/+YUdg4NmAV5Gq5o43oOa4qbF3+Hb1zGIQaELbYj3
         h9sdcjgM6hzkVByMfUyJiFlilsc64yxkQrw8PlhmwvCNDcHDQimXcMDkoF2yFxYZssHo
         VpGu7svvECblsacCjes+kQW51StOaGW2fD4tQabShXjOHBZOLX9pohoSOiOJ+V1bB8AY
         fotAWQXdRKhOusHwFVVgv0ovM6Q3mh6nIdElmlmAHdlYU5gvU+W2ekRDK/rFkFOMUCrj
         Wnyzm6pVJylGsovJyshJ9WlxGHj0VKatwrmu5HWVKut3irYsDMfuFnpGvOJtCFYm9PsF
         jnEA==
X-Forwarded-Encrypted: i=1; AJvYcCV+H4737OMvSpgcnhqN2/sBGT7kmYHqbzc9rm7+4v1xpBaVU6cim6wASX6PeqiPP7qK3+KDXea/wfdxW36VVONY0Kbh
X-Gm-Message-State: AOJu0YwS4oQ++Jc6oJ+n8W7ah50kqY8hHlLkoSJ8F0rSffEOX6liaXOv
	NEVdYJVqdj5w7pj1glcQx1RyOimq5KZb4BUgsdFYT7ks8DXPNiNeJ4CJApRPe1L85DvOpYBfARP
	lsW+2Lmo3pcp4+/invfJXZW3tTJbBVUcBUL1+cg==
X-Google-Smtp-Source: AGHT+IGKDWGdNxQGJZweiajid/dw+zVC/Oau+vnI5Q4PQPRCzknA/C8QO3ydNGB8zLXwAPoaa6wStVIUJ/W5OifBOtQ=
X-Received: by 2002:a17:906:c143:b0:a77:dbf0:d22 with SMTP id
 a640c23a62f3a-a80ed2d6494mr294578266b.65.1723566177512; Tue, 13 Aug 2024
 09:22:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240522215043.3747651-1-tharvey@gateworks.com> <CAL_JsqKtc_65tDMFWT0WroNPmW2R0Dd-4Jw101PnyJcPb=7tJA@mail.gmail.com>
In-Reply-To: <CAL_JsqKtc_65tDMFWT0WroNPmW2R0Dd-4Jw101PnyJcPb=7tJA@mail.gmail.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Tue, 13 Aug 2024 09:22:44 -0700
Message-ID: <CAJ+vNU0LBEET=y40BT4OE0zWsu6DxT-SYOrx7qD-h=HH2zENzA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: rename gw7905 to gw75xx
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Li Yang <leoyang.li@nxp.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2024 at 7:13=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Wed, May 22, 2024 at 4:50=E2=80=AFPM Tim Harvey <tharvey@gateworks.com=
> wrote:
> >
> > The GW7905 was renamed to GW7500 before production release.
>
> Maybe some summary of the discussion and how this changed from one-off
> to wider availability.
>
> >
> > Signed-off-by: Tim Harvey <tharvey@gateworks.com>
> > ---
> >  Documentation/devicetree/bindings/arm/fsl.yaml | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Hi Rob,

What is the status of this patch? I'm not clear what tree the
Documentation/devicetree/bindings go through.

Best regards,

Tim
