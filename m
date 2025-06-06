Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7782229A2
	for <imx@lists.linux.dev>; Fri,  6 Jun 2025 16:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749226646; cv=none; b=r4hYnm095QykCznLsojLcR8wkvU3vTjjkYhKqc/0Qh74368tyBgVlUl4eUrbKNhFoo+hUOdAqpUngfbQO0uq3FfRDXczxKcsYT+FvSJ3gzcekk4+Rcp0+/QO4HpxqwT5O7ArfVlredztknFns9zhoVwpFZixoIY8gye+IRrCc+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749226646; c=relaxed/simple;
	bh=AJH8Xht7LgFTcE3HlorlUpcubTIYPJN2EmtJ6m0tPCc=;
	h=From:Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:To:
	 References:In-Reply-To; b=Ng2OlaVAwHr2n3ZyBzt7n2n6jVe4JGPiIGYfiAQywyX3Im66MTV8uiQpsybuH4AJbdZ8bEJqhfk0g5LqWLJZsYtwRegiGptT/wLwgkECAY2q6jBCMlbvb3TIzRsuvmGQk4WeX31qF+lLhsShNizvHxBbvIbQol5jupEyJl5hA6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eYXVoVVq; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eYXVoVVq"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a36748920cso2198240f8f.2
        for <imx@lists.linux.dev>; Fri, 06 Jun 2025 09:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749226642; x=1749831442; darn=lists.linux.dev;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4NlKIg2a1lGubO5sNSfmyFBsfmLI6eZhDm94jolhDTQ=;
        b=eYXVoVVqQlU3nztPmHETHlKGTGSxS/acLZVhexWeelehb6UIaU0a1syHdcGlexO+IF
         26PCHyiBE0Me0kW0HZB7LWJQWaLUpx7m126PNTwTs61EfCciCiN2d9LAh0h+fFlP32/Y
         CaGoLA8404HdXEXWGqKKYGGI4YxfK9o4ooI7ikIWneX0PEslOD4+O3uUao1Sx4POY/In
         IqppTZgqW0rKbIZpDcC4OpqfMAWMrX+C/4DY2KtKJiKGL1bWhkXjtAOe0LHzivQGVym3
         czJX4ZxREhfJzCOHMqtyBcPDvFmGuTiprE5mayTfQFN77pAR3qwJzF7q9iE7KSB50LIP
         BaGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749226642; x=1749831442;
        h=in-reply-to:references:to:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4NlKIg2a1lGubO5sNSfmyFBsfmLI6eZhDm94jolhDTQ=;
        b=YAH2r4gY4o9SauHEOXEwctsNAWjLVonPO08xYzlVtgg0+WqHW57RAGK59v0A5CDkc0
         fyVr9tPNuuGTUyElSZLKpqIfx2qYVkOZqRe/xXkbfo0mzMhDACxKHHM4evHK9ivq2+2O
         0zatMCEvtsK+Yd0ODqFe7gPV6Spsh1tg4opmL1cQYf5Qo5/y02JhtVouszH5PXRqb/go
         L1vyPl2e/jmHQ4hpc4qM2ZXMxTUZKNc6u2cTMZxmgvCApGUFUYa23bGh0DcdBilZlokh
         iYeDbCv407rgCOSI2H7HlncTpfwY9X57SG2stlvS7MwGNmGBdfgCUMxgv5bxoVPV2fYW
         zVyg==
X-Forwarded-Encrypted: i=1; AJvYcCVIDiaJ+LLl/xxLemiNvN7DCpP58wz+lqieRg+2xKiWEkhHP0kJIe/Ib4ZabYLqU2Pb60k=@lists.linux.dev
X-Gm-Message-State: AOJu0YzsiEQGfRf6uU4jsbaTeBEqH4sXqQ32Fut7qdecXqe8R1nnXr8+
	I7MhpqClVfnUfelwpGTi2rIFBaJHIsomZvH/ZL4eWRgTgexFge6KYqkC
X-Gm-Gg: ASbGncsulLhLfWnlcM/neHnTDLw97rk0eTKRpNI2LQBFQQJvMlmV0NVXKrNL+0SmVdy
	1S4+cMGefWmT8vTMoV6dumiIfFtvNFtKTTGDanryzSEhiTw7Dqziw2DTAB8mKCv+oK+yNDcjwc8
	B/fnrhpxmIzTcvk2clvsC82MWRae/hEqfjYBszrhNNQd7IFz1Kx1IokMsz4pYq/iwhm1TwSs+kc
	FcO9z4EyNTfjTgj9q8Ad8X6Tgiimr6YFtX/Ht6ozCb1JR4ykgiKJj5p91orS0LZ2VrhB0B93rou
	99AhPTmhOACwDlFpFTMK8HnQb33KpkqOt6x0Ts4pNzdbsGMD4K56+pnNTtc7IVuczBflHfWrJIk
	XMlDD8F7zJfOjlw==
X-Google-Smtp-Source: AGHT+IFEPwne2ttMNKIa+n0ICE8jkRX3AQsfZ+fAiNXrpYKRs5y4Ypd8txsA2x6HPfCUIi/0m2BD+g==
X-Received: by 2002:a05:6000:25c7:b0:3a4:ee36:ee4b with SMTP id ffacd0b85a97d-3a53188238cmr3679704f8f.11.1749226641555;
        Fri, 06 Jun 2025 09:17:21 -0700 (PDT)
Received: from localhost (a95-94-245-170.cpe.netcabo.pt. [95.94.245.170])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a5322ae43fsm2281609f8f.25.2025.06.06.09.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 09:17:21 -0700 (PDT)
From: Rui Miguel Silva <rmfrfs@gmail.com>
X-Google-Original-From: "Rui Miguel Silva" <rui.silva@linaro.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Jun 2025 17:17:20 +0100
Message-Id: <DAFL3CTS8R5D.1FIGCAM5SXJPL@linaro.com>
Cc: <kieran.bingham@ideasonboard.com>, <rmfrfs@gmail.com>,
 <martink@posteo.de>, <kernel@puri.sm>, <mchehab@kernel.org>,
 <shawnguo@kernel.org>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
 <festevam@gmail.com>, <linux-media@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] media: Add line end IRQ to imx-mipi-csis driver
To: "Isaac Scott" <isaac.scott@ideasonboard.com>,
 <laurent.pinchart@ideasonboard.com>
References: <20250606154414.540290-1-isaac.scott@ideasonboard.com>
In-Reply-To: <20250606154414.540290-1-isaac.scott@ideasonboard.com>

Hi Isaac,
Many thanks for the patches.

On Fri Jun 6, 2025 at 4:44 PM WEST, Isaac Scott wrote:

> Many boards, such as the NXP i.MX 8M Plus, feature multiple interrupt
> registers. This series refactors interrupt status register debug handling=
 to make
> it more intuitive to add other registers such as LINE_END, which has an
> entire register containing only one interrupt. Previously, the
> mipi_csi_events[] list contained a debug enable field, and this replaces
> that with a status_index, which indicates which status register contains
> the mask for the interrupt.
>
> The second patch adds the user line interrupt, which is useful for
> debugging, as it allows a user to trigger an interrupt after the MIPI
> CSI receiver has counted a configurable number of lines. This can make
> it possible to discern the true resolution of the image stream reaching
> the CSI receiver. It adds an entry to debugfs which lets users choose
> how many lines are needed to trigger the interrupt, and can be disabled
> both within and outside streaming by setting the value to 0.

LGTM.
for the all series:

Reviewed-by: Rui Miguel Silva <rui.silva@linaro.org>

Cheers,
    Rui

>
> ---
>
> Changes since v1:
> - Moved from magic number to enum in status_index
> - Clear INT_MSK_1 in enable_interrupts() when on =3D=3D false
> - use local variable in set_params() as in the interrupt handler
> - move interrupt handling code outside of spinlock
>
> Isaac Scott (2):
>   media: platform: Refactor interrupt status registers
>   media: platform: Add user line interrupt to imx-mipi-csis driver
>
>  drivers/media/platform/nxp/imx-mipi-csis.c | 107 ++++++++++++++-------
>  1 file changed, 74 insertions(+), 33 deletions(-)
>
> --=20
> 2.43.0



