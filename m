Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658D027A934
	for <imx@lists.linux.dev>; Tue, 15 Apr 2025 07:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744703976; cv=none; b=dUD8PI32I6+thKDd6uST4mE7UXZsKPiZ2U4SUEqkpO9JmvwhvxRWILkmx184Y+4Xr/U3NWiq/p7veUaNGUxFHWDi7cqwhWnjmMl3g53ya5w2qL01/BgJDPUXV0EHhIPCvA3+MDeWa2XKMXz27JQWHDQh1ddx+gzyLOBcrDuK3VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744703976; c=relaxed/simple;
	bh=uR1O8ZZvZmjOBhiBYTQskmTA/I3mjL0NlKi6//xSjZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sg+mWouwP3QLRkw5XRlL8SV7BkY8JQP52Ilp2dhK5ee8WOAfyNjgDyLf5iH6tQ45o9gzcvT5kqTYLpCRRb8CZnTHrHWwc4IH5Rl4kCM69VX+sb++xb/8XM9qYKhjnRPBRrqph3+aj6w0GzbpSRKGVkVDKpZ6fustggA8UGj74Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E47qIDOn; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E47qIDOn"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b041afe0ee1so4295641a12.1
        for <imx@lists.linux.dev>; Tue, 15 Apr 2025 00:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744703974; x=1745308774; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wEFV5bIBr/cofPLBiI3DIVx6RdeQqkyirfkoTqfZW9w=;
        b=E47qIDOnYqeJ4ut/UcDh6njOO36J0uc1+PditVqsfUjR3MUEpmXM0dHOrotUnmd16D
         1F8g+9REbdf2ECXEFbHJSZhEZs7+n1Yt8C2gfi6XHpQQyPH7tnDTD1WMi2S4wpsIYy9S
         mr3VVxNpjJr6CNx4QyUdm0QDPQ2RDaNUsFfwm8CQfn/kDxOAD5IPPDd6SHeXoSEDHSKT
         eyJFE0d8BMhqicjaKRKLu/ikp2cH/6JrFkjgsx+Kq9W+zdGiVxuSp8RXkuJiOG873+r5
         +thUhN0mZVCBLnSj4xWW/27ssJ0jMvbBHT9CL6In/OBGBlUYS7hKoZqn9GGY+/ORGLEw
         IbWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744703974; x=1745308774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wEFV5bIBr/cofPLBiI3DIVx6RdeQqkyirfkoTqfZW9w=;
        b=uAzoRFYqPPSu+ZNmK2YFE8PFBmJLNSj2iB46REzk5ZYLmJ982xEBjsDL2Kcw3TDZDF
         6tm+STouJuzzA0L2Z+XXyqdbRDIjH6NKeYCb2/tqP0tL2f2nAUS3d9MQ9F4oSbVHIxPQ
         jo+V0V62JW+c3DlII7+2d4fY2HGsRiXbgLI0rSheEWYLwXf1igkh9kEm77BB2/2AyiVD
         EAdMlbh5QZriulF6sFCT7v1kbP7w9/6Xv+LQgcMq6dMlD9gGEG+M7yngkCd11H4ZDyoe
         IJUE8es8LB8J+U+fMouKQgoXt2pWyORCjNXsMfv68Z+Yi86UqNhmax2aGg0jom4qOmDH
         zHMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHjHIwZwEfXEN5IPfMaDLrs3HYuAaIegot4xnL28cXR/Z2N8yE7xVu0Vf/0gs/Sb+3VJI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwxQBWUqe8qfQpAqdP5/nvkSPIdyN/hiIccra4lmwzRTuYNASnC
	LmKZ+pblDPTuhTo09CN11mhWuOQe1hHxh0nw068w/JJ3irYXgls4gERj24/0k950YzjWlguezBW
	SAQBl0qu3HxB+kYci6AGAs5QD+DQ=
X-Gm-Gg: ASbGnctTthtlGTG1wmC6sgSHN1sbcrIq2uTgiDqIDFSnRME8ItYGzIGlcYkM5kUsCqR
	fJCZ9P2jdhZ8ynR1wzXSpmu/NA8fet9zzXwUtOAxMnXY8GcHDfoN7gFHmWeQfamVMdctK45YP5j
	eQi9jE7Nj/iRl9BmoqYA==
X-Google-Smtp-Source: AGHT+IF2W8A4YkSqajRi/sexIZznSwfdwcvCj2cIEypd4+D6fw2CUP3Kw5bGACl/NOZEQJwvcxcQkRM9OjIrn7a8B9Y=
X-Received: by 2002:a17:90b:258b:b0:2fe:b774:3ec8 with SMTP id
 98e67ed59e1d1-3082367123cmr17928270a91.23.1744703974638; Tue, 15 Apr 2025
 00:59:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250414171511.6c7c80af@canb.auug.org.au> <c2a9122c-1e03-48ec-99a2-696915418e25@infradead.org>
In-Reply-To: <c2a9122c-1e03-48ec-99a2-696915418e25@infradead.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 15 Apr 2025 11:01:19 +0300
X-Gm-Features: ATxdqUFkkn10zwLQOVbjH3hyRsvPbQRipA-IbqqBhLmjY57a3oZXmPOpGm53Qrg
Message-ID: <CAEnQRZBZ-w5ST1i3Kw7+w3qEaO695rEkK1-OTXDde7yBGYfVSQ@mail.gmail.com>
Subject: Re: linux-next: Tree for Apr 14 (drivers/mmc/host/sdhci-esdhc-imx.c)
To: ziniu.wang_1@nxp.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-mmc@vger.kernel.org, 
	Haibo Chen <haibo.chen@nxp.com>, imx@lists.linux.dev, s32@nxp.com, 
	Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+ Luke Wang

On Tue, Apr 15, 2025 at 1:20=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
>
>
> On 4/14/25 12:15 AM, Stephen Rothwell wrote:
> > Hi all,
> >
> > Changes since 20250411:
> >
>
> on i386:
>
> ../drivers/mmc/host/sdhci-esdhc-imx.c:1608:13: warning: 'sdhc_esdhc_tunin=
g_restore' defined but not used [-Wunused-function]
>  1608 | static void sdhc_esdhc_tuning_restore(struct sdhci_host *host)
>       |             ^~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/mmc/host/sdhci-esdhc-imx.c:1586:13: warning: 'sdhc_esdhc_tunin=
g_save' defined but not used [-Wunused-function]
>  1586 | static void sdhc_esdhc_tuning_save(struct sdhci_host *host)
>       |             ^~~~~~~~~~~~~~~~~~~~~~
>
> Full randconfig file is attached.
>
> --
> ~Randy
