Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859F9D304
	for <imx@lists.linux.dev>; Tue, 14 May 2024 07:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715671345; cv=none; b=PBhJwn2Q67pxlZIz2PqW8apy8NPmLUWgFE2EIJxuj9WbzxK5Jsj7GHtZn8c2jZ6Jt6zvS3VOhIRD6RI5uOcfrCHFOnbV2OOnmWDiklPLwk7/OS0mwa4aHQ6VGLmKGW6iSc41oumzuuHQfYSHxqPArA+mzXobMvegzh/mPhjtA70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715671345; c=relaxed/simple;
	bh=JzVYEOFYJs0vaOsSEbpguUeyRllA43s34MwtB1FYfVQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vC6AQp4O+sKyIO77LehQZUGxXFM4t39zfs30fYgYxZY34RXhvxhN58d/UI7zFBToAaidxeem7PgIXjeZLo5BQsgD+H1/xwUYa2AcAFRc+AJVRyYq+cglDzsxCVr+mvd5+ZQYowVQDcdSoakleqazS2eEKGq6wp37NHWmJdFqXwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HIIQqWmP; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HIIQqWmP"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-36c81da1ce4so18179775ab.2
        for <imx@lists.linux.dev>; Tue, 14 May 2024 00:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715671343; x=1716276143; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9WNa+3eLjaxowCpV/iLa2mMgq8zXzxRscxKrC3IUfjs=;
        b=HIIQqWmPxmKwafIzcC6OQhPTmeNsgPvwIHmMqzkkJG530/Cq3dlxm26DUrSJGz7x2L
         1kk+gQ0tykNZiBrVaEskvHg0tC3kdJqTqTpX/K11wPq0IOihm3tZEb/BnmWsaDnRNgru
         mVIN9uktLnzTSDECi1+mzx1iYRMxhy3oRVuMQPd/ir3F+UWdLUSPdq1eXJ1CUjr/7NZe
         Ab0b31wDJYdcErJU3ZbSl8l9j3NUrV4nz1utGPPa5pWl9KGlYCcekY37+VjzIVny5nyi
         ZJt5Fm/3PP9GYCJh+owqFkJlTrS608QfiZTZbelFzQUljhx5jtLSye1d59sUtTO+2j+E
         xyDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715671343; x=1716276143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9WNa+3eLjaxowCpV/iLa2mMgq8zXzxRscxKrC3IUfjs=;
        b=T3Xxl3szJ6L4xGMs4mMKMvcCbdjHBlfEFfQpP4v6Xd/8D60BBDwiESxEPhaCL1DQhh
         BSA16N6/QlbSLZHOlH3MbhjKupKSLxEt9air6vtzXHWcUUfgfegqobq3lwdKPaMOY5ac
         nJz0OobTX2ov5nLL2whpH/MwhQHVkZL0a1M1izAIBNPySB0EpZhqE2s6Pc+ksNdCRKCX
         hlkkNwrqQQnqjctcdP8N8uYhqUwNHz8f5WW+WBUA5OwxAp7dYsVSb0xkVzQ1kkDB9fCN
         7yHgxceDvve/DAez0tXu162PLxzLmdnZwf+LqLm8F0vHzcqrtM4rOR9DoogWtYrNkkbb
         /Rsw==
X-Forwarded-Encrypted: i=1; AJvYcCWAaNGwnRV3F9jNbvN+pmNz8AYzKux9tqsjhDCI4QlR5tas6vO8MvRgW8yA0EJDqYPyAJjmDGoLIXk5AZ8gJe5Attq+
X-Gm-Message-State: AOJu0YzMXzaISNDxtiVTY7OZFhWpBKDt0Ie2lqXlpnkri5V92ynore07
	HBnDWbpKQfMWUY7TeHbVgAS3vD5m0yE0rfN1/p3c4j7XNOyKyOqaeq0CTcqbj6K1++oemyJQQ62
	504IKwcEHB+uU9MfwSp8CnTFiIoc=
X-Google-Smtp-Source: AGHT+IHz7rxMKPw4QcPFf9e3+rPk6L5/ivfWPbNHVCV7og1/nXbe/V3wGrxTTVUvZ2OU/ikTt9tJestH0UovLmH6h3c=
X-Received: by 2002:a05:6e02:17ca:b0:36b:85e:7d69 with SMTP id
 e9e14a558f8ab-36cc144b718mr211747815ab.10.1715671343660; Tue, 14 May 2024
 00:22:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1715219038-32453-1-git-send-email-shengjiu.wang@nxp.com>
 <1715219038-32453-3-git-send-email-shengjiu.wang@nxp.com> <0d10a689504be61c50b186d89ddbf9d1.sboyd@kernel.org>
 <CAA+D8AP9uS1ePxSeSUPGCGe42U5sNguZYQS3d-9T305d2iVbhQ@mail.gmail.com>
In-Reply-To: <CAA+D8AP9uS1ePxSeSUPGCGe42U5sNguZYQS3d-9T305d2iVbhQ@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 14 May 2024 15:22:12 +0800
Message-ID: <CAA+D8ANZYB2ec8qEzub8++Rz76zwn10Bt9c7cZ3tSTUbbQfwGA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] clk: imx: clk-audiomix: Add reset controller
To: Stephen Boyd <sboyd@kernel.org>, p.zabel@pengutronix.de
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, abelvesa@kernel.org, conor+dt@kernel.org, 
	festevam@gmail.com, imx@lists.linux.dev, kernel@pengutronix.de, 
	krzk+dt@kernel.org, marex@denx.de, mturquette@baylibre.com, peng.fan@nxp.com, 
	robh@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2024 at 12:02=E2=80=AFPM Shengjiu Wang <shengjiu.wang@gmail=
.com> wrote:
>
> On Fri, May 10, 2024 at 6:04=E2=80=AFAM Stephen Boyd <sboyd@kernel.org> w=
rote:
> >
> > Quoting Shengjiu Wang (2024-05-08 18:43:56)
> > > Audiomix block control can be a reset controller for
> > > Enhanced Audio Return Channel (EARC), which is one of
> > > modules in this audiomix subsystem.
> > >
> > > The EARC PHY software reset and EARC controller software
> > > reset need to be supported.
> >
> > Can you move this to drivers/reset and use auxiliary device APIs to do
> > that? The idea would be to have reset maintainers review reset code.
>
> Thanks for your comments.
>
> This is a minor reset control only for XCVR devices, two reset bits
> are accessed.
>
> If we move to an auxiliary device,  we need to define a new header file
> and a new driver, which will bring more code size and complexity.
>
> So is it necessary to separate it to another auxiliary driver/device?
>
> And add Philipp Zabel in loop for review.
>

I will use syscon and simple-mfd to separate the reset function to
a new driver,  which will be a child node of the audiomix device.

Best regards
Shengjiu Wang
