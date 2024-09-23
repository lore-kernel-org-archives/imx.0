Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA35944E
	for <imx@lists.linux.dev>; Mon, 23 Sep 2024 12:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727093005; cv=none; b=CAMuQqz6yvkOTjmU+vKAkQJFkXXEE+ythCRrEs93yoAJYhYACACfbHVvpdThthbTjpGPqm83D7SEw4yH12p3hJe5mFpw5dPYJSgzDC8z7VHdOpU+e0NPjq7J8MU0+k7OV8dcA3dk4fd9GOq85KR5MBqAtAXeiNrBQxV093L86hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727093005; c=relaxed/simple;
	bh=D59OiNf9BhG00vuEBLNj/YD7ekAQ+eBV0cuBs/ceEEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cbfu+IV32ll3BzFZSXT3Mm+oI+yy8XMxsLPoWhQmZcnUkDs08SpBdvykeuV8Qtt4I8WEYOw/dw7YirSbD++CRHbybl2YVGTPz6gQsxjrtBcmYryCruFPOJ4tWHH4en6HCoiyHM7Zit9VMS+O53hK+WENfYYEq65yi2phEBHGJ2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KSYspyTp; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KSYspyTp"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-535be093a43so5059821e87.3
        for <imx@lists.linux.dev>; Mon, 23 Sep 2024 05:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727093001; x=1727697801; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bfE7g7okfFlz3A1braftE8uJHKezq5Xofdkckgw6nkc=;
        b=KSYspyTpcpU4WUyQSf9tf3fc12Dx98n24icEYzucluzUUf4Z41hF4dLUY9mmjTcF0P
         lvBEh/g/GQMYhFIjDgWHLp++etWZW8hDemmbcRMyPPdKHeWeRtNEZgGckmF8qFn02tS5
         aIvyZLiFeNzlALFw+I73Zv3bPBG9oReT50erat0LMhaGKW5HIT0aFJh5XzoNw3GjtR4v
         1/nNK+kD5yuBuhPT6BpSn6+8EeebCEtWYTD7JDx5Dudj4D/BIoCo4u5EXeQ/Rn174IR7
         hrHnYjFY0+1bPexbI7tTRKU9njDP9lsty8U/jIZ4O3X8uFL4dCN1Z+521wZ6LVollSM4
         3rLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727093001; x=1727697801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bfE7g7okfFlz3A1braftE8uJHKezq5Xofdkckgw6nkc=;
        b=i05T10r/AetEG3/X0V4Dawyu1mLLuti1auaxxLajVZ9CjhRQCir6hgrjOUVwexN/fe
         deV8UBLW4TeKhOEFU4xOket01foqcunxdn/pFxgQVYqtubL4wNhmO86YwPOw++p1mKoV
         3llKRF0snfbERBQi1WTQAHDDoX8hwbNy6XbwrvNP9djyrzAFzp8X6bJDJLGSXrxWkuwV
         1fEMBmhxeuhZNkdwrptRh+3u52Wlxg/WoebQnO6bHez3FEBOvoGYJbx4HP+5+foQXqD0
         DQ4YI0Mt+NyxcDrE5OOKzyPzJybIcwi3g+eQjBuuIf30OfIoLCdwujGbxSVQ5o3rz0yh
         9nMw==
X-Forwarded-Encrypted: i=1; AJvYcCUgP1ZRpNqVYXPpCQBySZ253fDQzYEsf8Rfg7iVKTLSBnqdyV9Zkh2jZgi3E1tV7bAx3bA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxWm65A5gvc9UIKgsr3ecl7azvFgOdB3Kd3NgSG8NhZbC/1829j
	ad+EZFXclLFwoWjzM+Yc3ri9eoV2Xr5QEyLccFPbhwV6nwa9r1XhW7OgrSux0b2XTMczY6JBqwd
	INvMaN4VYSQIWpgzJT+4cOfe9gKg=
X-Google-Smtp-Source: AGHT+IEwu1mOw5vW3/uY5OHfjlqgcJrFDYsoSJK9w0OxsKHFyFcLvqe+moPZFsMuGuqDWneYME8rofTMqT5VmcMNOmU=
X-Received: by 2002:a05:6512:3d86:b0:533:3fc8:9ac0 with SMTP id
 2adb3069b0e04-536ac2f51d9mr5278526e87.34.1727093000284; Mon, 23 Sep 2024
 05:03:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240912124825.2528984-1-lukma@denx.de> <20240912124825.2528984-2-lukma@denx.de>
 <CAOMZO5DJ4=ARZEcq+vbisA4kJBg+WFkH3G8-hYDkL82GQBEPBw@mail.gmail.com> <20240923114711.1c294b6b@wsk>
In-Reply-To: <20240923114711.1c294b6b@wsk>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 23 Sep 2024 09:03:08 -0300
Message-ID: <CAOMZO5CqWRqg0YhyNKj0MW807i=kVahSDpVXibp3oDj7D91z4w@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] dts: nxp: mxs: Add descriptions for imx287 based
 btt3-[012] devices
To: Lukasz Majewski <lukma@denx.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lukasz,

On Mon, Sep 23, 2024 at 6:47=E2=80=AFAM Lukasz Majewski <lukma@denx.de> wro=
te:

> This file has the:
>         panel {
>                 compatible =3D "sii,43wvf1g";
>
> Whereas in those devices (i.e. btt3) - I don't know the names of the
> displays - manufacturer buys them according to the timing properties.
>
> Hence the question - how shall I proceed?
>
> IMHO the most straightforward way is to modify fsl,lcdif.yaml to
> not require "port" and "remote-endpoint" and instead add support for
> "display-timings" and "timingX"

Yes, that would be a good solution, thanks.
