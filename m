Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5523453363
	for <imx@lists.linux.dev>; Wed, 10 Jul 2024 06:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720594130; cv=none; b=LvFumn2Cf/0q7qokvFtYERwCNMKPG1HrDELJr087yZAlEeZunHh5E6Bn+cmv6fx2Pp4tBFp8bnYIzw4Z2vzEBe7qypND9J0HwwqrNc691MMz1oP3+c7VHD1n/g9X+uqfz0ZTaoJfFcQzjKsfW9zWq64nGj7+Lrlc2FOaOrRoeQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720594130; c=relaxed/simple;
	bh=d7E4pF3B/YC1SaQ5hGT1rdhUnlINXowoDQRGFU9KCU0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LQQQaaEdVpR+wsb5KZcq9YiYRBi8Jb/Ma8HYpd/oIVAYxz6W2GhQHU+9+VXncLs7EYAaAjnbfWhhCQoVIheKGi6kxZgqc71f6qjX6oj38MfVV3n4Kcz1rpEhne/BZnEkV9wtVCv2wzRNRySaBwfRtAg+qZ7nl0fXkstIJGf2wEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CjaBchPn; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CjaBchPn"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-38b1ce72526so5108985ab.0
        for <imx@lists.linux.dev>; Tue, 09 Jul 2024 23:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720594128; x=1721198928; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AqJpJlQsOLg6grig5aAIY5nJC8Y497l/ww+yMkv+els=;
        b=CjaBchPnTNHMw63S92z1K0lw86ArlH6O2jDOpZRbWjekqVVkjI4FvzjmjU7ikRWRKJ
         uiNHwzqeubgYsUbx0IIaWhULKb6CtZhPSU75jyBGpp5CNWXZptRKsNVUB0lpQJWV0wwM
         XO1RKSMRLnR/TZyf/D8p+elpbJyW4Me4ZJPuc5AQIFq8YrfP7fkLwgtz4sMDjoXVpcWk
         vkKhp6+GZlaq/LiPpOvzrGBUBrxwbdzRxgVebuVvLzWqXtZYqPY0O7fxc9OuJHWBJXJO
         AHMlX7MeZpAUwn18ZklHX5HMz/rQ06lcyA1p9C7gOBH99xJBKuiPzTpkSMSqya4+vKv/
         7uNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720594128; x=1721198928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AqJpJlQsOLg6grig5aAIY5nJC8Y497l/ww+yMkv+els=;
        b=QLtWzUFzsdlMRJ2R2U4esYadV+m9WEhWBSg498sHyVVhBVBuRY7dzoovn5DC1pCylm
         cXY7kw5qyUvnIT7E4M3I//a7RxWYngG5+Zw0LcV/0X0sokW/Ro6rO6ezN9gD1b4cVZdY
         55zIqH1vG6eW03oTGDwOtkjDgS2QhSdsy8ESDntZeZ6Kv30Y1tOGbjVkMNKhbjmdIKN1
         htJbcHk3rW6FdhzXARrzT4AzoX+zMAYXObabO/zm+zqnjFgN5pBkjafc/sl6WTfsiaiL
         mSe2/T1sd1fkCAX+SfqJYicG/MLZaUX4CWQ6B9QY/flZxG3/6SGAPdf5m4/3qytgunQB
         rdiQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2+9yiMrP48coSfxvKcL6wMvnOpGy9UrKM5mzLoy3pYyZcfl9t60wPHaJlw+OMlV3v6H4d88ACxt7Yud2JWBCsokJa
X-Gm-Message-State: AOJu0Yylpc9obGhSEonodn6QQhrbINeAF1KNBcANgRj5ojMfaTVBkd/I
	hFcj4wxcxbaQumb25PXnxp6n1wQkiKLAxMSkjBeGFHQGGc+FJ6/bIyvca65u8bznkAGvKCaPFL/
	Fd5VTlJKPqiX/5dhD1KkuiKKXV5Q=
X-Google-Smtp-Source: AGHT+IEXHEmoHb3TCymWx3QQxiI9X8NsPovHzCQ4rz0cdUtcFQXIiu6fSaiQ8WtQeUYBP0xVeQJ1acajWd3skRQPx0U=
X-Received: by 2002:a05:6e02:1a23:b0:38b:48c9:55d5 with SMTP id
 e9e14a558f8ab-38b48c95c00mr29939745ab.13.1720594128346; Tue, 09 Jul 2024
 23:48:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1719996771-11220-1-git-send-email-shengjiu.wang@nxp.com>
 <232c2342061b17b9f750c4ad52b0766e.sboyd@kernel.org> <CAA+D8APumdP97QQHObF6NEw6jwDJRb+0R=aAjqftrX1wR170Yw@mail.gmail.com>
 <065ab85945db26eed25ea874fce92524.sboyd@kernel.org>
In-Reply-To: <065ab85945db26eed25ea874fce92524.sboyd@kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 10 Jul 2024 14:48:37 +0800
Message-ID: <CAA+D8AMvEVk9yLt70ROhDGzdd+A5C34611QnSyfbYr0OrLb75A@mail.gmail.com>
Subject: Re: [PATCH] clk: imx: imx8: Add .name for "acm_aud_clk0_sel" and "acm_aud_clk1_sel"
To: Stephen Boyd <sboyd@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, abelvesa@kernel.org, festevam@gmail.com, 
	imx@lists.linux.dev, kernel@pengutronix.de, mturquette@baylibre.com, 
	peng.fan@nxp.com, s.hauer@pengutronix.de, shawnguo@kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2024 at 4:08=E2=80=AFAM Stephen Boyd <sboyd@kernel.org> wro=
te:
>
> Quoting Shengjiu Wang (2024-07-08 20:20:56)
> > On Tue, Jul 9, 2024 at 6:45=E2=80=AFAM Stephen Boyd <sboyd@kernel.org> =
wrote:
> > >
> > > Quoting Shengjiu Wang (2024-07-03 01:52:51)
> > > > "acm_aud_clk0_sel" and "acm_aud_clk1_sel" are registered by this AC=
M
> > > > driver, but they are the parent clocks for other clocks, in order t=
o
> > > > use assigned-clock-parents in device tree, they need to have the
> > > > global name.
> > > >
> > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > ---
> > > >  drivers/clk/imx/clk-imx8-acm.c | 12 ++++++------
> > > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/drivers/clk/imx/clk-imx8-acm.c b/drivers/clk/imx/clk-i=
mx8-acm.c
> > > > index 1bdb480cc96c..a1affcf6daff 100644
> > > > --- a/drivers/clk/imx/clk-imx8-acm.c
> > > > +++ b/drivers/clk/imx/clk-imx8-acm.c
> > > > @@ -114,8 +114,8 @@ static const struct clk_parent_data imx8qm_mclk=
_out_sels[] =3D {
> > > >  static const struct clk_parent_data imx8qm_mclk_sels[] =3D {
> > > >         { .fw_name =3D "aud_pll_div_clk0_lpcg_clk" },
> > > >         { .fw_name =3D "aud_pll_div_clk1_lpcg_clk" },
> > > > -       { .fw_name =3D "acm_aud_clk0_sel" },
> > > > -       { .fw_name =3D "acm_aud_clk1_sel" },
> > > > +       { .fw_name =3D "acm_aud_clk0_sel", .name =3D "acm_aud_clk0_=
sel" },
> > > > +       { .fw_name =3D "acm_aud_clk1_sel", .name =3D "acm_aud_clk1_=
sel" },
> > >
> > > This doesn't make any sense. Why are we adding fallback names?  Is
> > > "acm_aud_clk0_sel" not part of the DT binding for this clk controller=
?
> >
> > It is not part of DT binding for this clk controller.  it is registered=
 by this
> > clk controller itself.  As it is a parent clock, so my understanding
> > is that we need to add a fallback name,  or change "fw_name" to "name",
> > please correct me if I am wrong.
>
> If it's registered by this clk controller itself then it should be a
> clk_hw pointer and not use any string name.

ok, will update it.

Best regards
Shengjiu Wang
