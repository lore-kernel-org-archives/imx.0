Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D3418C008
	for <imx@lists.linux.dev>; Sat, 16 Aug 2025 19:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755373462; cv=none; b=rHoNilAp0dsgSwmRF1x7rzKG/mpbVy4yF4F8hUWJK+B758BrExRABsjKhHmLFYWPK4yVL+SSxOKcP173Ekqkuegb+07BOz/7PgXReiwcU0n7xdVWMYba3+H/GBbu0Ivyoqsw7WFu5tmc5IzZ8PjmNG7F6VNQCVFPfhV+dZEVSLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755373462; c=relaxed/simple;
	bh=CxOkN5Im8aBXZWyAkD76EEsI08M13nbfFlULVi6mYiw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=koPpKy9pLKBKklPMnmB5F8aU9qgnBgV3rqk0YTbJhzbEi6e2Klt5n0vkY99TP7eEZIyojdKRjesWoJ9DsGXN5l3AuPPWaO7L0vK5GhsYv9w3Pr7KydqZ44fpl/B28sb06o6r3RfJXlpRyvKo85UPWK0o47Hdlj8x+GA4aRW9As8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-afcb7ae31caso520642866b.3
        for <imx@lists.linux.dev>; Sat, 16 Aug 2025 12:44:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755373459; x=1755978259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xhNfRQTJCTHs8wZzyX52sBmas0EwpebMHyW2WLiU29g=;
        b=ifQHCMVFMHGvgdrzDbncAt4CU0EGVDtxntKtxuWxlHddAp9KsBTdrNahTYTh5q1rHr
         1Whsuw1/nxw2Uq9EavYdQKUWbbmc0IRO2XZAFkY86DyPz9z29mjzW7YXfmFTY3+0e5DV
         aMIDEDLjRuRVoHD3E2rBGF+3rgFQlOaoiSyOAzIWCEotUcExHSD/mUOo7W2dwDXhCToh
         aCYbTI2yqBFf7HJEodkdnEunNGNbL6U5E/kepnjQ8EUJqR19FOqBsWcFAEu5G2FTJrlF
         G2t3grpSCdkrjF6K3T4alT537OqgE6bnHXe0KmszoeDg/w5J9BsWnR5HVkoaosDuwL6N
         GMig==
X-Forwarded-Encrypted: i=1; AJvYcCVxkqFqIqz6/xaNgV4fsWhQT1FK4Vy+ML9XY5YXM17ktAZdkzCw9VqhEZIxNukwEl4R7I4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzDB/fF4gE/VNSruyAPXA5HJioUrFDqrlIXYsxW5OiSY2zqguP8
	gAkNZGHcPRN4IToa19jIW+Mq/PdqY34ehhuuILR52GCioxHQvo9aPeRmFBvkoQ3tApo=
X-Gm-Gg: ASbGnct0ryOEJRSdJQHEnVv62AjKnEomGqUVWq+U+Qvh/R0T9MqvHThZ0giqIbFAHV9
	zuGUclm46mW0U/9uEcJNqiD+x+IqjvYv4fbQ9B4u8o8QzulCgc3f6jyZH/IEKm0l14TZgv0m6Q6
	VgY68QmS3qYxACYtxdWq8MgiXI0AWg3cm8kUPm7xyMYNu7lUIQtqRfSF9W6NtA+l85nBhjH+toF
	UZPPsVlhADeEJx/TB7q/AIfRsJzTvBEZg1skIH0tGbENan0mIZpLWMRpfOBz2CwCYxEuIsLjg9y
	f9nuPGhRtO6bqzO0EQJht1VsWeBJ8zmW5xZfW87NrqzT8VZPTgVjuzTwI2nCrW17sBA2stQ5v9q
	p/K7vS1dnOhvtMH6Adaa8IP28sahEAsHaBnzA8FM2L57Ki9CM8HjkqamVo11uzgmq46NA
X-Google-Smtp-Source: AGHT+IFMMT4phhEQqjgO9c5CSrY0JXNgBtk7aO1Xrk6rg27oInkYzq/7O+9EQQc6c6cNY+CcHMZzCQ==
X-Received: by 2002:a17:906:478b:b0:afa:1bf0:97fa with SMTP id a640c23a62f3a-afceacfb0camr312431066b.25.1755373458831;
        Sat, 16 Aug 2025 12:44:18 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce53e52sm431666066b.25.2025.08.16.12.44.18
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Aug 2025 12:44:18 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6188b5ad681so4108527a12.0
        for <imx@lists.linux.dev>; Sat, 16 Aug 2025 12:44:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW5kbEsGsj+YiYjmWZwxAgLhv4cnKnFEB6Fmb4c/Cm6oepZdODMBpf7iyaMOuDqgKM1g6c=@lists.linux.dev
X-Received: by 2002:a05:6402:3495:b0:615:5bec:1df with SMTP id
 4fb4d7f45d1cf-619bf1f7206mr3258270a12.25.1755373458280; Sat, 16 Aug 2025
 12:44:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250810220921.14307-1-will@willwhang.com> <20250810220921.14307-4-will@willwhang.com>
 <20250811-cinnamon-tapir-of-music-0bda96@kuoka>
In-Reply-To: <20250811-cinnamon-tapir-of-music-0bda96@kuoka>
From: Will Whang <will@willwhang.com>
Date: Sat, 16 Aug 2025 12:44:05 -0700
X-Gmail-Original-Message-ID: <CAFoNnryfrJvoEHNgQDpSZBbGiGjPr-bwnhhg4cgpNK_hW=0EbQ@mail.gmail.com>
X-Gm-Features: Ac12FXy-vY_C5easw1Tym_fd5E3dOtxKIqhJ9wZAZ5bar5LAous57hWKnWEIrdU
Message-ID: <CAFoNnryfrJvoEHNgQDpSZBbGiGjPr-bwnhhg4cgpNK_hW=0EbQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] media: i2c: imx585: Add Sony IMX585 image-sensor driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 1:06=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Sun, Aug 10, 2025 at 11:09:20PM +0100, Will Whang wrote:
> > +
> > +/* -------------------------------------------------------------------=
-------
> > + * Power / runtime PM
> > + * -------------------------------------------------------------------=
-------
> > + */
> > +
> > +static int imx585_power_on(struct device *dev)
> > +{
> > +     struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> > +     struct imx585 *imx585 =3D to_imx585(sd);
> > +     int ret;
> > +
> > +     dev_dbg(imx585->clientdev, "power_on\n");
> > +
> > +     ret =3D regulator_bulk_enable(IMX585_NUM_SUPPLIES, imx585->suppli=
es);
> > +     if (ret) {
> > +             dev_err(imx585->clientdev, "Failed to enable regulators\n=
");
> > +             return ret;
> > +     }
> > +
> > +     ret =3D clk_prepare_enable(imx585->xclk);
> > +     if (ret) {
> > +             dev_err(imx585->clientdev, "Failed to enable clock\n");
> > +             goto reg_off;
> > +     }
> > +
> > +     gpiod_set_value_cansleep(imx585->reset_gpio, 1);
>
> You asserted reset gpio causing it to enter reset and you call this
> "power on"?
>
> > +     usleep_range(IMX585_XCLR_MIN_DELAY_US,
> > +                  IMX585_XCLR_MIN_DELAY_US + IMX585_XCLR_DELAY_RANGE_U=
S);
> > +     return 0;
> > +
> > +reg_off:
> > +     regulator_bulk_disable(IMX585_NUM_SUPPLIES, imx585->supplies);
> > +     return ret;
> > +}
> > +
> > +static int imx585_power_off(struct device *dev)
> > +{
> > +     struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> > +     struct imx585 *imx585 =3D to_imx585(sd);
> > +
> > +     dev_dbg(imx585->clientdev, "power_off\n");
> > +
> > +     gpiod_set_value_cansleep(imx585->reset_gpio, 0);
>
> And here device comes up, but you call it power off? Your functions or
> reset gpio code are completely reversed/wrong.

Reset pin High -> Run normally
Reset pin Low -> Reset state

See drivers/media/i2c/imx219.c with the same logic:

static int imx219_power_on(struct device *dev)
{
struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
struct imx219 *imx219 =3D to_imx219(sd);
int ret;

ret =3D regulator_bulk_enable(IMX219_NUM_SUPPLIES,
   imx219->supplies);
if (ret) {
dev_err(dev, "%s: failed to enable regulators\n",
__func__);
return ret;
}

ret =3D clk_prepare_enable(imx219->xclk);
if (ret) {
dev_err(dev, "%s: failed to enable clock\n",
__func__);
goto reg_off;
}

gpiod_set_value_cansleep(imx219->reset_gpio, 1);
usleep_range(IMX219_XCLR_MIN_DELAY_US,
    IMX219_XCLR_MIN_DELAY_US + IMX219_XCLR_DELAY_RANGE_US);

return 0;

reg_off:
regulator_bulk_disable(IMX219_NUM_SUPPLIES, imx219->supplies);

return ret;
}

static int imx219_power_off(struct device *dev)
{
struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
struct imx219 *imx219 =3D to_imx219(sd);

gpiod_set_value_cansleep(imx219->reset_gpio, 0);
regulator_bulk_disable(IMX219_NUM_SUPPLIES, imx219->supplies);
clk_disable_unprepare(imx219->xclk);

return 0;
}

I really don't understand why this is a problem, it is up to the chip
designer to decide
what to do with reset behavior and not the reviewers.

I'm simply writing the code following the datasheets here.


> Best regards,
> Krzysztof
>
