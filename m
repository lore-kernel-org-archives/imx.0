Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39794167D98
	for <imx@lists.linux.dev>; Wed, 12 Jun 2024 08:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718181260; cv=none; b=pf6Y17KiiIhzmLjIKR6HckcvqOCF7bydqHllf+mYOANhnagfkeyCTXmWKN5gmqH2vwhfLZBL96aEJg0gIHdXPZf9KK8LaVusn0VyMVj7/Vc+KH1pbU81s5MwsRJ3O6xB94/dGKY+FFuPw7dZ2wKSZWVFX0GuTLI40u5Vj77xtj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718181260; c=relaxed/simple;
	bh=GRlEpNQ1vOAfspdoLRmjbH1WiL/9+2xtBIbJoKzaPig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iWlGlRYqR/CKtx/rqBwiNkd9zaPWIFsTckmpLMjXQnvOPlRJLWYCx/qZOptKqEvpKMoDcsHji0zAATTXmvQ2PUMoHbY++UCu7xz8GovMMTQjz6gtkeiDvMX/ykKilRfylVupNr7X33IU7xd80eS56x7JZhY1YHHpJfmpPhan6zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=melexis.com; spf=pass smtp.mailfrom=melexis.com; dkim=pass (2048-bit key) header.d=melexis.com header.i=@melexis.com header.b=P1OCUaJb; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=melexis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=melexis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=melexis.com header.i=@melexis.com header.b="P1OCUaJb"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5b96a95c5e8so3586237eaf.3
        for <imx@lists.linux.dev>; Wed, 12 Jun 2024 01:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google; t=1718181258; x=1718786058; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GRlEpNQ1vOAfspdoLRmjbH1WiL/9+2xtBIbJoKzaPig=;
        b=P1OCUaJbjbota8e/4t5kG1pEKM+Ihom5FmzFur47ezd2MRJPut9WqUXMxNsWwoUOyj
         6P9vcMpjZDa9qtBoUg+UhwONa03l+g/3t9IrAE4GH1dv098YREd5F3F2qfzP1uUQtzSp
         OSYZSb2UEcBNgjbs8Cy1hg5N9IEh5O+iXBjpMq8CaGRB1KpR/hl+ygoSB5k6vrUD4POd
         3Kwxkzl9lYrGf03fsqpjYHvikQj9CgHjR/ufYsPODhw2vOl/eKUymihpN8sefGIVAZsH
         0Jmlo9DgCOt8UVxWN4Sw+CjNZoqwNavERWqcNv+kjTdqZBqdkNWMRjsvDZ6dbyWd6iEK
         WQPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718181258; x=1718786058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GRlEpNQ1vOAfspdoLRmjbH1WiL/9+2xtBIbJoKzaPig=;
        b=YvMxmc4+YI8JMKjlqShncbH4gz0t7efdYYrSWb5xPl7E2IdeWcYoEveoDQOM1m/AtU
         pKl4B6IwFvRWSWagXEVDkDwQ41hV5Xe+MJ4Iqy5LdLDMtQwD+65uSTeEXQiA5y1Vh3UR
         1PY2OLyqryOFPiccDNwiBai2LWL4sf5EwnzVFrKO1gxhjHweIQesx64IOteqRQvphDBm
         KLqJy4Fqjvz+/GslanwmgtodeAIJF1W+TxU1skrf3KcpsMFhJy61ihSW2H11zRqB6gON
         JsZbjA5yjr5m0PKTQ9Yx4v2kLm8ORadpcbAj7ISTx/J3ANK14SMUu7962LkPLnZbGbTg
         HAJA==
X-Forwarded-Encrypted: i=1; AJvYcCWzjC4yeMwmOfJTfXCBuBg4gAcuwMEtpeBUCtQEyLvK+iyl/6Hk3wUUPXQlUg6pD0cntPEEucVkCkmZi6Rcho0Ddn6G
X-Gm-Message-State: AOJu0YwTJXf0cRkmwEOW2qo/dETb0amPpi+ut6fa7jEMKlmWu+yLeiTB
	MiE/6WA/5BPA+V7xVBu5xOF7MrPK1wu9d4bGfNmiU7sMYZiufovA1A6knnITNayuXkTr/o52A9U
	J8fCWx54BHCZm4wTaR/VBbWC9YKIISghct1eJ
X-Google-Smtp-Source: AGHT+IF2c1FL0fqOMuwGFXItue1Pz8K0VY5CQ9QXgEnYWVlMd7GYFa+wcDzIz9YylVcb2zSif5XgvNLrC8xGpqwxyEQ=
X-Received: by 2002:a05:6870:b625:b0:250:7973:8092 with SMTP id
 586e51a60fabf-25514ef5f86mr1113389fac.56.1718181257361; Wed, 12 Jun 2024
 01:34:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240611165214.4091591-1-tgamblin@baylibre.com>
In-Reply-To: <20240611165214.4091591-1-tgamblin@baylibre.com>
From: Crt Mori <cmo@melexis.com>
Date: Wed, 12 Jun 2024 10:33:40 +0200
Message-ID: <CAKv63usQDFuz9s06GNTq=3fzYm-OVPAxgxwxTNEw6zw2rYxyig@mail.gmail.com>
Subject: Re: [RESEND][PATCH] iio: simplify with regmap_set_bits(), regmap_clear_bits()
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: Lucas Stankus <lucas.p.stankus@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	Dmitry Rokosov <ddrokosov@sberdevices.ru>, Cosmin Tanislav <cosmin.tanislav@analog.com>, 
	Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Saravanan Sekar <sravanhome@gmail.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For mlx90632 part
Acked-by: Crt Mori <cmo@melexis.com>

Thanks for the update.

On Tue, 11 Jun 2024 at 18:52, Trevor Gamblin <tgamblin@baylibre.com> wrote:
>
> Simplify the way regmap is accessed in iio drivers.
>
> Instead of using regmap_update_bits() and passing the mask twice, use
> regmap_set_bits().
>
> Instead of using regmap_update_bits() and passing val =3D 0, use
> regmap_clear_bits().
>
> Suggested-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
> CC list got suppressed on first submission, so resending. Sorry about
> that.
>
