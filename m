Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DCE199EBB
	for <imx@lists.linux.dev>; Tue, 22 Oct 2024 12:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729601756; cv=none; b=bpMm7vdFdV711CrR5RuRzJ7KUn24/E0CTMltu4MDS+yWKs4uglGmWhdJ1J3C4zwohS6W0zM4V9p0RTaRJopqGtJ5lDlI5PHdnB2BlGp9EnaHZpUkD3Pt1DaEjCC7poktbc/JQukxgOqFNaphqIa3G/oi+5hJtHTzhetFYKwQN9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729601756; c=relaxed/simple;
	bh=7fOT4Xjo1xMpe/0KKsIBBl8n9H1ikaNSOO20uuJA0HM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JupzrZDWoHf80PxNgROVq7njBAPBMV09sJ/UPaGCUabK/nNoGqqWMb/1CknY9/q7nXB0KWxZLRhRkfD0oPwulyKwRJUBljv/5pgJZ9v9I6MKYq9iX15ZVWYdvukRw7T9jIima5CHSfwH8HuXrb8gtTz/6MUsx3KXBd5Tl8SrY9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A3Ub382j; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A3Ub382j"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539e7e73740so5009297e87.3
        for <imx@lists.linux.dev>; Tue, 22 Oct 2024 05:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729601753; x=1730206553; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7fOT4Xjo1xMpe/0KKsIBBl8n9H1ikaNSOO20uuJA0HM=;
        b=A3Ub382j4kaqLy6pq55rP1r0UANfd6wtfck8t8Lu8Etc4DYv/9SmUXS/s7zqXGcQvg
         o3RNkSbkN+7rtATPuED1C+9OqaiHpFD+oLJfrvAJ5XklFig2lmGS/crMb4arOvVdBO7l
         FXjFnMzFPczwhylJhuFcfV0knj6GP6sO4L96HhgmXgG2oqH/C5MdaM67SNlinFQ5Hyij
         4kfyfsRdP4lvRUaPS0uKdE1UJrbbDXo68G5bxdFY+8cTM73vbq0NBmw4ZQ8Pcv0CoNuq
         AGK7K/MwJTcFL2MEVPAxHDbN5Biw8J2z/ifZu/OklHUBvwIJdnnN+z5Rsh5rS3utO2di
         MY2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729601753; x=1730206553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7fOT4Xjo1xMpe/0KKsIBBl8n9H1ikaNSOO20uuJA0HM=;
        b=LTk8c53Bn37sLrYxupn0Pid0heTvxJbT95z/h3Fk7zumG2eQ1zTY5DNiLcxSmpnk5i
         j2v35gOSutKGTPLjlenO3FzZ+2VYfd3Mhu4OSHvhfoWBcYXcFCZXy94z/4oJZyoY9VjC
         Y0PqSCL99kKDusfLO4BF66ivTOv5oqLfxT0n5ddM2cBoLbaJrsdmXmO0inz7FwLu/QHP
         nJ0buzSl9zVI4xMIL7YhPsFn3zvEQt9MGbSk8/6U9/nxVttfLYHngqP83SwL1+IGhGDs
         xKTf+2QVM6uiB/mhq6Aazdpo5Ink6GTv6GHtWs4YMa0VbjUuRCXF/uhXlqe9T/UEi2tZ
         VQ1g==
X-Forwarded-Encrypted: i=1; AJvYcCVEyJCEe4I4OOcsi/NaIvGBc+X+QfFgQw9MJV1D1qIATKcXjN/iO0oa8h1dgAQFrmZ3TOE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzZhz4PqPP+A1eoRV0jfWgjWRXFu245huhMztRjJwlQdA6Weee/
	GgDTpAKJSg7tAYBGikR4W1xEmD8Scuaf3R2/TS1Od+4xVgJVKYaSy1n0f4V1gXNuPaSX+BwNdvn
	sMdALxUvVZwda9k9C6PRKLxiFVOwyIzLzUXrpdg==
X-Google-Smtp-Source: AGHT+IEApsleJ++LyDXUKi77PnqAoKOGDzM+ehV1eZLJi+inAOZKg62iYgBKSaWzgGuDYSSU2dftJO0ptCxWO71V4Yw=
X-Received: by 2002:a05:6512:401a:b0:539:eb82:d453 with SMTP id
 2adb3069b0e04-53b12c36e60mr1673392e87.39.1729601753275; Tue, 22 Oct 2024
 05:55:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241017211241.170861-1-marex@denx.de>
In-Reply-To: <20241017211241.170861-1-marex@denx.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 22 Oct 2024 14:55:42 +0200
Message-ID: <CACRpkdYvMWABqw1tC5YSh+RXcHiCwUGsbOGAfkysThYQZTPWzg@mail.gmail.com>
Subject: Re: [PATCH v3 01/12] dt-bindings: pinctrl: fsl,imx6ul-pinctrl:
 Convert i.MX35/5x/6 to YAML
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Conor Dooley <conor+dt@kernel.org>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Stefan Wahren <wahrenst@gmx.net>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	kernel@dh-electronics.com, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,

thanks for your hard work on this!

On Thu, Oct 17, 2024 at 11:13=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:

> The IOMUXC controller description is almost identical on i.MX35/5x/6 SoCs=
,
> except for the configuration bits which differ across SoCs. Rename the
> fsl,imx6ul-pinctrl.yaml to fsl,imx35-pinctrl.yaml, fill in compatible
> strings for the other SoCs and fill in the various bits into desciption.
> This way, i.MX35/5x/6 series SoCs can all be converted to DT schema.
> Remove the old text DT bindings description.
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Marek Vasut <marex@denx.de>

Is this v5 patch 1/12 something I can just apply to the pinctrl
tree or do you want it on some immutable branch or so to be able
to pull it into the SoC tree for dependencies?

Yours,
Linus Walleij
