Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686E41990D2
	for <imx@lists.linux.dev>; Mon, 17 Jun 2024 23:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718666540; cv=none; b=kEAXJ6sTdq4SoGknqZr2LY8Y0Z6nJ2fZYx5JaM+FDtG3QFqCqT4wFU1PWMUOYD9ZeN51QvLXdXpJEBMAPuyuqAhJxY/bzVdK/GwP1ojNbUOv1zqAamn8LEsI4XI2fiI3pGLVDJ8rCnf6vKXlMoOeEyGy9Y0xX4MD2sFQrUA8uAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718666540; c=relaxed/simple;
	bh=wKRTlIR7nnOjM0KXV8XEYm+3gbeEEjKGhoRIr/a9C1M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZhtGmO76uEyGmAbg9gVfuir4n5XB/XQ4AdHPiBFqDZ9MN8uPgtLUkS3X6AlS0HGZXT3vUPyZBGP33D/V9rCRbFj6JqZPZGoABwoAq0cViPSmCW9kaXRQsx/GnibfAnXWP8x9Zs36iWZTQOgw2gH7AcW6xRayzKDpeVzfzODH+Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PZ9lHM59; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PZ9lHM59"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a6f85f82ffeso192801866b.0
        for <imx@lists.linux.dev>; Mon, 17 Jun 2024 16:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718666538; x=1719271338; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wKRTlIR7nnOjM0KXV8XEYm+3gbeEEjKGhoRIr/a9C1M=;
        b=PZ9lHM59DfYow9yNrF/Jw7EBgc22WR0seMerE7KykhPLpMs5o5xTuRsgugDYEuEuOD
         LiFsAorJ+oC4+Moa9pWPE+Lq7b9hf42Ynawnm11XVn8mYefoeYdBzhWWNQzA+UkZAN/U
         KPvfp22P4pguhRB8IGu1ZNGsvtutrWq4IzHxouVEi/pZo/hlUWm5I5Gcj6h6sfY0TCd1
         4cSPzQZn9mMZvPL8UfOD46rkYsQpR4ptCqnwhD6xrdi9q8IXA2zY4brch4q1o2Z6ZCCC
         y6FzbL+5G2ts7to+05F9wDkq4Yeu5Q4PANxftNV2g1evCAUznMurJKir291qrVCfHhuL
         sD1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718666538; x=1719271338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wKRTlIR7nnOjM0KXV8XEYm+3gbeEEjKGhoRIr/a9C1M=;
        b=b2F957lfgMbc1w1N/Y4pucFhuC87rsgAeDcvUAAO3AiFDhPaO0Trb8eSxHVTCACz5i
         6Jxlb+FxlVZFykGuKSSGBIPwJOJtfI+t4HOUVqm+TYZCB6H1Q5P4h5Brw3x/QWev55by
         OYzDKJAzCU10713y13yppfkoeaCxTmX/DH2vipAMp+JtDQi3SsKoj6o6/TFA8rY1TarK
         8b7bsTnq7WMm//XMMkEyeS4i9DnUZA6ZWJfIayuRWRk9IWXXcakr4J9TVKti+ZTeNZh8
         NJBPSPNsPRb0b7vodKO8+22lyYoOk8+Wlu1GTEGYuQa2qdX/ye3K9tRpT4xmpgBlC4Qv
         xDUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiHMdVRydsZmXF/XXvNEIVolzGgEYFJeKc48/+FMvaELJlutC86qkEaNhiMmjznP/8T4mCibmx7kwQT++ZZHWNdMxe
X-Gm-Message-State: AOJu0Yzh+uKmAHu1HANV6CuPK7X45UoJPRRX23bh3kbhnD2oz0TuQvgd
	3sn5qLCvJeFy4KTdKPZWvSsjL51g3NxFs/DETL5Yj9R+pQEEk2uw
X-Google-Smtp-Source: AGHT+IGjp3Ii1wNb0dBKA712QfgjfMKbqZ/mXIwxAYEF4EPT50uybie8uvCZMH9EY/OD9lYqsMYbEw==
X-Received: by 2002:a17:906:d18f:b0:a6f:256c:8163 with SMTP id a640c23a62f3a-a6f60bca7a3mr697845766b.0.1718666537578;
        Mon, 17 Jun 2024 16:22:17 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:82:7577:b152:a6ad:d6c8:f0e8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f6b2b04f5sm411879666b.192.2024.06.17.16.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 16:22:17 -0700 (PDT)
From: Vasileios Amoiridis <vassilisamir@gmail.com>
To: tgamblin@baylibre.com
Cc: Michael.Hennerich@analog.com,
	alexandre.torgue@foss.st.com,
	baolin.wang@linux.alibaba.com,
	bcm-kernel-feedback-list@broadcom.com,
	cmo@melexis.com,
	cosmin.tanislav@analog.com,
	ddrokosov@sberdevices.ru,
	festevam@gmail.com,
	hdegoede@redhat.com,
	imx@lists.linux.dev,
	jbrunet@baylibre.com,
	jic23@kernel.org,
	jmaneyrol@invensense.com,
	kernel@pengutronix.de,
	khilman@baylibre.com,
	lars@metafoo.de,
	linus.walleij@linaro.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	martin.blumenstingl@googlemail.com,
	mcoquelin.stm32@gmail.com,
	neil.armstrong@linaro.org,
	nuno.sa@analog.com,
	orsonzhai@gmail.com,
	rjui@broadcom.com,
	s.hauer@pengutronix.de,
	sbranden@broadcom.com,
	shawnguo@kernel.org,
	sravanhome@gmail.com,
	u.kleine-koenig@baylibre.com,
	wens@csie.org,
	zhang.lyra@gmail.com,
	Vasileios Amoiridis <vassilisamir@gmail.com>
Subject: Re: [PATCH v3 35/41] iio: pressure: bmp280-core: make use of
Date: Tue, 18 Jun 2024 01:22:12 +0200
Message-Id: <20240617232212.34280-1-vassilisamir@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240617-review-v3-35-88d1338c4cca@baylibre.com>
References: <20240617-review-v3-35-88d1338c4cca@baylibre.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For the bmp280-core.c part, in Patch 35/41:

Tested-By: Vasileios Amoiridis <vassilisamir@gmail.com>
