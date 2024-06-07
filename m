Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0408318C3B
	for <imx@lists.linux.dev>; Fri,  7 Jun 2024 20:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717792487; cv=none; b=Bb+DEc6hqbqbf9dCTGwpmjCoz9oWgYD9pU2ThoXDGwZUrlCj9ITpmkzb8XfKOHh3TrFJegKUFQLu+cmyCuYX2by00UsHZeQmilrVrzTSeD6MOe/+sw3Gc5Y6svzzGlY6XmZ6+BJ+T3tY1mzlDarlLudaA7UN+1BZoq42HbkPOGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717792487; c=relaxed/simple;
	bh=k/qOH0xVbdv81jM0nNIDKLRqUAZO1z/a91QrrgXPknI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DsX/+NenOucXLUgc06T1yGFLVUqXVSPnkspr0wxRozyvZdUYLpcJ85KmUXVhfPUItwvRvdx5Hi2RoEeS1NofDpzx5MAmBCbsDzYI55Rz/F/31HLKngBkvjckH6BBkk196e+sNEX+5RoeqePLCZRL2wdO9y1K3fclpQowWJ8K0+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y82OwK2Z; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y82OwK2Z"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52c525257feso235444e87.1
        for <imx@lists.linux.dev>; Fri, 07 Jun 2024 13:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717792484; x=1718397284; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/qOH0xVbdv81jM0nNIDKLRqUAZO1z/a91QrrgXPknI=;
        b=Y82OwK2ZAuejnM2uAlRpWI/t6l1G88sICfr8Gzvjd0cnBjA8IJWjIVUs2tvCd2FZ4G
         J9ER+WYMKxNs1pEH9hD7wqPw8GQCH5D9XSNMScEF5sfMFYzW8rgVGL33jgqnImJFuYD+
         YhtZyWrWSfgonsvUhYo/O4vz4S9ZmgJ6UBuAi5KRv1TnGi+EILiY6kotPMR03WMbCg7z
         4BDfTRgHU0nfgr5v+7WBYonV7yCnKuf26B0YxBBGof01pDACobIeoB2YwSvYTHUPsJRV
         2MU/gYU/DV4JikVhGe00q3YjTQDKLl0TIDTK+fGCTg6bRHsVfVq3zlaDuz/5wPxxJ6pU
         fUWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717792484; x=1718397284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k/qOH0xVbdv81jM0nNIDKLRqUAZO1z/a91QrrgXPknI=;
        b=HIsjUI3mXhXQcGdIVUWJIr3bsQumAFDyFln9ouo/YHVkx1RVDPQY5iPwRy+a+3NAuJ
         wP6IdX0dchYc7q5RFERMIg8bkytWQ1Mi/f2efokK/QOAuyGadCxAsXGfeJ9NVJG6ykhT
         nNiQs33Whtj4lwpvXcexZvqMnCImRWu0L2MOMotUSWKdG/pBl+JteghQppEHMPdNpW1x
         bi8eHo6xr6zIYkTlXJA8CMNGDB515h6AHSDKfR+WHKMeqoY2gVg463HcWrGTM7KYzmZo
         AC2H70JcZys51P9/e6CAoBgEGZ3y/O3PJuybP1eGbjANTlYCTHP81dDtB3g935FCHDJC
         YEpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxmOtd0wtPXze5px2fPA3glc44pYMuSbC8FZ6HGhY74AIyetyxSq7ZwqsiS0KiuX9il1JQ60v/GHAgvW44j/jV5dOr
X-Gm-Message-State: AOJu0YxQUCKQJoKu1JemJCVflDIzhz0owcOSp8enqVb8UQ617aHZHz2o
	znDzJLFnaRVqm7rxv91JmP9yEkezSkKmKjRJcxJpQui0//hWf63Md2UrUf5jvXXMbL4pqkmVQzF
	B3KWCL3KEsn7mp0I2sVMhUXlUWLYIP0+Xcwkz0A==
X-Google-Smtp-Source: AGHT+IGEyJ+w+NYHGdHZTgbtEUQOfYGBIFct41lT8WKTrSrUoBr0eDijD2Dx44IKe7RqxIodGmEk6AWnkM/ViP3EgMk=
X-Received: by 2002:a05:6512:131c:b0:52b:e2ab:7db2 with SMTP id
 2adb3069b0e04-52be2ab7e90mr867659e87.22.1717792484193; Fri, 07 Jun 2024
 13:34:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240530085745.1539925-1-andy.shevchenko@gmail.com>
In-Reply-To: <20240530085745.1539925-1-andy.shevchenko@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 7 Jun 2024 22:34:33 +0200
Message-ID: <CACRpkdbHwY2UJ-OodeJu2VrhML6tcjKeD-00ZoZotmi1tKzsEg@mail.gmail.com>
Subject: Re: [PATCH v3 00/11] pinctrl: pinmux: Embed and reuse struct
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Daniel Golle <daniel@makrotopia.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-mips@vger.kernel.org, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Paul Cercueil <paul@crapouillou.net>, Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 30, 2024 at 10:57=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:

> As promised to Linus W. there is a series that converts struct function_d=
esc
> to use struct pinfunction. With this it both struct group_desc and struct
> function_desc will rely on the generic data types (struct pingroup and st=
ruct
> pinfunction respectively). I haven't compiled everything, some builds mig=
ht
> fail. Anyway, comments, reviews, testing are all appreciated.
>
> In v3:
> - added 'moore' to the mediatek patches summary (AngeloGioacchino)
> - added tags (AngeloGioacchino)
> - fixed build error in IMX driver (LKP)

A week passed, no comments.
Patches applied!

Yours,
Linus Walleij
