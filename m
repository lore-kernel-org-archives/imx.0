Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C6C8F4A
	for <imx@lists.linux.dev>; Thu, 14 Aug 2025 03:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755143768; cv=none; b=t4675zrrh1+P+hs1m2seoS6pBQR94asLGQhLju8H4agFd9ZDQqjPAzQLIT8Y2N+sdM7MhBDUfGfxRvqcIHipkvAkWFhabhFr+xDTNmIvn4kI2GPpQBKKGN9XV0Y9y/LdTIKhnr4+c9EmOBVUi2WAJ1wKESQfww2mB6ai91Pp7tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755143768; c=relaxed/simple;
	bh=QPXgL5JA1NadViWzO3at4LaILf4SB9CfhgF57NmFOj0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZCHJw4bU+YQmPpW6yTP7lGOkLiU5h2qWMBlbl49iPESjBhfUae5KEs94lxtlWlub2GpCqFIWdFVjlg7AnBdP6l2qHbk8oXGz58DwYAuOSQ3vxP7fl9Zr3U4Mfzi2EEtUYmXsCho8s1+GeCiTkuU4eYCMjZfbDJlhnjaT6RbznzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TuiENSaT; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TuiENSaT"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55ce510b4ceso534308e87.1
        for <imx@lists.linux.dev>; Wed, 13 Aug 2025 20:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755143762; x=1755748562; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QPXgL5JA1NadViWzO3at4LaILf4SB9CfhgF57NmFOj0=;
        b=TuiENSaTwfftxeRV4msmHztMtLKY05Vx+UKcuRqBLBIIFX//kQuofokH5qqrrSq2Jv
         LjVRIF8n906gnX8CMHBftFRoz94aBwfxMEfxYiAK6lCUqXTu6ErUsO61jf+dQOv7N+7P
         zmv0omUIGDyx+V3dsFr0FdjUNDk7mSLCfg5kM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755143762; x=1755748562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QPXgL5JA1NadViWzO3at4LaILf4SB9CfhgF57NmFOj0=;
        b=sLkRjOfen6KqmTcavDAE07q2BSsBEC6YcytzU+Tkm5wQBuThScxGygRtA+GM5gS1Io
         mgZmeS9gcwhrZa30XQCESXwOhsp7hzMXU3K0P5dGRSXCm7wmbEt6oQTrlx8hjPhn9fmk
         nI+hBdrglZnYEuN8RYweanpUxl1Dl+ICbwkUqPtvKeXrxwX2jDkcxbQ6H5gEvUC1tx4j
         Q7Y4UoFUTkeFfBrNOp0I44QRnagbiiLe6lkGR4uMA+xpkj9l0jWVmDsMCaN3xuJIgbjP
         xAsVdyWC2U63tyQEBzhGiKHo1Dt++tDcvfKIwrLCyEbn6fVzt+OjyJnqkF5+Euw9LXDl
         NdXg==
X-Forwarded-Encrypted: i=1; AJvYcCX8Ndz2WBt3ocT0E7GYBTwTKBUythxSIW4gjkeK6L7cr0NpMPa1mDOZBVgMUMpbduhdvy0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyLtr2uVhdGvhurL0Wff+Vp7KLSYKc/hD82/q6C7rgnXUuB2vOG
	VTCtxkRXmfDjb87F8pxJPQPDUDtsQNyRdr2t0o7MzF4zDFkO4rJvaFbXmGPaUfY17n4ZbNMIDgv
	2NSAzQxwnwwVZsTB+512BVjFm5eiBrTbgG8I6Td6C
X-Gm-Gg: ASbGnctiASyaMDwr2K9LInb9l0yAcqEYzSrFECJl6X1E/UC3Jw/SEGDVZnfwWf2oXND
	Ut2xCp/NsNu0Eh3n+EMj9Xwe9STq9J6EuYekqDsHljGVCDEtcrO9peTlmFPgOtvyjNylBsFGvAl
	rI+97l1xyGiPnIv/p69pj5LuOfBlcFTq2EzLV+qtWHqZWqdKg6yp6V5CzZFhfEPbVvffM3kqJgf
	nud9zB3SoiD/S2WE42kHgaNX9tXg/P9MqAp0UED13R7Pw==
X-Google-Smtp-Source: AGHT+IHQMv69+04AP9otNVcxhwI8uWKlLmUkdvXFQ1PCUQkCenB9LDrLy/Vl+cHfeBSUvo7zV0jpH3UAnLNxpErRIuE=
X-Received: by 2002:a05:6512:4406:b0:553:2868:6355 with SMTP id
 2adb3069b0e04-55ce4ffa5f7mr485589e87.18.1755143762579; Wed, 13 Aug 2025
 20:56:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org> <20250812-pinctrl-gpio-pinfuncs-v4-5-bb3906c55e64@linaro.org>
In-Reply-To: <20250812-pinctrl-gpio-pinfuncs-v4-5-bb3906c55e64@linaro.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 14 Aug 2025 11:55:50 +0800
X-Gm-Features: Ac12FXwQl-cvQ51JsCsvzfEY1EzqeHLXUhAtiyz4lnmgFYbrRneNtPbyaTw1wc8
Message-ID: <CAGXv+5GE4eUjMhewRm9oa+GbJWt8tMC0RXvT0R5FEfVOAsJ3fQ@mail.gmail.com>
Subject: Re: [PATCH v4 05/15] pinctrl: mediatek: moore: replace struct
 function_desc with struct pinfunction
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
> struct function_desc is a wrapper around struct pinfunction with an
> additional void *data pointer. This driver doesn't use the data pointer.
> We're also working towards reducing the usage of struct function_desc in
> pinctrl drivers - they should only be created by pinmux core and
> accessed by drivers using pinmux_generic_get_function(). Replace the
> struct function_desc objects in this driver with smaller struct
> pinfunction instances.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
