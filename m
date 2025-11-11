Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAB0347FED
	for <imx@lists.linux.dev>; Tue, 11 Nov 2025 10:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762856427; cv=none; b=HNproYWnDJhPjh/tN1XUFu1RWizN0kBo5VlrAOK4zsmRq2de0WdEPF2xovZBdeU6szjl2cgnHWeUc3qAgJT0i24rqVKQ+7lKRvtwSiR7/0ZV1l4r3xRKybIMzahPl/YeFrrw7P4ySPj3XJCxe+rv7W9p275G9tSPr8++L20B8JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762856427; c=relaxed/simple;
	bh=vFQCQTjKO8TNTzEmtlk+LvI6FcO3v/ubcdimd89KqZk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KQFOF8D5g+ntDBEiT4x7MAL+LMUoTPyDTCVReFEPDGxoYRlvxI5quhio1FlnvKlXs6WdOvsKsKnm3MxnlxI1rOTQ8my3vCf3ytXFcRQ3aYLxuYnBvwMBnY6F61943y1Xz80foCOCJ7gFBLupHzJRZkCRKqap5JrUDrK7NydnxPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=diGLdE52; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="diGLdE52"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b98a619f020so3519691a12.2
        for <imx@lists.linux.dev>; Tue, 11 Nov 2025 02:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762856425; x=1763461225; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g2BNnZMONHx8/CvKkJxYxrwMB72hoWbxX7RGGc1E2Ds=;
        b=diGLdE52Nz5exV9tUYyYuPxD13Rmgc9iK7qT8yY5cx2ZKKEFElRIDtXjFgCqLdMTaZ
         BgEzrsjSgT7wXgksa/XQe3Tdjlv914qOCeYr0/zbh4vej/gclQpT5gFsY7cSHpTuO9qI
         uClSkcMLpNEZ2uz6BUYfNHzLB6DdJs2lZidadZcIcMNiYXPRxMU/LyeWeTNf58YxesTS
         VdR8Q9FzqMY20YxPfg6VhlwfVD+Wcanwk9iOkL8Nu/N/6wtvP2a2AV6IFBjrE91uJ5W0
         MdZ4lGVlTzsNOzg5tcvwbcmBVjLFqqpJ2Gj6PJavRy7JW3VAdWV0caUP2+r8isJ1fWkA
         vAgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762856425; x=1763461225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g2BNnZMONHx8/CvKkJxYxrwMB72hoWbxX7RGGc1E2Ds=;
        b=mP7s2fp9CijMFPsi2VLhhQEJcppaJ+H7aa8vhtw8nxUKmUYhPJ1Ba04v1FkekFbU6g
         prJGPNCVrwG5mqAPOi8dyOu97XVnYESvEDAN+HgEnnxYXu/wpOJaq8NU/aluYxCF2hgD
         HSamWAGW3OO34F8fGzxp9zqlAt3NYLTGYCiuLrSVlBT+jS3C4FdRi6w5l1xEewaiDaP0
         wywBncD+TQYKZR+mSL1DxRDa1p8py7q2OOzSKNS/0DfslKK8+KTn4vsJe1tyTymHyEgS
         xQpdB9HtuXPUJWqberJ6rUHgasFCw9zpFDo6Xpm99ATulnI37UDfUp7HtEZcwwdhRuY3
         RE5w==
X-Forwarded-Encrypted: i=1; AJvYcCVUtlbjFezOHtMQlqGa/EoegRWq+zqxruepfvEp2IOlXRpP7+0jeEAAl0nwj1gbGMqfYhQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4AxcHfUyP2Y9SIviaAQ42nX82cy+ijhaHMjxGwKZoh6ER5dhv
	LX0IvdHfrXpu04oosKoDFD/oiTEPzdFU07boee/+UAK7ULa/LXpyQkxaHYG2FpA/tz1n7NZUw+W
	Fw4+uVXRfQ+QQ9eSNqdOHsP/EHZRDqBI=
X-Gm-Gg: ASbGncuOLrBns6+65ypMU9N5gMvAFLENxXYVmuSu3ZwAPUNxWFZXKQXJq59tNxCqQmY
	K3Xu4xpgABxUtMtQQzVYZtuWdHbz8m8PzRxRITw7+HPkfyDAcJjWE4XmgRAt9tiF2hJFIHv1ve6
	n++2+2wQIdgYju125xjtKzkxYZCRoKd5rR5za8XAVKvGEUrVv7GwvWxR70ggZXuJtcRw9QmuPmm
	Jibhz24CQJTfqn0wkjd44lWXEf1X8CTqyHEn3qeK4O/+XSOXdkm876NoQ==
X-Google-Smtp-Source: AGHT+IGHeEc0tdcwN2CitYeC9X138lPaLhDv7imL1UBIrrtgzyaJrxx+3S5nCZWKtBm7wpPk+C2oztDUFMFw3MuqU3k=
X-Received: by 2002:a17:903:a8b:b0:298:68e:405e with SMTP id
 d9443c01a7336-298068e42acmr127289735ad.59.1762856425272; Tue, 11 Nov 2025
 02:20:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251109214515.121742-1-rpimentel.silva@gmail.com>
 <20251109214515.121742-2-rpimentel.silva@gmail.com> <aRF0++cUigbETuPs@lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com>
 <CAOMZO5AdcR_fT_RV5-NWu7j51_TA_=Mzzi-Y3Y=HpH+pu=mrvQ@mail.gmail.com>
In-Reply-To: <CAOMZO5AdcR_fT_RV5-NWu7j51_TA_=Mzzi-Y3Y=HpH+pu=mrvQ@mail.gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 11 Nov 2025 12:22:49 +0200
X-Gm-Features: AWmQ_blb19ig8nToRgjFSZoxZIb7WUT84e0ePG6rGqwjB44zvP8kQIVu2iX87yU
Message-ID: <CAEnQRZBdqUQUahHcFO2W6yezonXdpFVT-G52rnda941+M=T93g@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: add support for NXP i.MX8MP FRDM board
To: Fabio Estevam <festevam@gmail.com>
Cc: Joseph Guo <qijian.guo@nxp.com>, Rogerio Pimentel <rpimentel.silva@gmail.com>, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, 
	alexander.stein@ew.tq-group.com, dario.binacchi@amarulasolutions.com, 
	marex@denx.de, Markus.Niebel@tq-group.com, y.moog@phytec.de, 
	joao.goncalves@toradex.com, frieder.schrempf@kontron.de, josua@solid-run.com, 
	francesco.dolcini@toradex.com, primoz.fiser@norik.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xiaofeng Wei <xiaofeng.wei@nxp.com>, 
	Justin Jiang <justin.jiang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Fabio, Rogerio,

> On Mon, Nov 10, 2025 at 2:15=E2=80=AFAM Joseph Guo <qijian.guo@nxp.com> w=
rote:
>
> > > +/ {
> > > +     model =3D "NXP i.MX8MPlus FRDM board";
> > > +     compatible =3D "fsl,imx8mp-frdm", "fsl,imx8mp";
> >         model =3D "NXP FRDM-IMX8MPLUS";
> >         compatible =3D "fsl,frdm-imx8mp", "fsl,imx8mp";
>
> Why do you suggest changing the compatible string?
>
> "fsl,imx8mp-frdm", "fsl,imx8mp"; is correct.
>

All NXP documentation refers to this as FRDM-IMX8MPLUS.

But compatible strings have a certain pattern to be followed so
we should really go with: "fsl,imx8mp-frdm",

But for model and all references in text and commit message
we should follow the documentation and use  FRDM-IMX8MPLUS.

So, model should be  model =3D "NXP FRDM-IMX8MPLUS";

Thanks,
Daniel.
