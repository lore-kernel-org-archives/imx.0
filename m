Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAF819C546
	for <imx@lists.linux.dev>; Fri,  1 Nov 2024 11:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730462022; cv=none; b=mKRD0RGajol4YT/WWW2NYqsVmPU0CfCtpdOjunfSLOlIVEapVRIW9cpGeuz+78A6bzW7ILn9y5FOscWe2DgHMVXfgDGtSQhdWEYnrU/5it7TPndwddwth7NBbn5QFb0nZwHCNEbwYrdAevO2/WLKXDCsPwP1pqvvF63aKh0tthU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730462022; c=relaxed/simple;
	bh=Bxzb7SedPrl5l7ZKQkhztkTNV+iyjd0TpmJ2sRm3VZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KbVLuBNav/M316SxNIAE52aoCIZqVSHGMLPj4K307Wsfjk9ABMJae4g5P+Lcg7supyFPYOEqbbKKDsvyxVl++Li0E9HJIOn+LiRIdFbP/MW/DkVZnQeIEJ2fl/BuK6UX3MsL/1cScTruFOvt9d68SwM3zTVNChdrRahyHBg9SqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZVmQOu2T; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZVmQOu2T"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb3ce15172so28402801fa.0
        for <imx@lists.linux.dev>; Fri, 01 Nov 2024 04:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730462018; x=1731066818; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bxzb7SedPrl5l7ZKQkhztkTNV+iyjd0TpmJ2sRm3VZY=;
        b=ZVmQOu2TvHcjohVY+UsA7i2F92hfQjZ9Ng35UpBJYRgf+wZYYA5FHEY3yDxkr3dwqx
         GPQRZ0Squ8suLINrhfzBPYjmjmOsyKr2x06Ju0eZJbX6odAY0C2CGFjw02TDMSEX4aoC
         VTzjfnXE4BEvtuXqlHaSTcDE9ohXuBNrPd0VnrqZuIiQuxhOrchXJw+qdd6PFjWvEkzq
         sJZrWSCysokJtbdFt2nr5pgGdGCOa+VmWBCk+eEXBHNz0iZHFWsAHvYWkAGK8m5vJMdp
         j4n7+sYyLHT6sNyR5cq6J98kiHWilYxfZTeCo/vbJzYvI9VdHguwHrQ4ymMEA9q2SZFG
         QT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730462018; x=1731066818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bxzb7SedPrl5l7ZKQkhztkTNV+iyjd0TpmJ2sRm3VZY=;
        b=qZaTYt4omgMQqPJEOieOE50qm3F7ZHtx6tSGuymZSu3tCRk9TIfc6B54iLexF6RCwD
         1lk1WYXNa9VO/0iZf6Oj8rzrNdId36vd+DMm9wzGzHb9GCi5DAwZThQUb06XB0dVivop
         cCLJ92QmIhH662qKibRI+auIQhF+fYl9aXHhjQwIz9SIDvhzg/VBeEaPGA5kKoCRuKRI
         BuQpuT2RXJHh/pcEY5Q13R0O3SKSMTYivCzZJ25FhP06WgJGu9skzJMMZfH0IxYkaMAe
         CAR35MGRN/c++7Uh1q/cT4a3VMyZrebycWeNhHRnPjsnLNQUY6MrnFnqA72g3DhmOwaG
         lXrQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+iRhBavdPb1oPPbfYgHnZTFaRhQCdqa0wNfzjR0Tg7x51ICSE3GU1ttVGuP48lQl22z0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9FzrWc5jYtHMx+//vq+rKglP5IxXEBJno3MBtdYJVw0MGel97
	8cevEdhmekY+VuWl/xK6N65V8FmZPxkp80CGm6xjhgGVTa16PTCSXiXn6K4nxKregSSBdBv6zAu
	/U4L2JLjIGB/rWJGaVFMpCu/Y06eVqO1rt+BO6w==
X-Google-Smtp-Source: AGHT+IGIi5ao43k/vIAO/lA0KVUBT2iz7DHq1Gqz+0/lE6XQd/R5X3Fft6qTZ9ZmTNYTYQonru0QZ16ntriXjkPbnU0=
X-Received: by 2002:a2e:a595:0:b0:2fb:4fd4:668a with SMTP id
 38308e7fff4ca-2fedb49929amr11134431fa.22.1730462017840; Fri, 01 Nov 2024
 04:53:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241101080614.1070819-1-andrei.stefanescu@oss.nxp.com> <20241101080614.1070819-5-andrei.stefanescu@oss.nxp.com>
In-Reply-To: <20241101080614.1070819-5-andrei.stefanescu@oss.nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 1 Nov 2024 12:53:26 +0100
Message-ID: <CACRpkdaFqtMxE26jA6gWDAps6L58zL3KD6CisxTcVJj-DAR+pw@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] pinctrl: s32: convert the driver into an mfd cell
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>, 
	Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>, 
	Enric Balletbo <eballetb@redhat.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 1, 2024 at 9:06=E2=80=AFAM Andrei Stefanescu
<andrei.stefanescu@oss.nxp.com> wrote:

> The SIUL2 module is now represented as an mfd device. The pinctrl driver
> is now an mfd_cell. Therefore, remove its compatible and adjust its
> probing in order to get the necessary information from its mfd parent.
>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>
I assume this needs to go in with the rest of the patches.

Yours,
Linus Walleij
