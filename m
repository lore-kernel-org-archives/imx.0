Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0497B19B58F
	for <imx@lists.linux.dev>; Tue, 18 Jun 2024 11:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718708973; cv=none; b=CSngtADfsDCOFklCq3gs9h6QfV71EcT3J5TLHH3XZ5bXi07360Rns8nYZ1HqR9JK3uFCKG7WGw+aM9AH/2xAHHvhz+sDrf21aGylQ5HYO8kj3PjvSaBNjGBKoARG7AwgbeE87JjIcpf59zt2yEKu9u9vL8yZPreLIWSlzEolb6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718708973; c=relaxed/simple;
	bh=RvD7TOS4EE1gHEN7QDkfjxYlgO+IfDmVHOBhN7+7Oyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aFKnTg7pTGqzS6Eu822C2f03vmHxxRhd1W7JCGU1qIihfBwlvY2Es+yrjk7kYpgmq4o0Vqn60F2wKdiCKa6APlhamJOg2zQWgrXkE5qV3L0q98LVVAXn3BCcbT0PCFjKYzDCqWrxN3ajs6OLMD+iOJ4WT7hjRotMJcVVXE9c5h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TOT5LCrh; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TOT5LCrh"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52bbf73f334so5064633e87.2
        for <imx@lists.linux.dev>; Tue, 18 Jun 2024 04:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718708970; x=1719313770; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RvD7TOS4EE1gHEN7QDkfjxYlgO+IfDmVHOBhN7+7Oyw=;
        b=TOT5LCrhCk/VS3a8Go4UmpW73iI8vDKgrneeNQbINNu71goYvjzBAfdQoaIq7YR1uU
         AyWUMJRLrMjwKTqod8lUMewsZ7xeRJlutCKOd29hJNz2MMrEybir8D3nAQKt9yaRaexF
         aIiimWwxYIyD6NaSg7r/Z4ezRqTwufRmv4dI1OcO3kdrEE29LMWldzX4U2tRMFHyzI4h
         j3hAWqZNd9YqsOTgoGtdqll/bPDP1qGrnICzyTKqCflzsqkJ9/Q78L+FYk0niX47IXCV
         s2XxvINY5xSZsrGn7S8luCgUN72hR6M8gsfNHvYCTluky9w63ItDpO36sJ0XspAfpfzr
         CJ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718708970; x=1719313770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RvD7TOS4EE1gHEN7QDkfjxYlgO+IfDmVHOBhN7+7Oyw=;
        b=JZtR0pkxB5PnKiQ5ltA3l5OjrKs4YnUijEPY09i9Nca/9RsykyCGfuRp4lClXov86L
         xLqYAQW8pFEzN/BhhlYLQ2vZ0hw8jASyzXY71fBhj1apgJ6mFUknzZYzcsh2WL1st56B
         de8yn3PpncO5S8por4zhBRHmZuPDbFsAAo63QZZPcy87a6FjpiPxd1VSL20jrzE0fuVD
         TOer3GNyADHIPVcTtgabezAuC6B5zR2WbEDcToZpzYUuJ9sP32k1CG7l0BVkA/YBEEDe
         9pNDreZZWZW0cdW9BpVEKXZznLB/L+x7fy1F06CRTdxdN+BAsWGNhchlD/v/0iOdwyWi
         Vs7g==
X-Forwarded-Encrypted: i=1; AJvYcCWlpKrIWl0NaepT06yry9d/iQ5VtBQaZ9ccDvwX5et4qNINWbzCjBqOTzOOayRqojE62CVxtyue/pTAfdLuqOWPyrNx
X-Gm-Message-State: AOJu0YxZtu4ZeSqPzoirmm3XERHYaZCNGfzRiDjWZZrpRCT1HTh/CMTd
	Ji/RUwaddJkX5ZlUKioBIh9DPiN1LCWdc22fDN+yHtRDYtsjcnuhZr+41HhPkeiC2EhluDZ0Kux
	forNwEHElcSkTM5ozuxEYYevuqwRgVrYjgGSQJg==
X-Google-Smtp-Source: AGHT+IGoKxTkRYLabjHUEETT/B3IbExJAmXPzq9+RXs6bzZ+GQ8xGK2jG8c67xHQQUvRR1JIcG5ZA4yr3WPNV/0LYAU=
X-Received: by 2002:a05:6512:2348:b0:52b:bf9c:7e28 with SMTP id
 2adb3069b0e04-52ca6e56012mr10869317e87.14.1718708970136; Tue, 18 Jun 2024
 04:09:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240617-review-v3-0-88d1338c4cca@baylibre.com> <20240617-review-v3-2-88d1338c4cca@baylibre.com>
In-Reply-To: <20240617-review-v3-2-88d1338c4cca@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Jun 2024 13:09:19 +0200
Message-ID: <CACRpkdbos8og5=d4MXt4q11tQkhX=dOZdv382f1z2YJV44zidA@mail.gmail.com>
Subject: Re: [PATCH v3 02/41] iio: accel: kxsd9: Make use of regmap_clear_bits()
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Dmitry Rokosov <ddrokosov@sberdevices.ru>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Cosmin Tanislav <cosmin.tanislav@analog.com>, Chen-Yu Tsai <wens@csie.org>, 
	Hans de Goede <hdegoede@redhat.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Saravanan Sekar <sravanhome@gmail.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>, Crt Mori <cmo@melexis.com>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 3:49=E2=80=AFPM Trevor Gamblin <tgamblin@baylibre.c=
om> wrote:

> Instead of using regmap_update_bits() and passing val =3D 0, use
> regmap_clear_bits().
>
> Suggested-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
