Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFE3149E13
	for <imx@lists.linux.dev>; Tue, 24 Sep 2024 11:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727176055; cv=none; b=oejnt82pxhXdgE1tjPvdfybzDkmrAN5PJpogS0Lrg0w02O9RGgHd57ajeBUNCV+jrdfngoUyhEff8SHPDoPnCpzmkg7oo5ikR38ZQ2+JCB0njAmeGjokhXK1Yd6t0VMfhLOFSZ4k5JwXJATRszgu+APV3IoTE1ZGVzwO/1A7yYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727176055; c=relaxed/simple;
	bh=vDlY6jpRSj+T7ZW8ZDZhyMjjU6W0gpKFuQ3eH2CfT9A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C12DAW73p8AcAd7K9nPQ2mBmKfAlS/+ZrnoJQqX6H0swKZ11m1Z9pXdqSWqxl/Vuil1Et8FihQMCByvb/U+LSaGuZIAvmO8NdhrNqUDATa5rZhQlfWYiReWNCfNLBNaswtURCRV46gizyebxjhPGkvDObGgh4SOE6tKs8qSUw5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TotJqFvq; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TotJqFvq"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a8a897bd4f1so808842866b.3
        for <imx@lists.linux.dev>; Tue, 24 Sep 2024 04:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727176052; x=1727780852; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDlY6jpRSj+T7ZW8ZDZhyMjjU6W0gpKFuQ3eH2CfT9A=;
        b=TotJqFvqzFP6cFOaUgeP2tMHWAFDDenmLp7KiBeHRG5c+MBhggUkOdHYQHCjBqwly6
         wkxBTrbXXCta/KyHqo3OK+qUUl4483zXZhUlbiVocf06nLuW8h1BAQEurO4ONasOwoLS
         3ZMvBdf36zj5OS1C6oiA+0kaygOqEXM/fM0FAtrTskLJOTrHEwGD8uGpwTfOEb6+/qow
         B3FLrDxcQZtTkGxfzP3UaTQZuaokKZDgBVX0UEUmuFwvgBpYLbk+kn0bC6JMPzel7R3T
         8aw5almLlAE9N+N5/+UL9I/DPD1W2gNonOAdHgU1mANDwhcNQLK2bIiuhmjke/mkSGLz
         qA1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727176052; x=1727780852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vDlY6jpRSj+T7ZW8ZDZhyMjjU6W0gpKFuQ3eH2CfT9A=;
        b=DGeN30UwYzYu3SJJno7gyyurpE0afwdB6FPsFxGpYNOUf8EYcF88oc1dSzg/AtH0sg
         4VmCoZRqsMBQB+VK1tS3tm6MKZjIAZ4DEqW6sKMEqYFWOKqg57RdbJIEhYwppIEK/fQv
         J8UQQ7WY+kF7fa/HUf7ESY41zE3bM8G4/ANtiZT9/irqsEzid/3m/m89cvBdzBnrFJq8
         /ivXnUWt6hutoHjA0v2Q9pEbiJBiDwkhXcLsee2124YbPSe/qKABZxJ/zdyupU1WRrdU
         f8SXsVJc5jEkigVd7DtGlyqct4+z03PaMFrmkJZ4Sfdy9dghTwBFaY/IXHc7ld69Bq6D
         I0EA==
X-Forwarded-Encrypted: i=1; AJvYcCU1typJIESUSjSHEssWg7H9pdG33F8pY3PN9oiOvvJk01YAMnltGmu7jJAaejSDQqktDY4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzbVRkfcmuVDmBizm5WumvS95rgY/8Y3+o2BcLcjGXkuvF8K2s8
	S5WhCsA0mKMW7sTmgwe1LKhrjzajDzfprg3nPPx1iYRNnhTEHN51IqC6j5dikRw/3mux46qzo5Y
	mwvzzuCK9lHVhJsmhZeTrROCBdNg=
X-Google-Smtp-Source: AGHT+IG3HdsRc7QM+IEwBYc/UDvbaTCxK9b+KAf5uClMdu8Xw/sPwq5oksTAoaulH/zR28+iDEGNfb6BD1GYhNSiPoQ=
X-Received: by 2002:a17:906:99c5:b0:a88:b90a:ff30 with SMTP id
 a640c23a62f3a-a90d50d6ee5mr1627389266b.50.1727176051720; Tue, 24 Sep 2024
 04:07:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240922174225.75948-1-laurentiumihalcea111@gmail.com> <20240922174225.75948-4-laurentiumihalcea111@gmail.com>
In-Reply-To: <20240922174225.75948-4-laurentiumihalcea111@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 24 Sep 2024 14:08:31 +0300
Message-ID: <CAEnQRZAF3oDS8xas6+p2f--XduKvX+jc09=x52LFLf55EjC=Mg@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] arm64: dts: imx8ulp: add AVD-SIM node
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Liu Ying <victor.liu@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 22, 2024 at 8:43=E2=80=AFPM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Add node for imx8ulp's AVD-SIM module. This also
> includes its children.
>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
