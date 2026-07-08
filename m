Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797A42E03E4
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 23:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783552199; cv=none; b=ovoAzWtnO4087t1sl92GEchOauBten4WVI5cMJHkpILLC/vXnzrxisyMWauKQxJChM5ZKpXNmO+G56jRRe3x+43WmmRaooyk/sC4ErGj+qfSpf1AuEEVy5TBBawgP0bPqstY2gEqvcS9zNGAC5a21NTldC/0hC47lSBJDwK6IH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783552199; c=relaxed/simple;
	bh=53loIXpyqY+B+k4wJXgZBf3N4G7JmilBoyIBp13Tbc4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=loR+dfsaTwU3B5+hjBk9hsYsAuXA9R0KNQZViaAExVC5fJP3XFmfp4LD8aRZMowE4+g6wVkIqZQkhwXe1yWw1CF3I0QyS7b11OelkFaxiO+7lLQtq28haW0lbNCtRrqMQSyNbo+FFizjbTI6FSXgHaGHOBWWnsC6XCTTYDvszxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZqLGG/La; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZqLGG/La"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F3E21F00A3D
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 23:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783552198;
	bh=LR60eLgUfNNIz6B0v46FKwzAtiy9XGoPTayqxcAz4UQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZqLGG/LaE2yyMqM5XS0hIvwyGP4VAC2nYijzaQlQfIaDqC4xDUQr93yEZe96t90jy
	 VymKJ+2dNoXJ0R90xBkWS3du9UT3kY79XAn6bzUKknfEpUTxnHM6QE7X2l+BB0xYbo
	 cwLCu/lnPGJjQS3pil9w7fjr6vJN/rv+nWiHl6vwGXiVOcVBJ0Sg0UuLfA7DpObG8X
	 3dtK6Nb/81VPz7HN1L7VIbbeezTa9yQCWAGc/Bb0heQOcjAxtvPDGvlr4CsC+tQDDf
	 XQ9VtCE1WQQ5Sx8FsNYcHIPYNyyrcoAuBxDyDOZ8Y0d+4eXb8TBqQwXlD7MHuq2KVY
	 /XVaqMZw9G9iw==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aec139da7eso380535e87.1
        for <imx@lists.linux.dev>; Wed, 08 Jul 2026 16:09:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq7NyLE74sIVKJkM1zH/5/bdKi0CwOj+m3xbj+Dv1nBUWel8dJlu0GCiiAL/39Hb0YxAfk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8MryC1Bb5EgbRZWoRQCwYCppqXuTcwp9AxT403Iuxgz3vUf5b
	OUXawmm81fM7Z9vJ1x6NgRQL1aIZKbW7E81qRep49KgH70z+6YZXYev8VI3Web6JzB08ykOqSoF
	Wi3IV1JWdtYWeAEG3x2GVAyW8exJJBkU=
X-Received: by 2002:ac2:4f08:0:b0:5ae:b5d7:7844 with SMTP id
 2adb3069b0e04-5b016d1b33fmr49718e87.5.1783552197150; Wed, 08 Jul 2026
 16:09:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260708-dts-stmpe-v1-0-1f51d15bb358@nxp.com>
In-Reply-To: <20260708-dts-stmpe-v1-0-1f51d15bb358@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 9 Jul 2026 01:09:43 +0200
X-Gmail-Original-Message-ID: <CAD++jL=tBRFXzqa6gXNnZ3-DRUMvs=waSdDvq5h5MPHAQoheqw@mail.gmail.com>
X-Gm-Features: AUfX_mwW-7N7MmlP00AndlWeAaBl8FEBrFYJNUhifSWGKsGcvxauySd-Uj-hISw
Message-ID: <CAD++jL=tBRFXzqa6gXNnZ3-DRUMvs=waSdDvq5h5MPHAQoheqw@mail.gmail.com>
Subject: Re: [PATCH 0/3] ARM: dts: imx: cleanup st,stmpe touch screen related
 CHECK_DTB warings
To: Frank.Li@oss.nxp.com
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 9:49=E2=80=AFPM <Frank.Li@oss.nxp.com> wrote:

> cleanup st,stmpe touch screen related CHECK_DTB warings.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Frank Li (3):
>       dt-bindings: mfd: st,stmpe: add deprecated properties
>       dt-bindings: mfd: st,stmpe: let interrupt property optional
>       ARM: dts: imx: remove undocument properties of st,stmpe*

Those look OK I think:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
