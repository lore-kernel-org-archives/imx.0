Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028AD18786A
	for <imx@lists.linux.dev>; Thu, 14 Aug 2025 03:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755143876; cv=none; b=hhCxW63rzypIyJKsnPWmVEEsjRoT2a/VE46u4kYpNLUhp2JSJ+N9n61nrIrVf0h7i8DnrkSEm1MVZRUnUIZ87g0pw2T3MAIUapI0EMDFQHcdmUGm2MJFTUgIBFJnXiRzpgBSiAMLzTDt2lfKy4z5gr44bQVv0erw+Q9WX6p37HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755143876; c=relaxed/simple;
	bh=KuAzkdu+nBeW4XQJu6RSp1V8OBm3suYsUZfkIRqSD68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qwY0T+NbDT6MD8NEgV8c1pp0HLYLUzS6XPlVu8x+QCtgALzwMMXjcqcSnkVlooNRiQTpsnN4OQkKhWOkFC4t1xekJxJ+pUKpAAn6Wn/FnBtnS4uN7jlCVAV5BYwDyEHoVKLgfrKYjjWlSakIzX4rXVWcm+zpaex+k9Rtaz1ATCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fOk4A1p2; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fOk4A1p2"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55ce5253adcso512409e87.2
        for <imx@lists.linux.dev>; Wed, 13 Aug 2025 20:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755143871; x=1755748671; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KuAzkdu+nBeW4XQJu6RSp1V8OBm3suYsUZfkIRqSD68=;
        b=fOk4A1p28JHeK82K8JVZRU9NPFW7PKqHuJyt5ZHVlxKAH0h9RL0HBKIvvCMDN4QXKi
         2IZ9RGXtvs+OXwAjHBZYj1JEdNNfbI2B5I5vcYPYe67dNlm8cXUAVovHrW+chRR17Yua
         Bg+J07T4bXGkU84KoTgfOtgaGk02zhPX4mF4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755143871; x=1755748671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KuAzkdu+nBeW4XQJu6RSp1V8OBm3suYsUZfkIRqSD68=;
        b=EXW9vOJhK2VtGYAOqK4y4v8VpbSMhvSkmimfnEZQkGRwQG5o7KJnyeYqGWH2ZWFJ/X
         m9gsHS80AUdyNUHsWwPzMDct/WTSLy0ARFgJZmT30H65Xdr4t47XTyzNZjcUV1zUhTl1
         arLtiXvehJfbLcLwfQw10gBhXX7f7+utVxL4fAadchzdfwse9gcPX3NSi3Shq/ieT+LL
         7//ghxRt+DNI988OdAb2sXVRlfCmd8UzQFu9tdcqxugMx1WX1WLxPrfwKyV71p7nDv3s
         8WmVRDZjc4dqTVL+WfWktO6PuQWYpEVAK74lOBaqcPWeg74uOP7cjK1Mvn9F/b4/piPX
         gh8g==
X-Forwarded-Encrypted: i=1; AJvYcCX7b6Ig6iZMtmjc7NA38ObYLrx5Lr9JFNSyYN1lHl81sxXihxVrgJ0U3mpj7Wr0SpjrmX0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy662wqAPtSojiHdtuan0P4xWnCXRmQwKDnPBz1q2in1LHWY0jn
	vB91FlE/z+vBzglUji9X5RyUuyDPyGbJx+3YphzD6NWrLhTCKVKi8xwypwM48LcULMEkIaCojC8
	gsMikvuXrFDflo2gfOagqk5XQe8KuzfSgXGzCZDbp
X-Gm-Gg: ASbGncvAZ586XrWCUpCUfXJwVCR4FItRT28IxFHzt2PhiWpnf50g4b/i2/JqW5g8ysk
	+2qk9X+54QQPII9x8BU+vzJb2+ifCJ09AQNJRipYB+3TXaUtWzkVDfe7QOimECm9+AqDVobCLCf
	ibnswJoXIIpMhWv7oE7TzTPwDHg/vGEIASBwBtU3QGVdoA5OEzqDH8SVuZ9Ep2ZLK/Ml7Ng0GQG
	Mnby+ByHKzEfTQjyDcieDzV/sXMWqa+u8qcE53lAtdKVQ==
X-Google-Smtp-Source: AGHT+IF+5iKv8rMK9YHb6myK/q855kRCdUIsQfOlyE7uVil4m3zuwOKJ3gr0xAyECxLHg6Jl7SqsZkrMsfX9UPSHH2s=
X-Received: by 2002:a05:6512:b8a:b0:55b:8211:cc88 with SMTP id
 2adb3069b0e04-55ce508ddefmr488807e87.51.1755143871084; Wed, 13 Aug 2025
 20:57:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org> <20250812-pinctrl-gpio-pinfuncs-v4-4-bb3906c55e64@linaro.org>
In-Reply-To: <20250812-pinctrl-gpio-pinfuncs-v4-4-bb3906c55e64@linaro.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 14 Aug 2025 11:57:40 +0800
X-Gm-Features: Ac12FXwH4SzGC_raZvHd6w5DhOOOwcWIZ0DYC3dWkFgv22xak8lk2qDrshBunvY
Message-ID: <CAGXv+5EDj4JEKAFC-Sv8kyiBNy8SViEXaepdssG5QTu_HtYQHw@mail.gmail.com>
Subject: Re: [PATCH v4 04/15] pinctrl: mediatek: mt7988: use PINCTRL_PIN_FUNCTION()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 8:36=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We have a dedicated initializer macro for defining pin functions for
> mediatek drivers so use it here.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
