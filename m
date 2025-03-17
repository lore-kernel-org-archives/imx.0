Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74FB1A315F
	for <imx@lists.linux.dev>; Mon, 17 Mar 2025 15:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742227085; cv=none; b=GDeHtcFQx+D8r7Td+OBQyHKDG3+zzPiaLMSneCngkRis7guyVeeWckyVEVwNMu7I8bQ28KJJpP5N4oPUBLQ7kc9yXwGQD5e3i/1gg5vy12QOhYcoJwN6fiMltKXHuFrNOVPhDsgjIFmgRBU9CJcAj49qNe3NnzEOmwVReTgvHf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742227085; c=relaxed/simple;
	bh=yMKzmgdAa1GrfN1P1367oG58K7sJ1GR+/2GwB7WGKUc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KYsPbjofdtxpjzh1kjY1fqXayKBBvHh2b2dwbLZo3SLxxVEwmttFqES8RI5ZD71kiKDdyPi9c9tt4JCOJSX50WbyFyYl3O0TkMC4+hQHrWsqdZ6AZ2OKi77H7c7ifTkXMaKg3X0dvT5eaqhSu183uASAVn+9MFgcrnT/swG9Vts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DWSQ/q+J; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DWSQ/q+J"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2243803b776so43011875ad.0
        for <imx@lists.linux.dev>; Mon, 17 Mar 2025 08:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742227083; x=1742831883; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=06QGEsbiDHTPlITpRCkSEygiFBtZganqjlJySZAtEPM=;
        b=DWSQ/q+JarZAnagRpre9Lojaz3BXvU1UQ5Yh3O0cFMjOc7eeXHyz/C8yxm7l9Dhahf
         fmgfgVuHvZtJ5kh/DXqdtHLUloHf2prFEd6jNrLWMAeSLa6a4pMI6x+Y9J4J9eJ3gxil
         srHCpVeIyV+wB5NtfRZA/bP1m8qJoRd6Q7aLJ4tX0Mk6lHZeZtGuJw12wKwXAgM117yC
         1FHvjegBN6j3IUrti3TNfNcqcbrf1eAilCvLCQ9mH7xm7glJExXG14+TEu1fLlUTAbYE
         mdhZJnqt5A1qfaDN7AZ1neUxQZfA5TfLQXc+1lGrO5QnIK6IZ9uuWYuNJI/giBVFF1cv
         Cdxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742227083; x=1742831883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=06QGEsbiDHTPlITpRCkSEygiFBtZganqjlJySZAtEPM=;
        b=V6bcB7cN73bQ9YgAJMOksOnfZ1DI3BLNyy2r6vlFnlJzOvhNIUNFKOu6hKj9VNK4ni
         9Vx0cP/Ma0zf0Y+jDYJUf+n5yXreiKTA1lH7zahWdhAoOTAY5f4z1d7UFB5Nx39e75O4
         ZJLxm6Co/nRzmIF3q1Yq0PIePqE+k3dUUTq7Umxw/RBJe6HPgVJ9/79UkNiaB3XMAUdf
         z6mSnouF+qFXoriU7iurt7WmziM7uj/3LyLdikyTmfPzUZymP+aUdZqk/r+m5BXa6Twg
         Qc+jsm7HewXu2tNAGhcqw/BcHWfQEovLFxjvTw4fPsqVvj56R7CQGtFEKDgzGRL+2WiO
         L6rA==
X-Forwarded-Encrypted: i=1; AJvYcCXTc7+Qm7d5HT8C72zUvFbRFOra7n4Uy+eAt8hQRdCcN2xeNYcjgEiIPSB/58H6VXFeoNg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyTrr0/G0whQdq+Leg9og2QPi1Qr3WweCtUK/3wP+ekUF6tK70r
	z8L4kFCRcNxXxFRCqzdtT4t2OdMzeRR/Zpm/IyuSpb6ADuAjmkrimZwSsXZP3xw8tiIb47vVFx3
	vzGAbO9wbGGCBVcve142cLoGasZw=
X-Gm-Gg: ASbGncsInvjx31fFzArZ7v9TpJ+cYOvR6uSMo92+RSgZPSdp66HxoTv1K3o6ua/ODbh
	wtjC61Qc4zctIK5eiKSi8tC49em68Ni9amw9q3M4ElHNRdGkNwAA5bBYwzf9+gUL8Rp9eF4bSGX
	1BZL6VZ2YS4JqZYFkTHJIQtGGDX5Q=
X-Google-Smtp-Source: AGHT+IG3Ayo9k0yRtjHNBCfqhmNJz3asFcvcSqQ3hdNGSq7kkzqBge1sZkHTYixEYa/8f6gTrblik9jUofUotL/jY/U=
X-Received: by 2002:a17:90b:17c5:b0:2fe:b735:87da with SMTP id
 98e67ed59e1d1-3019e7a3ce7mr409937a91.0.1742227082981; Mon, 17 Mar 2025
 08:58:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250317133306.2003909-1-daniel.baluta@nxp.com>
 <20250317133306.2003909-3-daniel.baluta@nxp.com> <5873285.DvuYhMxLoT@steina-w>
In-Reply-To: <5873285.DvuYhMxLoT@steina-w>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 17 Mar 2025 17:58:07 +0200
X-Gm-Features: AQ5f1JrRqDM8p6JEGxBqM22DUaeaV1igcAM-i6by99ARfroWOHqb4YOLD6MREdU
Message-ID: <CAEnQRZCsCYbQU8uxpFeyLmji65VRoO0rckRcoyc3frd2_B_KqQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] arm64: dts: imx8mp: Add mu2 root clock
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: shawnguo@kernel.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, krzk+dt@kernel.org, 
	conor+dt@kernel.org, festevam@gmail.com, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org, frank.li@nxp.com, 
	aisheng.dong@nxp.com, laurentiu.mihalcea@nxp.com, shengjiu.wang@nxp.com, 
	iuliana.prodan@nxp.com, a.fatoum@pengutronix.de, mathieu.poirier@linaro.org, 
	linux-remoteproc@vger.kernel.org, Daniel Baluta <daniel.baluta@nxp.com>, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 17, 2025 at 5:30=E2=80=AFPM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Am Montag, 17. M=C3=A4rz 2025, 14:33:03 CET schrieb Daniel Baluta:
> > Enable MU2 node and add mu2 root clock.
> > MU2 is used to communicate with DSP core.
> >
> > Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boo=
t/dts/freescale/imx8mp.dtsi
> > index 3b725fe442d0..5b443fbeded8 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > @@ -1253,7 +1253,7 @@ mu2: mailbox@30e60000 {
> >                               reg =3D <0x30e60000 0x10000>;
> >                               interrupts =3D <GIC_SPI 136 IRQ_TYPE_LEVE=
L_HIGH>;
> >                               #mbox-cells =3D <2>;
> > -                             status =3D "disabled";
>
> There is no need to enable MU2 if the DSP is disabled by default, no?

True, I can enable it only when needed. Will fix in next version.
