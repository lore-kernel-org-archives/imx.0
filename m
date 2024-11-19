Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D11C1CC170;
	Tue, 19 Nov 2024 13:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732021566; cv=none; b=OTP+w7PrzefFKi+5VvFzEd5EBtPcGVNlhTynEVk4us8LCZ3TqlYaAUAF0c7R8jBbDi0ODddwXoYVJ6wqVQ+a/W8twuAyYLQVowqepibsN8jQZ8VXF63djg1GW9T9tJeS1lFcp+SqxrGsc6ZICzVjZJgzp/G2YEZY19ACjwsUtmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732021566; c=relaxed/simple;
	bh=uSwSTdd7HCm/YcK1V1kqqpFIOnCFAFfr1gYiTS1xaBk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nZtlb3rEruiu+60SWYXSmbFiolh5La629YTUnxMZj48ZNUJ0diYohQ8pAnbXPbF+pKuubYmpM/H+b3F3ewAM++JjTg+BHwpDwFvWR56UDHzSEb2TNoCaWBAh9SROCJXEbq1UwEMZYB0xmq3NbxB86dNHQgX98X/jEGMZDc2imUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539e63c8678so3484164e87.0;
        Tue, 19 Nov 2024 05:06:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732021561; x=1732626361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r5SnbOSPJM2xbQk5uUW2SdrCV3aSiK5t/lke9tIy5ZM=;
        b=hbZSjwSfa2LuDiQSnlNU8aFhK2kHvzLUCTYJTEQiImo4sdliPhvZ3+RPhAQFtK3EhM
         vaKtKeD/5/d3MmZAiaOKFWe4jTi6U+PlQowc8oRWJWu8QNx4YILq/5GRY0Q7fb4Kn9VH
         uB6GynMJ3r3/OtIyn43a5CgZ80QbsqvlilgULs9n20BXDcDOl/MqpSNkf8q0y/QNPiTu
         mE1r45GFxJc5U8z/EB1V6xGwItqCg2Aj8gARPBzb6mrin+jyISnOrX/kGwkZLYvwHC7o
         nE5VxbYBBEPImsahw36foBr64LrUFZq5790gUo94eeNgDzuckT8HSMEGL1/SNZ1OwYG+
         jmZw==
X-Forwarded-Encrypted: i=1; AJvYcCUEwL+0OqXDlSpNSodLMq0NXsiF/YjHeieQ7WWm5hSu7nlhyJbS68XFxtYHeu79h/KwKK1H5tw+OiGHRT0=@lists.linux.dev, AJvYcCWYjDJtrwguroqDUjhAXFRq1KKKcA4cWHfYnCvYcfaQ+66XRHfpvCiNUjzK0GymqV1m6FA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwiwKybR6f40yXrevSEbT3lFjJW/cWNAcItywUG85uia4bIq3Oo
	MbyH6hxGb5kVs4i2YWJg/y3XjijeKM9gTIL9ZyCJqyqJH2xAvdOpLBrqsveQ
X-Google-Smtp-Source: AGHT+IEzSSF5O7an5iWIJe5ACmbEhJ5QhUP1IoqtIqRh3Ro1IBc66ggvQI74zIJcUjcpY29I4lU0UQ==
X-Received: by 2002:a05:6512:1319:b0:539:e436:f1cd with SMTP id 2adb3069b0e04-53dab29c827mr6686209e87.16.1732021560950;
        Tue, 19 Nov 2024 05:06:00 -0800 (PST)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dbd46828asm287420e87.129.2024.11.19.05.05.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2024 05:06:00 -0800 (PST)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fb3110b964so25253031fa.1;
        Tue, 19 Nov 2024 05:05:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVRPxfSelxkCYYc/YcAXm2YlKpCY8KfZlqnBiZnROnf+JMlsqaDJroF4k94xFL26HEu6DFtqDVxRotT7Yk=@lists.linux.dev, AJvYcCWAJJyLRb9IiY74gjiDHOTrYtFBgsHQZjdaMQbzmdMQC2QgVnErrly+WJMPfLEEz2n4MbM=@lists.linux.dev
X-Received: by 2002:a05:651c:1582:b0:2f7:4cf1:d6b1 with SMTP id
 38308e7fff4ca-2ff606226a5mr76184521fa.1.1732021553921; Tue, 19 Nov 2024
 05:05:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <6f0297ba884c670d604232c2861347940082c8e6.1732004078.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <6f0297ba884c670d604232c2861347940082c8e6.1732004078.git.u.kleine-koenig@baylibre.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 19 Nov 2024 22:05:42 +0900
X-Gmail-Original-Message-ID: <CAGb2v66f6WEYYVm+UQzmz_V87Vqt4BSUkoW5S_qqr_arczc6ug@mail.gmail.com>
Message-ID: <CAGb2v66f6WEYYVm+UQzmz_V87Vqt4BSUkoW5S_qqr_arczc6ug@mail.gmail.com>
Subject: Re: [PATCH] mailbox: Switch back to struct platform_driver::remove()
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2024 at 5:17=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
>
> Convert all platform drivers below drivers/mailbox to use .remove(),
> with the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
>
> Make a few indentions consistent while touching these struct
> initializers.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> ---
> Hello,
>
> I did a single patch for all of drivers/mailbox. While I usually prefer
> to do one logical change per patch, this seems to be overengineering
> here as the individual changes are really trivial and shouldn't be much
> in the way for stable backports. But I'll happily split the patch if you
> prefer it split.
>
> This is based on today's next, if conflicts arise when you apply it at
> some later time and don't want to resolve them, feel free to just drop
> the changes to the conflicting files. I'll notice and followup at a
> later time then. Or ask me for a fixed resend.
>
> Best regards
> Uwe
>
>  drivers/mailbox/bcm-flexrm-mailbox.c    | 2 +-
>  drivers/mailbox/bcm-pdc-mailbox.c       | 2 +-
>  drivers/mailbox/imx-mailbox.c           | 2 +-
>  drivers/mailbox/mailbox-test.c          | 4 ++--
>  drivers/mailbox/mtk-cmdq-mailbox.c      | 2 +-
>  drivers/mailbox/qcom-apcs-ipc-mailbox.c | 2 +-
>  drivers/mailbox/qcom-ipcc.c             | 2 +-
>  drivers/mailbox/stm32-ipcc.c            | 2 +-


>  drivers/mailbox/sun6i-msgbox.c          | 4 ++--

Acked-by: Chen-Yu Tsai <wens@csie.org>

>  drivers/mailbox/tegra-hsp.c             | 2 +-
>  drivers/mailbox/zynqmp-ipi-mailbox.c    | 2 +-
>  11 files changed, 13 insertions(+), 13 deletions(-)
>
