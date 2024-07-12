Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E769A16F83D
	for <imx@lists.linux.dev>; Fri, 12 Jul 2024 14:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720796068; cv=none; b=JLK3619g/Xj+Mg3Y5n3EFbSdukVoVrq4IeIxQnKPJ72rJluoEh2dWSHxkswJo8fhhLhyXUO0zgQytSCTk9lcj1EWV8OQkgVqWKv/jrdz7eTJzKtUj3nkGnlAmxeiOKibiPRS31DnjtGQ9SkZzSJnMR6C8QQy08/qHiuuZtwZL/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720796068; c=relaxed/simple;
	bh=oZnP4bqPkk+o/GdAa885VaEJ3Pa8Q+n8ng3fh+ry6gw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IdGQFYQpqnjFQrbn3O/6ifkfCA2kCsSOo5howfk0QR/k3FnuTxOuPft/q3o+WAXFLp6THlnNnadM9HOw0wCBpE0aWmHC3reeZ1BSU2GypHUFVPFwa+HSgMatLUAVzLtUkaof9EEzdt5d/iK4BWvb+rcb1cYljJQ/pEbtjbveJho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TQFBg9PF; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TQFBg9PF"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2eea0cbc96bso2291781fa.2
        for <imx@lists.linux.dev>; Fri, 12 Jul 2024 07:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720796065; x=1721400865; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZnP4bqPkk+o/GdAa885VaEJ3Pa8Q+n8ng3fh+ry6gw=;
        b=TQFBg9PFbIXEFUW5JUSE7vZJQPzNW5bZZ6Zyo5g5ITTa8MWTP0350rAkheBiuph+Ci
         uKBflnORfhZeE6HuVDnobjxq2O/rScMpiUOT8W0WAo7MPSITgKElncsvXMIBnbReLjmZ
         wTXlg0bmh1Fst1XuuK7+Vm/NRHVPGg4t+cDMky3TdK5L934OrZ7t76opbjMQ5YxPOu9V
         psJESMWlKSatTi5mqHJMAkWJz5GdUhyc4SFkPGHGyBaR6TiQRIzYBJd90OR5hNRe32R7
         uVd1WwDjnPPny/LbaWlHQjP6AVZ/+mc1l/i42drmKkD80hMC/9SMR+/C5u2tvE6ZWCTR
         H2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720796065; x=1721400865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZnP4bqPkk+o/GdAa885VaEJ3Pa8Q+n8ng3fh+ry6gw=;
        b=V5+tXa7687467/QpNepyPYCDbEPMdvSffmsGR3HceuFxuh087vBdbPMavqXnVjXD0f
         eHSYR5222el7ohZ4QtNSQEQ+v1PCSNDvpm8x0KZ+5Z8vT05itGQMMgvs8uDaz4/8hELU
         JJNZt32BF58HXn1NtmGS3v1YyTD/ZO48ogLaJGSfH6iLM5w4N+WMy2Uvll5HgjXU3oYn
         Jv2aNuGGP7EcUQIiCpNTcqXNCg+Cb3jSxfHD5ZX3AeJlr6DIoONqqDShdqZ1+ITXuQVg
         6SEyYKDGSPIE7ymaVV1cac1nSV5lUOOEltUiRao7aIDUYZCvPt/UasaAOfbJKvY2gl/O
         P3cA==
X-Forwarded-Encrypted: i=1; AJvYcCVbTXGNChRnZ/4YOBA63mTTbz4rkVlhuSUDwUnNOwv1tgyEerti+31kTxHF5hbkay3GzC9/0l9bCg+XCseIHhmghWlp
X-Gm-Message-State: AOJu0YwLRmu1f+8cGsBeMmjaUGh6pPt1fo9u2MbbDwsatNi84zeE7ouo
	feYveKa0ibcYvf4Gk86Yg5IhbKlNSoq+5DHhYt1RQmpDR0x2+CiEmynePMbBeb7MS5Qq+uHp1ZT
	0NStVYLpb8My99F5Yt8xW2ZUlhm0=
X-Google-Smtp-Source: AGHT+IH/V+4RuMMP1y4zYsMr3Q3yn0/UVcWRFpUrpBf/8WyoZC0+hb7EngLvXStJlZYCrRKOZeKjxOC/+Ux6x8JjAy0=
X-Received: by 2002:a2e:be05:0:b0:2eb:e6fe:3092 with SMTP id
 38308e7fff4ca-2eec98b4de8mr35608201fa.4.1720796064757; Fri, 12 Jul 2024
 07:54:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240712141844.3274214-1-Frank.Li@nxp.com> <CAOMZO5DyP_V7+hSGm6q2ReTUhQ6ebTaLrx=qNhkuFSpCHc+8NA@mail.gmail.com>
 <ZpE/6VM/DbCoVg5c@lizhi-Precision-Tower-5810>
In-Reply-To: <ZpE/6VM/DbCoVg5c@lizhi-Precision-Tower-5810>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 12 Jul 2024 11:54:12 -0300
Message-ID: <CAOMZO5DZHBuGyCbce5RajNXGCFtSZ60OG-Su8QfXR=CfQpjosw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] watchdog: imx7ulp_wdt: move post_rcs_wait into
 struct imx_wdt_hw_feature
To: Frank Li <Frank.li@nxp.com>
Cc: linux@roeck-us.net, alice.guo@nxp.com, imx@lists.linux.dev, 
	kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	s.hauer@pengutronix.de, shawnguo@kernel.org, wim@linux-watchdog.org, 
	ye.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 12, 2024 at 11:38=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:

> Yes, default is disabled.
>
> Please ref v1
> https://lore.kernel.org/imx/20240711-wdt-v1-0-8955a9e05ba0@nxp.com/T/#t

I understand that.

My point is about the commit log: you mention i.MX93, but you change
i.MX8ULP. This is confusing.

Also, better to explicitly pass .prescaler_enable =3D false inside
imx93_wdt_hw for consistency.
