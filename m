Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E194C258CF1
	for <imx@lists.linux.dev>; Tue,  2 Sep 2025 22:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756851513; cv=none; b=MxnGoxR2qhIYaEsPZHs9v0eakerpPe54UJ9IOrmUaZp06i1agqQ8fOKz+htewIrON5LrqelRBHiZ0tXqKXK2EUe0lfsB+KqfFzRjzwFV5cXvkVA9zVBOuDZtnWaSMt/GtAvG1SKkXwKnyS1KghNQDOic1S1nz6o2JTanS/GNSSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756851513; c=relaxed/simple;
	bh=li67uZ6xqKQCADV810jgcapd5oaTXRr3DZZuD3FIP0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eU/MWUxLG0sf5u4Ja4B6jK90fd3wAqkOu/vm8uR1IghnfPS485qPwXIgClO/wZQu+cuPCGAikVjLHHyZosfbzw8BTIZsE87NGK2rjVIHo4ETknU8Iyyzemvv1LYaVIUQAKnrKLEtqCqIic9RsmU6TNnO2cVPLU3mFG7VAQ6A3Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FHd5z7LF; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FHd5z7LF"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55f76277413so3342740e87.3
        for <imx@lists.linux.dev>; Tue, 02 Sep 2025 15:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756851510; x=1757456310; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=li67uZ6xqKQCADV810jgcapd5oaTXRr3DZZuD3FIP0o=;
        b=FHd5z7LFynJjwSWpowesC1Xb9w33JT2YgDOzjKtlykUvY26NXAQK1rFMjlJhHGPG8L
         LDfvTBmR0SVss1+JBYpzDnaz6MruFzBX//vj+CHk/qb/+iZBOIkkjxRrw3COa8Debw4M
         Ic41n+n45SatmVFCnzX3YzDw5j5cuHWJPoyK8bNNscXQU/gX61mScdWTB7K1ocDkhT7G
         HuU48glL+1m05e4EhUFageQr7W47RBF0nFfKQSGeVpvKLBCdVOZET3forNxoPjJwXyqM
         JRocs4WDqEM92HdtI5Tt6SErz1bpV973m2Dh1kfQBB5/rDAH2sqV48E6+R+9jleyxtvW
         d+nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756851510; x=1757456310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=li67uZ6xqKQCADV810jgcapd5oaTXRr3DZZuD3FIP0o=;
        b=TAn1+eH7OXKzpSKRc3f6KmXKrIVQlEkdotvZmOXYbn5a8LYXcLMK1FMiTtkBrlryy9
         9LkjAUp/HojJR/vcuN9Sukpw6ITxDlTnqe20nFYeoLgemZJhE+7VrG5SFGEY+YSJOITV
         O7Qu8HugjijKQb/oo54d3kSN1X+ARRmfn5BlqGHJBntWJ3zPkxWLkdssx9JZS0Vry/TT
         paRGZp2+LBxaySjOK6g0ATUMl5U5cEQD9I4q7dto4raJPMgrpstnYZfj/f2iVaaT7d3I
         waZrw7q1Z069Ar6g/eeojH0n5c3qo6t4+3jE+8cssgHqX0AZVFRLpdII5NXcDfWnNhnI
         vIkA==
X-Forwarded-Encrypted: i=1; AJvYcCWspgYZ+XVqdSRbz0aP7QkJAnna4QoDPlEjKW4JyHZ2H8NcfFVYZdqeegf8zzkeh82NxuQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwgTgcP/ZKEkSLaoG3/gSRUH7Jluor3qTw9TNbkRIHNlFVEaQr5
	DAr8gCHHaBsb8wqWRQRvH2/edaBJ1J+tediHFJRDlw0jcNjBmAS2XonZtkILBq51oEUqF1D/Ri4
	J9o05j2+X+RaQ0R4DXyev4mH3V87aO8b/jSx24YQakw==
X-Gm-Gg: ASbGnctXw+zFnox4g4fyFkCW3hMqSPVJlPLmw13SmXzmExvviSV5M/ZHrN4GNm22Yjq
	jNmz6rg6HfP9Vn09MlKM46/BVN2oHYjp/S4C2gOgu/Sv6w3liTv59uhqKUO88rl07zW7G3XQZfk
	x7wuvdLfEqoT5y95wgWOXbOeZGGdf37Q6aumxvBxMBuqnSKB+LRBLJxYlYkfZ4YWAhDgQVlzumi
	DBoqqCNnQ81/0vhXg==
X-Google-Smtp-Source: AGHT+IFb5FJ4SVuaW/MZYjqlxiCtjVdy/Gs9hCmULK5gWsYMbnHTDsvg0XfXKbqBDAFJs9xAYF0giEeS6uNYA+ao+FQ=
X-Received: by 2002:a05:6512:3d11:b0:55f:65fc:8db5 with SMTP id
 2adb3069b0e04-55f708b9c56mr3711945e87.23.1756851510074; Tue, 02 Sep 2025
 15:18:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
In-Reply-To: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 3 Sep 2025 00:18:18 +0200
X-Gm-Features: Ac12FXw-1tPuaZxU9kVS8RfwbL5AeZ_YF1A5IdRwoR4crjvnC6JAL_oHeKPOKoA
Message-ID: <CACRpkdZ-Toq9MziPisZCcT7zcL3rosQYZ1Jw=RWCH1KZTbeBug@mail.gmail.com>
Subject: Re: [PATCH v7 00/16] pinctrl: introduce the concept of a GPIO pin
 function category
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
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
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, stable@vger.kernel.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 2, 2025 at 1:59=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> We have many Qualcomm SoCs (and I can imagine it's a common pattern in
> other platforms as well) where we mux a pin to "gpio" function using the
> `pinctrl-X` property in order to configure bias or drive-strength and
> then access it using the gpiod API. This makes it impossible to mark the
> pin controller module as "strict".
>
> This series proposes to introduce a concept of a sub-category of
> pinfunctions: GPIO functions where the above is not true and the pin
> muxed as a GPIO can still be accessed via the GPIO consumer API even for
> strict pinmuxers.

This is what I want for pin control, and fixes an ages old issue
that pin control has no intrinsic awareness of if a pin is muxed
to a function providing GPIO.
So patches applied!

Any remaining code nitpicks can be fixed in-tree, I need this
to be able to apply the much desired Broadcom STB driver,
so this needs to go into -next now for cooking.

I also want to strictify some drivers using this, bringing GPIO
function awareness into them, which is a good thing!

Yours,
Linus Walleij
