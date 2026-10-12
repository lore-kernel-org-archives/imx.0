Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD30A39A7F0
	for <imx@lists.linux.dev>; Mon, 12 Oct 2026 09:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791796793; cv=pass; b=STL9G9JPg2LPkZxCvkqcpKX7+5kG9r+U6IbeKhVZAuJN4oR8wPb/x2Xj25bPGevJ5rn4o3JolvUH59DIV7HXJs4VhVUPiHQr6EV0gLDwY4UExledGgjLLVGxlGyDJpINovFOYaZe+IDaKCNRwyQHCiEr7lvEQDDpB+6uBhB46pU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791796793; c=relaxed/simple;
	bh=NyVvnAiMH30Dsk/I1bnv7++UVVXL3Aytufou6d1ZiCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KDA5OyluIxX27hIW2C9e+lVIjWGMikd1nXMlU9G9YheMZWcIEeeF/aBN/o2mCErAcPjr3YWJelPQ8aNut5EjnaxRbbC8qu26BjAmh9LFrOVxglkqWq667eKc+vSFY993PkV2DnjtZfwT5k+41z8gmXdl36K58+WEXpxaIxAoC4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=opZdyusD; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="opZdyusD"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c315869241fso236851066b.0
        for <imx@lists.linux.dev>; Mon, 12 Oct 2026 02:19:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791796790; cv=none;
        d=google.com; s=arc-20260327;
        b=swr/uOHTGeg4eaFTqltec0cBW/CojpG+LCsxs9zl2OOT1w+d4fIiVJ4gLi/Om48XGj
         OtbxjYJXB5K4ILMIMZAhNAHrY/sDjMtZMcWJPc41LIAC+CYn/vu+xsBxkfbqfKtqlbL6
         Ic3OJtwFw5FLCkKpHWyXyrOUbviAD/qU5ZuFGuRRc2anJhkWTf0Kv4tcNavV/IxL4b8p
         gITggQLnMdfFCcD97LXSCbOGNuDmk0PTm/PwuB+BbdPWCystwnfC4XLuvy9QDB5fZ2sa
         ACPAWuU5/Lflg9aak7qqLP+s3KlmQHuCVl2zoZxDJtxa8MWGr/OrfuhJP7YdvcN+mIcj
         ZH4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NyVvnAiMH30Dsk/I1bnv7++UVVXL3Aytufou6d1ZiCA=;
        fh=tJRacJC7zL4SE6uo4/JodNr0bPqcum7O3a+I0cdbTtc=;
        b=GMOiOdvYaeaef1L6TEZT/PFs0r6lekVSE8QozpgcvdoW7VSbVP7T8PoWUpTcujSuk5
         FJ8mfNimtYimCj6/Ln7dT+HMRc5pwN0GUj5kF2GE/pjdaIfgL2rpQPkqW7Et74KFqfkf
         Yca0kpqKvhIPhKvgG6rIpZBbiOoCqxkCQPUeXP1CtjTXdNdt88yNosBBtLKUzcG0s8QA
         y8AU2dPN6nqSipYN1WEdtsbbcK2o9hUj7TbbXDpcW53zvtgt98sOrzHezN5Pl525e7aj
         UKHImAmnTMyt7zD7zg3WGEHSUmcmZ5/y6dStMnjGFJzbEnuBRRb30vUSWCr7r0wEoIdz
         LO5g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791796790; x=1792401590; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NyVvnAiMH30Dsk/I1bnv7++UVVXL3Aytufou6d1ZiCA=;
        b=opZdyusD0ikqNn8kJJbZn+eRfkYDeh33rL111w+w7P09SBF/iVzGXa9qBI10lhbLvT
         wKfS+O6N3MhbJwhqH32hiUuC0FKECMLoRijoTFt3+DP6mWUgzxzCV2dh6JI6jS9gdGfh
         OkZwhzpFqe0PnZ+sg/1W0rMyZpJAXoJOiNE3QiKKHJbEcHSVszgv1b4dvenePpPsTVw3
         DS6oitwq4EGSaFSUKMr5f/k75+Dn83Eht+jTyk+HsFFIRecIXPw9V2WofWn66bT1QMxo
         5Lb+H7K0T4r+Zht4H8vHLEtoqa7QK+Qi057oSZdfmNON3n+s0ZDog2/6nOHeOg6rkieP
         dsTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791796790; x=1792401590;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NyVvnAiMH30Dsk/I1bnv7++UVVXL3Aytufou6d1ZiCA=;
        b=TxBoDY50kBSDAvc8y49dHSXGT+R3WWC/QcRcUtnrl3nHrHbJiHd8giw/W0Z5ByUqh7
         3I3wECdqjc5qpit5AUN5YmjHnw14IJdrvkXvWIB10hCu91OPdlVoNXYjihTlkq7jtFyN
         BkUyG7WrgnDrWtE1NJPJiXimGqFXeDlXDPXlRhWU1oe4APLEhB+Kf3L39Rd14+XVTfRa
         t8zf6Wd8gTUU0CmBAb6VfTR2AOxdrW1lrc7IZAHp/pmDpCXEqyq71zBmrmdu5nbxtM0p
         iwqbMGh8EI2d3oHrOJdy3H5UADNfKM6C0wIkYJeI1NkRvxnLDtcv6S6+OL1Y0F4DWIIr
         3NAA==
X-Forwarded-Encrypted: i=1; AKwUvBxv/gEdwec5FAXp7O6peVamoQhEQo22QiCShSdpX1j3ZvmP/ep7yoiS5NE8GOhFqyMEfcI=@lists.linux.dev
X-Gm-Message-State: AFq9FYKyk86HgAI7vDaaSlXMWyKFw0OxQdp9YqS3jhOD0yIs7HMn9T5y
	doAKHaiTGrXIKsAnSbcR0th5o0OOkRZMo8IHCRbx7m36ICIFTE7mthKPUXYN6oot1lcv1Ryt3SA
	ffPZTl+ODhdqjgURQGD6mYM9sn1WaaxQ=
X-Gm-Gg: AYBFou1vePqrmMOCud78p7G6b4Hr9Oa8MoI62YDkwTpT7YoJtNN3UrRV4rxygKAfBun
	6UpSpG7y+4iKysrJz5xn0dwMTTUzb/yDafR0KeFRvkdGOt9074DwCK2dNkBA9+uCyF192LFaxNd
	hNVb+SKs3x9UVF1fWvdeUwGy89Oss2PAmtZCSQdL5K0nJ9J76kwdDV4z1EK+Yr92AmGrdpXWzIs
	WXi9oDhEe/q0JLlxmAuSOhw9iLJrZhqCqDooOiGIwpsV4P4kbUe0MG+8iSTOfMNFdgRSjbckKku
	bRWbziaIAoldlV+4uhpmmqU5To0dUoAyK1TOgiw+gWVu6dtm7HfDSU/NwkSlirGr8TP8ChD2L0U
	HaqXlBnpYJvg32ituPqVw+TM3xVGAa0vDC4jXrwr5/Vs5dlI09MaxQUXmOyGoFpCPtVztcQ+H5A
	CEVfZxbSY8aeELpUYe9tX17C5KGUPuUk5HCIoYqGrx
X-Received: by 2002:a17:907:c317:b0:c2e:2ef8:5585 with SMTP id
 a640c23a62f3a-c31a9b0af08mr839361166b.9.1791796789636; Mon, 12 Oct 2026
 02:19:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com> <20261011-gpio-mxc-cleanup-v6-5-cb47ce2ad758@nxp.com>
In-Reply-To: <20261011-gpio-mxc-cleanup-v6-5-cb47ce2ad758@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 12:19:13 +0300
X-Gm-Features: AclHuK-_ERRyTh4kZLrDH4khT6vrVC8RPJd3Q28g6NygjNOEZR5lX3Usk0n4iPI
Message-ID: <CAHp75VdsxjdbrvjmFS0R0wzFV1pge1L-bfqmA5dwWD=o1Z81LA@mail.gmail.com>
Subject: Re: [PATCH v6 05/13] gpio: mxc: use for_each_set_bit() to iterate
 wakeup pads
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 2:54=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> Use for_each_set_bit() to iterate over the enabled wakeup pads instead
> of checking every bit individually.

Suggested-by?

--=20
With Best Regards,
Andy Shevchenko
