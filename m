Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C36215B1
	for <imx@lists.linux.dev>; Mon,  7 Nov 2022 10:30:31 +0000 (UTC)
Received: by mail-vk1-f182.google.com with SMTP id b81so6307206vkf.1
        for <imx@lists.linux.dev>; Mon, 07 Nov 2022 02:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+8+uu9kKMEq8Y9OytB8gsVKut4lj3U0/a/S35uT3UQU=;
        b=MDTYVKCNb0/qgY91nHj/Ep35Uoawu+BRg898hqS8zg/Je5DSaYTXknBqq7645UiEGb
         mKIf5IfDCiYNikSC5gV+YsfKpkEZBFDrtQW+E7SGZl53VB1+CSORJ1wKHVVWBIbWfGa5
         nepqOj5o1L74FadAoIMIuvYubN3MPSHk3Jf3HhhZgTjPMVdKvTe9dY1+/2BEsJRRY9/3
         qdvNqs+AN6uFaVshhSTH9LgLvI0Z13z/iiSBHmbbIMo2sRKh8O3SYIRl6BFN8D299Yms
         9F2l99bQgu4KlGxqwV0y8DKInddibkNB2OmXb7QBjn+76h7KtF/Rhn33LSn6Kq2kmUJy
         Vzew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+8+uu9kKMEq8Y9OytB8gsVKut4lj3U0/a/S35uT3UQU=;
        b=4dC6RfuO+pxS5NanaadPuV3nRaOiVnlfyKq9nqlpCBNZAxhk0fKdK2T69l0ilrMBdO
         FczSWprgQH/Hp7fH9pUJzSBGxW1lkk7oxvRlJwtrJviCb9Rgurifl1jyf2X4qZyzparG
         mNpd9eegnfWDW6If+/L8ZbkoQCP1M/xtFRXXXjQtDoI9i2Z0ATnvNaDJd1O6Eraaq/oY
         fNgVLm0zauSQ73vKaN2cd/n3oBvVqpZGDjPqLftknaN6c0IkK9XvMKxhtEOruhefhudi
         HswmfUFXhVjJeVUPdqi3dM5+Gd5BLoOQFlCEKZp2WUq1I+pPIfu++uA4ljsQiit8xq8U
         AADg==
X-Gm-Message-State: ACrzQf324GV8VpFooQxT0g2x8s0w8279dquLZqMZZY3BuzMYOngj2Zvf
	0tThckivjRLjTwF/umupalnEdYsUMZLBsrjVJ0RFEg==
X-Google-Smtp-Source: AMsMyM40dfLheNyJpxRKrlruFqXHZd3uAgc7HrLOqZvbFfPbKtA0whtMMMLzf5d7lWMkSxfcWdRjVful/T9eocL8Dsk=
X-Received: by 2002:a1f:e5c2:0:b0:3b7:3aca:9868 with SMTP id
 c185-20020a1fe5c2000000b003b73aca9868mr7842964vkh.33.1667817030498; Mon, 07
 Nov 2022 02:30:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221027130859.1444412-1-shenwei.wang@nxp.com> <20221027130859.1444412-6-shenwei.wang@nxp.com>
In-Reply-To: <20221027130859.1444412-6-shenwei.wang@nxp.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 7 Nov 2022 11:30:19 +0100
Message-ID: <CAMRc=Mf+ByrcBt64gMdiWTgBRETuNHoJZNud1ZkW1T77rR6+QQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] gpio: mxc: enable pad wakeup on i.MX8x platforms
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Peng Fan <peng.fan@nxp.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 27, 2022 at 3:10 PM Shenwei Wang <shenwei.wang@nxp.com> wrote:
>
> On i.MX8QM/QXP/DXL SoCs, even a GPIO is selected as the wakeup source,
> the GPIO block will be powered off when system enters into suspend
> state. This can greatly reduce the power consumption of suspend state
> because the whole partition can be shutdown. This is called PAD wakeup
> feature on i.MX8x platform.
>
> This patch adds the noirq suspend/resume hooks and uses the pad wakeup
> feature as the default wakeup method for GPIO modules on
> i.MX8QM/QXP/DXL platforms.
>
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
