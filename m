Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6885C1A0AF1
	for <imx@lists.linux.dev>; Wed, 23 Oct 2024 09:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729677351; cv=none; b=dc77oZsFVS75fb5BKzSe92xeSLfVyMuANAIAM/J0kwcU4utdgUE/cbMqMtcsMLGiqCm15d7QLAR5MqguxFyiMo+yldL+oOacWXr/O4BaDue9dvcVkUVaxPjln/n2cV5zcnVw9ufQNvvaSEmvm4Q89Diox1YcRXvClY1myhuI+8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729677351; c=relaxed/simple;
	bh=mPjbajRR4bOoqdpLgYZ8XbSz5ySdKuEORFF5va6CWng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l8MMwy/Xca+9u/f/2nzBzLi/3Zl3BCnTnFdtcz76/DI+cCpFraNdOCwfbrJL+q87pU89rhyWAAlgAagwWXVkVMQsDwpC0vpoZWI64Ik11nnd1MnySKFBWqvhrMphlJS6djBpRiu0ua8R6SOym8RmAS724yPUziqG5Auz6UOhRN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lVSX/Z5f; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lVSX/Z5f"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539f1292a9bso8050594e87.2
        for <imx@lists.linux.dev>; Wed, 23 Oct 2024 02:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729677347; x=1730282147; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mPjbajRR4bOoqdpLgYZ8XbSz5ySdKuEORFF5va6CWng=;
        b=lVSX/Z5fPCfduNOfF7sCKipWqb7E91WrKAC/a+RcCn55MtSwbDaR+jbGCmjFMhINke
         1D3kqiLmN9JsMWzdmtHwY+Fa/Uhdc8dhDiuzky16+xvWOxgQpuAhbF5kJv4ATwmbvZSW
         SspOxqz3pUmkayjaxwAwlDa0GwVJwWBsY1dAhGqZTuWdQNwDOgdU8bgE6auliJgRMDSW
         9opR56RFbAVyiKY97fVtNJGeSo71sshsTz+U6qKDk/A66MpacLGO7TP1sKpRmovfbwiW
         Q5w8WtpDbK/tLM0JHopnJr8K5JOp5jyBKbeGhjfHoIsLZh9VDxBNTPvLMTL6/92/el9M
         YbFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729677347; x=1730282147;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mPjbajRR4bOoqdpLgYZ8XbSz5ySdKuEORFF5va6CWng=;
        b=ghkQxjTeiFdh90uyNUgUR1LDVZfohKQxVrLZfQwCkxi0ayZbDR2tCSKbffJYYND46I
         EN0lOpp/9NWX2btHEdTSiSSnUgR/Rp2noww2QnRLNrr8DzFy4qFKTLuNVgN1XlG2LaeK
         WrSrAoRA3r+ALoiN1a+WVnxQLNB8V8EYNyY6U3rVfGsJAWi78Yy+kmCSoGcL8vggd6h1
         5NSfP2kIO4DmM+Yo1EBNmDoO6CvoT7bBGR2ow7ksQpm3n17bsbexzMNbClao/WtoSSpr
         iL5jLJFqyWhDZQC/BUKG9KmMsy6s4hNukN2AQ060IZuoCSsVy2rWCdCHsrB6YEHW3Slm
         tiKg==
X-Forwarded-Encrypted: i=1; AJvYcCUStY/bgCi0ezfgOT5AhsoUqKhVgqe+UWis8SCzRkUIPvTqbxnPNI1AVMOlWMowWdLNhR0=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywu9W0GYeD79fHZgQOS9M8dNlWe5Cx1RTmPQ+wvKz+kG4A4CW/4
	VKjAe4HPXnCb+WP7vzFCtY0JP6MmbbsnBrXy/rCP8KZBr8P3cSbHuPdcp3tPYjCjOPNCFX5r3Fn
	fUg+0YFELR9Mu9vn8MvH1IsxQZwypR4/SGZ/ELg==
X-Google-Smtp-Source: AGHT+IFolzLkC+hFN1J3gwCoJ6YWqJKWTBQDu86gMLl5LAGSfGYrnPJgVActrb1HJVkCYcI4kIlnf6HXC+/7svXA1PM=
X-Received: by 2002:a05:6512:e99:b0:539:dca9:19a2 with SMTP id
 2adb3069b0e04-53b1a355155mr926169e87.39.1729677347558; Wed, 23 Oct 2024
 02:55:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241017211241.170861-1-marex@denx.de>
In-Reply-To: <20241017211241.170861-1-marex@denx.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Oct 2024 11:55:36 +0200
Message-ID: <CACRpkdYxerBV1sZ7KpOcO9_nwaLd1b+EKpttD2DW7zJx5ikUWg@mail.gmail.com>
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

This patch (1/12) applied to the pin control tree.
I expect the rest of the patches to be applied to the SoC tree
soon so we don't end up with too many warnings.

Yours,
Linus Walleij
