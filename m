Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56648F4A
	for <imx@lists.linux.dev>; Tue,  8 Nov 2022 10:24:35 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id k2so37386629ejr.2
        for <imx@lists.linux.dev>; Tue, 08 Nov 2022 02:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BTTHBNjBtTpYDRiI+nagl9P0lankquzjvOptk3WzP7A=;
        b=o4IaTT6mhB9aAAypocUuyM2wEnWmwMci2CqOIhamCcZJft7dfV07Yi/lxD5tqDaSyd
         L2aWt7W6dKFVwLMl0fk8yoK6DgH8pD7V5Zf5XWEVf72mnA8oxAvDjwoJoZ7GG0AvLKR6
         E87H251kjTeHwZYlaHZ8+LeUlvEP4+cxss1jZZ68MvMsX8bZWHk4zc7O5usiF1WHi3xE
         yj79OrOl0aAjhm2JJt62dC7OzxEqFLr9MnJGKcVx9Uu3CNJaShSn4u1A+vvB6t1V/Sue
         ZbWEKlTDwTGsAxRQbqqrax+WkjN5H1Tt0Kn2iGd44eAnKt6oU7ieLXP4qyfSduLnbjI9
         ixbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BTTHBNjBtTpYDRiI+nagl9P0lankquzjvOptk3WzP7A=;
        b=AoOEptsRTCiBakSMrGOh8mOFUdHvjpkRKzWZ9jt9gylEWI03esvzANVUFgRbe0W54+
         g+H0v0/OmlBPbF0BjWfdfry8cCjB9lrqG0eNoRGMxR/9FLgpZviv4SeJw3827v+DW0X9
         K+b5onXSjM1j5HyIZBGL/CBAJBojD7jS0njSJzB7BN1FJ2t5tqBYzTizzPXy+c+rW1K2
         CIUeqf712TyJkN8X4xbwN2n6XA307Em6v3P0YyKiWpddCzDYOfBEcJJq2jKcXoMd1jU6
         B/2jowRHV3R14eoEIO1uUeQXCpajmGgihfYzCqMkx7juaGz0qJLK3H3tOofMoxdRwD8t
         2WSQ==
X-Gm-Message-State: ANoB5pnxzH6k/dv6PoerDndwe4FNI98EJ7GezWrXb4LXGraPj3MrpM2d
	2P0qFM1srs8+0wxTsFT2xiW241gR/5FzJX8qYIMa4Q==
X-Google-Smtp-Source: AA0mqf5MOcAk17Z/aFvf+7ny+bpNY81RyNBA5Z+fpcYISwJidn/J6X0PdTakonxMEwooWMgTwTgz96R8CVOZ3Cwd1/U=
X-Received: by 2002:a17:906:6acc:b0:7ae:658c:ee45 with SMTP id
 q12-20020a1709066acc00b007ae658cee45mr10466302ejs.190.1667903074024; Tue, 08
 Nov 2022 02:24:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221027130859.1444412-1-shenwei.wang@nxp.com> <20221027130859.1444412-2-shenwei.wang@nxp.com>
In-Reply-To: <20221027130859.1444412-2-shenwei.wang@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 8 Nov 2022 11:24:23 +0100
Message-ID: <CACRpkdbrnxmHv-rn7fiuMkH=asK2D82fdiUUgdqk70Hs9V4b9g@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] arm64: dts: imx8dxl-ss-lsio: add gpio-ranges property
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Peng Fan <peng.fan@nxp.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 27, 2022 at 3:09 PM Shenwei Wang <shenwei.wang@nxp.com> wrote:

> add gpio-ranges property for imx8dxl soc.
>
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Please put this into the i.MX SoC tree.

(If that doesn't work tell me and I can queue it in the pinctrl tree)

Yours,
Linus Walleij
