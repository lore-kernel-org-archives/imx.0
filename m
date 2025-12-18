Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448502EC553
	for <imx@lists.linux.dev>; Thu, 18 Dec 2025 18:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766083454; cv=none; b=nxOaR40JPiLKJ3rKgfxshKKZI5/33FnRJTMXPnAymsCTVaSd+Qva7tf6eutQQtejh6f1io29A2uHXa75rKkWqRGHxZzQDmtW7gFbQ15fjMi+zWrQbDfbCF0PKRuKj3aAs2A6Gkwrj2oZFtb9ugf0X7Y2rA9+xOTo38cmL5HOD/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766083454; c=relaxed/simple;
	bh=2UcGggCJU/gQmM5MZ61Xq/8KY3VcjY+5Aob9fWERvdY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GEQbuaD6vdAZSGRPw5qzp+TMXs1yzUOBYu9fxf+8tudQ1Va2zygHTDAoLPmfbug785ZyTXg9stLfiOZpRsDGDzcnyZ/kaMrpdrjifqtyQfbr+p/jjuI5s1zgyc6miKAAHbR6/8LAcHgDbVZ9M9NRITvBBNtqR46zSyNkDTL+2Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=no2LJVf3; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="no2LJVf3"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5958931c9c7so1109344e87.2
        for <imx@lists.linux.dev>; Thu, 18 Dec 2025 10:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766083451; x=1766688251; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2UcGggCJU/gQmM5MZ61Xq/8KY3VcjY+5Aob9fWERvdY=;
        b=no2LJVf3/mdTdqo10PHdRmr0oFwk7bGqOcI39esJHHcvRmpVLRSRJMIa1f22GRjvgx
         PE7Fi+gZnQDONb/y2m9PboNBOyTcuAGR2pOJqMr1AwsOZv9NEk5HL3pmznCN7M9lKiEp
         ThRX5eT9EF/AEkBn5m4XdCLW14hpTZyU//aoOYyeTA3UG3xaVRqZFe/HiRARnWH8VIsW
         1VrpVK8MxzTQt47vle5vScYgHKCAXxbQpzM2TgRq0go+Tey4oqMU4YFLOyB2h8HfP8ti
         T2evJAXhFvKNsHQ4rWb76G+SLrcbKbeKcz6gdLTBJPKKkTC+ugIEB0yPPzjxfPqbnBpT
         ob4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766083451; x=1766688251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2UcGggCJU/gQmM5MZ61Xq/8KY3VcjY+5Aob9fWERvdY=;
        b=HqlfP7G6rvMPp9hsc7v8EM6WX5IHsuGpdkSiArpGNnxiA4jjmwdaDItUCVRQw6sFPh
         ea6hd3sNf73TRcEZ/rlZD09hEtd9jhAwvU7oI1mE71Tzkcz5MmySxyUSPIpmn0J7PGKQ
         h1TY3vvYK1Xo+6F3hBHW11Ix7Uyf/n7zF7c4vDy0Rwxct8sc62xJXZn0mPj1MJ2fmk8L
         wRs0OPXE7JScqFHHC4KrUxCdWX/m1MI3UeLuJPEcLpd0Y864GRfB3G0a4PBQNsAQ8UTO
         WYvxcWvlg1hPdpjJ8mUp+Cd/wyMX7PZsAV0s4a3UIXbc21RU606iCcFrONao4qbHbF6R
         YmRw==
X-Forwarded-Encrypted: i=1; AJvYcCUMQaWidA7jYJUJ41jmvx5dfkPK3cRAF9lYsymtePq7z5iI5bWTO7Z5al9gOZgIinxT7YU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwxjKLACoT+cKoi5R24TzdQsU575DE8xeJg+5NFbh0gRdaWuzUC
	1/fuD8N8PClg6fzFBv8NO64/d9cdty0uyxgzyMtuQ83ZMY1ulV9NKHwW8EDGdWgyaXbt8sOwY1K
	ZDBE7Gw7VjnrsNbold+6OJDETvZI+OKE=
X-Gm-Gg: AY/fxX5qNgKATUDFRKLdMkDZMmgqeogZVBkTY13vYsVgodkYyeVYhH79BxN33zx6/E4
	NZdq1DcHFunqvDQR52k/A2656444Kq7hAT8D59pQFT88WXRL0DT45g/UX/NxIaqiTqLiF10WFmg
	GkAHaNhmggf+Q3uYrJWiDjKZ2E6H+xZICWNDxXBH0Vcwl1yj3VSK1yufHAXiM4khjN3GP0n3P67
	xjAG9Csj6iETOkQ4DOcGT0g+8weuvRWGb5sQnhgIAC+8AC56BtVktmBo+tGcbrVR8clBBCYPQMe
	f7ve4kTtGgGFpHsjOyO9gozZ+QE=
X-Google-Smtp-Source: AGHT+IFy6VXe0oYcT9AL7PKkkyZuOK/cOJtVaqtyyEXq3TUGm24XPb1fiNFmYHhvBLxZ0/hxZJK5A8dV3Kok55pUhAs=
X-Received: by 2002:a05:6512:3d92:b0:598:f96f:af0 with SMTP id
 2adb3069b0e04-59a17d74c9dmr176519e87.7.1766083451115; Thu, 18 Dec 2025
 10:44:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251218174920.359282-1-stefano.r@variscite.com>
In-Reply-To: <20251218174920.359282-1-stefano.r@variscite.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 18 Dec 2025 15:43:59 -0300
X-Gm-Features: AQt7F2oT3yekYwkg8Q3KFC57cWD5deIGE6pmkCwOIalUzjXuivrTkNyg9wjaQnw
Message-ID: <CAOMZO5BGtgDemQeLvJ+hjY+zBtpFLp=pkpD9js0SfknE4fHd4w@mail.gmail.com>
Subject: Re: [PATCH v1] phy: fsl-imx8mq-usb: Fix PCS_TX_SWING_FULL register configuration
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, j.zink@pengutronix.de, 
	linux-kernel@vger.kernel.org, xu.yang_2@nxp.com, jun.li@nxp.com, 
	Frank.Li@nxp.com, haibo.chen@nxp.com, linux-phy@lists.infradead.org, 
	imx@lists.linux.dev, Stefano Radaelli <stefano.r@variscite.com>, 
	Pierluigi Passaro <pierluigi.p@variscite.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefano,

On Thu, Dec 18, 2025 at 2:50=E2=80=AFPM Stefano Radaelli
<stefano.radaelli21@gmail.com> wrote:
>
> Clear the PCS_TX_SWING_FULL field mask before setting the new value
> in PHY_CTRL5 register. Without clearing the mask first, the OR operation
> could leave previously set bits, resulting in incorrect
> register configuration.

The change looks good to me, but the Subject is a bit misleading.

It gives the impression that PCS_TX_SWING_FULL is a register.

What about:

phy: fsl-imx8mq-usb: Clear the PCS_TX_SWING_FULL field before using it
