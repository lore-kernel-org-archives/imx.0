Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E73013A244
	for <imx@lists.linux.dev>; Fri, 18 Oct 2024 21:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729286003; cv=none; b=ulChZ0fi+9pvqF7m29REXTHZBVqoN5aAPCqoWtJoJJdiFmIuD62uiU3SbtwkTRCj3jVvD9/KnTcsMI6OumHmvV1gR9NqsocGraphZ7j0qDry2DNtZ/oxWfJN5oK0OLc9TnvX+p5ijAOsIoN6stJT1wHyyheZoQ37512ghabnBNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729286003; c=relaxed/simple;
	bh=c3tp8WEfTQg96L+JmiTzQuNoT8H1hD7dHZSz1KNVVKs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=auZAlv2sVFfPq4cDdeoIaZME5F+cixw9MPE3U34sSV691bm8HzzToKuqc2EuM9vjdZpFr5wedJRNrSE4njPfrgo9uokLRb1Sy1qSzAZKFeB8ObTmss1HjyYFUORj7iJG8kJboI8b4RSescXSHfmJc97m97h1jtHE2NGJSVm2gS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cKxIS/SA; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cKxIS/SA"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53a097aa3daso2614984e87.1
        for <imx@lists.linux.dev>; Fri, 18 Oct 2024 14:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729286000; x=1729890800; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T4x7ryulF+Xq2OWl3XXy8Jt9zfrfW6IZJJuqxol9fSc=;
        b=cKxIS/SACV2Vy2j61YFz7WltQ/Pwq996AUiASDoLz3LqkegK5hA3rfp+jCALJgTxph
         uyckDrfqXJz30oRLTA4m/LdeV6kBs2K8SYzVdmulJfrTFJpaZupYWVJSNE6JSwb8nB3I
         T4K9DthjbD/1gC1/iM5Ioc7QbKJba/AZBOy/5ckdvFgiYIEDRsy8HsqIJAiKAq6RbzCC
         6vAfTEiOEFr44b984YxCojFvsOAt2msuwdSLTSRy9lYtlXGdRSRcGNNYKwaLUxOuXDEJ
         +fcEbjKC/FZBXWeDB4B1I+ad/FlUo5b73MCVLk3NZOYRJgizsPRpZ2eTWnkWhihJpoqL
         4IkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729286000; x=1729890800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T4x7ryulF+Xq2OWl3XXy8Jt9zfrfW6IZJJuqxol9fSc=;
        b=nKp3JTX8hj7xdY0CiA8ngBx5eBkAJ19J6P1YRc/j83XELLIV4/B6q6cpFFdO7YoXtm
         Ws7MwzhWzI6KInTGc9p5NcM/U5T1VJWf4bp0nN7A4zyNANB7nkG5IfM5FNdQv4QoC8oa
         AsDbVy6LO27DyGIO9d5l1iq64GoKoCYNsMKj4NNCfyANyjc35V2XLMNhqI44VQkn4vsY
         KC2YmBzO69upSun1gm873UBzBja3GZiaJF47px6TWHnfKE4RjP6gppUyYKNLkwhmonKc
         eG+ncGR1NCT57ic1qBkXaSY/Vtxm7GO86BOSIULSYCSF/LMHnvzkeFEZvVATx3eJfXc6
         z8Ng==
X-Forwarded-Encrypted: i=1; AJvYcCV0qnM3UMea0LtR3hm4VgXF8/gzLrpyk2Ja6JxPQw60NjIiRmXi9zH11lIssr6pCf0eiXQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzMX8/u7iHo9GfZrg+7l5f24z4QLIfavT3yW6Vm0+fKSu/EJ8pr
	XhqH9vJrOryhlBNdz/n6wOnVK7QwBPM8Y7sd8YMdifrFJH8EJAe0Kk+IZDeRMThcHmYx0JpO/aF
	ZSv0jo5b+QQpJ8L+SckVigmzpBpY=
X-Google-Smtp-Source: AGHT+IEErlKXWoPM1xS28jgh1kUWgN6OFYJM9ESE/RBdz6vaFn0+yNR0nyqNLewi/Mv0WXUwP/askR+vNF7ulEFp5Fo=
X-Received: by 2002:a05:6512:104f:b0:538:9efb:dbe4 with SMTP id
 2adb3069b0e04-53a15449685mr2238300e87.46.1729285999322; Fri, 18 Oct 2024
 14:13:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZxK1yAZkJOTQN++s@lizhi-Precision-Tower-5810>
In-Reply-To: <ZxK1yAZkJOTQN++s@lizhi-Precision-Tower-5810>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 18 Oct 2024 18:13:07 -0300
Message-ID: <CAOMZO5AcyVeq8TN9qK=_54gP6y_rrCLjh22LnA=E6pLnxjbpNw@mail.gmail.com>
Subject: Re: panel-lvds for imx8mm-verdin boards
To: Frank Li <Frank.li@nxp.com>, Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: marcel.ziswiler@toradex.com, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Adding Francesco.

On Fri, Oct 18, 2024 at 4:24=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> There are some dtb check warning
>
> arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dtb: panel-lvds: compatible=
:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'chunghw=
a,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070=
wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
>
> Can you help add actual pannel-lvds compatible string to clean up these
> warning?
>
> Over 50 lines warning related this one.
>
> next-20241018, all warning under arm64 freescale is 814. My local tree
> is about 138 line.
>
> If you can help fix this warning,  It should reduce to below to 100 line
> warnings.
>
> Frank
>
