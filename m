Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F973BF69A
	for <imx@lists.linux.dev>; Mon, 12 Oct 2026 10:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791801741; cv=pass; b=bMKx1Om3F1aC9xZlQsbqU379lZ/wJXzVf4BHls8hYd2QK9u3hcS37xn5w7XZ75VqPBLY+SvTDIXf2ehf7q+lSWZtQfmsmfTcl5Hw/JxSPHvi/KXVrjfsh0xncbu6zpIanYjE3Khl6i9+7fwoohs1tYllP8JLb8m5FfLjmZi1gYE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791801741; c=relaxed/simple;
	bh=yD/LRzCXLzuKvkdgwfHxZGIonOOMzZ6oGk+zvJrPiw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FQRuBceELwUyBG6QD/iccAFbXPfC8e82LLP3wb4yDrvLTQruMrFQvdESv7UI2D3JKZAat53it1C9ZMvqUMjIt5BLL8GHWJrkxtbX53HUoZe5H4JtxC227HDWHfrENHZaYqXwkKGaBXdp0v5Ienkp8VuVeCFuWaNXwdScFA8lIAg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MeGKW8CB; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MeGKW8CB"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3a9c92ae2baso14140671fa.3
        for <imx@lists.linux.dev>; Mon, 12 Oct 2026 03:42:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791801738; cv=none;
        d=google.com; s=arc-20260327;
        b=sUl6nNZYCYQdmT+OEewSeaXFE4mRcvESuj+4JUAhz1W2e6nza2b6tQT5eDbwJovLo/
         UvvRrwj40HOa5xSMD9hfp/hjKGMd5nPtTemif7WGtWGvjjXvANr1WfeuhOm833ZcB54C
         7Wdb+uzajAbH6pMAoxQJfcHYKbk6N4YjPEBdFiTgf04f2ToKc3LflKegwzzZ1V48FtDw
         C07qyST+/unVIZlBZ+ttVyOJWy0WDFt4W/Cq9AqBQG+FbkIHnyRh3DcAIRyea36NkTYN
         9NoGtIXzbnJ6LVZx6vTkg/YX70eWY/Ii2pF6tsGGxxSjcSm0CZdRi6CMdtwwayd3wieK
         pcUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yD/LRzCXLzuKvkdgwfHxZGIonOOMzZ6oGk+zvJrPiw0=;
        fh=Zh1AN702vKRgHo/xw90D6fMre47Qh7A7u7vjjLl8psg=;
        b=Z3kkegfsUO85B7u9wbAPPSw9zeSziYabN2BPE5AtCfWanve0ek8w3+TCrp2upy7G0Y
         OzRv/kcV5zYgT7oR/Vh7asTXQkmnl4Uhk7FhqOUTRLpvkfpxXmsmLCSZy8+NQcTjWSzX
         ewX1pK51u9g9uTcnB0t1XhmbdavjS23sBn5fAkl49TJfW8nENBkRmoopis5fYlpf5gmK
         ZJ1b5jcAa2WlGRFv9rmFekOk+uv0SDoDCWKVBoIx9slo4S3UW9kAppG1YmIOrWl/88Jh
         8C1lhSJDpU/mXdc6Gs23OvUWxwFbzhdHsjQ4GqjgyKTlhwmhiTWXnBMSmS7H3I1EA17N
         3gGg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791801738; x=1792406538; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yD/LRzCXLzuKvkdgwfHxZGIonOOMzZ6oGk+zvJrPiw0=;
        b=MeGKW8CBCXnVmgjoXRsv/Z5SXtQDEcuBVrVdXPUaBV7aA4QroNkfmiWPpeD4FtkSDq
         f0DNS19NoCFLXelt6ezTbOAjjRYEWjacU5zZtFrKUQX4Vft5MwSg5v6ADZU8j8YobmiQ
         xyXCDdADAcjb0aseW8hChAV8qkqN6LygdVoySDwOiJobTMRqRH9jWMbalkHJl40Ihgpg
         zvtAVfC+6pTqsmoJ/j8qrUKLRQiN5+iEQFIkFMj6FIRwNcOvkwMa/FSLkOfMS6iol+db
         x9Swfyo/S0GRrechQxrN3siRMcITA70QEhxI7YAYzQy82Mp/LMlb4kMfzd9yt1gkCNBl
         yYSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791801738; x=1792406538;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yD/LRzCXLzuKvkdgwfHxZGIonOOMzZ6oGk+zvJrPiw0=;
        b=i3ZsyVffFYb+XS/FJPpYRfeF6KMJVjIuCANIsomIhRiEK5ciV8m0okKGZ7yamiLnhh
         IkyQMiumJi0EUn1+iqEu3W+tlUczxBHYqQmbE4p/U8sqqpcAkFLNMEZrY5ix0WNkNEP0
         1gD32MQE76KiJYhrhC26jpaX9o1fQprD5KhaSOPcrVOuEoOdVPajKf6tRsR+eZNFauWA
         YBJk4Xqr3t2MhvbCxC/o2EeoqJvuQ1qS64lzRhY2ZzOsVTgqoXMyhVu3VqcG11rV5dw/
         PzkNry00NRVyr1O44PU4hLSngN4wByyPUlIZ+28JJwIXVDy7VPyuFuT631TewcHE3cmh
         eaqQ==
X-Forwarded-Encrypted: i=1; AKwUvBzm8C/Mbmu8s/GxAj4mypTle3r2R5Q6PWqjAVizzSe6a/TRxjtRuJZqsHT8FrfpbF3P4Hw=@lists.linux.dev
X-Gm-Message-State: AFq9FYLRt7b8F+Byx2iqXupO+zBKnXi/IoREkCg4fgb2eVyibktCvt6+
	vHMThrIPOYox6f7qTDCU/vnd+dfx+abaHA3MOhVg0quRiATDW+j6JmVuxMprbUEkWuEsbX9aud8
	nn7LUpecIAspeqFPiBXGkb6ZT/K3dCh8=
X-Gm-Gg: AYBFou0Z3Zo9tjp44vM0RmAT/+xtrYqpkfdX4feWeaKi0R4XEsQ9K/W5vpyrS5CWWMp
	8fmfIoB5BCu+fTx0MNP7O2rex/VW/koBsz1dqa6LGgHWVO3DumDPeX9gyx9yf8qbUFONwTY76Ny
	YXX7JqTkaRjw2b56s4b/4ugqL0EkRGpew2NpERcAF2YVnfFG39cHZARoCyt7LMPmTWGG2T3BOma
	5WV29dwWt0abUo2oeLg8jqlzOL7ckdRg+pabbkNJtgzBb32XxGiG4iqX0u4ElgOHBuqaV/HyWFI
	+24vmbZGABbCINxknNjmefGhlpCPQ3yA1n5AZ3ceo0zFcFdFfIt7tIauYTQ34WIRXSIMJywtan3
	Pf8DOGwsNdsfdRRBJRH2o/4loj/cwiMOk/YgtmTZ3iDONz3MxpHyoPk0G+zDlO227go/2/nKcok
	IJrYF5nwGSM5B6RN0y3EUrQmajt7hCk661pzJaASEUNA==
X-Received: by 2002:a05:651c:b27:b0:3a9:9b67:25f7 with SMTP id
 38308e7fff4ca-3a9c53b0b19mr23170161fa.4.1791801738046; Mon, 12 Oct 2026
 03:42:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
 <20261011-gpio-mxc-cleanup-v6-9-cb47ce2ad758@nxp.com> <CAHp75VcktnQVpqLADs5AccUj6U7KLjAatPaSzMX8SXDrbbs6Ng@mail.gmail.com>
 <asyyLJ3nOUxJ8TKq@shlinux89>
In-Reply-To: <asyyLJ3nOUxJ8TKq@shlinux89>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 13:41:40 +0300
X-Gm-Features: AclHuK-RRzScLhztBzLfy8Jh6NTaM_vTOn9ggo9DZdIceERnpI8cnWgRhuFuAK0
Message-ID: <CAHp75VeRG01p06vT-8-a=VsFj5PKRFH-jUNi6jeerJrHfshHjQ@mail.gmail.com>
Subject: Re: [PATCH v6 09/13] gpio: mxc: use cleanup guard for
 pm_runtime_get_noresume() balance
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 1:06=E2=80=AFPM Peng Fan <peng.fan@oss.nxp.com> wro=
te:
> On Mon, Oct 12, 2026 at 12:38:37PM +0300, Andy Shevchenko wrote:
> >On Sun, Oct 11, 2026 at 2:54=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp=
.com> wrote:


...

> >> +DEFINE_FREE(pm_runtime_put_noidle, struct device *, if (_T) pm_runtim=
e_put_noidle(_T))
> >
> >Please, split this to a separate patch and move it directly to pm_runtim=
e.h.
>
> Frank raised same suggestion in V5.
>
> I tend to avoid introducing cross-subsystem dependency and use a follow-u=
p
> patch to move it to pm_runtime.h

Alternatively you may not use it, just carefully put a goto:s and error lab=
els.

> But since you both vote for pm_runtime.h, let me separate it in V7.

Also think about splitting the series to three. Do not rush! It anyway
missed v7.4 (except, perhaps, the first fixes part).

--=20
With Best Regards,
Andy Shevchenko
