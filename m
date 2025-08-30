Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB997239E97
	for <imx@lists.linux.dev>; Sat, 30 Aug 2025 08:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756541117; cv=none; b=paJPNAVq64RkT9DGWKRXGUQLv/2UI/gl5lk6S2s1Dn+ruHLgr/Xj6XVIOQaT/BAwouuFBlM+23mnT//BkVMkoaa8rk7X6tw3JIjPvYgJM5G92WNjv8JjggB2gMc21taIbB9tI8Pjrydo03dvVr6irzfrcmQhrpJx+9MJXeRt7Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756541117; c=relaxed/simple;
	bh=E+3FytFWpN13QNaZlIP9PT23YkoDdof1b13hg+sNa10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KXg9bYg2G4O+N7Si7/3SCG4M2xFcY0/qDX/Goahhb0fG9vvJkl+bFoqYZ7AkGnG3QxWiYxj6LyavefyNbZ96W+x+WOv/+dMXHmoVVIAhR/arJSZ5kUw6jqB4yV9nljm85LRb9yWt6sFiyrvcWgC1U3amD2ovTl8HwzboZixd79I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BHpKM+WN; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BHpKM+WN"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-afeceee8bb1so421739366b.3
        for <imx@lists.linux.dev>; Sat, 30 Aug 2025 01:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756541114; x=1757145914; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+3FytFWpN13QNaZlIP9PT23YkoDdof1b13hg+sNa10=;
        b=BHpKM+WNxAlZXNg2MmM33pmyWFj4VzgcRUYLR/tYpv9PjwrlT4myvWlVldZIRmmprc
         1SZBLLsXEz/MJ7HLfy3oCJeMhy3+KbNoDwf/GdRZHOSTrYrrDI/CKHF5WZVZwr/m0VMM
         plLrnLZcU7ku8zWNsbd2/zBx1KyYCL5EL68VIqnlfXBmVsgr7leaMlRyVhp/Bn5rrvFW
         rowp4mU4lsrU35P+wLDjWYjGZKhZt0mdj5Fx22NTxrEQSCrac8KvZ5sEOr66NpEqe3zf
         WlE3QOtD6j6xcBoI3vrQ7ys9eQuokspw7m4io0C429TAvC1aKhUa3p2g7ilsccmnyHVw
         hbxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756541114; x=1757145914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E+3FytFWpN13QNaZlIP9PT23YkoDdof1b13hg+sNa10=;
        b=MDez5ow3f7HYt95tcjCRrXXghMlAAHRBtTNpZ95rtDFakHetmGkzjLjbMi+Ug+Cbk3
         C/mZDtGE6NjOErtyNOs7WjObwBLinpJRtaCm0gX9PKbXbPz8ZqlvzRGVNdvwuHWKRnxi
         LekZ9e1YxO/uTHlP5UUQtvgOux72KQCiVlq2YILC1/8GIZn91BfNtMZ47peydu8vxr/d
         55dqdWakX8iAXlQQHCVVrMQY0msB8FPKff8g5mrwC7HIFXqsVS9h9d9Mb4BcSrkwDt8J
         AnP1fljRash+rOCBRU1FQJuMKnxvGC/lr/0QUDV/JoCZBwlPTJ8evhyaYQqsk0YtPqyf
         +azw==
X-Forwarded-Encrypted: i=1; AJvYcCXN+rnTBqpF645/1sz1UdyCi8sGHijkSFrVz7SsJ/puZe7aRqUPBsXkyGjRA/uszPJSlJc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1pOkcbxqW2Pio070yy6RVUN+IkiY/bCzVT8lDhWCU46NfSprW
	mh7Au6cKI59aoknw28W7Z2+WKW0ftDG13z7Uk8gg5kjl0JA9E4pzHDhFGCujDlXB6qjh2hdlnBQ
	l5pFRZInLNcL2zQwvdWL0fAd1TSwyo4k=
X-Gm-Gg: ASbGncsGAxe39GH2SHkG2FCbd73jMvZlZuWBbOB2iMBqDL0NlmycQvg7pO2H/FbEQ8Q
	zKhzhRr8lLFLqf+pXwMZngixy7RLc6a7sebi14efN/HIgJh8RtUh0DTaECpROnZ4DcdnTclDier
	G+T1UsGW+mg9w5wi1IqlPSquGF9yMECdz0LCQJqsu5BC+e+JWZucSiQggpGNkJz1HXFclq2tYUD
	rMGGbI=
X-Google-Smtp-Source: AGHT+IGzflFMFHhQCk11BPmcxfewbn8R9ACv8Yo0SSn9TtnTW1JgawjqxVwsmdBQr0ZCbodUJMXZIPy39a0Dt37TD0k=
X-Received: by 2002:a17:907:7244:b0:af9:6e2b:f30c with SMTP id
 a640c23a62f3a-b01d972f530mr112838566b.34.1756541113922; Sat, 30 Aug 2025
 01:05:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org> <20250828-pinctrl-gpio-pinfuncs-v6-4-c9abb6bdb689@linaro.org>
In-Reply-To: <20250828-pinctrl-gpio-pinfuncs-v6-4-c9abb6bdb689@linaro.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 30 Aug 2025 11:04:37 +0300
X-Gm-Features: Ac12FXzW7SA_uUOkcPEFLfZfGLYsYzzZVOKlWfYhU6akvDLYnA0W6YgK2rZDIDs
Message-ID: <CAHp75Vci1uAcA9ahofn95hxufa+Yi1Fjt4w74HSObQq-Rz5zMQ@mail.gmail.com>
Subject: Re: [PATCH v6 04/15] pinctrl: mediatek: mt7988: use PINCTRL_PIN_FUNCTION()
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
	Danilo Krummrich <dakr@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 28, 2025 at 7:00=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We have a dedicated initializer macro for defining pin functions for
> mediatek drivers so use it here.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
