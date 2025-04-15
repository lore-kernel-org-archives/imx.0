Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FF427991E
	for <imx@lists.linux.dev>; Tue, 15 Apr 2025 06:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744700180; cv=none; b=nCLSrQXgZvxfhOMoF+jHPMv0U2TeutDX0eKyyjJulQCXH2U5QNRx7b1HDTfgpClVuyYIX5aBwz8A9hR1gj9DDeSsAFuejb2Y2Vzf9cnSBtscjXiNJSjP58WO02uFKVkkN6K/RzabmkIbUWlVZZ1XhveQHvlh/P//5p+H/vbxPWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744700180; c=relaxed/simple;
	bh=uv7i/A+xKRCxebwBNDHz/b4HBL+FjuvQmgw0J3Ek2tk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P3DTxE1zqRi3hdWSzKnDls6bWOuozEWq/EeI2iF1OgRHa1eEuUfFyrLyK9Fo+eoty+A451bpkp/fjpMfB75zHwWyIMoS6XfF/+FaF37f3yROd2LjC9cOuwmy8b/nu3C1YsYGnR8MdqGoONh0izXf0LmtWFANO0j94IZPt9P1nIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MFielKDf; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MFielKDf"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-736c277331eso5654378b3a.1
        for <imx@lists.linux.dev>; Mon, 14 Apr 2025 23:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744700178; x=1745304978; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uv7i/A+xKRCxebwBNDHz/b4HBL+FjuvQmgw0J3Ek2tk=;
        b=MFielKDf8GTbTEvSOFSb9nhjDUZ5i4G/ir3pVaLoeZHr+d2Jxu3Gunu04msIXuY/UZ
         q+UVJqtQIEaobwWsjt0u+hbksi+Kfog3IHXbc6JDrTzFlrQ8Sfa+V+4Z8IGpOOkdF5wf
         9xYdomQOT8pdA0D8vGdGZ7D71wCtBpvOJb+2+t6kCXG/d47AFzMHu3o4g8ZoQbxU+i1L
         oVCP37Z2G9GvzOZOfzBt+kYoDiCmT5cFmDlWPPSBFwm8rE8egwiAz9pa3wRcrrweaM9f
         dD1yjX0MSHLetf71zPewkaZYqkkb0igoLXi6RNdpX0bfQEaAc+MA/6wGD1WzlEZH0c6j
         mz0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744700178; x=1745304978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uv7i/A+xKRCxebwBNDHz/b4HBL+FjuvQmgw0J3Ek2tk=;
        b=e6tAKm0z5n7wj2mbcDw9DbT98VqDddyZuyjFaOh7oGg1hu2nX9aGZKWDbF1rdsMsDF
         SlXkAMQWv2l4j9jOBBGGpQI3rEjy+abk1Lx/1K6yrYA1w/VQTbdFDQEsCz0jXEw9gTaa
         mXy44pylttlc7R8nnwPl//GyqJSt9hnxgKeuJ/p1+PdRXdYrAvFeiI5Wwo0fX8BQLjCt
         FhpeTF+3jfzEuwr3BxaCMXBreUGhV/jEiko/MmQacO5uzBBIO42X3tk7Tt2gYYhnP9Ok
         Ag+800hX5ejJuG98WFphgb3V0eoq9FVrkEykS5owPZORXPYN8rfbRe1sk6djAmB/ut69
         H3qQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdKZP9AzloZEfhXZpjzlYnz8751XA26PXU7vgnVDlIgqh6Bl0czbwEsWOsCZ6tYcy0LDQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxvrcyBkGYhjX+7VEkNn/xAA20YcGtJ7dbw226gjwZi5Gs6VZYt
	muafb1O2cCcbQ+ECu9GttdKx3CgaUzlGjtvXKrKZO0Hjfr2r5G6Nw6skvHoLkD0fF6wUW53RJug
	O4HzqSQ8465EKli0jC5N4qOr0zW8=
X-Gm-Gg: ASbGncvG6HnWxC8de2J29SsB99R4Ye1ijdYNSDs+9oiGcZ0bH1TEOb33lQtPObLlelZ
	Uk4mleI2FO9D4kMUB6Rdq8nCzrVgzpvZjItqTvdI/b5jClSnALsmQQiWZdG42TBnpbVRkPWhKkk
	CcoS7HufEOLzK4PoYkwg==
X-Google-Smtp-Source: AGHT+IG6NnOFJlKScP+Wamh79XovR7K0CPgG97m4Wp+PToKHbCYOR7nSiLCr5HD0lc3ekUswv3GSc/IBDvySxyjSaD4=
X-Received: by 2002:a17:90b:58c5:b0:2fc:aaf:74d3 with SMTP id
 98e67ed59e1d1-3084f2fbb88mr3226588a91.4.1744700178357; Mon, 14 Apr 2025
 23:56:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250415043311.3385835-1-primoz.fiser@norik.com> <20250415043311.3385835-14-primoz.fiser@norik.com>
In-Reply-To: <20250415043311.3385835-14-primoz.fiser@norik.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 15 Apr 2025 09:58:04 +0300
X-Gm-Features: ATxdqUFzmx2uRpXUocIpbqqLeApK-nJ7IdkiHEJrpoo6ZYi5WSR7a6jQ2PJwfmo
Message-ID: <CAEnQRZDtHWTEHMkhd6BqtqYXCkOcAEj1eNYDdkQ2FV3a4QDbvg@mail.gmail.com>
Subject: Re: [PATCH v2 13/15] arm64: dts: freescale: imx93-phyboard-segin: Add
 I2S audio
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	upstream@lists.phytec.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 7:37=E2=80=AFAM Primoz Fiser <primoz.fiser@norik.co=
m> wrote:
>
> Add support for I2S audio found on phyBOARD-Segin-i.MX93. Audio codec
> TLV320AIC3007 is connected to SAI1 interface as a DAI master. MCLK is
> provided from the SAI's internal audio PLL (19.2 MHz).
>
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
