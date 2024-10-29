Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29DC199FBB
	for <imx@lists.linux.dev>; Tue, 29 Oct 2024 21:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730238375; cv=none; b=sAPO3Y8XYOFjWsp7nSV2YhnhQmEDWfjKounlJ3kWj/JI58wBu0fC4xLfebLDlrj/gu7MtlGBiUbVedIHwRGVWFioZ/zKJ5uxT22WutpqitT1CcTAm0cBjCmiNGHzBXonstrNjLekysAirJOqoVqisQT+wzRRMUv4JH4or8IWy5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730238375; c=relaxed/simple;
	bh=2JblyV7WTsTnc5tXzfZ94G3EE4PGcp0Te58mEyBSswg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nQ6Sbgi37OLiyCIKho6/wlci8/ErRtxw7aeJMJ6SJnZfIfX0/zp+b3GZvrEk/f44FvFz8TQklt1ogyJpHKytexIoutbReCaaIo6adsBmOhzcbToP7TgeRRZxin1OoFKtOGA08hjw42WAcTqgPo7HdB6G79dLWYXwX9WbOXcAq0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EHqPyVh6; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EHqPyVh6"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb388e64b0so59072901fa.0
        for <imx@lists.linux.dev>; Tue, 29 Oct 2024 14:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730238372; x=1730843172; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2JblyV7WTsTnc5tXzfZ94G3EE4PGcp0Te58mEyBSswg=;
        b=EHqPyVh6JWZrbo6fgxeHUQ0RN7ms3onpwg5DuOKJ7Zj/XjuyMyHy/LCGxaShXqV1QK
         2lNeArORhLANFfMcq+HTgNcvOioSk7z3dAI02oniK/aZuUhvlskfGCRj8SEk9QosAJl+
         Gt88baWTy1btSOGzHLfim5wkzO7AKKl8FOUxy654qOI6eP5Eaua9hdINW8Z92xqB1mED
         c7FewSZRfEsXtESpkU45Xdiv5/G47jztvZ4WSIOe5EqA67luYyhZChhI6HRCS/8PAB5r
         ahKHFYeWU63V0d4ej8DscvdMErUVHMS+z0AdOo6RlcK/HwIy6LszUI3bnxX24I6cSqKr
         rEjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730238372; x=1730843172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2JblyV7WTsTnc5tXzfZ94G3EE4PGcp0Te58mEyBSswg=;
        b=w94kF/IsYkWtdAeqHek3yn76q1M6x6EL6K1IOvKFUKq6xczahelKUvxyOokLl2poh5
         n7NKJOOpVtAG4T2G8BvQrD8/u4pauYPliAySdRX9NObIuCY5YpYNa4DVuYwCL/dwv8km
         HIkV79cDHLw4QoaalvThulfQ9cBPRxHCZuH1D54bLMyUl6QdZ7GpxzZwvkEDsm40cDpy
         9Npzaq6c0NcZSvfnqb68iYFd31dQWZtbb4aP4SKbbGS0oS7luMEGcy6kmeSQeYwBUpB+
         kQB1Ac8RdL+vkP3rqdVWXwaOl3ih83zPOKUqiiOswXW1xVGoi46MZJ+t+XZkH/3gJ8a/
         6zbg==
X-Forwarded-Encrypted: i=1; AJvYcCVcFbyEp8xECJR6qG2ZWhz4xHYu73/rXcARrU0waG3kCn1e8c7EEl92VpsN4lgW1plHk2I=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyyzv5T69lj5rOUK6w8opjZmE9GeXoo6XKRpjqHw92ejm7Og3TB
	Qa9xR48wNxe9H684Q3CYihITAPb3IHWy61jYKjNBIPLIYQF7FW4R3PQ1pgsh90ZFZUA+Md52d6l
	oqOlRmVPwhH1yxhpVCwvZqBlUuxI=
X-Google-Smtp-Source: AGHT+IHi88pfTT/7FGL5cee/QnViHlH7hwmFEHz8ie9yk7UIpmVR+ZWO36ke5t/IiJD3HDIGyxxtDXcGFtsxJ7egax8=
X-Received: by 2002:a2e:b8d1:0:b0:2fb:5786:251f with SMTP id
 38308e7fff4ca-2fd059e9c3amr6259081fa.37.1730238371622; Tue, 29 Oct 2024
 14:46:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241029191640.379315-1-festevam@gmail.com> <20241029191640.379315-2-festevam@gmail.com>
 <94745526-055c-486e-aff1-ae178ae0f2a9@denx.de>
In-Reply-To: <94745526-055c-486e-aff1-ae178ae0f2a9@denx.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 29 Oct 2024 18:45:59 -0300
Message-ID: <CAOMZO5AVPCLsoWbtKDzN2j8rUvvZUQQG_RkuLoF4BnKQDD-QhQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: lcdif: Expand the imx6sl/imx6sll fallbacks
To: Marek Vasut <marex@denx.de>
Cc: shawnguo@kernel.org, a.fatoum@pengutronix.de, andreas@kemnade.info, 
	kernel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On Tue, Oct 29, 2024 at 5:16=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:

> So you wouldn't have to write three compatible strings for the 6sl/sll ,
> but only two ? I.e. this:
>
> compatible =3D "fsl,imx6sl-lcdif", "fsl,imx28-lcdif";
> compatible =3D "fsl,imx6sll-lcdif", "fsl,imx28-lcdif";

i.MX6SL and i.MX6SLL have a more advanced LCDIF version than the one on i.M=
X28.

The LCDIF block on i.MX6SL/i.MX6SLL has both overlay and CRC support,
corresponding to the MXSFB_V6 of the mxsfb_drv driver.

That's why it is better to have the compatibles as:

 compatible =3D "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
 compatible =3D "fsl,imx6sll-lcdif", "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";

This way they can match with a more specific fsl,imx6sx-lcdif entry.

If an OS does not implement the fsl,imx6sx-lcdif match, it can still
match with fsl,imx28-lcdif as a fallback, keeping the DT
compatibility.

I missed updating the binding example. I will wait for more feedback
before sending a v4.

Thanks
