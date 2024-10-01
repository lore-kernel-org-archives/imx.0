Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7371CB505
	for <imx@lists.linux.dev>; Tue,  1 Oct 2024 16:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727800961; cv=none; b=EhKAysqgKuprWxX6RpZ65oC+7rYInAd9Q2U8lZPpM4hHKuPAm8D9afsV16wFcFgGUdjLxciIHiYdxj9K+9QBXM+zLe/98JHr+tXaBCfX1uuUmCwfrKS2HKWLixyaxbCucSemLlWetvx+ykQrVVzKZgQzGhOljedytCKwiVnXOwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727800961; c=relaxed/simple;
	bh=qDk+Xk5T3BmfKW2hoygle5OjFf/fDlqRm+H/1l0P5yY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YGf72snR7Nxo+oIHiQ39p60mELcsWRQjjg4vL7U82Z1KIT7nfQWP7+NMhsR0Pzz0+lmMYHlwTDZ9cgcdb5bWr5ufgWhQsy6UWHiFbDjESH6b3M9rJeG463KoaRpXOyppoExGm1gLizwb4xiUSDQRKbXT2RL0LhEO0N2So8fWh+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ae4lnpZL; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ae4lnpZL"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5398996acbeso5087662e87.1
        for <imx@lists.linux.dev>; Tue, 01 Oct 2024 09:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727800958; x=1728405758; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V6i7vWcWmPggAvHHEAieW2NuSXRKfSov4TjQFiR69WU=;
        b=Ae4lnpZLghPlmG4Npo8Y/2gCytJ2q5hnqKqAN5bkCMkltY4xCd+9AGYfShch0oi7v5
         /xT3tc1/kC+q/wiQ4XO0dGmw3rt2X/FNV5mEHb1OSu35mAp2vOnW8DdTNgxBv/okYPLR
         joz1YJrQ1bB+zQ1dyNaxUTSsjIhXGkGXP66gDpDZ4dckAyCWr66o7RlwMgKV5fxnl5/F
         wDh5W49IxqBv6HtLI1+e0ejsiiL2kARZSJyx8U45S4IBwvxXa/emhiH9TWqGA16/0M2Z
         dKtcVPL37ZCPSpG5WqQTVDzgHa7XO07qQGAFbqqRJIDKZkNDgJCtVcLh6wckLK7X6vjF
         aA2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727800958; x=1728405758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V6i7vWcWmPggAvHHEAieW2NuSXRKfSov4TjQFiR69WU=;
        b=nyyC4/9slK/QEQAdDYVOqoccqD33GJOtiUueu7LHybeGrCU8V9iXgCAHuK/unmGRQk
         u2/x07dHg4Zss7BzCyXENJEdj7wvDVas7SKk3xgApLUbUkIkR23CqnC80KC4rkVf0kYZ
         31ITxglPVcteDadp7GAvIwDLzjfIHPE3+cMYq/CIiz4zh0iyh8rGwA5MpGPO22F1rX6n
         KvBuOnrj7hB/Y7dxqOYrugoJpmpgQE0e2jHzdAfDZm4jIwStfpvh6L1ZMGkrZxgmYQ2H
         XjNbMu+HvMTUoJ/f+6E8C+0OhApWWDP5YcYNtv8nGx8aICfXIxNkYHYLWb6Bac/kZg0R
         ifhg==
X-Forwarded-Encrypted: i=1; AJvYcCVRUPFVdMpBAFWMm20Xm+o/F5Us3Pi2MyiPJTYzLDyF7KlqnFW3Tzy8iO5pFsa2EJr6Bi0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxhZD3UebEW6A7uQEFxC06mr4ccsZfBFCIQQNB4xiNShfpD5dCA
	986bfXfHalVeorreDFJo8ZaOgU9DwpGfzE0dV/xEeoKxYI46XdLqLJoaw0hcUEOXNXSDRPpzloF
	qK1MsJlCcU4aPewuKblg2BhvLPFI=
X-Google-Smtp-Source: AGHT+IHrY7301UmnL2Imcx/jn4R4Bb+f9nqvndhDoNb5KoBwiAbH01vr7CF3mvxGbkFApgIhoFOuXGohXFlDj85XM5c=
X-Received: by 2002:a05:6512:3f11:b0:536:54e9:3a63 with SMTP id
 2adb3069b0e04-539a07a339bmr7710e87.49.1727800957816; Tue, 01 Oct 2024
 09:42:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241001163106.4169421-1-han.xu@nxp.com>
In-Reply-To: <20241001163106.4169421-1-han.xu@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 1 Oct 2024 13:42:26 -0300
Message-ID: <CAOMZO5CsoTAPHBkuDw_zgArRX0g=aUNeVJQPzD=dv9qTtjXU1A@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: nand: raw: gpmi: switch to SYSTEM_SLEEP_PM_OPS
To: Han Xu <han.xu@nxp.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, imx@lists.linux.dev, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 1, 2024 at 1:32=E2=80=AFPM Han Xu <han.xu@nxp.com> wrote:

>  static const struct dev_pm_ops gpmi_pm_ops =3D {
> -       SET_SYSTEM_SLEEP_PM_OPS(gpmi_pm_suspend, gpmi_pm_resume)
> -       SET_RUNTIME_PM_OPS(gpmi_runtime_suspend, gpmi_runtime_resume, NUL=
L)
> +       SYSTEM_SLEEP_PM_OPS(gpmi_pm_suspend, gpmi_pm_resume)
> +       RUNTIME_PM_OPS(gpmi_runtime_suspend, gpmi_runtime_resume, NULL)
>  };

You missed to change .pm =3D &gpmi_pm_ops, to .pm =3D pm_ptr(&gpmi_pm_ops),
