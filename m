Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FD01DFE0C
	for <imx@lists.linux.dev>; Sat, 19 Oct 2024 12:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729340693; cv=none; b=pdmCNxDUzigVOoByGJUe2p1qMcRmmBEFpH84sjwattwfqR/2nH7N++3qCWcSHGSZ0Oo9QifAiK9Z2bs57Kzi3Vf9LcqAnbKQVSsRbWAZ97QZzA3yxwvryeAPm8nURl4VlfMdK+RObNKt3Rvd81sMThUesgNADjlm9geFhkneIcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729340693; c=relaxed/simple;
	bh=59z0vk9jSRT/Hektv9lYc7s4D3nCJX9RgikMYJZSGYo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nePz1vT2yEt+5EOEvxAsncDaCSoCrSipU0AnGNQipIBqZYEGnJl1Buuu2wuvN9p5RsUIspqdQZ61IVCUgUBt3gtYQZ8GdvfhzaAhVhw364e5tMsiVa2d9uW81ZRQpJNYs9DRHjGUhkgy80sm+TE3jWTVYMnhwhV+i+rW5Q3Js9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dwZmGRRB; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dwZmGRRB"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539e63c8678so3765651e87.0
        for <imx@lists.linux.dev>; Sat, 19 Oct 2024 05:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729340689; x=1729945489; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59z0vk9jSRT/Hektv9lYc7s4D3nCJX9RgikMYJZSGYo=;
        b=dwZmGRRB+uluAmJp9VJ+3Vu8fxL4Zn9IIJ2K6wImO0e9oODfhSHnVqUdaeH0f8+moz
         hIZQz6Ir7An1u6cS792X5ZxjQjSEMMF2g5465hOrkyZkmkbmOt3cs+CmqRs/g6d18pQa
         ksGuRAviRp69X8V/D1eMVjdnC2hzvgxgPOfyYeHmbSks5KFBQ3Hv5rGJIJ3bJzWML/ov
         NMoUU3M5IylgeTlwVGfT14zsRwhe+O7Wl7rtJhFhii9jQS8ME4uqcitRf/i/0IU0xsLL
         Ismk4PI/axzlYCPmvWVYyv3p/1Y8t57RWONYV0gre/+CbQiscx9PpCI519VFhp4Kccsv
         CW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729340689; x=1729945489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=59z0vk9jSRT/Hektv9lYc7s4D3nCJX9RgikMYJZSGYo=;
        b=Mmc5bFe0jAkW+aPu1KyvOtLQXBypp7Vuf1+zasMcKx4kAu+7DMYzWZAG9GDOPcRDEf
         d0cOSMxhFdw4Cc/zn+nhKOd8qnVZnMLru2TtlPOlzFzFs/jLmjY1DGYsMh31VTfj+u2H
         g+9cN8EiPN+P7StWTE4WWjTWiQ+nugCCdMTBqpKRRL0Mp2aX7sD6MTm+mpEGyQ+3tPCZ
         Yj727IIgeMm7Rdeo/qOIut4LH4YBBZEl7BRc5qAzQum5sUrvPecS9XQaMuVIVWxRxqXv
         Y7JlKFd5TnqLBn/rFeIza/Dtj5ajTo+v8iMsZvybkZWBbtJiJjyf+5BN4BjMTuActSnp
         E1gg==
X-Forwarded-Encrypted: i=1; AJvYcCXLCeBNUBPT5wj7NzKieCWBPPlRjj9OjzGDaVTOL+juhcfid50CAQ4f18H3gGnjhiW7T0k=@lists.linux.dev
X-Gm-Message-State: AOJu0YyfzHAvxCyrQop0lGlh4dowYxpBAE6z32tDdTz7UeUDz1iI21sP
	irU2/1W9Xw+rBVWWWCWq4SEV3cq2gpVSpdIHAcLXZzSLfmi4QwYAURs95l/Ovq3IgRPwklXqJO1
	kJFk2GHTX0RYHmAzpK9R5STPZsus=
X-Google-Smtp-Source: AGHT+IGUrTXwWiv1lKL67SWJIsNA/hXh7zoipBe5Wg23cvu0dcs9bp2eLa3387Yv1dQp+DUEmW3HYGfmFS3x65zmVLk=
X-Received: by 2002:a05:6512:3b2a:b0:539:94aa:d512 with SMTP id
 2adb3069b0e04-53a15508b0fmr2672892e87.53.1729340688831; Sat, 19 Oct 2024
 05:24:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZxK1yAZkJOTQN++s@lizhi-Precision-Tower-5810> <CAOMZO5AcyVeq8TN9qK=_54gP6y_rrCLjh22LnA=E6pLnxjbpNw@mail.gmail.com>
In-Reply-To: <CAOMZO5AcyVeq8TN9qK=_54gP6y_rrCLjh22LnA=E6pLnxjbpNw@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 19 Oct 2024 09:24:37 -0300
Message-ID: <CAOMZO5B+sJih9A24-NLUvKQXVkBrvFjf+9Fi2x1CFhRjD8EYsA@mail.gmail.com>
Subject: Re: panel-lvds for imx8mm-verdin boards
To: Frank Li <Frank.li@nxp.com>, Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: marcel.ziswiler@toradex.com, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Frank,

On Fri, Oct 18, 2024 at 6:13=E2=80=AFPM Fabio Estevam <festevam@gmail.com> =
wrote:
>
> Adding Francesco.
>
> On Fri, Oct 18, 2024 at 4:24=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote=
:
> >
> > There are some dtb check warning
> >
> > arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dtb: panel-lvds: compatib=
le:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'chung=
hwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv0=
70wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
> >
> > Can you help add actual pannel-lvds compatible string to clean up these
> > warning?

Would it make sense to change panel-lvds.yaml to allow a single
panel-lvds entry?
