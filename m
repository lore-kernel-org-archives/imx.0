Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5617228B51F
	for <imx@lists.linux.dev>; Thu, 15 May 2025 10:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747304622; cv=none; b=Sewti7F25JrftoCnDI7RIsDnf1gxzkPMYcYB1AJk2/1k2mxQPnRo7z1hszCrdNxxvc0IxixTvPFmJ3P/5nAu8yRinL5slEOHf04AFmpFu/s4V3GaNC9qgn1goBY3YA7MniEnRiEvJ5E34DGwWUlsTQqWYWhbm9DM3ZKHlWux2Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747304622; c=relaxed/simple;
	bh=LPn993xnWWkvwlm5rudsJA0BQo0qu2yihgm1xOxvsW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VSHLRqjl+JDSd5fBYQP1EHM5Jt4dBJdIl+KMhD85N4M1cydNT4ansepgMGGjlr4N7O0PE5wewkbiyI2+u5zNGOAxHN/R+RmgFxWHiLH2Z/aoYv9dl3PpFRtFpFv5QFkjsOHgjqoATsVRnJk6gJFMe3ac1r/25Wl1Y8fI/XdsJ/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M+nfQ1Do; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M+nfQ1Do"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3da74959554so1898055ab.2
        for <imx@lists.linux.dev>; Thu, 15 May 2025 03:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747304620; x=1747909420; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zJZrSFBkNbM1G4hOj8s/L4+l2f6c8+4aH2wqD19Gqc0=;
        b=M+nfQ1DoFZNvuEmmuUB4qP/zfCevaru/nEaHbjkKtTDCCyYJpeXfSSiNrOza8Rmwsz
         krojydSzr44wN3XwpR5RMMRHlqObTXO/FXzDbtVc8EuFLFcGIVulWnez1qGkrN74iZI4
         DW9l2ZG1oIEpC2VKFP9Sld60muJ8zWZeD3j7MIzP6X7q3nxgUfLIelCWosKyt2XxZprI
         ikiRWv5TXeyGYAvP9zM3K4x1EDiZd8RP1EkctGbEF+heDYxHUiUP7Uni2i6IRHOt4MBT
         UIzo9XCGJ/ts5f7fxpa3USKMIjhKP+l2NkpRoIcAEGYXrHYA+ZIouLagWIvqoEEmCepz
         durA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747304620; x=1747909420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zJZrSFBkNbM1G4hOj8s/L4+l2f6c8+4aH2wqD19Gqc0=;
        b=aYvrwFIa/ALM5uK+UcQxv4MFTdWLD8kH1Fur+I3NOJlT3LTDZH09bL/aGUVoTWb+0z
         Xw8Jbz13mvGdh4atIgQbh1jSUm4n0r4/0uCbyHiFHvEpN5EjKdt5m9jH5C1ssuAeOseR
         kcogOFUqGxVODJ0K2U0RbjAiBOJ+BtOmsEUsKRDc4tQKRtR6hqiDhzXUp0lK736l1u0C
         lgaMb+AP/b16ZHANROeFSVJjh17MFkItEEgzwhFrM0ZxWrj/k6poL3+IpaFUkffov3oh
         fRnybobHdmoYIvuPwrDkhvAqnQU8gQQadpjXQYIErBWbsJRdqDXTlBOCX0jkXP2QtT2G
         hoMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcRPCvSMfySxOrJUEs/vyYYSwrmFYHwudTIOzEix0MlfWCvpccVXX1Jsl+q9H/6D1i6EY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwoLsiezTi4BxnhbO4W2R+E/z+ShVYhDy9GPQdQ7TYSv0D6o/Af
	7I7y2BiF9+ORAzQpacLvZ8mrbGyjeTJH2Lrxn0IqZ4+gYCCa8BsRYeSKBJZ3mBt/5M/r3HBwBDq
	n1NhP9d1ImZLSyGgTt9kSJxVZ+AY=
X-Gm-Gg: ASbGncsCq32Jzqo964WuV5SL7TMnnHzsXIGxjkkV7RdeLs731lxTdquhs40GCpyiQ4G
	lS0bbYw8YmXR3LeuXRAg5wAew0cm3qdiv8LTN8vUKfFm1msKOCZlQ1uEB4GB7qp3aWq5wY9oPJW
	uSW9rP9DOuCMajG3OWyYVJS4ea8bL4rknM
X-Google-Smtp-Source: AGHT+IHO5NjvG7NPaTx/Wk84Xf6YXEN9rB+dPDyiQnC6Nqm2qSNMD7m/f1k9O8ljI/qF9B+KJKVTOxllmfRsmBxkeqU=
X-Received: by 2002:a05:6e02:2186:b0:3db:75e6:80d5 with SMTP id
 e9e14a558f8ab-3db75e68272mr38100995ab.14.1747304620350; Thu, 15 May 2025
 03:23:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250515051900.2353627-1-shengjiu.wang@nxp.com>
 <20250515051900.2353627-2-shengjiu.wang@nxp.com> <CAEnQRZBJgJpyE-K6fn3_s61-Q7j=mXk5FGMggpaBhnH62w+ACQ@mail.gmail.com>
In-Reply-To: <CAEnQRZBJgJpyE-K6fn3_s61-Q7j=mXk5FGMggpaBhnH62w+ACQ@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 15 May 2025 18:23:26 +0800
X-Gm-Features: AX0GCFs1HwaoDdoFbQAbv3WJV20f_7O_khUEi6c3pJChsc5rxc9dD7nQQ1yVecY
Message-ID: <CAA+D8APSQK8FqGYYmAygF-dhM7N_54Zw-jSz4xWrr5ToGfUKmw@mail.gmail.com>
Subject: Re: [PATCH 1/6] arm64: dts: imx94: Add micfil and mqs device nodes
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, carlos.song@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 6:19=E2=80=AFPM Daniel Baluta <daniel.baluta@gmail.=
com> wrote:
>
> On Thu, May 15, 2025 at 8:21=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.=
com> wrote:
> >
> > Add micfil and mqs device nodes
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx94.dtsi | 30 ++++++++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot=
/dts/freescale/imx94.dtsi
> > index 3661ea48d7d2..77297dde5c95 100644
> > --- a/arch/arm64/boot/dts/freescale/imx94.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
> > @@ -108,6 +108,16 @@ scmi_misc: protocol@84 {
> >                 };
> >         };
> >
> > +       mqs1: mqs1 {
> > +               compatible =3D "fsl,imx943-aonmix-mqs";
> > +               status =3D "disabled";
> > +       };
> > +
> > +       mqs2: mqs2 {
> > +               compatible =3D "fsl,imx943-wakeupmix-mqs";
> > +               status =3D "disabled";
> > +       };
>
> Node names should be somehow generic.
>
> So here, we need to have something like:
>
> mqs1: mqs@<ip_addr>
>
> similar for mqs2.

There is no ip address for mqs module.  The only control register is
in BLK_CTRL.

best regards
Shengjiu Wang
