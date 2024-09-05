Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7A01A00FA
	for <imx@lists.linux.dev>; Thu,  5 Sep 2024 17:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725556370; cv=none; b=M7bSOsMXaOLYjUoqwDxjXAzh2SizWuyjtuSLym9yiR10/mXYCHg91Mzw5zyIHoM3pv7WtWY7k2D+2cMP5/OSnFW11nVG1IgWdTpB070WruokFXtnAmhH9c6iwmsu4UX5gsfqvwq/2e7qUWnfjm/1SzhH5NcPk2LkhEIdcQ2yg8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725556370; c=relaxed/simple;
	bh=A7TtDQQAdTUo+ZDaXSaI6ceuzOQKZTjGvuB/qTrYS9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I4lomaVoGihRGBJm7ZnzKb7BoB2E+ePdk8op3iEu7Knert8xa8c453DNplGSeMaWvDLX/Aj4kMqXRDakf8HLUFKF1fCUcvsx8MqfcXouAD59c5xb0VW9usGcgJTBjUkWTUfjobDoKxT+IcO3mPjrVza4aHKuuRjKXICuY7j4MDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3UhiqmZ; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3UhiqmZ"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5334879ba28so1290870e87.3
        for <imx@lists.linux.dev>; Thu, 05 Sep 2024 10:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725556366; x=1726161166; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MtORbUfBuSYpw+ZpNAYafseBri04aZwmXOf583OZnkE=;
        b=h3UhiqmZGSWyisaxt6AR9fVh72kb3+q2VohlhRWbc6LVQcmYzM2BuMDjtb5emPZ3Ag
         i/PvoGTEiUr5+XvBhZWXQaVU9DGaPGEbYOq3wwgyljumh4/rhsjcupjwq9kmbP+ccDso
         dLXdKAXEK2WRWUTRBciDfg3xfpfP2/11zmU/fb2+RNcH4hKkBlONSgkKEaNgQ8YHkLyp
         +a8K/iCuf/cCIv+A5HPQVNf+sRBsPzq10ZGCuEXX8JxOOXvFNB52jqVIOhlShhfN5Hwb
         nx73nji+3bWVxj+u+5rt9GhwQc6jMYH1Fd29gNL7a4ZLxPOlwRnd02WHQOT/iTK6/0N6
         pEsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725556366; x=1726161166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MtORbUfBuSYpw+ZpNAYafseBri04aZwmXOf583OZnkE=;
        b=fH3sIcgsrNklZlnM2OhxFNOs/qzN8QgzlY2hWXQZ/uDjv6iM3rcOFc3T8VcHnQBVsv
         6mDeQSVixNVs+XC1EVSNrgDfB3/Qp8hazO/qx+TXwvdMctfFexb4pEnMDdaw0zyiXmLd
         aqmYfOYPF2XqXWElJ8Okv2NCVFD0/EIo1wyvlMKurhDY9BmzI+tQpCbTzkhXX5FIkVOU
         hTzGfZ8HCT/E/MOdrc9StpoXByANriJL9NXyW+9Lhle59ItyhjoMpESWbxbc83KtdhxL
         yAxBY5/ry11z+5CEV8KMGEsTtdaXGZJLzOPGeFDZpShmifaZiC1+K3iP7Ba6F5jVisAS
         F9Pw==
X-Forwarded-Encrypted: i=1; AJvYcCVxiFdL2RDLGouYjqYplF0K6M+Tg2+65ZLz/MxaxDO3hhctWrBvTQqPoMbNkCL7VH+LTcI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyT64Ax0TCyNZjPhkwzGJjRtdYIMzaz80RB34T1Z+yv0QkW1u7E
	1c/fXAHdzUsU4lf6GQ/vT9V1ovj9vNHRsrKN2FppWPv/l/eY5lZL1EzIJ0YN+5mN0s0g7JmNI1+
	t2lss9CmYWb1DdwnnOZhfMBDYzYA=
X-Google-Smtp-Source: AGHT+IHSwofzoxwQsG0zMSSmo1+llgW2Wy3bZzwTo3q9Dkz410dXl/IeuLUWClfjbJdYjUEnCtJ+IeVIoX1nfMyYe0c=
X-Received: by 2002:a05:6512:2394:b0:536:55a9:4b6c with SMTP id
 2adb3069b0e04-53655a94bf8mr892897e87.13.1725556365789; Thu, 05 Sep 2024
 10:12:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240715-pwm-v2-0-ff3eece83cbb@nxp.com> <20240715-pwm-v2-3-ff3eece83cbb@nxp.com>
In-Reply-To: <20240715-pwm-v2-3-ff3eece83cbb@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 5 Sep 2024 14:12:33 -0300
Message-ID: <CAOMZO5DNmHfHWbLoPj9P=_+JiLLQ4tiDd_90+UX+_psN2o+Knw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] pwm: imx27: workaround of the pwm output bug when
 decrease the duty cycle
To: Frank Li <Frank.Li@nxp.com>, Marek Vasut <marex@denx.de>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	pratikmanvar09@gmail.com, francesco@dolcini.it, 
	Clark Wang <xiaoning.wang@nxp.com>, Jun Li <jun.li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Adding Marek.

On Mon, Jul 15, 2024 at 5:30=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:
>
> From: Clark Wang <xiaoning.wang@nxp.com>
>
> Implement workaround for ERR051198
> (https://www.nxp.com/docs/en/errata/IMX8MN_0N14Y.pdf)
>
> PWM output may not function correctly if the FIFO is empty when a new SAR
> value is programmed
>
> Description:
>   When the PWM FIFO is empty, a new value programmed to the PWM Sample
>   register (PWM_PWMSAR) will be directly applied even if the current time=
r
>   period has not expired. If the new SAMPLE value programmed in the
>   PWM_PWMSAR register is less than the previous value, and the PWM counte=
r
>   register (PWM_PWMCNR) that contains the current COUNT value is greater
>   than the new programmed SAMPLE value, the current period will not flip
>   the level. This may result in an output pulse with a duty cycle of 100%=
.
>
> Workaround:
>   Program the current SAMPLE value in the PWM_PWMSAR register before
>   updating the new duty cycle to the SAMPLE value in the PWM_PWMSAR
>   register. This will ensure that the new SAMPLE value is modified during
>   a non-empty FIFO, and can be successfully updated after the period
>   expires.
>
> Write the old SAR value before updating the new duty cycle to SAR. This
> avoids writing the new value into an empty FIFO.
>
> This only resolves the issue when the PWM period is longer than 2us
> (or <500KHz) because write register is not quick enough when PWM period i=
s
> very short.
>
> Fixes: 166091b1894d ("[ARM] MXC: add pwm driver for i.MX SoCs")
> Reviewed-by: Jun Li <jun.li@nxp.com>
> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change from v1 to v2
> - address comments in https://lore.kernel.org/linux-pwm/20211221095053.uz=
4qbnhdqziftymw@pengutronix.de/
>   About disable/enable pwm instead of disable/enable irq:
>   Some pmw periphal may sensitive to period. Disable/enable pwm will
> increase period, althouhg it is okay for most case, such as LED backlight
> or FAN speed. But some device such servo may require strict period.
>
> - address comments in https://lore.kernel.org/linux-pwm/d72d1ae5-0378-4ba=
c-8b77-0bb69f55accd@gmx.net/
>   Using official errata number
>   fix typo 'filp'
>   add {} for else
>
> I supposed fixed all previous issues, let me know if I missed one.
> ---
>  drivers/pwm/pwm-imx27.c | 52 +++++++++++++++++++++++++++++++++++++++++++=
+++++-
>  1 file changed, 51 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pwm/pwm-imx27.c b/drivers/pwm/pwm-imx27.c
> index 253afe94c4776..e12eaaebe3499 100644
> --- a/drivers/pwm/pwm-imx27.c
> +++ b/drivers/pwm/pwm-imx27.c
> @@ -27,6 +27,7 @@
>  #define MX3_PWMSR                      0x04    /* PWM Status Register */
>  #define MX3_PWMSAR                     0x0C    /* PWM Sample Register */
>  #define MX3_PWMPR                      0x10    /* PWM Period Register */
> +#define MX3_PWMCNR                     0x14    /* PWM Counter Register *=
/
>
>  #define MX3_PWMCR_FWM                  GENMASK(27, 26)
>  #define MX3_PWMCR_STOPEN               BIT(25)
> @@ -232,8 +233,11 @@ static int pwm_imx27_apply(struct pwm_chip *chip, st=
ruct pwm_device *pwm,
>  {
>         unsigned long period_cycles, duty_cycles, prescale;
>         struct pwm_imx27_chip *imx =3D to_pwm_imx27_chip(chip);
> +       void __iomem *reg_sar =3D imx->mmio_base + MX3_PWMSAR;
>         unsigned long long c;
>         unsigned long long clkrate;
> +       unsigned long flags;
> +       int val;
>         int ret;
>         u32 cr;
>
> @@ -274,7 +278,53 @@ static int pwm_imx27_apply(struct pwm_chip *chip, st=
ruct pwm_device *pwm,
>                 pwm_imx27_sw_reset(chip);
>         }
>
> -       writel(duty_cycles, imx->mmio_base + MX3_PWMSAR);
> +       /*
> +        * This is a limited workaround. When the SAR FIFO is empty, the =
new
> +        * write value will be directly applied to SAR even the current p=
eriod
> +        * is not over.
> +        *
> +        * If the new SAR value is less than the old one, and the counter=
 is
> +        * greater than the new SAR value, the current period will not fi=
lp
> +        * the level. This will result in a pulse with a duty cycle of 10=
0%.
> +        * So, writing the current value of the SAR to SAR here before up=
dating
> +        * the new SAR value can avoid this issue.
> +        *
> +        * Add a spin lock and turn off the interrupt to ensure that the
> +        * real-time performance can be guaranteed as much as possible wh=
en
> +        * operating the following operations.
> +        *
> +        * 1. Add a threshold of 1.5us. If the time T between the read cu=
rrent
> +        * count value CNR and the end of the cycle is less than 1.5us, w=
ait
> +        * for T to be longer than 1.5us before updating the SAR register=
.
> +        * This is to avoid the situation that when the first SAR is writ=
ten,
> +        * the current cycle just ends and the SAR FIFO that just be writ=
ten
> +        * is emptied again.
> +        *
> +        * 2. Use __raw_writel() to minimize the interval between two wri=
tes to
> +        * the SAR register to increase the fastest pwm frequency support=
ed.
> +        *
> +        * When the PWM period is longer than 2us(or <500KHz), this worka=
round
> +        * can solve this problem.
> +        */
> +       val =3D FIELD_GET(MX3_PWMSR_FIFOAV, readl_relaxed(imx->mmio_base =
+ MX3_PWMSR));
> +       if (duty_cycles < imx->duty_cycle && val < MX3_PWMSR_FIFOAV_2WORD=
S) {
> +               c =3D clkrate * 1500;
> +               do_div(c, NSEC_PER_SEC);
> +
> +               local_irq_save(flags);
> +               if (state->period >=3D 2000)
> +                       readl_poll_timeout_atomic(imx->mmio_base + MX3_PW=
MCNR, val,
> +                                                 period_cycles - val >=
=3D c, 0, 10);
> +
> +               val =3D FIELD_GET(MX3_PWMSR_FIFOAV, readl_relaxed(imx->mm=
io_base + MX3_PWMSR));
> +               if (!val)
> +                       writel_relaxed(imx->duty_cycle, reg_sar);
> +               writel_relaxed(duty_cycles, reg_sar);
> +               local_irq_restore(flags);
> +       } else {
> +               writel_relaxed(duty_cycles, reg_sar);
> +       }
> +
>         writel(period_cycles, imx->mmio_base + MX3_PWMPR);
>
>         /*
>
> --
> 2.34.1
>
