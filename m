Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCB616D333
	for <imx@lists.linux.dev>; Mon, 27 May 2024 14:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716820687; cv=none; b=Z16BoIz9JPiKNd/OhHRe15fpJUBpsIIy8kOID5lr6LTGH9tE/a9FOlwj7JtcjHS6E5KpF1W1WDsF4JVipki7HAqXsfa1cq7sNmnO8uOcdz9Yn7sV4xG1VWJzXjeuklGZDWT+Y15uJXROmJURBsbnJUHekOK1aLlNgrAUZxNXBrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716820687; c=relaxed/simple;
	bh=TsORAf+30DK49YwxeDsXCfFaQYfYRcUm4oGKDiMwiIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UOMgYYVB1BzS8n5O13rODmKI3sx9mBR1MgZ4ZA9BEs1LMtrhP1eSr0HFGoD2i1yUCqzjcHUCrlDoN4WBOkHRB3PQvjw/PKCbE/si4JpSp/3ZwRcZfTmHg9XtRFMbhecpjApvRS6ZBdGxRdKvJiqAw+adftyINIgORNslv/qAo88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VClSe8US; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VClSe8US"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-df4e7763603so4928315276.1
        for <imx@lists.linux.dev>; Mon, 27 May 2024 07:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716820684; x=1717425484; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TsORAf+30DK49YwxeDsXCfFaQYfYRcUm4oGKDiMwiIg=;
        b=VClSe8USC0jrNCekpuBGNtfh71I0Rjnkpn07CD/KeblrtoTGuUYYQaRjNwg67zRN/C
         TlP8nvOnSkkVyVvU1wfIWjvGsz2FUxlsAD6xQ7/U6RHI3uk/4gVUBpcGXnAD8V1BoYz7
         1FYDjPOTfmHreki8HDk4uzHzJvn/usG8Zv6zDzeADdBUPC6qvE54rN3iJ+puEmR37gsF
         XmfqkypwMf4xHXm37xgy1gjD5/dv1pDTwjPCn4dIsAoxijQFb4eucdNiVd0pvKBSzDRC
         Ay7FHklLdsqf1YvwegTiL6xmO7vKV995LUNHmiAq70FYBIhRe5tjdSl8dIlQcwQ1/ru6
         khLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716820684; x=1717425484;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TsORAf+30DK49YwxeDsXCfFaQYfYRcUm4oGKDiMwiIg=;
        b=HELiIEsz0apvBwY4taZACaxkkXJvdPVQ2fASpP2WdwpOJvyBxUSqfXfC1PEJJhctue
         SaI9GRDh7YNpgwpgzh0iAWwpbLNw0N9YHbIfVcliQDQxfPlbjn2ZdkUcTU4/qRvRlW4G
         bEd2j2BQn4aiUeAzUf6BndKcKEQ+rceu7Nq2jGyr0DL+3ZAfiuoquKORrUvuWIGw7HEO
         CWLgBCaaZyGbe9/nG6oZS21dQ9YTqVSvcBEuDaGELVVKMAGm2miXDcToptV0QKFqK39c
         R4yzp+7mv/k6PabLF5eGvFNXYrUFRcQX3J5Nw2S/LW/GB98281cW7iARY9FDEYsD815Y
         ZcLA==
X-Forwarded-Encrypted: i=1; AJvYcCWZ98mMRnsl65u6KMJXhpmUxoL4lk7cd42gmnVBCfLeRpKc6niScoMVmbEMjOCZ5sozSgKYKtc1TS0JNzzGwVtN0gaL
X-Gm-Message-State: AOJu0YwRyUa8UllQ1RsharQ1a7417JdZW9lL4OnLUVLJKnsYNK9+FK4x
	mVV9huK+VwysxZILWwZ7akBHY4TQTKFYlKhljx7MlvCP44XH0Sip2wVyYCPjnmMq1BE3WMpfhXc
	tLmN4ULupo7QnHPiI33HhIvptsoyUvnEHrP3MUA==
X-Google-Smtp-Source: AGHT+IEwTZzUZTnOFyK1J+Cmkx0U06fySsAKy1c+9/Zyl9b38yE9jX5xO+y6/SfRx/NvtCMT1w5cN419DuraUe6mJAc=
X-Received: by 2002:a25:ab8a:0:b0:df4:df29:bcc6 with SMTP id
 3f1490d57ef6-df7721a2897mr8786729276.31.1716820684554; Mon, 27 May 2024
 07:38:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1715396125-3724-1-git-send-email-shengjiu.wang@nxp.com>
 <CAPDyKFp4V8f0iyeRASSEu4YaCSz0m56=8ssBJ9ogSvqG1dzMZA@mail.gmail.com> <a04b3939-081a-49e0-a063-5b50d3321ca7@sirena.org.uk>
In-Reply-To: <a04b3939-081a-49e0-a063-5b50d3321ca7@sirena.org.uk>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 27 May 2024 16:37:28 +0200
Message-ID: <CAPDyKFrhvB9bXiuQS6QKd28S2tOu7WJ-48qHP7KEBTpE8SSi+Q@mail.gmail.com>
Subject: Re: [PATCH v3] pmdomain: imx: gpcv2: Add delay after power up handshake
To: Mark Brown <broonie@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, heiko@sntech.de, u.kleine-koenig@pengutronix.de, 
	geert+renesas@glider.be, rafael@kernel.org, linux-pm@vger.kernel.org, 
	abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com, 
	sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, 
	shengjiu.wang@gmail.com, frank.li@nxp.com, mkl@pengutronix.de, 
	linus.walleij@linaro.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 May 2024 at 14:49, Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, May 21, 2024 at 12:22:41PM +0200, Ulf Hansson wrote:
> > On Sat, 11 May 2024 at 05:15, Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> > > The BLK-CTL module needs to add delay to wait for a handshake request finished.
> > > For some BLK-CTL module (eg. AudioMix on i.MX8MP) doesn't have BUS clk-en
> > > bit, it is better to add delay in this driver, as the BLK-CTL module doesn't
> > > need to care about how it is powered up.
>
> > Sorry for the delay!
>
> > Applied for fixes, thanks!
>
> I see this is in -next but mainline is currently broken for i.MX8
> platforms - could we get it in for -rc2?

Yes, I am preparing a pull-request as of right now!

Kind regards
Uffe
