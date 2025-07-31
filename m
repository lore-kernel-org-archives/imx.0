Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69151D5174
	for <imx@lists.linux.dev>; Thu, 31 Jul 2025 05:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753940082; cv=none; b=UTLDKObbDMCPUjmleFb7aquc11tQPzNO4s8gnVyW/pghXNccpitdBFmQSa6W4mWid76h+qUdXhMxqCqPkYYhq9+2lnQbUY+D75tFsmW3RgzpsKvhBMCS+6UnBLqsKv+F3d0kVMNuIZ4nv+fGssOmNyiwdi/TScIJuLY4Q9AmxrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753940082; c=relaxed/simple;
	bh=P4Sp2GDUfFML3x1uoKRtS9TflaYxWalc0AI94nd7XtQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NPJwem2SrC6BugzgKViFm1juAZACp9sB0XlYZU2pcFvOYaNNCgjEu9nrNI79jZksw2SrplycaiLtx26fgHct8qdhRQbjRic4CHTruSKCPU2gnkxKWvXpjl7nwe9eJ9+P2SCdwBXAzWqfNqfD+AbZD2flghw/LtkA7GEGBzlqcuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fl4qeRtC; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fl4qeRtC"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b2c4331c50eso417847a12.3
        for <imx@lists.linux.dev>; Wed, 30 Jul 2025 22:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753940080; x=1754544880; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4Sp2GDUfFML3x1uoKRtS9TflaYxWalc0AI94nd7XtQ=;
        b=fl4qeRtCnl2DPoXawpaX/YEXW6MiO+Dg7avkS8IzG9Ipm5VyOLZ0EJg7WiDwzbf8vC
         OQq316XykjWjv0OoLAPx3W/LXoIuahXxHpg0gPNh/fdkUR70y1ohQCZYHY1iU65Tnqhz
         yiP9pY/LZkYJuzM9Kh00fc5R3LfUeif+5in7p438BMTWesUgS3drd0921Kvd/ZZbsjKm
         mdBzCgoSEwfKLAvD9SjuIuLq7uz71w21BnRl3KIcvqumfWh7KOb7DM5d23M7HoDJGwnV
         OjAcMbNeq7NFbTj6rLr+eWmVHxHzhku//yq6e/mjlmeVky0HJLUX7aakWvd1Gl4pfJqK
         s0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753940080; x=1754544880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P4Sp2GDUfFML3x1uoKRtS9TflaYxWalc0AI94nd7XtQ=;
        b=AenUuUQZUA8LJuto2YIZcOKFMH2o1fj+Ijkm80rqIpJE3rj/n0Ofjh/NA5YczeQGH2
         NDtL4+Zl6JK6tkRFh5EUdvFdnO+AGGqHmjmfqrHxkiD7IN5UhYLp1bF9ZyyskZsQiwco
         VSvPftneBTUGCqjgqmt3zAT5yDeIxSyQx6xYN3ug9cgC9ngamApBkwrAiKmOxu9eWy2i
         /0PuauZdWyS7V75jo5YW9HflQ9MBQyxRTm9vD1axfdoAYY0SFVItqUko1NN0Z+4zv24k
         Gm2mKEHCR1A+W0mmabLJ4gEjYGOUmDI+Zn1rSQAHK67n/vGNId/QXZEGKIHY3vAtWpIh
         qa0g==
X-Forwarded-Encrypted: i=1; AJvYcCXfhSSpiikE8mK2piRxbo8t4G8Kd6h2aFnNxcuzixoqBIcAAXLmjUwV64vH1IX5vGKFE8s=@lists.linux.dev
X-Gm-Message-State: AOJu0YwW+e4rNe36ErnNafzPZUTy00WIy5P3hV/dgF7Aku2v14yCOXWf
	mLmfK7BEAoi2wlT4xK7YZNWRSfvET2WvwnbLZbk59W9/R+zNJn+9BJcb8FbvnJGb1cr+9dNh05T
	tkM01aKC0kE8FQaxvS3Am9EnQeqRT2p4=
X-Gm-Gg: ASbGnctYYKLpzekVpibu3xQ/0OUddJxIHkDYWTx26/iQSiz0rfbHYxWNxDx/h5mDRGg
	ZcsYrqnIALApq/EKJcrgJBQl6581+Lv8ax18tprllJOWrTuMl6xutTEY6XLjxz4siMeeE9P7zsu
	/3IRfr+Z2xcAQU3sxrLCsUclkz7xbn/M2xhSr91ZzoQQ8EPOcVBcYnzmLvCrz0wt3ZJh7w6MU/s
	jZH
X-Google-Smtp-Source: AGHT+IHXrxbbNNYCinyHQoskYKFqoXHqmo6YX2SFTgg5APWeBRHOh1sgrx3dY4RlljDqEABe85zpkVvrzPg+EkqADTg=
X-Received: by 2002:a17:90b:5847:b0:31f:42cd:6900 with SMTP id
 98e67ed59e1d1-31f5dd9de96mr9675756a91.12.1753940079962; Wed, 30 Jul 2025
 22:34:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250730125932.357379-1-laurentiu.palcu@oss.nxp.com> <20250730125932.357379-2-laurentiu.palcu@oss.nxp.com>
In-Reply-To: <20250730125932.357379-2-laurentiu.palcu@oss.nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 31 Jul 2025 08:36:47 +0300
X-Gm-Features: Ac12FXy6016R5yBjERUVNjJ9NaURXNKHJ2pnztmaFYpAtiC1FehtoRDqe3M3hL0
Message-ID: <CAEnQRZC5UDTMeF==2POenjw+YK6X4rCPCH_XN1Jq+ULJLofuqQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: imx95-blk-ctl: Save platform data in
 imx95_blk_ctl structure
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2025 at 3:59=E2=80=AFPM Laurentiu Palcu
<laurentiu.palcu@oss.nxp.com> wrote:
>
> Add a platform data (pdata) member to struct imx95_blk_ctl to store the
> result of of_device_get_match_data() during probe to avoid redundant
> calls in suspend and resume functions.
>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

LGTM,

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
