Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6FC2853F2
	for <imx@lists.linux.dev>; Mon, 23 Mar 2026 02:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774234440; cv=pass; b=GogBCuMlRlOzOkl0sm7WEj8ojQEXYtR8RolnWfw5JG8tZbXwb9TQ8JTQlJyXX8zps5dBAbDdblZFvQN2zgca2lZs++3fBrwS9RG6jtUE36QMM0MK+sORkKVTw0vWYZI7AnVbkwf+c8nt23wWIRRZDRkp2fcf7Jj6tK0uczNJRF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774234440; c=relaxed/simple;
	bh=Xo7X24KURKwbCzAPV/YiMB2riIeW/RY3dANwUw5/k3Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cnNxj4Z/nsQ557j/LoS3q+KL9OXCnggbPfz1voP7xt/Zbvq/6c/22mQdJ180jHc5lxtk4BbIqetckUC1cKGWMZpKVbYyEtzahUTIRnzFsEcOV+oCpn70WRTJhzvk7+IvczmdmBIRV5QLeWPszhrHSPZ9hz739moSXC0MpPvJFgo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ASb4S5lL; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ASb4S5lL"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a12cd0bcd8so3220835e87.3
        for <imx@lists.linux.dev>; Sun, 22 Mar 2026 19:53:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774234437; cv=none;
        d=google.com; s=arc-20240605;
        b=BiOfZtosFodLTgEhVNc6e8JE0b6YZdf/C20vKr+wSwyLnl2TX56fGjOIdoMt05et8F
         S0MQn4+tP02i1RQ6VXjQUfci39jNZa3CbJQaRcgW5AYJMbqxTKaFknj9a61n2bOMP6JQ
         nHdTy/0p6RfRIy8Vbgi6Ylm1zMY8SveVTsMHyeVQzKoGYSTbj7vFmV7HYkrmbY1sLoG+
         29tK0/vcIo1VN+i0WphQLa6NZMkZI0okNEtqGHucbEaEp5ZrZk+/WU0FI5FFhU1HE5Rs
         W2g3jXFhlIks6MOAaUujXhb4lFiz5682aA2EOhXbuUVe/RgEcfmjzXqQcRnuDY5fuUAw
         8/4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xo7X24KURKwbCzAPV/YiMB2riIeW/RY3dANwUw5/k3Q=;
        fh=yAt32/oHX8XnGdp7+mQxAGh1YLxyWK9BIUywzmCWkZk=;
        b=GiWTT6q5jT18AyPMXukOOl7xb+/kq3USlzLtqi6kwbxmJqDNMeIA5UHsU9STZuRyD2
         we3qkEcygoNIaoid0an/3xw4bv/GO3GRrC0vsxZ4n4rVH0UA1AfgRaEqMYfdpc+68YiG
         93A4t7mEO7U3sskg8NcSqCNNkW3+zMmiRJOGVHJR0kH192zQt+bozlZbgPVPiTOdKOEi
         KKDEbfT6ghTfRxDIAmwHBjiTQ0qc48nFdYjUCUo6bIxlT87/pTXfz6SKG3kO9JYY4xeZ
         7KaMi9k9XWEFYWki3J4VbfLPazrSJxFANTrU7OCKd9R9OoaBUWN1VmZwLvfCuLtTHN0K
         HxDw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774234437; x=1774839237; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xo7X24KURKwbCzAPV/YiMB2riIeW/RY3dANwUw5/k3Q=;
        b=ASb4S5lLDmJFSCx5EY8OpbviMKXZIdaKP/ixA+aUm3vrK7u3O6OWY16EsUrAIXIswr
         +UOTEEGi7d1CGmJ7RwFZOZiZVU4f/iLrN//yNvENkpheVcjKpb2QkA4uu4cugs16UtOV
         4SBjsvoujuQG9quPlR2eQX0++CjrqEOY8jjo7bO+YATs1Fg64nlvsh/eVyyUC/TKwIhC
         Ej279C0iGrYxowehg/rSTNHtGp6ORzOg1fiQmK+Z4FDQWC/unsc4ZYQFGVj2o89wLa5h
         3Yp02IKSeMZdAJf2P433kaQxzh4ZmXfd8Ax4ZqMKzoEIs4DSvBuysx4sUZ6E8O5jG+UZ
         rmJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774234437; x=1774839237;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xo7X24KURKwbCzAPV/YiMB2riIeW/RY3dANwUw5/k3Q=;
        b=VNWh7Mj1I+RX282Dssb/OOhlWamOZGufjwxaVsIFQJkkGIkN6FsKrIhxXdsM/NOc9y
         Lb6yhAt+/+45pFv7lazdnnU+1yfISeQ6zJBeWwf/QMjpLWIsHDS7+aHuKIY9DFHzQmpq
         RdyLNd/FNOx9MAidBIv98lcqM/qzsZX15B90r2T1KMkZgBLZ+vN/XTSEA+GVSRLxBhL0
         qEadoNYZjy55FhAjOcvYLtuiIH0Wxzd/thumqZKZp2jCIqFjB3mCoORalH2eNJpUjx4o
         NIe5lUTxWi8C2bxYGvZmEoFok3lXbIS4wa8epiCaSDr+7Zm7MpxAQSFCjA/+ry0nqCZ0
         xUpw==
X-Forwarded-Encrypted: i=1; AJvYcCW1KzRlLLiyjLG0T0ELHYWsqphY/axBE/g2dLim93FV4LeLyJ4BFfNY83Ud4UnkVsWPWr8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzUqXPoZmRJi/2nOUOBoaVBEpZBGBPSEHBlERS/rl0DirWys+eS
	ZORBcjAmqvpp8LNpRpLTWk8A282D/Ms6dzqQ9IboVC9OPrNG1SGO9klRlXupSxmQWw40Ilwuhb+
	pXZc5fUmaynQ/I7PTYyLO07M4xfmsH2w=
X-Gm-Gg: ATEYQzy2//ivVFfENOoD4y+OADAgWYlowz+jRecLZhe76tJqOv8bNBbr4w3JDPVHao9
	xDMptcpvhrG7gE2GMp8vcRtlZuUuTYgSWS9ECxR3iV8+jST6b2c057AQgo48Zo++k0DyPoM7ba/
	nLRkBE6RnOBscCgCPH1bNI2jIdmlw+xJQOw0IhrBglvVAqp3BrOSqmKN9ZqHw6LCdHvELtFnFC2
	2vk4eFiJ16JcpyWDO28+axl3luqgNSkM626XJySrLi6yQ+bjOKnJ3Eik+yegiRO5qvrp4fqoDJQ
	ACZUL1Oi8LOP8r8t5tU+H0a/hRpCzx2PTvepmsHT13NW5de5IHWXzd1U8WgkPkEXA8BPuBA=
X-Received: by 2002:a05:6512:682:b0:5a1:18f0:930b with SMTP id
 2adb3069b0e04-5a285b6dd90mr3277193e87.42.1774234436995; Sun, 22 Mar 2026
 19:53:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260319200945.23333-1-adriangarciacasado42@gmail.com>
 <CAOMZO5DcaucpKj2=gO5kP3vd=f==ydzB+3FbGB4Jwg19Vi8fpg@mail.gmail.com> <DU2PR04MB8567934E6CAB063DE5CA0F3AED4BA@DU2PR04MB8567.eurprd04.prod.outlook.com>
In-Reply-To: <DU2PR04MB8567934E6CAB063DE5CA0F3AED4BA@DU2PR04MB8567.eurprd04.prod.outlook.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 22 Mar 2026 23:53:45 -0300
X-Gm-Features: AaiRm53JnagsrSa0mVy9Yk82B1cInf3CYkgQHDyLxpH2kT6hRQZKDibglWpZf8Q
Message-ID: <CAOMZO5CJ3m9ucMVPB8qYhfaLYMTfRNF2VEoAmfbyJ2dFF80DEg@mail.gmail.com>
Subject: Re: Re: [PATCH v8 3/3] mmc: sdhci-esdhc-imx: remove redundant mx25
 handling and consolidate soc data
To: Luke Wang <ziniu.wang_1@nxp.com>
Cc: =?UTF-8?Q?Adri=C3=A1n_Garc=C3=ADa_Casado?= <adriangarciacasado42@gmail.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Bough Chen <haibo.chen@nxp.com>, Frank Li <frank.li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, 
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Luke,

On Sun, Mar 22, 2026 at 11:38=E2=80=AFPM Luke Wang <ziniu.wang_1@nxp.com> w=
rote:

> Hi Fabio,
>
> The option to remove the imx25-related code was actually suggested by me =
during the v4 patch discussion.
>
> "
> The original use of is_imx25_esdhc() to avoid setting DMA SELECT bits was=
 because mx25 doesn't support ADMA, introduced in commit 9a0985b78d70.
>
> However, before that commit, imx25 was already using SDHCI_QUIRK_BROKEN_A=
DMA to disable ADMA (commit 97e4ba6a5ea9), which theoretically should preve=
nt the DMA SELECT bits from being set.
>
> The actual reason DMA SELECT was being set incorrectly was due to a bug: =
u32 new_val was used without being initialized, causing DMA SELECT to poten=
tially be set to random values.
>
> The new_val initialization issue was fixed in commit 81a0a8bc380d, but th=
at fix was made for a different reason - it was not recognized at that time=
 that the DMA SELECT issue was also caused by the uninitialized new_val. As=
 a result, the is_imx25_esdhc() check was preserved.
>
> After the new_val initialization fix, is_imx25_esdhc() should no longer b=
e necessary. So merging mx25 and mx35 is indeed valid. If you'd like, you c=
an go further and remove the is_imx25_esdhc() related code entirely.
> "

Ok, thanks for the clarification.

This explanation should be part of the commit message.
