Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974371FCD1E
	for <imx@lists.linux.dev>; Wed, 27 Nov 2024 14:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732718221; cv=none; b=MtN4NJRJuIZU6dbRF648dKcuDKNahKZMg+3qVB50/42NJYeSbdI0Fkp5ibWnnzzunQX1xRcL0dCJbgI2DH/Ka/P0QzHDJz5tcFtMhfKQcoO8bvUuesfehN4Ys6W4fhOE8GMdAJBCVTjZ2XuUkzVOXS2x8ood6iNbbTQKQb3W71s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732718221; c=relaxed/simple;
	bh=spaZDggYYtywRJ4kgtwhMtxKbrnoYAiIWhbsdMeY0e4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DcqYlrUfIGT0eh4KouqO0rGOafOXGI3axSPlkNmU+O7Ne55Xf5dkRHP9ClO0KjacVyE5KB9jHT/z8s0DVa/0ISldrlU60hBQDJSujVyQ3mcZTDVAW8H+dSwIEJu7yXjlWvMDXIwGmrsDwb8X1+8Bi1GoC75k+egISfujvpHfvvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PKFaXP9z; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PKFaXP9z"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ffa8df8850so62164491fa.3
        for <imx@lists.linux.dev>; Wed, 27 Nov 2024 06:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732718218; x=1733323018; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=spaZDggYYtywRJ4kgtwhMtxKbrnoYAiIWhbsdMeY0e4=;
        b=PKFaXP9zO2tzMYGRsUerCz+b988eEPUJ44TeYoGfqSeC4r+W6psRvwzJ0MGuRWv9T/
         wGoLvnwTJakMVj08atjY25D0i5a1buMi2CE7MWOTXhNxyWMF6/qipVsho+HSGYt7O/tF
         yI4aBy9ykp3d2cfzb3rYMp+AvlXkmg/snDoRR52dcG20d1mA6Vu5r5ScqELQIBfIdEJP
         lBjA1MAVx3tcthWq4/BiULNUJmEpR3PhYK4R7QLhtSs6AKiQIhlFMIs46jsJoMbkRG8W
         bLONKifkwm6xAgHjL2Iwfgv8fGM9Tlo6qoZGMX5SadltkGr7y4kdpK3LSKiYa4jfpgpm
         ltJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732718218; x=1733323018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=spaZDggYYtywRJ4kgtwhMtxKbrnoYAiIWhbsdMeY0e4=;
        b=NgL835fy9pAR+u6Gd3w/K8z9aQ8Y6xmKBr+QLel3k5gatdpYlNjZKEUGWCJNKJl4XT
         R9lTX85DT37U5VfNCKItfFnk+cEWl+2lQIhAIKMIq/QAHZxa1mv19AT1S15Hy54k24e3
         tFknqoBPaiaJVH/dr/bbVxNhL/5w8kbX4nH5YCxLGtjRAzjVnMCYjn9sLI7/SPV3kWOT
         5mqIbeEZBQSflmB635zXpbsqCME1FnWnB6QU9ZALPjY1asX+JTm/qC9giNos1oTg93Dy
         mZWdEeO0OkqwibmckrAanoj1FHPE3n3yHYqoZebk+gcDLKcEf9p6/zFiOFNoculXjCTN
         94IQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvvjiSWhp0evho0o7z2t+E/rZuf60L5TBpP6uptnV6MoMNx5vo0qUT7Oq2W7IfQVfo0k8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwaI1QKNaektvzfr4MTktQR4spP5zQo1ks486y+sZPvcEnx8G80
	X+0qYATW/eq/h848chnkxar9UGD+kFNqlLYHmXsrxwVITWhPgQUTGpLfhuWaZVN4xL1Pqf52JXy
	JQeizVyWcGBkauWIP6akSdqM85MM=
X-Gm-Gg: ASbGncsYdLVXDipnkESNXcrpCA8Z4Pq5LRbYGcBFT37RxWUvHrRj6/nso7UXqGiIJrS
	BWYl4EBlHD66H9XenTXDWb3Fj31QJeVp3Kf1bne3ZygtUBHIenno7AcX/ZszQpA==
X-Google-Smtp-Source: AGHT+IE2Y1pwt9tFpc2i5mwaMDyiDpAZKOHFBSgRH1+njHEYwg26v01EbLgq7h2hGHIiXKKBL6YXf0n/tChU6h7R74Y=
X-Received: by 2002:a2e:be0d:0:b0:2ff:d2fd:fc94 with SMTP id
 38308e7fff4ca-2ffd6142a7cmr18766941fa.32.1732718217502; Wed, 27 Nov 2024
 06:36:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240506-imx-pinctrl-optional-v2-0-bdff75085156@geanix.com>
 <20240506-imx-pinctrl-optional-v2-1-bdff75085156@geanix.com>
 <49ff070a-ce67-42d7-84ec-8b54fd7e9742@roeck-us.net> <CACRpkdaBR5mmj43y_80b9jd3TAqRWMdCyD9EP6AY-Y0-asz4TA@mail.gmail.com>
 <1ff005f8-384d-465e-9597-b6d5fd903862@roeck-us.net> <CAOMZO5DW3t-sof_uaFa_qJPE3WFq_155mFTxGMWh0m++csgopg@mail.gmail.com>
 <87ttbthwdu.fsf@prevas.dk> <5881df5a-9495-49b9-9956-0538055bba60@app.fastmail.com>
 <87ldx5htm3.fsf@prevas.dk> <45ba6632-43f0-4142-85f8-9dc3f9d1e698@app.fastmail.com>
In-Reply-To: <45ba6632-43f0-4142-85f8-9dc3f9d1e698@app.fastmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 27 Nov 2024 11:36:46 -0300
Message-ID: <CAOMZO5BY56N9Sfm1_qprQm7jeM+5bLgR0CPeu3kXK9rgmJN87Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] ARM: imx: Allow user to disable pinctrl
To: Arnd Bergmann <arnd@arndb.de>
Cc: Rasmus Villemoes <ravi@prevas.dk>, Guenter Roeck <linux@roeck-us.net>, 
	Linus Walleij <linus.walleij@linaro.org>, Esben Haabendal <esben@geanix.com>, 
	Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 8:30=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote=
:

> Overall, my best advice here is still to not change the way
> i.MX pinctrl works at all, but just fix Layerscape to not depend
> on i.MX. The reason for the 'select' here is clearly that the
> i.MX machines would fail to boot without pinctrl, and changing
> that because of Layerscape seems backwards.

The suggestion to make Layerscape independent of i.MX makes sense, but
I don't know if it can be safely applied in 6.13-rc.

This proposed change also has the risk of causing regressions.

What if we revert the patch in Subject for now and then someone (maybe
Esben) tries again for a proper fix targeting 6.14?
