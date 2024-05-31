Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01001161B4D
	for <imx@lists.linux.dev>; Fri, 31 May 2024 14:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717164828; cv=none; b=SQly/vt6N6EJksjev/N4xypJcSbL2uc8aIXnI/TP6HoteKuQiurVxFtHVaoRNOawJolRLK9kIK+PdfPWNNLaxB4gOTZQ3w8XLuhZoN9JmK2Xn2KaHqloed8BLnL0X9xXwXgGAn0qtMFJ1vJDx70DPTOwAVg85NTfdvaBO4E7M0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717164828; c=relaxed/simple;
	bh=C14r9FmYtbAymOkjt/uxZrZg8hcE5Qe7k9wAzHSGsmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZBCYDhOCRX44k9O/4+oP8XRa3CUkC2Wugh6m8Uo/vTbVQtKbaDb4mOrZ8ENtCHZBp8F5l1S09/VUMzZrBJJrd/tmIV1MAp9PIdOL54jf6CwsxN6yiV/pJKl5ry1S8DGSJ7eh8WVY/rhxdaJcmz2zMpKb9z0L7XswABVELfn8Usk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B71EvWbF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B71EvWbF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84997C32786
	for <imx@lists.linux.dev>; Fri, 31 May 2024 14:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717164827;
	bh=C14r9FmYtbAymOkjt/uxZrZg8hcE5Qe7k9wAzHSGsmE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=B71EvWbFYcnrC1s/wCyUOJm0cAfJo5IkGkcsHonkHxN7bzgqxjFwpKwhagVykzJPW
	 uKopnOInmDG/A9CITXKMB1ktzNnvJYdWKyr05/lBhaXPXJY6JocOk86Qhhe0g356US
	 OWUU0ClvxBVR240PrAzG6ezTVfHDXJ1bDKGCmJXNXK7uGI4BZYrb6eP79JdjucBncy
	 318psGnoEfwVlCDAbkMzG733liaolL/GxxDYy7kwSVJYY7K0B7XQelMDyZDx7JrmY0
	 +gc4GUYoVzdpEXnBAQoCZnb98IVwLRi5vwLbV/QSIZIGUF2K3pKkT3lPkSfjmN6jKy
	 lVYNoWipxB0pg==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52b87e8ba1eso1157441e87.3
        for <imx@lists.linux.dev>; Fri, 31 May 2024 07:13:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUUECWCbl46CvcJWjBPBt/73Y2m1KIVS7XX/jW8G4TV7DIGcTxhkTAHHXxMeFBXJMZoiSipC29nAHQxkXabsoqODhsd
X-Gm-Message-State: AOJu0YzxYD5jwGMZ30CV86LCwxTa7AjwkJQnFwYoriI9y2zum9ZitAuf
	O9+H5YwCVS52T154mKaejNBGFShNVpBodFAfDxk8WExzwx+0D8TXTWbFbevZpn56xOjHI5qItGa
	af93HEYAraBogKwu6+/7L2uZ+Fw==
X-Google-Smtp-Source: AGHT+IHUlwL3z32dD0Od1b2Bi8JNBTAypQXHyjUufMKO7fZljjcaDf6m6zg3OLTckqlZX1AxA2gLS5ds11gM5rI/2RQ=
X-Received: by 2002:ac2:4eca:0:b0:52b:83c1:3f6c with SMTP id
 2adb3069b0e04-52b89576997mr1438677e87.24.1717164825951; Fri, 31 May 2024
 07:13:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240522215043.3747651-1-tharvey@gateworks.com>
In-Reply-To: <20240522215043.3747651-1-tharvey@gateworks.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 31 May 2024 09:13:33 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKtc_65tDMFWT0WroNPmW2R0Dd-4Jw101PnyJcPb=7tJA@mail.gmail.com>
Message-ID: <CAL_JsqKtc_65tDMFWT0WroNPmW2R0Dd-4Jw101PnyJcPb=7tJA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: rename gw7905 to gw75xx
To: Tim Harvey <tharvey@gateworks.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Li Yang <leoyang.li@nxp.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2024 at 4:50=E2=80=AFPM Tim Harvey <tharvey@gateworks.com> =
wrote:
>
> The GW7905 was renamed to GW7500 before production release.

Maybe some summary of the discussion and how this changed from one-off
to wider availability.

>
> Signed-off-by: Tim Harvey <tharvey@gateworks.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
