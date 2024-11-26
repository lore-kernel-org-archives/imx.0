Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D7A1DE4E3
	for <imx@lists.linux.dev>; Tue, 26 Nov 2024 19:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732650998; cv=none; b=sJz3FUtli0ZKHQPtn5c/SpOEYmZ+L4cZW0tBktaMT7w9pkgoEA745XcO3QRgm5mdBcc0J7BITxU6cLnR4JG1NQZTRhTEDZIe33a9IdTxBv84+RQiku4pDvotbYmE+JoyMUGxaFq7q1PaERr0/U5W7aWTLZPTN5usweY3GYOtlAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732650998; c=relaxed/simple;
	bh=VGkyr0KqJCkxfU95x+cMx7RyBH0/dieElDzoNvSFXUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=APEkx8TUpCVV3RkVa6lU+jH0uZdSWvJSIKbdf1wNLeWQFtwchpR6u3TUVYeIeyF7Nxy+xFh+R0iGHSXwTz7tF02N6w2UcaY+8oyI2q69s51cfAV1XnWBOQQIFUIqfcoh9CIs+68I9xO9v8jR3TULfIdnGM4qM+67tG2qpffWZRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z5hxZTrO; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z5hxZTrO"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53da6801c6dso5740791e87.0
        for <imx@lists.linux.dev>; Tue, 26 Nov 2024 11:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732650995; x=1733255795; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0xQ0j+0GPxTIxCI2SDK13a8DSfyq5mTc8ur8YhTeShY=;
        b=Z5hxZTrO1DlFZSYrHR3emHX4xuUVrUpvzM131XKdeBJ0vTu4USZO6F4k8wH7H4m7qy
         oDJa/DeT5bFUTK0D3dL3JzzoIDWVZbkY2O2FudPxNtRH/PVJ4s/rSjz59ArLA7dgF4aH
         lmD+y4k8DRoiw69kmr250DkA4OB5gMpGvrNvtmoFZ+VVUKFBU+sVB3Kk+Alg/8sj7WNE
         qCO5biIKb+IM9inFG6QEGg0g7IoTfhm+esT6Xs1xrUCwAFwFECm3rfjRejBfi8G0E2mk
         sHQh6UhUdgisDpbYlTz+0atw49QfaRGOcN19I7fdFpEya83tE5qLtDjKHLq39ZSAmwde
         Mr3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732650995; x=1733255795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0xQ0j+0GPxTIxCI2SDK13a8DSfyq5mTc8ur8YhTeShY=;
        b=ODTelzQPO6162jFK+H9ETuUFOooLAsX34T9vbru8WjC/5qkAOcZw3H53+OYYFR0ZVJ
         bodSYXrXVk9ZmnOOnxg0i5Ta09wKJQrB7hDb1xZ7FTQJwglu2DLAemJaVKiTMqQjdUPD
         KupgJ5+ABfk4khnXsCF4h2ZgZ+i33St7X0OgsxF8BJXW2xqffzRng8TI6UsH373hr3BN
         wpVthPNCwVDV/INoS2uaNzfRjjxumfav5bjNlb3A9iqo09EiEnaiuwzQl8ZuPYD3KTlQ
         mqa6NqRxH9+dQohSFzAYYJ+G9VLtsmdcpsuL3Vxb+CO6hCs14tu/md8mfZhA/EZpdKt5
         CSPw==
X-Forwarded-Encrypted: i=1; AJvYcCXn4dFZannzm6TvwOg4YHWBHoDv5xxCYbdR/FynHdz0EyN7+cxbV5zbAogb1AmfmVlKX4M=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzqh8gqwD4OfHc+AauV5F9wFo5my6DV3yy8LUyTTLht1aTtOS13
	xHPgXfA9nMuuYlV5z/ZDx+OcffhAGu+wP27Eb5XGN0xdrFgG/qiL5CDZq2hIShR8pv99zo4zZWj
	idvX3HJ8bTru6umyvn8jlIjGEnlU=
X-Gm-Gg: ASbGnctsRLbwOqVkGyclCs3s0GP8clNIt6gaa/VyviQXHqGI15Zv6JWlQPpyX1PIsZP
	A4w1MuNzLc4QB1LqKZSUsTbO0w5u53z2qdF2BQdGRs5751rSDBd0d4Dhw3zUFkws=
X-Google-Smtp-Source: AGHT+IHRCkqCpu4EP2m8a5f0SIbZRGGOJkHFNp5nvbOOTzS3jxCURg1GTmPDbw94b45oJGKAsgVT5lQidAMPOeW4EF8=
X-Received: by 2002:a05:6512:3c82:b0:53d:edf5:1db1 with SMTP id
 2adb3069b0e04-53df00ff1e0mr184421e87.35.1732650994656; Tue, 26 Nov 2024
 11:56:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241126195256.2441622-1-Frank.Li@nxp.com> <20241126195256.2441622-2-Frank.Li@nxp.com>
In-Reply-To: <20241126195256.2441622-2-Frank.Li@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 26 Nov 2024 16:56:23 -0300
Message-ID: <CAOMZO5AVyubQUpEhm-oRb8bmAH=5w2TxTnuuvoY_+HLhpnBaTw@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] iio: adc: vf610_adc: limit i.MX6SX's channel
 number to 4
To: Frank Li <Frank.Li@nxp.com>
Cc: jic23@kernel.org, haibo.chen@nxp.com, imx@lists.linux.dev, lars@metafoo.de, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2024 at 4:53=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> +       chip_info =3D device_get_match_data(dev);
> +       if (!chip_info)

This NULL check is not needed.

If the code entered probe(), a compatible was matched.
