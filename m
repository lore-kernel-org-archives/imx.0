Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C396D1917F0
	for <imx@lists.linux.dev>; Wed,  4 Mar 2026 12:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772628056; cv=pass; b=CIrFZbL3jPc0aZkkImSClgmXrTPLlyIsOXiB4z5Iz8+J/EKbqM2JWrQO6W/ApgVwxpJiOIe/shhV9wwjve/kpIWSCsrSb7kedV+100vkyKtdAdMbCWc92fiULUMFJkJUIzoLh7DND5e7aVLkaj9xJ1bxF4Ea3wKmnTv9JYn74q0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772628056; c=relaxed/simple;
	bh=2/WAS/0pzPoroLAGh2PLMGdVZ54HV/z1BsjWlFv4VDw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X/7KAWdAVF/r8e5/hUD/ymBCx2qKXTMCbRMlZ+Hnj28vpMYLqeIuc/DBPmxDP/+7aOxsB8afZGZARVeEW/CVu2Ty/hnI/xbr09JSO3Km2dNETmu5DzHj2R12wsTjhWnZCOKU9hFavnN3i5qvC8Wc60UVQVWF6DzIQ4q556KRylU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RARVKDW9; arc=pass smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RARVKDW9"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c6e248aa446so2681391a12.1
        for <imx@lists.linux.dev>; Wed, 04 Mar 2026 04:40:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772628055; cv=none;
        d=google.com; s=arc-20240605;
        b=UPP9YGsHiPY1Zbg9YxHI1BGTmE8OchbgkyrUILiBKeOUGCTjcO/uwTErzVX8Qz7LyZ
         LAO9zcySJiVzTfi7NX+0Q2/Aqx6Bq7Ej1NqTXRkuE26saN60QvKXP1Q/lQB6yGDXcGvr
         8Rv/r/wE7W//H7tHyCTP447KviMMzF7t0k/Qf37O/sTXR26LtQX1tMZL5iwWVeMzDX6P
         YR5GpqElJNLTD/HfkRbX+uNPBKaOHnMkE0EYqO0EszAPxSKBySBiBqf6IaIVDZqyzugj
         l2cKiERpfH2Ezy0sYVTJJ+bZVsrUovBWvG7NEZMMKnmaa89Xru5hL1zUCouMnMC7wASq
         p8Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2/WAS/0pzPoroLAGh2PLMGdVZ54HV/z1BsjWlFv4VDw=;
        fh=ZTF6+0E6ZDhQslKZiSPiFXgVlze6MElildT+3/F5Nb4=;
        b=M/EFmO8dCn/AD0h/vIqn8B8LUA2OFO2qfn98HITBp/4Mc1FW0OGB9tLkIslz1HSE3C
         p/hSXZRS/bB7ocewrVDm5RsjlVJS9n+4OB1sP3hRN+KYpQa8pX/2yn3WH8TUSi2rJSnM
         3bvmd+IAiFAtreLvsuPHgqNjs7ZnnvxiMrcri6remCXh+tHy2yrr4nlhNmfaw0kumjaC
         CZGrIxfOGzpxuTHyJJxzNg75ABizaI512gVPhxrJwVPKZXuNRcL9nYfxYmP7rzH/mEYU
         wERaBMkCeH4aXnMKZM0YdZvT6QigX+h/1e08xBqr+0XxF1MpQgk5VmYrU0bsB/msxdQ9
         +n0g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772628055; x=1773232855; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/WAS/0pzPoroLAGh2PLMGdVZ54HV/z1BsjWlFv4VDw=;
        b=RARVKDW9ewvpoArKD6F/0Vmkowfig9JWkazqU/XJ2qk+9aKdsx5apmpfyn98OXdwlh
         c1N8yBPxFKNS0rnY6n3Utaha6XF3PTD7YsVn2yiumwuS2+TZf66zjAvAnZ0b9Ef5aw2e
         rzlhhLf12ChthLdJMUamuZi7s6NsmYfd7kWM+cIWlB9Ol72XkmO0cJz233YQksfyOQlp
         8SgEpJzCXyyzVGL0i1VMBhOf7igdLB6CJfH27JXsaYBHXeCGOPFDOXlTkxeTfzZirYSK
         33QIw2UKU6kwG9kwScLjbjzrN/qtASNkQJK2mLPPCTyCUagpOytC5RLZz1pVRqFP2RGd
         tFVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772628055; x=1773232855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2/WAS/0pzPoroLAGh2PLMGdVZ54HV/z1BsjWlFv4VDw=;
        b=L7rIj6HSVt5AWT74hDikZoAWH/D8+2zMxRWXKh47p008QMHNdXmPtgXSXByKLhAOp8
         uk62ob5WiBQk6F5HSBGuQfDiexSiEsMSJP1TUcTF7sQQu3G+15wUKLBuU7fys4NYKKg2
         nKp2e6PfRUq1bkoXUZMyaYNESNZSgr5QvU+wwCGJmsD/dw0l+/fyEnWc7A9dqzQnjRYM
         1fjYxhUxyYUashgwlS/s2bla5WRRQUTGay1cmGBySTEyLvuzOKSSGzNidGQgueo9/SeN
         xa++31B+6tGCq1nVzfySMONwQuP4SsVdxmHTTC3PhIq8wkBOZIKl4BICb56o/2Rk84nH
         mJQA==
X-Forwarded-Encrypted: i=1; AJvYcCWNZxM7Ki3FnJxXN5QmkeUOCZAOMZBHR/SICPfF/eNZLPDqFfhfaN35x81v88trZJeFjyU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyDgUUYBX5XuB/klFk3bxAgSAhWS5pPMy3nb/T/qc1cYYm1VmgV
	RIM/Nb2ytnzAHtZORqtYTt3bxD58Rx7FjMXhWnb9TnyGLy9RcxPCwtaJ5U/qhb07UxXNmN1h/za
	vqMu+8o2DwJkTTQNpsiAA+iCza+kjW7c=
X-Gm-Gg: ATEYQzx7q4L/tJkP/D9T/pc9utksKQ/xJFwTCw+8rjZl6zZid0ipUaojuR2CSVBdaTo
	LF0AbLMd6Wz7TzSsJwwdf+2VFyU3vby4EW4gqJM5CMs6fkpJsnsAJgQbC9gD8UrsSV2VC7SOTbS
	ugoqO0bbTrpFeF0uh1xP/26fLzmX4ly7KGTH4yTWHfsFAR7icjtX5zkuzmw7urqL1LI1KpyowEd
	4hV1+0wYXXP7xp+71+QQMX0RJuM4eT5URBy2PaOLxcVBx9OGGtdJwtfs7PvPHgyA7zGumbl7N+g
	8mHVUwPuL33LmJDlHrY=
X-Received: by 2002:a17:902:ce8e:b0:2ae:4a4e:1e25 with SMTP id
 d9443c01a7336-2ae6aa649dcmr19233535ad.25.1772628054893; Wed, 04 Mar 2026
 04:40:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260303-spi-nxp-v1-1-b78570db28ce@gmail.com> <DU4PR04MB12275755ABE75588FF75BF65C907CA@DU4PR04MB12275.eurprd04.prod.outlook.com>
In-Reply-To: <DU4PR04MB12275755ABE75588FF75BF65C907CA@DU4PR04MB12275.eurprd04.prod.outlook.com>
From: Felix Gu <ustc.gu@gmail.com>
Date: Wed, 4 Mar 2026 20:40:43 +0800
X-Gm-Features: AaiRm519fMWevOrxACIjx0JfN7SzPZoQPXxnqjFQdS-XzmfkrSmDhriX6o8zRcM
Message-ID: <CAN4SLj2P3qzN-N4dsjzo-0bF9NPLG_-Ad5YWkL97rOrGo-gW5w@mail.gmail.com>
Subject: Re: [PATCH] spi: nxp-xspi: Use reinit_completion() for repeated operations
To: Bough Chen <haibo.chen@nxp.com>
Cc: Han Xu <han.xu@nxp.com>, Mark Brown <broonie@kernel.org>, Frank Li <frank.li@nxp.com>, 
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 4, 2026 at 3:23=E2=80=AFPM Bough Chen <haibo.chen@nxp.com> wrot=
e:
>
> > -----Original Message-----
> > From: Felix Gu <ustc.gu@gmail.com>
> > Sent: 2026=E5=B9=B43=E6=9C=883=E6=97=A5 21:21
> > To: Han Xu <han.xu@nxp.com>; Bough Chen <haibo.chen@nxp.com>; Mark
> > Brown <broonie@kernel.org>; Frank Li <frank.li@nxp.com>
> > Cc: linux-spi@vger.kernel.org; imx@lists.linux.dev; linux-kernel@vger.k=
ernel.org;
> > Felix Gu <ustc.gu@gmail.com>
> > Subject: [PATCH] spi: nxp-xspi: Use reinit_completion() for repeated op=
erations
> >
> > The driver currently calls init_completion() during every spi_mem_op.
> > Tchnically it may work, but it's not the recommended pattern.
> >
> > According to the kernel documentation: Calling init_completion() on the=
 same
> > completion object twice is most likely a bug as it re-initializes the q=
ueue to an
> > empty queue and enqueued tasks could get "lost" - use reinit_completion=
() in
> > that case, but be aware of other races.
> >
> > So moves the initial initialization to probe function and uses
> > reinit_completion() for subsequent perations.
>
> Hi Felix,
>
> Good catch, I think spi-nxp-fspi.c and spi-fsl-qspi.c also have the same =
issue, can you help fix?
>
> As Frank's comment, there is one typo: perations -> operations, please fi=
x it and feel free to add my tag in next version.
> Reviewed-by: Haibo Chen <haibo.chen@nxp.com>
>
> Regards
> Haibo Chen
Hi Bough and Frank,
Thanks for review, I will send V2 for this.

Best regards,
Felix
