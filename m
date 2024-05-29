Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C61381C8
	for <imx@lists.linux.dev>; Wed, 29 May 2024 09:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716974165; cv=none; b=pM0DviLaZox19nvKxHTdq3Eu+8XJCWR9K8MGszlYcNCH4ikH+W38nc5Jxb8725fMaZHe2Imv8iHPD+qRimYYy+GlEUYnnNRUvMxgIbfOMa3wABv+K61OngOnBQMwdLfoiYDBzwDUY9X3mkHOlL28tOUZXSBFkc2Hqb3OnxaSqO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716974165; c=relaxed/simple;
	bh=P/11FGodoFA+E+NLZvrYREmdgvCahBEkTi/n+hGxNYc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G75s2lcyeqJqy+b2KeWIIGRnUZj1l46DcX30XEkDqNJaBMQcaQ/9mbrc6J1NmODc5KEgo04BaDLXGoVR8f7eEgzaH/PsWhOWuANDGdvJ2EGYNJf+BX0yKPDEw3PodvwtpiwisooOKAFQLE7BK5HqHcHLVCpy6t/rx9jbdDdDd4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=meagjo7U; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="meagjo7U"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a626776cc50so194936266b.3
        for <imx@lists.linux.dev>; Wed, 29 May 2024 02:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716974162; x=1717578962; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P/11FGodoFA+E+NLZvrYREmdgvCahBEkTi/n+hGxNYc=;
        b=meagjo7UNcyOPOZ7ZLng0IyY0zcwJHZ4PUsBXtEsBzGh90cmg2UHBK+ENKLOhauQV0
         5ET9H/G5jU1loryh7L/bompbuXgj+a15XgxU5zzzHSkXvpk0LJ554OqKy43Yt76Leg1B
         j1vT+epreXNnooUJiK9akChX+JZMhbt3m4eoQvNJSXYl3rofTM4iKt0eYHuqtpUYd26K
         eGpfBKrHzN5lm2nceCabxcKpzmidsaDLqWmESRUxcOTzgNAJjBMf4oEo+lhDlF5TJSSg
         XLguNa/meIAp8RKrxjg39ghMoiqvv9BKqXcHTV6DZ21ne/BXCeaUOK7YZjK9yOp7Gu3m
         URwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716974162; x=1717578962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P/11FGodoFA+E+NLZvrYREmdgvCahBEkTi/n+hGxNYc=;
        b=MdLvdymEnR1opp7oriTh2gQflCRp7IQ9zSzSun0ioLVRhta6Tn93nw5CmwG3UM5sA1
         B6gVwbgZjF9dEVIAk3TSB7aXyCWdaYnXM9xAsTQCXh3hvmQ2nVIsx8/A958onF8vxbkd
         4gjiUw37z/nWBV3Ee1Eqkc+M3RZ7sFsEF+Su9ISAS2PpX7PtY8o+3/6yqS7jOLB7Q1t6
         be7qcbVprZagvnjajwa4pJrNkQdeGtZCMm9ywMm6m7nOwhs79lvaTkxT5nWJlfypFPbV
         vxBUgaHVpAU9qBkEZB5pXKG8OL77boRvldmQhwnjZzec7RkYq8ifFVrWYf92Ky4lDtVi
         1sSw==
X-Forwarded-Encrypted: i=1; AJvYcCUVejCcy6OoXemGhwVv3hPUtT68pTVnHdja7zwG8h/s0V1wADX/KAgMbBGJBckoHOLZX+gNHZFIbFFsMWnw9gXqcBqI
X-Gm-Message-State: AOJu0YyNs575Y1yBaOT3B37KVwN94L/G7PAEu8lmdoObRrg4Tuyf7Yfp
	OHp1wKN5Gxs2Uteg2E4iq8bB9tMYNEBZVo9QKBlFzhh5VzQ12S3QfS3nEmgccRBZjltUaX7+qqv
	8fy3Nc8DkDOVCG2LN0cqiWEOQDbo=
X-Google-Smtp-Source: AGHT+IFzCGL3iHzr4n/qBEh0rBcTkXqfRF+a6gRaRMQGh5+of4CGG73bxuOyvd2Zs59FzGTTgkYC/QKjn7uf1k5x4v0=
X-Received: by 2002:a17:907:7e85:b0:a62:de58:b362 with SMTP id
 a640c23a62f3a-a62de58d30fmr640122266b.55.1716974162356; Wed, 29 May 2024
 02:16:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240528194951.1489887-1-andy.shevchenko@gmail.com>
 <20240528194951.1489887-5-andy.shevchenko@gmail.com> <c52ff392-703c-482c-a297-c12d4e0dbd38@collabora.com>
In-Reply-To: <c52ff392-703c-482c-a297-c12d4e0dbd38@collabora.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 29 May 2024 12:15:26 +0300
Message-ID: <CAHp75VeurNjWSLsM_cEphZZhqSM9TNc_ozGYcJ-vvefHg8NY2A@mail.gmail.com>
Subject: Re: [PATCH v2 04/11] pinctrl: mediatek: Provide a helper macro PINCTRL_PIN_FUNCTION()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Daniel Golle <daniel@makrotopia.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-mips@vger.kernel.org, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Paul Cercueil <paul@crapouillou.net>, Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 11:24=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
> Il 28/05/24 21:44, Andy Shevchenko ha scritto:
> > Provide a helper macro to assign the struct function_desc entries.
> > This helps further refactoring.
> >
> > Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>
> Not a strong opinion but, for commodity, I'd like to see "moore" mentione=
d in the
> title, as only the Moore pinctrl IPs are being touched here (where MTK ha=
s two
> different IPs: Moore and Paris).

If I need a new version, sure, I'll add that.

> In any case:
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Thanks!

--=20
With Best Regards,
Andy Shevchenko
