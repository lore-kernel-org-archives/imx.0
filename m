Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64B310F7
	for <imx@lists.linux.dev>; Mon, 17 Oct 2022 09:39:32 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id a26so23565531ejc.4
        for <imx@lists.linux.dev>; Mon, 17 Oct 2022 02:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J0YhO3HzLm2V4h7OTfmPCXEk6LVGyM2MExF0oyrbPLs=;
        b=Wffr4UFGk/jp/aCXUwFCyJvIwsfYrNcE4ANBGsE/TtCyub6pfENvEepM72XsNEMsOm
         tyb12pgmvbBVqhg3L/86HMp9z/52cbFlsCsgpYxRreEtVLAoqYGfQVaHeoO3OT1uLUPd
         VWTXUtW3pcjrLKjhBvnF5ShkcmCcBAjFNAW7zFgXkjJQ1PB93K4IBV7/VdRrMcLgeFAI
         kkh1PqYJeCc2tumvRUCSrUyxEUpLjeyLb7GorEWSiuGNxyjMbhMdkvIzOZkCScg3aGtP
         jJQ9N5fJRr4oPavqkqzf537164n7AvMGr2Wimpr5/n2FiB8F935GLLVDrmHMNAwmn1QR
         aTBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J0YhO3HzLm2V4h7OTfmPCXEk6LVGyM2MExF0oyrbPLs=;
        b=oLGG/QP1CWCNlFDp5Q/x6K14wyKfMH837tU4N8myXfRwYQWMtw2U5dOn+qaDnHxEv9
         QUVRgTNhS6+Qty0KCCdc2bvsb6qCVMrhx9f3EFI2/LrSGCVjy8WZfgW5qcOKUzhk5udk
         PHsjQmEqtmj3m3TDpY5GcxIz0F+2+kzBM0r2cHaXdSykBnQRBvQII3y2ieUDETdf8pqe
         If/QY+EkxD2SPlmlsQNJskh7TgezUHJDWttBf3VGykaT35HIYhF3B5e62NMgrmMSv/cL
         wYH44z5LP59P+wKaFCCgvjQpE05XLQXaNV9XbgGm+aEwfmB1zc/q2hMxAGfvRbuHsiuZ
         uCqQ==
X-Gm-Message-State: ACrzQf0OUB8BwWwfaQvMPLbbrScK7bsk9PUHed21nlh8E5e9dw3wyWXl
	mOVqFGRzWQFHfhvlz5VMp8ssJ+fdHVP5X3H0Nu6C5A==
X-Google-Smtp-Source: AMsMyM7MydtQD2B74+S86KBF0MsWw1L6jmxP6JDsOzPL9wKuvOqq5tsExhAnLgBdku3EgCNpI9yqTWZ+DT+UqiEOoWM=
X-Received: by 2002:a17:907:a06b:b0:78d:d25f:b726 with SMTP id
 ia11-20020a170907a06b00b0078dd25fb726mr7972727ejc.203.1665999570894; Mon, 17
 Oct 2022 02:39:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221007152853.838136-1-shenwei.wang@nxp.com>
In-Reply-To: <20221007152853.838136-1-shenwei.wang@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 17 Oct 2022 11:39:19 +0200
Message-ID: <CACRpkdaKncznz5qej6owA2OGMeqbrif9e_QO3CWN6+sGhEApDw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] gpio: mxc: add suspend/resume support for i.mx8x SoCs
To: Shenwei Wang <shenwei.wang@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 7, 2022 at 5:29 PM Shenwei Wang <shenwei.wang@nxp.com> wrote:

> On i.MX8QM/QXP/DXL SoCs, even a GPIO is selected as the wakeup source,
> the GPIO block will be powered off when system enters into suspend
> state. This can greatly reduce the power consumption of suspend state
> because the whole partition can be shutdown. This is called PAD wakeup
> feature on i.MX8x platform.
>
> This patch enables this wakeup feature on i.MX8QM/QXP/DXL platforms.
>
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  Changes in v2:
>  - fix a bug when finding the pad index

This:

> +#define IMX_SC_PAD_FUNC_GET_WAKEUP     9
> +#define IMX_SC_PAD_FUNC_SET_WAKEUP     4
> +#define IMX_SC_IRQ_GROUP_WAKE           3   /* Wakeup interrupts */
> +#define IMX_SC_IRQ_PAD                 2    /* Pad wakeup */
> +
> +#define IMX_SC_PAD_WAKEUP_OFF          0
> +#define IMX_SC_PAD_WAKEUP_LOW_LVL      4
> +#define IMX_SC_PAD_WAKEUP_FALL_EDGE    5
> +#define IMX_SC_PAD_WAKEUP_RISE_EDGE    6
> +#define IMX_SC_PAD_WAKEUP_HIGH_LVL     7
(...)

> +const struct mxc_gpio_pad_map imx8qm_pad_map[] = {
> +       /* GPIO0 */
> +       {  0, IMX8QM_SIM0_CLK},
> +       {  1, IMX8QM_SIM0_RST},
> +       {  2, IMX8QM_SIM0_IO},
> +       {  3, IMX8QM_SIM0_PD},

this is pin control.

I think you need to think about adding this to the i.MX pin control
driver instead, possibly cooperaring with the GPIO driver.

I'm not entirely certain about the relationship between MXC and
i.MX so correct me if I get this wrong...

To me this looks like two drivers could end up fighting about the
control of the same hardware if you don't.

Also CC i.MX Freescale pin control maintainers on all patches
like this, thanks! (Added on to-line.)

Yours,
Linus Walleij
