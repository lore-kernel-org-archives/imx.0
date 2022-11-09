Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8BE17C2
	for <imx@lists.linux.dev>; Wed,  9 Nov 2022 01:30:07 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id z26so15364727pff.1
        for <imx@lists.linux.dev>; Tue, 08 Nov 2022 17:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3N404XwUgTy0PrRfb6253/OsDITUBh8vwB0xePuTtwU=;
        b=mr+CAXTFhVONLtU0kR0l4utue8cMN3bgrveICwM770SB2o17suBZQOrM3lcp7Iyngz
         cOQNS93ebjlGkq8fri6BOwJDHMVsK6CU2jo3PbwT+3NpH5IgeQhVIAEGhKBchky62qBS
         dMgKnAKb2UYT6Fl+y8K03yqOI1WClTRiDCGkVxd3pMyFkseWLGktydMdGRXsvCqSU3vK
         53M77ogd/++Ydba4m0DKm0iJ0OucCBBMlSTZIw1xYXrVn7+VZoJdpP2uq3OY5l8oXB1m
         xZr+Ct5km4J2vbGZZd48vocRYtgGFtG/MFV6tobf6cZUzbJuPBzaKQA26D9Eu3635taZ
         DPsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3N404XwUgTy0PrRfb6253/OsDITUBh8vwB0xePuTtwU=;
        b=vwQF/9aJFXPtL+8Px9f2H61UfR4KTO6JO9yrlegva0RbvW5l9T14yqzIVNFhukasLk
         FIUmsFpNS8KlHphSZn1sUUa4ED9qiqVqFBAvHSV/7/K60PZhJ+fGhP5g4kCN3QEnuMmH
         /OeXCge7LMHfzguVWopLZlG7wxN16+6Fy3PS/vUO25aEZqoYD1wcVuDgbttYr0F016Ow
         CnJ1zr5C4GEEICuSjeLQOz2YdEa2a4DUUhhZyV5wEf+OQeGWBWNGYOHpR21EO9broIHi
         4izVVMJ7Euo5suntjUfOjy9z5f2I83ysPvddWUkvbz69I1jCtCZtq6Iu1mTzsVIM9fT6
         z2qQ==
X-Gm-Message-State: ACrzQf0NSHU/8iWMfPyesTdaCUfd46je8HVF6XOnBUSKGz/XJpYWtng1
	rStL7mLOlUWQiIe9njsHn+ASkd5wwZSBDp3JIdw=
X-Google-Smtp-Source: AMsMyM5dn/qopXh5MXQyDKeHSuuy/S7lMPRtUmwpiKQBKmiO3ZHqUmPH7v22FdbTgEABCsF2BvM+TzFIu5ZLS68TsKk=
X-Received: by 2002:a05:6a00:3249:b0:565:fc2c:ad79 with SMTP id
 bn9-20020a056a00324900b00565fc2cad79mr57915724pfb.72.1667957406569; Tue, 08
 Nov 2022 17:30:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221027130859.1444412-1-shenwei.wang@nxp.com> <20221027130859.1444412-2-shenwei.wang@nxp.com>
In-Reply-To: <20221027130859.1444412-2-shenwei.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 8 Nov 2022 22:29:53 -0300
Message-ID: <CAOMZO5Cy3h50QmjnTBDNweQS3JZN6HEx6A549860hUg5opuftQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] arm64: dts: imx8dxl-ss-lsio: add gpio-ranges property
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Shenwei,

On Thu, Oct 27, 2022 at 10:09 AM Shenwei Wang <shenwei.wang@nxp.com> wrote:
>
> add gpio-ranges property for imx8dxl soc.

The commit log could be improved by stating the reason for adding gpio-ranges.

Thanks
