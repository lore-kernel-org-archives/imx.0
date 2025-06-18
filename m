Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF79D2E3B0F
	for <imx@lists.linux.dev>; Wed, 18 Jun 2025 12:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750251424; cv=none; b=NnaSZTGh7lPedDPqt4fQDKpQyYxOf86gUQS19JjFjE5J5C14zWI1DHg32a0riU2ibngbNo7SyeKBtuY644GIFeGlZHIQDiU3iPoYMu5JlnP/m5/sexu88Huz/qRUueLhBVypl0KztNQ8mljE9vKtJb63GQeJaft0H9LSujoSY48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750251424; c=relaxed/simple;
	bh=NjVYGChQDbdYIHe4Sr86or+FiSbuf0vYfumtIy7G6CA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rZzypQ5TUn70idPpbXQ6hR1TL1vmnkEX6usOn1oLb31LPUYczEFmihj8ARxKwqljVSeXLOtC7XlmuodJOuKvXSkE+UIC1ZTfSvl6+DDTB3LWuuC4rLYLqBP4zyWFXZlJk146DynGzuuZPFLK+Ln2CGFeDYZ9FjvvjPsHc0iJL8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xG1upQwV; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xG1upQwV"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e82323de932so4110339276.1
        for <imx@lists.linux.dev>; Wed, 18 Jun 2025 05:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750251422; x=1750856222; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/0yNglyrMOZ78JyNR9Sp0rHahct09b8RGeUMHfCfYXs=;
        b=xG1upQwVQxHx+YYhkaFTURxYs/8ON1FtGr+xj9Z/Z4HbqFpkAPDCp9kamu7gOCeFlx
         TGj1uJe0FXvBHj/mNBVQoy/wDVUSRL3uvrrNIzq8cP9aniqePgipSkzbDIJMPso9hDCH
         uB+a9praBxFlS7O0zkg+hxZpBHCa2W2bHfMdoqw+7hRfMTR6vhvULgO4R3x21St9kSKD
         MaM9AZeRbPjG1O9bu47lpV5f1T1f44jmD58ZjbdFU6C+Qic7egFuG2j1XvNTOXbxDLVV
         uYTWUBO7HHAMsGIRcfmcBOvhX6xPAh3ymsA8TFXK8DjJ7pUoCp5Qo6NSHOBAyWULLJMS
         k+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750251422; x=1750856222;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/0yNglyrMOZ78JyNR9Sp0rHahct09b8RGeUMHfCfYXs=;
        b=ClPjf/VG8qEsk9HgXZ5Q31uc9jOR9XPU6iq8Bo4T9dmfFz+6jMnDensoW3ynv54bV5
         lReA4GC0n/D+YQR78jLWq/fJM28F5kcv4+r0Z4P+sJERf4DolP2h/a/8VxuMtj0T3/Vt
         kX6oQ+jBOkoJdfYa/6vqkW/ST9pdYYoLs99qkR/6eGJvwvO8GScyJia9/whi59qZWaeL
         OBcu7utsP9it1zyxo5q+xkspCSD/U7tw37Fx+skzx6kSLah+iSLyAnSNICIr6fZ6kQhQ
         KkWmK41r0KvJGw1A8aOj9rAxrrGgpg5pe3HRn7uUd1b+gKmXWNY/qY5byGXDzzkDcNmt
         qreg==
X-Forwarded-Encrypted: i=1; AJvYcCViPeF6WnRBctubmUGcu6c1/IzX5kc2YRDzzW5nAVSlmKHhkgkGEZmoQ88L7LeATLKnDPw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxXSumlMQp7hVa3076xw8moWHu0mk9Rj7gucLKB3a95Ee+w4nfE
	gM4ICaZ3p83oLNYxN/SsMQoceFo0hAWEQM3jWe2i3jkXtTGvb7hYsEClDFwmNDa1t1wfzRz2gyn
	Xcg8hP1ZZtjUHE0uGbl3b5eKIl0cFqrA6A6/rYU+lMg==
X-Gm-Gg: ASbGncv4ghe/7/FNPdCCT+0Ebpmj73/ckh9j/Mk3m6yq7vVCWraXiT8di/j4SvS89d+
	Ryr5UXZVSTLzg35L8rSnDp9QyDxCyBNo0iSkUXRNW3IxsosXQoG7zcxB4iR7pqN/oinZQv9fcxe
	DtFYnX2vIPmdr0Gn3yZ/MYmnPTXYPjERTYpj/qh02xpGs=
X-Google-Smtp-Source: AGHT+IGKJ/9nezM0CjL8LTlmXkuqqs1XvYRULfznlZkJ00Zas9fy/8SeNVFH78QNFQr9m4QBfV7T9IMSOGKFGfTViCA=
X-Received: by 2002:a05:6902:100d:b0:e81:9aa9:88cd with SMTP id
 3f1490d57ef6-e822abe0669mr22502028276.8.1750251421799; Wed, 18 Jun 2025
 05:57:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <m3ldr69lsw.fsf@t19.piap.pl>
In-Reply-To: <m3ldr69lsw.fsf@t19.piap.pl>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 18 Jun 2025 14:56:26 +0200
X-Gm-Features: AX0GCFt2trdH5lvp26KlouAeiTYZ2alEevH8lFXOfNjGnwSoGAScAqPAkE83GxQ
Message-ID: <CAPDyKFo_oTWWX-PNNA_Dpq0fjbmhzoLCgd77NfDO=Q_JZ8hZ-g@mail.gmail.com>
Subject: Re: [PATCH] imx8m-blk-ctrl: set ISI panic write hurry level
To: =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	linux-pm@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 9 May 2025 at 11:26, Krzysztof Ha=C5=82asa <khalasa@piap.pl> wrote:
>
> Apparently, ISI needs cache settings similar to LCDIF.
> Otherwise we get artefacts in the image.
> Tested on i.MX8MP.
>
> Signed-off-by: Krzysztof Ha=C5=82asa <khalasa@piap.pl>

Applied for next, thanks!

Kind regards
Uffe


>
> diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx=
/imx8m-blk-ctrl.c
> index 912802b5215b..5c83e5599f1e 100644
> --- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> @@ -665,6 +665,11 @@ static const struct imx8m_blk_ctrl_data imx8mn_disp_=
blk_ctl_dev_data =3D {
>  #define  LCDIF_1_RD_HURRY      GENMASK(15, 13)
>  #define  LCDIF_0_RD_HURRY      GENMASK(12, 10)
>
> +#define ISI_CACHE_CTRL         0x50
> +#define  ISI_V_WR_HURRY                GENMASK(28, 26)
> +#define  ISI_U_WR_HURRY                GENMASK(25, 23)
> +#define  ISI_Y_WR_HURRY                GENMASK(22, 20)
> +
>  static int imx8mp_media_power_notifier(struct notifier_block *nb,
>                                 unsigned long action, void *data)
>  {
> @@ -694,6 +699,11 @@ static int imx8mp_media_power_notifier(struct notifi=
er_block *nb,
>                 regmap_set_bits(bc->regmap, LCDIF_ARCACHE_CTRL,
>                                 FIELD_PREP(LCDIF_1_RD_HURRY, 7) |
>                                 FIELD_PREP(LCDIF_0_RD_HURRY, 7));
> +               /* Same here for ISI */
> +               regmap_set_bits(bc->regmap, ISI_CACHE_CTRL,
> +                               FIELD_PREP(ISI_V_WR_HURRY, 7) |
> +                               FIELD_PREP(ISI_U_WR_HURRY, 7) |
> +                               FIELD_PREP(ISI_Y_WR_HURRY, 7));
>         }
>
>         return NOTIFY_OK;
>
> --
> Krzysztof "Chris" Ha=C5=82asa
>
> Sie=C4=87 Badawcza =C5=81ukasiewicz
> Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
> Al. Jerozolimskie 202, 02-486 Warszawa
