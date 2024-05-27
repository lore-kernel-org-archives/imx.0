Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85D115DBD1
	for <imx@lists.linux.dev>; Mon, 27 May 2024 12:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716813744; cv=none; b=Jmg98WhWH/UrkYrEbbKcud+gLUFnRT72a8y8yw/47O6JJ2Y2Jb47nQTtEPLkdERN4pBVX/esT4+0Qk4ENliT4DKTDvfzY4ZUxT9Uynlbk9Sw1qFHAMKFjlB4APBF1RB56WZ7JYPa5fx3DaHw9oFtlpGPfNvmADFd03ozXXYteKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716813744; c=relaxed/simple;
	bh=gvmIvei/evck27eAyXPfMfAUpIW//VOl8Dual8yqM7I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b3tj+wLJ1pldLxyBKf2U8RlHUQmCfslIQQZlRJJJuh3QLUpeJZL5QDszv54s7aETEWf4lRYbRFeuYr1wV3mNyVnJBULKWb42QfiKuVLH7mN8vaw9+XQUDI2e4VVAIAMlyPTnoDYOiaQtSZo8LUrxO3mjyeXF3k0jalmrQjONpPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zIuE/JTB; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zIuE/JTB"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dee72970df8so4113942276.0
        for <imx@lists.linux.dev>; Mon, 27 May 2024 05:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716813742; x=1717418542; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RreWtAd7Wi7xpCgHNvoy0257vlpp2GBbsNvbWW0dsCg=;
        b=zIuE/JTBJiXelgke8TvBcdFb1e07B+nNH1U5lUVssL1manjNpG0SF6/2GTzomPYxrK
         f2gAl5SkTVk/8kQ82kpT+HLhOSxq4xkotRWa79rDTx/dbZy2rqKxNe4TAUA+hrwMMqJK
         Cukrcx+bL7BG3sxoNTKDpw2N/kLb+CseselbwUeXd76ii4+oTVkFEPoWQ207rZvma7GZ
         UrGUrD80MHaOwX3Vjo8XSp+GbPO1tzFY4fVUdZ70UwvBQIii3PzULYk23TxSoPJNDeG7
         2qUdG30z6OYoESTwfLbkS4FC/0Ta3y/ZAfs2aClQm2Q2jMJi4vldE1zMi5hmZYBzC8HX
         sC8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716813742; x=1717418542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RreWtAd7Wi7xpCgHNvoy0257vlpp2GBbsNvbWW0dsCg=;
        b=HQhEMY0mcvJXsZlL+x77nw7zW7B/y7poWCjRI55m89P1XdCFEeWOPX/ZtN/uu8s3sk
         CuXTBx8L5myVGwt3wd3/v+Pmh0CmiOtUAjRhS2oyZSAVRUe/p5l5fzLNFqAETWA6wudG
         K51i7kRw71n/Cvk4nVzXR+coaavl+I1dTz1cNYdeDBh1fLTMZf1Gx3qMqu2wjYieLGlN
         mWTbPT3hD6IOzSD7WN8Xee7boqgzBTK7FPpd/VohxY7ZX2JPINQsfxpjFVTRnbo7TLCr
         o90gyGzMCEopry8cQmClOYCIZ0NvMW7qxctjNIct1jXlhYn+sQ2y5gtsqkeHWfD/cj0m
         h6qw==
X-Forwarded-Encrypted: i=1; AJvYcCUTMBqR6IaL12rE6hHb98gqT6sHnxYHbpMac5Ss4zCQG1E7m/aHxfcCEcx+mvCU+wZlY+y4RI/aXXYzsrGCrvxh8A5c
X-Gm-Message-State: AOJu0Yz4viy1XfOPdc+CowqtFTDOmuG+/OPs/ZdkCYwhB2Z/YbHtSMOG
	pzMJmFXash0K1baChzCbNB4f6ESbQN/uEq3pNNqDiyTF6G37sGfvDCPg/p3owvHpNy0dF7j6XTg
	ho/fHNzTEwlYzpRfyirtva3K3GDx/FDoBF5eiEQ==
X-Google-Smtp-Source: AGHT+IGnKKyNaK0erydWgd+7egLyO1LEZVbwIGZL84HNMIAWKZun14kUnLhTrRDtqLO6jO06aGMtpPufyBXFe4UUfcs=
X-Received: by 2002:a25:c302:0:b0:df4:d98d:3e4f with SMTP id
 3f1490d57ef6-df5422399dfmr8673203276.12.1716813741865; Mon, 27 May 2024
 05:42:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240513-imx91-pinctrl-v1-0-c99a23c6843a@nxp.com>
In-Reply-To: <20240513-imx91-pinctrl-v1-0-c99a23c6843a@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 May 2024 14:42:10 +0200
Message-ID: <CACRpkdYP1Tp6Cxn7xMNusZi=DP6LPUUTaKOPzW4FChu3oEbkFQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: freescale: support i.MX91 pinctrl
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 13, 2024 at 11:12=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.c=
om> wrote:

> Add i.MX91 IOMUXC binding doc and driver.
> i.MX91 IOMUXC has similar design as i.MX93 IOMUXC, so reuse the
> i.MX93 binding.

Patches applied for v6.11.

I haven't heard much from the i.MX maintainers for a while I guess they
are busy.

Should Peng Fan be added to this list?

PIN CONTROLLER - FREESCALE
M:      Dong Aisheng <aisheng.dong@nxp.com>
M:      Fabio Estevam <festevam@gmail.com>
M:      Shawn Guo <shawnguo@kernel.org>
M:      Jacky Bai <ping.bai@nxp.com>

Maybe someone should be subtracted?

Yours,
Linus Walleij
