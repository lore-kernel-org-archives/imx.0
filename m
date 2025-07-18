Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE122265632
	for <imx@lists.linux.dev>; Fri, 18 Jul 2025 07:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752824669; cv=none; b=qe/jc81JJbx7tb8vGD2aEvaImK7FyMQEeyBpvCFPTj8k83OpSBkyPUa3WogVfitORGmatRUAxWOqlrfhIWyoT3inVH3Tu9XRGG5C4n6g70fIRTiBChK9MGnm/cVG254y5KMxBK69K17iSl9h6BWuGbBLoHtQn8/NYAYgggMwceo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752824669; c=relaxed/simple;
	bh=WDBDIUqsCnzltvgUWzAq0CeGp4GzUUJd8bx41+z9Kcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E1zYBrPUMAmc7j1hY6gYC/gNR4YOVNeyD9QzGDoknbApT+nbHwaDoDReLjAi6nWx9xm8LO/95HYGu/c3WQXB1Bk9S4M8t2SNXB3pHyvqlPdhsYkrmAdnhOPWWovyxocJTS84OU8cTy5OpeLnPvfXn/priJqx4H8aZ1Sx6CdQu5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FVUjETfB; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FVUjETfB"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3ddd2710d14so15421115ab.2
        for <imx@lists.linux.dev>; Fri, 18 Jul 2025 00:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752824667; x=1753429467; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tmlpmnVcGL0avS3PpdVEZ5nI3yJOcG/fmYBWhlTK0Do=;
        b=FVUjETfBurKHl1Vq3rMbvjcTkRtRWSeonT6/aomRFkE/G712IihEB1E6Y746eMPHLn
         7OH3IeG4OzqPX61djmihD/V08WKauXlLUUJJuSfNid1/1e4ZlfFBvTR+7TaLsXlwMROy
         WCfOHhsaPF2qTHYBOjV5oxuen53xyB4En0wM2SgM31K0SOvRUFBxLZzagM/K41vGTGnM
         cDwe3rre2kCOHTCIUE30eSq3agdK+FZer6SHAVyG4lvjpHK43amgQYkLLJWaIVCqJTlL
         /H3rfSB39Nz9n/1rrWoUaBfYTT6FET1wjeR0LfK+VEFge9/pRwwRxAgFMgqFv4kqcFQt
         REoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752824667; x=1753429467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tmlpmnVcGL0avS3PpdVEZ5nI3yJOcG/fmYBWhlTK0Do=;
        b=G5wbUItJKtFzawotBoEJLbboNgpiLW/2JorRCYAeA5jSnQcv9seApnsEwkESEyPHAr
         A2Z6rKYjXYkouzAEuxdMWLDSHYm/9vhn50H4U+QF0S4mTeo4vsi3oQygfXollBfUPVid
         9sgOlnGXj0bZW65S1j4OJEu8104INyt7DIgZ/HIqaQxYp0mmQnNMXIK3u+Zi4kIj7zsu
         ukicP5E2euZn3x0XkEdA9N2pZaJ/LKtMiMw8m9NWSqu1eqjviNcJX2azq1LUQgXImcFq
         U/osqakzmPMCkGZRTxU7x6Ztr9YIDtdO8Wi4uzGERM/egViw9G42nhZVn8WQ/qXhpWSw
         qMuw==
X-Forwarded-Encrypted: i=1; AJvYcCVkKHxv7hcpmj9RyTllJzTcu1RnK+xTblOyzRc5FZyfKYUntzD6WTlsjg6xeLapuj6Tw/A=@lists.linux.dev
X-Gm-Message-State: AOJu0YzMR3DYLvrVimjdXHwaeiXqVrCTWPA4ss2Ig6uwNQwLnrEUMXzq
	VJTeGHy5PQQqOmD3U0oHOj9l9JRcBO2IcXdzUWNxnCBCrdzxIp8gQY4Jt5MF2SSNG2kWhDQ8K8h
	TWnNkytZtHQdzJGKQ1EPWWHHAzLhsKIE=
X-Gm-Gg: ASbGncs9cmjSHH405DluS92jPCW1Xruq0v+rLYocY9hEPWnI0g3bvXDFhuN96qq+Pbh
	dxcC4qzh2TSuE/NphUs+lQMzQz4yYw7bmUoglJNGuoZNSkmdUnBq/Lhb8ZD1E3Z65i8cLNjmeN+
	5G49jymqJLbvQ4H3GJw+GF3Z7pQKSR2Y4f7txn1zz4Ed+EY5G84aO1ksoJCfFrp6eExz5qrEOi4
	FLb+2M=
X-Google-Smtp-Source: AGHT+IH/Caf1fGdiRCnZGzyv7uHAPCmM1WdkO9Z9jQd0Axtk4U1Tyu/Cj/IpUNTfhnOI1VU+WUcrVTv2SPAHM7ZXCgM=
X-Received: by 2002:a05:6e02:2188:b0:3de:14d4:a755 with SMTP id
 e9e14a558f8ab-3e282ed01dfmr112246985ab.21.1752824666722; Fri, 18 Jul 2025
 00:44:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250716061114.2405272-1-shengjiu.wang@nxp.com> <CAEnQRZC=qApo9C0zBDQoxpV56atLeXpoxZdyBuQ=o2y59YJEqA@mail.gmail.com>
In-Reply-To: <CAEnQRZC=qApo9C0zBDQoxpV56atLeXpoxZdyBuQ=o2y59YJEqA@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 18 Jul 2025 15:44:14 +0800
X-Gm-Features: Ac12FXyAcDWebSNzkWDN6xJ8YvjSpNbbipIAuGrOnyFeWn6RtnLG3gfVuS2c34w
Message-ID: <CAA+D8ANSdiEqKwgyb8S18QcuZv58211nxn+cCnRcmovgtu8Yqw@mail.gmail.com>
Subject: Re: [PATCH 0/3] arm64: dts: imx8m: support more sample rates
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2025 at 3:53=E2=80=AFPM Daniel Baluta <daniel.baluta@gmail.=
com> wrote:
>
> On Wed, Jul 16, 2025 at 9:11=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.=
com> wrote:
> >
> > The wm8524 codec is connected to the SAI interface. There are two audio
> > plls on i.MX8MQ, i.MX8MM, i.MX8MN, one pll can be the clock source of
> > 44kHz series rates, another pll can be clock source of 48kHz series rat=
es.
> >
> > Shengjiu Wang (3):
> >   arm64: dts: imx8mm-evk: support more sample rates for wm8524 card
> >   arm64: dts: imx8mq-evk: support more sample rates for wm8524 card
> >   arm64: dts: imx8mn-evk: support more sample rates for wm8524 card
>
> Hi Shengjiu,
>
> I think it would be useful to specify which are the current supported rat=
es
> and which will be the ones supported after your patch  (in the commit mes=
sages).
>
yes, will update the commit message to make it more clear.

best regards
Shengjiu Wang

> On NXP BSP you can run:
>
> ../../unit_tests/Audio/mxc_alsa_hw_params.out hw:X,Y p r
>
> to get the rates.
