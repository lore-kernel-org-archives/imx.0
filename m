Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D102839F1
	for <imx@lists.linux.dev>; Tue,  9 Apr 2024 11:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712661733; cv=none; b=GuYaMxWnYx9vQzWwD8xLPaaaNZNaAVF5fiL14Mg+TtpNMgxVvhGt/ZdPjmw0kgNJDd+yFnVaac8576kAmqLm058v6n6zGJBOp6XwIi648ee/nPgyEsjeDsOYvI02xwf4YMnOujGBe4q1O2XdU35zf5ru8J7snBbd554bdhzNrhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712661733; c=relaxed/simple;
	bh=z2BYcIxpPV7dA/hoWGZiUhKQFrHNrFSXIXX/wN3zASA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ul/tfcBBSP5sq+NJR6+SU3yZuV4QipnxcQH+AEdkh7383h4Q6GEAxYbpJI3pQDX8ryAK0BZG4m858d8/edmOlz1ZVeYhGN4RYcsr/mqINmpct6P4PIOBGP8iXBuEVw6TQaFtzKM6J/yqFb8LBiaAhuxKp2H4hMq/kFzNe+NKiJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OSYKoGEc; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OSYKoGEc"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-36a202020ccso11249015ab.2
        for <imx@lists.linux.dev>; Tue, 09 Apr 2024 04:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712661731; x=1713266531; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cUPlYyCbnZyXJn6L4cZK1glpJcPHCmQEuO505nrY/Cg=;
        b=OSYKoGEcKtJ5XwPBy8xHyxSgCNWwrPEc+VslSLoIgizYuYkeWKD4sZXXXiwoNs0hdj
         kKxTuQjARnjLYGkJvtEGSujN6t6tIm7YCoGU9MKvs6dww1sHxltdn2TJQNXkCRzWiD6y
         QRV9cS4s4zyII1RxwP7bOb7IRMIhkl/kMme9laJSBeZcdpBravaBli6EI9G6MaqAaPaO
         RCo3bBmp0CBKvVVxPpSbfXeOqdCx3wExFDAZ9Xk8ol+b9lFm82McF3mAC498B/7RpCad
         1Onu+4HHipcduDHMWVnZYZa0bvCl6jbjgbBiPK0jZJy8RKgyvMPcdPoqtjtU1yjx4zif
         fiEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712661731; x=1713266531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cUPlYyCbnZyXJn6L4cZK1glpJcPHCmQEuO505nrY/Cg=;
        b=N67yegW6Vkctr64r82VinUbCW8pgLga9OEQqaRIOeHVK4g6St28ivV70YVX8arVrjl
         sjpm9Ua6vMhMS61LUAXGv+DYLpX9qsWzScMHaS2U/Kg78VhtBwBBj/TvqTkTJd58361B
         BTLzcYPzSE1ZOjVt80IzwUpw0E3EKhYNdR1qjGV8W7bXn9PRq6h/WSKOzeEMMSI6lCO0
         ZTd644tUdh1CM+NHzNeaJHudKaKFhyZj33B4YhiuJeRhWoNOzM5D2+qlvLyDubH5l+rD
         LjisyimIqMgzb3vgnmg63RvBHIjAmy3uA3pBjkp9BM9tvO6Nb2ITo6ioGmmnl+tPxv+f
         Uudw==
X-Forwarded-Encrypted: i=1; AJvYcCUobZtDhJuPNHfn19+YfHTPMcUh4xWH6tme5zyoLDB3nrtwwrs4brBBVxMhk9x+C4CdaBYh0kz92QQR8ZKwB1jSxQiE
X-Gm-Message-State: AOJu0YxiJpYfd+KImnyhPUYiYo0BFbvPYQbM0OjkNL4cax4cME/So9y3
	bdR7d7JbtZ6KjuKGIYLl3grepeKqyj1OuJlb1SoSfjMOsKzaQBCKwPjwMhMIeM+0lYD7A1PK87t
	fmyoolvKM+U5MGBPoM0U4z8kyPU0=
X-Google-Smtp-Source: AGHT+IFwJhpIsKcZb+Asw4W/YnwlWjJ+/9Z/cP+F5xlsh0I1LU5T/T/6y3yuehkk3NNmH5hNvipHXtlY44zFA7XMvgU=
X-Received: by 2002:a05:6e02:1ca5:b0:36a:190f:1932 with SMTP id
 x5-20020a056e021ca500b0036a190f1932mr10670474ill.23.1712661731192; Tue, 09
 Apr 2024 04:22:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1712652644-28887-1-git-send-email-shengjiu.wang@nxp.com>
 <1712652644-28887-3-git-send-email-shengjiu.wang@nxp.com> <CAOMZO5Cku1kifsnWJOr0Zd-5+49j-KB67iHZDcvUsKwrhVPtLA@mail.gmail.com>
 <CAOMZO5BfJBkyw2q3wi4q3yjEmQowg7Zsw8yEFyANMYYez3ai+w@mail.gmail.com>
In-Reply-To: <CAOMZO5BfJBkyw2q3wi4q3yjEmQowg7Zsw8yEFyANMYYez3ai+w@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 9 Apr 2024 19:22:00 +0800
Message-ID: <CAA+D8AN+7Ca5wFzTKFDHDEgL5MeW62K4qLsmP6LrngiG75RPBg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] ARM: dts: imx6: exchange fallback and specific
 compatible string
To: Fabio Estevam <festevam@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com, broonie@kernel.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 9, 2024 at 6:06=E2=80=AFPM Fabio Estevam <festevam@gmail.com> w=
rote:
>
> On Tue, Apr 9, 2024 at 7:02=E2=80=AFAM Fabio Estevam <festevam@gmail.com>=
 wrote:
> >
> > On Tue, Apr 9, 2024 at 6:08=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp=
.com> wrote:
> > >
> > > exchange fallback and specific compatible string for spdif sound card=
.
> >
> > Ok, but please explain the reason.
>
> I mean, why can't these two .dts files be changed to
>
> compatible =3D  "fsl,imx-audio-spdif";
>
> , like all the others?

The specific compatible string should be first place
as the dts rules I think. This patch is just to fix this problem.

For removing the specific compatible string,  I think we can
do that.  but this change may be out of the scope of this patch
series I think.

So I just change the order of compatible strings

best regards
wang shengjiu
