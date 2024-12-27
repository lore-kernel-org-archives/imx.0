Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3361F37D8
	for <imx@lists.linux.dev>; Fri, 27 Dec 2024 17:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735319199; cv=none; b=uJx8Gf3llznEp11vdUBNy22ur7oV54N+JYiKsP4Kt1+EZmkeMLAb2b+0sC5E4brwvS9M9qr0TGPwaKwMdnFGRqlpVDaig/0pgErRJjJCADLXj7bv3bavp+gxSGau7cXviEg1nL00P8mhtG52O3I5rB9AEjXbrZiPpYr+oxLuAG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735319199; c=relaxed/simple;
	bh=84EOIOtj+jrmLyO5mM61/2Lu4h9xRAKSN1hU4eGSdMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gb0HvTFJRNnTVSKtmgshuWpfvYJ1UXZVdD4Sg9oe+xZNvhGqQCnw/Dl+PfDm+6GuP1j4HpdUCo/Y1k6lRLJCTvgZzlWoHvTEUzBWNAatSd1sUVxlC2MUSgX0+pQ8buKggyZZ8iZDAaINM/e/uEeAn0mJqCEEPP9vKl40lU0vMuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rhYb10tB; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rhYb10tB"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53f22fd6887so7150435e87.2
        for <imx@lists.linux.dev>; Fri, 27 Dec 2024 09:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735319195; x=1735923995; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=84EOIOtj+jrmLyO5mM61/2Lu4h9xRAKSN1hU4eGSdMU=;
        b=rhYb10tBPGWhOjNqG4ib/6SMtp/SP9k1ZfwXzDmzNQS4sCkjBAUDdlG1I48ydYo4By
         kl1OM8/+BqcOvsmnCPbUCQ9EFOr8KkJ4sa0Ci+ll5BMpaHOB/7oR4Q/nWZmKTDoe0x8g
         kOoUq+doBczdhmxgv5e7iFanoI02IAorq0mlcQGjVTZB4dN6WM+9hVh34UUVfaeUNoHW
         kA5WtX7LfGSb3BlnpEE4sVQXqTQ16QurnSx7BmkxL4EqOdXhoArqAwc6jp/gKtctd9Hd
         /MdrYFSCmW9D/j8X0y1xDdbo4Pm/VuJkezLUmcBOCV6YZsV450X9dCK3zX2DngthEcwe
         WhtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735319195; x=1735923995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=84EOIOtj+jrmLyO5mM61/2Lu4h9xRAKSN1hU4eGSdMU=;
        b=AshgEMBzkcRaPkp8jJm6yl1JbNF1RYkLrlK7iLjK1QPQIwUg3EVHYzqFaOT5HSxwa8
         rvqkvVfAMcTRFbf/ceAlFCF63mWoC0wqC5opU6aalZ4cbnkcqljt5FeZQLdHqv2zVSKI
         yRKGwyfYJznla+gFLq93x7RElzw1VIqdv/jIItV1uPMJDhFc8Bns9nXV+PpMUz8qRxlD
         0yhBWzwRQjCD3gZ22PZlY9/8HK3yltPlmHnolkzkmKcO30+UirA4vozg4OmJ/OQuZQRN
         DyjB17TIl/Xh4WapPmyD5P0hpI1yn9kBuPMXAeCdj1Lvb60xnctZdk+fVwjuZgcqZyd9
         kvrg==
X-Forwarded-Encrypted: i=1; AJvYcCVBtjB+5IZOj3CRwqf8TOS2FGOJoOb63DxF5UL12AflMNPGa4V25YdSGvpor+owtumwL9o=@lists.linux.dev
X-Gm-Message-State: AOJu0YycdWkrdbjfou/YtFeGC9dV4idsmk8WDifxXl7BjBYTbvJOPShq
	XpdGcV+DUQbJdhwTVJFZIOdxAxE5oDlSd+nTyQA2uUr9H5ijjpx/+rYVzh6UeRJB0rfHMI8fQDV
	OcE0jmbFYM8MN7Fdy+zBwl2TAYipVDQdnYefKAw==
X-Gm-Gg: ASbGncvSzumVk0hzdSc22dgfekoD4FSJJfqzdy4gOY1odMdONrqxK9uFVSrpF3alMOM
	RbF9Uq6ic+H3J9/TCiZO50l60BsaL9JB+ZCDo
X-Google-Smtp-Source: AGHT+IEAF5Jp/QDipLuJyJQRV1ZFYVHjt8w4LULM8IF+C9aJBkOnwrc7elyqOWcRa+AO2vKIjyJhQ/+3xwflHVTRNdg=
X-Received: by 2002:a05:6512:4385:b0:542:2972:4deb with SMTP id
 2adb3069b0e04-54229724e47mr8311291e87.18.1735319195404; Fri, 27 Dec 2024
 09:06:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
In-Reply-To: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 27 Dec 2024 18:06:24 +0100
Message-ID: <CACRpkdZFQDiLax1QtPDr5zWbhAqwWuXdC=+VtBLD-S2c1FLpAg@mail.gmail.com>
Subject: Re: [PATCH 0/4] scmi: Bypass set fwnode to address devlink issue
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Saravana Kannan <saravanak@google.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 25, 2024 at 9:21=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> Current scmi drivers not work well with devlink. This patchset is a
> retry to address the issue in [1] which was a few months ago.
>
> Current scmi devices are not created from device tree, they are created
> from a scmi_device_id entry of each driver with the protocol matches
> with the fwnode reg value, this means there could be multiple devices cre=
ated
> for one fwnode, but the fwnode only has one device pointer.
>
> This patchset is to do more checking before setting the device fwnode.
>
> This may looks like hack, but seems no better way to make scmi works
> well with devlink.
>
> [1]: https://lore.kernel.org/arm-scmi/CAGETcx8m48cy-EzP6_uoGN7KWsQw=3DCfZ=
WQ-hNUzz_7LZ0voG8A@mail.gmail.com/

Please drive any devlink-related patches by Saravana Kannan, he's pretty
much the only person I trust to know how to do devlinks right.

Yours,
Linus Walleij
