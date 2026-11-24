Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795519123;
	b=VPa33mauECdb+4NkOnxXfCDvrQlBG1Ttg/3QhbJIBSLw1qHM1DdcD7nnyh9UP9AXUfJN
	 B2qfaqhfeniz4G2A8ICWy7dNbsHIclqt+YE/C9rrUhQsw1JyZrB0m99H7UCWh6dvG24g6
	 la3mInJJ1LwjbV3/+OZYRYGMmvrCdk0vz+y3200hDnrMXm/M4OhwxjxqFuA+JCzuI81n8
	 /1x9M3JOzEzSeRrIHTNrqfSnUhRyweIJGcMJI/9hJL9PjGguSxGs9XB1GeivohHxqkFD6
	 tO73rjfVhps5zdY+BSGNNARIKb+FP2rDVxZfABC+h7aFDZffqObKotFEoPdTZKe0CUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795519123;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zWCBxQaDnc67itD7Zy69q7XjxPuH2oichietMTNWCaE=;
	b=IRcwW4NkTot1/+oLdVKglmnvnfSS6CMvQhAdwoZxW+jI7N49Xv1A/3A7g+b/bPWrfOyI
	 U0e2X03gs4hLBtDg1EzK16pF6JsZ7tcWowundteIlEpQEC5XqLwIM7e02I3n9YwJsAoTN
	 YkO8Q8wQ87Ms/7oNEHSWUhhc1I//e3SqTVxDKxokCHdNzfCnM36hlIgT9h5pdrjOXkjhC
	 SEhRNKea51J3dKJZfasvbRrz3K8+T4nwfoXPcrsamxIH1d6Ip1bwDj1h0gMbO19K6dBD9
	 8BwgCrtAsAwAQ+ht2YfKw/lMS7PxVI58matp/nXfBKrhV/lkA71UPYC/JjQ+uM4Mfgg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v58j99Sw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7AB606A685
	for <imx@lists.linux.dev>; Tue, 24 Nov 2026 11:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B7AB606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v58j99Sw
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3ae22dcfdc3so34528601fa.1
        for <imx@lists.linux.dev>; Tue, 24 Nov 2026 03:18:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795519112; cv=none;
        d=google.com; s=arc-20260327;
        b=M4bl4J9zchYyP09fYyBHhrePdLSxmC0aMTq/WvfQCVw9qxL1NupqWl8N2H0ubMQ0PF
         0zBUjSkF0+b0ixb4hoFje2YcgPFv//MwsbwiEpsIXCLl/MmJbh1BOeRxBzoycOLtoqMF
         XhyNBzDmTCXZD+K+sK2tok/88J4a/Dt1Dyg51HwVi31Cqg6yMx+pAA5NNPF63C8g8LaT
         XYLdOzgTDjLesPgZNfLOk5TKVimJ2i0cI9CUNCKEAxulgYsL/F0fYLNEA7PvsXyFR6Kq
         DV+l0Qy4Sgf8Q77ZxlRwx50Xkj7E+7Hh6zgqU6hm7ThE7e1vHYjz7d1sWkDheAjuSGgs
         UuEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zWCBxQaDnc67itD7Zy69q7XjxPuH2oichietMTNWCaE=;
        fh=FxCVdeESvPMW41r+XJE3yilUzYVMOeaQufXtdJbFhAQ=;
        b=JQNltO02Rla+6LhXAY9pkuGdxL5RnU1a245pBcxL5mS9VkSFP2odzp1n+sHhbc4j5I
         vWjNyE5sDgKTCbeV49+yT5HdNm3OA2XDHjUV0aJeFaZiysycbOd9Z/Iwngdlz6ab+OpE
         Iev0wQXyVHSuQn8gRv52mzhmmULbR72Za5aSf9T5mFmfjFm0wfraqU8Fa2JA6W1VeXzn
         FeMt181CbaqzrME2p6dpujd3ivu5CqfJWEL1ANwqofbJTl5I+jS3koGTRDsLHiI2IW9V
         mTUo48jRfOeMXOYgAI/Sej8zuDYZukP6G6iCx+pXNpLK5mt4pPjLgT6v5nPddo1s4nZW
         OcdA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795519112; x=1796123912; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zWCBxQaDnc67itD7Zy69q7XjxPuH2oichietMTNWCaE=;
        b=v58j99SwxlVfs7CyveAcB6KdvtRb/T2s+k/hikSY8Ik9aaG+SDhzJOiOCmWNm974GR
         XlBKx4lYOJyofyXN5XcdReSyKbi+mHaxOKJjxWlOvoj1rEBW0XUEM5P570I3JsSGfKMN
         QNzg6asFmC3ulJET4v3Yw9ifCFpYk5r+mIfKt9o+RiE4qZs83xIwNRqeVWM8D0n/U3tX
         vw8kf0TPakQ02bS4qbZG3kBCRI6tWSjL603O+9Qh21+0m2RU3gS0DQjgCLQQfvJQt+RU
         BrZ3dv4dlQ5WRxFNsQDqDpzihGjc6t+BjttpXbcxel3PpTwgpq/j/SJudq5eCN4/IBNh
         qHlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795519112; x=1796123912;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zWCBxQaDnc67itD7Zy69q7XjxPuH2oichietMTNWCaE=;
        b=RnX0dR/YrRBEEm6v2mg3gQxihcN8BBbVTW+f5JesvyFrL247fX1AaK60ZiO3hKc3K0
         oVo74JLnNHQa+OTWDccxSWu5jGKr3H7wa6OO2yOzlSk+jNDQ1/dzYlE/m9IqLwNkwAI7
         y/3Q4n81sTfkNd2cqSvbkCVt9Me+15fw1AZsOU4UKPTmN/nhueyP/R04PijrwBxMKlPB
         NGqj6FGh97MtiaM2Tam2H/iLRNHSEU+3Fo6MhiIMJsLPDAkL3xV5QQVMSqTnDkC9RsSu
         j4xqD7/G1Ss+iHTzQJim2mQHNF5Qo46rJ7E/AFDOwmknqr/VnMb+ctE0z3nWS/sqb5QK
         zpBA==
X-Forwarded-Encrypted: i=1; AL+hErFA6V6/+l1vslDoabyD4R18qQtFqNCwkFMLmtCJ3KhAHAVl46stO6lYYEeKNnkcCmd7Jn0=@lists.linux.dev
X-Gm-Message-State: APuU4Z+boblMPLKoC1axEO2be5GYjI+3KQ0TfzGOjFC36yTdhj7xA+V2
	qLefxbNt+mayQPWYtw2+8UdzIaRrNjswR/KYVBxTgc6WDgbjM9CzQpRvhwaTN+UeozeFXa853BL
	dRtOTjKkIKwQUDH9Gqqz8VZTjNXCYGFg=
X-Gm-Gg: AZFdTZe13g3uzADPSXUYFO21cqJZoqTP+ucx0xVD195zUSz3A/ofiMaJKJ7toTQUZKE
	fYJ5qhiGP7pF9gOI7WXZJmhIPjNX/1cPMmISosW6f3PirAj2MpUZiy6LvvuvP8sMZ/MvdXN/pUS
	I3yWps2nA0e4eHFeRltdMGf673jSHH+9bg/JaNWFqqbS7/6oMxYo3rMWmCNzafNtfbpaolm+c4K
	qBkxwCn1rbg3QUxJHJh6ipz6apVOqOlRovVCum/w1BOSrXh+kYC8jJ0FWrkoCDSzXvvonIgT1cY
	i4KggAJdXJpzvuNEN8UBu1jFTsH4+jXjAraCK7nkpADiQZnbrKEWvUL4MpoUCe9k/XnbxKPwotu
	zYBECBP1tNdyRgLFhYkdjJbNOyYmzdcHf4NUhrX9Ac0SwdocLRA9zF58HAsK9qYgnykm+g67P4e
	PZAKTGAnRS3vYTTbopawciqJbrLAA=
X-Received: by 2002:a05:6512:108c:b0:5c1:5be5:a543 with SMTP id
 2adb3069b0e04-5c1bc660a53mr4292498e87.9.1795519111544; Tue, 24 Nov 2026
 03:18:31 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261123223357.535424-1-festevam@gmail.com> <179551300942.327856.7174455040291936744.b4-review@b4>
In-Reply-To: <179551300942.327856.7174455040291936744.b4-review@b4>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 24 Nov 2026 08:18:19 -0300
X-Gm-Features: Aa3M54rPCqpnfWWfBJ5P36EvmMGDYSDRBq9WyY_WgO-ypfC7S97pWkWQHrUAf_M
Message-ID: <CAOMZO5ALfN-zGZuVn7tm9gpg+1yO1tQGKt+O2NXem14hbr+_6g@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mxsfb: lcdif: Fix use-after-free on unbind
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: laurentiu.palcu@oss.nxp.com, dri-devel@lists.freedesktop.org, 
	imx@lists.linux.dev, marek.vasut@mailbox.org, mripard@kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Luca,

On Tue, Nov 24, 2026 at 6:36=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:

> I'm OK with the change (except a small nit, see below), but I have a
> general question: is there any valid use case for removing the lcdif, oth=
er
> than testing?

Yes, the motivation for removing the lcdif was to help decrease power
consumption on an i.MX8MP board.

> No need to use the @ret temporary variable, just replace it with:
>
>                 if (IS_ERR(encoder))
>                         return dev_err_probe(dev, PTR_ERR(encoder),
>                                              "Failed to initialize encode=
r for endpoint%u\n",
>                                              of_ep.id);
>
> With that done you can send v3 and add:
> +Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> +Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Thanks for the suggestion. I'll send v3.
