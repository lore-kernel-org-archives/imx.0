Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FA02609EE
	for <imx@lists.linux.dev>; Wed, 10 Sep 2025 16:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757522209; cv=none; b=F8saCldmboM83b3NanmsqlKRZ231b/ws699hC3P8NGzVr/ya/dodyjLP0siPXPm5HUBLJutfhzOBJqY0Tfd3nBHvt0mpGI2gm0J2q9OIkurb8FWnuY1lA+AgN7DoF/pHTLhirqpCBQEhrS+lXKW7A2axe7hIQqWkn577fnl4xys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757522209; c=relaxed/simple;
	bh=KJ6uNw0HKk0H9/K2jkc1j6Gr8BtOWS9xg6hVUrGi3EU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fkWEWwJEqYm4THQ6el+iBZh/rcNGzKXQ8pg/uZv8cuybSQgg4xrmxuJHzC2h6Sg0D4Fq8LSI5DM1GM1vfc34k4iFiPfYZN01Wl1Xc5lNmUM85lpDGJLjdURo50B4cQ2mh5LvSAVmIFFe0MJaicmfWaqfxhlLv0GApm97yVaC3nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PWfzb8xU; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PWfzb8xU"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5607c2f1598so7153281e87.3
        for <imx@lists.linux.dev>; Wed, 10 Sep 2025 09:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757522206; x=1758127006; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJ6uNw0HKk0H9/K2jkc1j6Gr8BtOWS9xg6hVUrGi3EU=;
        b=PWfzb8xUsFPELyNiwIdAybf/M/y4waYQLvaW1Ypq8N//AMhQNqnJMROsNpDM5ljsku
         iyn8Fz3vfk190RX61WpTxosKPzUvHTAx1dVKBnNJehoiZX4gnfv8pa99ALDaHQu/t5sy
         VeConxED2txTnBq25CTMF6MgQVae60OO3Nlb03Gr+dBIcM958ehI3VadKNielKzJKJnC
         YRfDpW6GA3zlMc13AOspHoRIM92h8w6x4PsVwoWhL9OJe9tG1Z61AwIjbb86/L3wgxhT
         JhQJm+3msz2VLeSgs+wNzORsC0EoY9r5bUOH74z4JsbxfhpfGBKgguxj5hWJfTwFsagi
         m5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757522206; x=1758127006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KJ6uNw0HKk0H9/K2jkc1j6Gr8BtOWS9xg6hVUrGi3EU=;
        b=UYbN84lzM49KIqZoE0trODk4VkHMG+d357xkgRiNhfI0x5/QOVa6ziGprnR1/dxRqV
         fQ8iqKAruEPMM+aqZMzJhK5I2fwZumFSXjFTtSGt1KiF2Y7QeuzggqZ554Q8IQIuF1QA
         zmJ7AbjZjvHGgtjasfNJMvY/b/lO8g/eHpCk7xmjkDDytMjX+xfUa4LcDegIySaBYH4G
         /NpqAAjeezZQsrpOkMD3lbzn5Pn5WX2XIuygdEGcVySBDgl9Y2GmnkI+Ys4pyPWYeFxm
         rKQlPKIN9p3GljlODnceAtPwy1ICg1BDWPKpm2nukyu/XyZg3wtBNaxgvscgRktPRoNc
         6fMA==
X-Forwarded-Encrypted: i=1; AJvYcCWvXZ3TPxx/idhQ3r4YnM3qGqDS8s2LqP84NEoEUA3TH9s71ECXRuvbkypHGGASQO7KQIw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz13yUqZlA4kDgE1zIBIyW/BDRIX+3bcwGafGd2KJMQ1jbN0LBQ
	D4iMlltVpCsWJqoOViCVLmFmmT2P1ZpItYlRtp3XDm/HMihdVZu5X+CzkMjYiFf9nVadzQf8j8T
	TDySeitupqFCuAJuvMVZ1Ti9fb/760uQ=
X-Gm-Gg: ASbGncsmiWMGm+V+m69tjvMZs5aqNEiBaevDg9hdWFY0E6U1QfyvPUrOCzcQ4a/mnYJ
	u1C32Va9CAZqwqogoucnl3OnvgQut+zvmNBWSMRZhjMtpqTYhoOVFfYW/LEFLjA12LMi5EWkRuW
	gXvKkBrSuSI3D4VdANNYxjbl9MR6nFVRlWeDVYDvmqst3+gs5eAYnXf3b937/eLvsfsrRvyfR6k
	MEzwPHTU3Wr3RH6bApVpSLijlsgdp0LitX/eww=
X-Google-Smtp-Source: AGHT+IFjFrlIdQsJBkbl5UrFknUtSHC2zpRAlUQjHTiQtPng500/xUyi1rm6QWi644I+fPHp7fWPkvMNF1fxWMqbWDI=
X-Received: by 2002:a05:651c:1549:b0:338:bb4:6d6f with SMTP id
 38308e7fff4ca-33b616395b3mr51779561fa.44.1757522205739; Wed, 10 Sep 2025
 09:36:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250910020525.342590-1-festevam@gmail.com> <20250910020525.342590-2-festevam@gmail.com>
 <aMGfiOZrVaFIqA2R@lizhi-Precision-Tower-5810>
In-Reply-To: <aMGfiOZrVaFIqA2R@lizhi-Precision-Tower-5810>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 10 Sep 2025 13:36:32 -0300
X-Gm-Features: Ac12FXwaCBXY8HP2XPn41wXZeHzdr74VgHu-UVfAGT6QVSQ5gGrKs0lhgzUSNzo
Message-ID: <CAOMZO5BGFAfJYFZGCStYhGoFM9-P9=LfFKSNqoTAmMQoox2nEw@mail.gmail.com>
Subject: Re: [PATCH RESEND v4 2/3] dt-bindings: lcdif: Expand the
 imx6sl/imx6sll fallbacks
To: Frank Li <Frank.li@nxp.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, kernel@pengutronix.de, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 10, 2025 at 12:56=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:

> > compatible =3D "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif", "fsl,imx28-lcdif=
";
>
> Anyway, you change dts. If you change dts as
>
> compatible =3D "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif";
>
> needn't update binding here.

This was discussed in previous iterations.

The change you propose may cause regressions for other device tree
consumers, such as bootloaders, where the match may occur only aganst
"fsl,imx28-lcdif".

That's why "fsl,imx28-lcdif" fallback needs to stay.
