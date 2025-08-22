Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450F123507C
	for <imx@lists.linux.dev>; Fri, 22 Aug 2025 06:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755843580; cv=none; b=eQznx4bvQ22p+4tdHT2wUe+LpLt/4S4xQ+SwoysWT+5GvfDDZ6bNJkXtKcgE21owB8+rGlHNlOSlNylRM7wthO4HvsSvXiblxZ2dzUXvgsQFkSqGUl4qkJB925GzeDP/SyM/Hh4aJibbb0INb4FJgBNLuXWv3cVVSQKBOA+Y/4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755843580; c=relaxed/simple;
	bh=v8a3z04Uh0u/uSmoBokGI0Tk49vBcGLpTfeWGAwsaHM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q8Rn4Z/kldD3dBsciu9is6XDm0NKXAXk4d/fWUogCmVac8iZarq5qAvDoA1eqb7PpoCTFO2TTZrD9emh2npunxNwlL+2bxKxg+w5E7SuMiBItfVlaQ+loeffy9iFQ8X+5OKK6G76Raxh74s9+RK+MvtbSsD+INrB6FMvDLxjFNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F6S4jby5; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F6S4jby5"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-afcb7347e09so290117766b.0
        for <imx@lists.linux.dev>; Thu, 21 Aug 2025 23:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755843578; x=1756448378; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v8a3z04Uh0u/uSmoBokGI0Tk49vBcGLpTfeWGAwsaHM=;
        b=F6S4jby5+iJ2OFbUP2+ibN+dCcdXqXIUUAGR96uAGjRhULBkKufomXG2Q5r6v29uG5
         dc1AccPeipJe3TCpBxHT4OfYe3oCs3239AV3n7Yjz1Mz0Bo4bvMl6yRs133K0jYY183K
         CQ+bQ9LxTWeuOBa3+kxZlM0NNY8TIgZtkBvYKUH9FCat5uMZblZZsKeKpcCcAD1byhFA
         nNd5uazD46qgkooJSV4fesndgUhQL+NSEZWxODrFzUCpvrhAH8Gs0kim5dkYB0XJSd3B
         dJxWKRPgYJt/0iL68qEtGRcqRqrEa2apyaVWszq6/qCHhF/Bzoizt91LnV2Mx8/GjsB9
         31EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755843578; x=1756448378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v8a3z04Uh0u/uSmoBokGI0Tk49vBcGLpTfeWGAwsaHM=;
        b=ZABR+PkT4TyxdycSA4NzpTG3OX+/dbkyugURWve3IiyqMYBYv28CjwTGYWFm69wrcw
         HGT5hz4jmAnp2/Zf8h8UTc0cxdO3CIPyYSDShz4kyWa5MTsIkV5EdpJStTQLqFQGid4R
         gYEQxqcag7hnGsAbLniahEBYk+2jrNl/sjK/SY4JdOpIvtjtC7grcQe//PtE4oXt9qjW
         ZR87HBTEzTnz+hLBm9nJoKEfOxdSo2otyABwXvt3MOL/ytFGPrMmAwEFsKMh48v0ceUr
         0fNvov1D6latuzIyAb5zDjyxxZL/lzB7ddvpxpnBLr/NrOcEHQPh4317hGT8Rz9MkBOh
         QSwg==
X-Forwarded-Encrypted: i=1; AJvYcCVs6VyATR3OcQ+9H8Gq5G3aa9vf4fJPNGe92MXP4EdsSWJldFwwwlkfIoE5B88pK811T3Q=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7xBeCxYk1iiKJINAGGTUch/yPbagc7LmIVhJAwwHrxqUm8Nnx
	j2/h6nzNsF+AYO8RQrLe/EQeCQgydMOiBp/FbBXagBRhjmSzLXrzjqCFmGxMaZMkz+kb++UXwXt
	3tG841RI9sSL5fScMjoH6bcAFbY3714+OWP0Edk33XQ==
X-Gm-Gg: ASbGncsmtJd8c7f8MMj+YiFK5SNWU7nsgIE7xVNjqvY09kEGUXVg37/4Pq4coaOUILH
	Iy1e3u4wemveNpiZllFvu6zKOaFPY50dwr+D4Ls6r18+mCR+39AqEF/LD4ierD7z7yYVoujGFmg
	h5aZwIBt0Me/eWjd7WYO29LeGVk0WYvcY3DuKbiyNldMmro6v+pZ+CDLoNhwvv0ykTIzgljgpkL
	xOhw8DnFlG78hjaAw==
X-Google-Smtp-Source: AGHT+IE+QSuwTRWNnEst85zd/nVk0XCWCT3dBHW+V785HwC5spF07O83YE3tf7aS5P/QoM3Upoe1DUKm+4/yzGTsmC4=
X-Received: by 2002:a17:907:1c17:b0:af9:1184:68b3 with SMTP id
 a640c23a62f3a-afe296358ebmr171036766b.55.1755843577528; Thu, 21 Aug 2025
 23:19:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com>
In-Reply-To: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 22 Aug 2025 09:19:01 +0300
X-Gm-Features: Ac12FXwT5-FuVxm-aLv8k_QiDyCdQQYyidQq38gD1A8xq-6f9ed_haxl-pVwx0A
Message-ID: <CAHp75VeTD5Y1bi-jYyfRnCPDfB4=WO+QF1uK5MSaSq=oUUMFdQ@mail.gmail.com>
Subject: Re: [PATCH 00/10] iio: Drop unnecessary -ENOMEM messages
To: Dixit Parmar <dixitparmar19@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Support Opensource <support.opensource@diasemi.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Cai Huoqing <cai.huoqing@linux.dev>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andreas Klinger <ak@it-klinger.de>, 
	Crt Mori <cmo@melexis.com>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 22, 2025 at 6:50=E2=80=AFAM Dixit Parmar <dixitparmar19@gmail.c=
om> wrote:
>
> The drivers do not require their own error messages for error
> -ENOMEM, memory allocation failures. So remove the dev_err
> messages from the probe().
> With these patches, all the iio drivers now has uniform handling
> of the -ENOMEM while device_allocation and trigger_allocation
> calls.

I don't understand. Don't you have a subscription to linux-iio@ ML?
https://lore.kernel.org/linux-iio/CAHp75VdL9kV2fyi63zqPZnW4CaeYPmJ74tmGEgU=
=3DM7FSYBv0ww@mail.gmail.com/T/#t
If you found something new, please base it on that series as it was
already sent and reviewed.

--=20
With Best Regards,
Andy Shevchenko
