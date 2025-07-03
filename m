Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18132D6605
	for <imx@lists.linux.dev>; Thu,  3 Jul 2025 12:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751546694; cv=none; b=nqQ428X+3DFD3xLwqn5K6qLOooyPFcI8O79ApTG+8VAsmIMaKAoohuppc0afph5jRpBCmQY8DTtFpT8zSadsoLOTyhcTIZJb1+z6SNH86+FhD0KcJTj5dQFsvw/3NtZCvXJcHt3jAsjEoRq/6o8XeBgoQPT5ybXGPiJoLXxVX1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751546694; c=relaxed/simple;
	bh=mbkYheEIyHbW1ygRTFZDti3d9YOTCkbmsZ2ULP3qOWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EtsiY0Cx33ylrl0l903WzCV4C85d2f0UXj0L7MArTFknliOaB5SSPD3dS1MtN1hbiv0Po9LQ38l6NMTdRBgDaB/uQC2+2V746PRuesIyo7G0Xg9UtC0wUPDrx7cfbrxUIjSpnAY3Of+sF+K17cO0WfrIaUuJzkChu6OhzAMA6w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GGcWFB2D; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GGcWFB2D"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-553b16a0e38so8856256e87.1
        for <imx@lists.linux.dev>; Thu, 03 Jul 2025 05:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751546691; x=1752151491; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDlYEkubd96z9MwJzBRtpwFB7aA0Q1bDJcX399/Kjr8=;
        b=GGcWFB2D06iQiF6XxfxcCpcFzhkUKL1IotOCqQH1s5CLEe3tn4w89p7mb9gFV5xk2K
         MV8qYKSWea3CVyyBaKOp9cZrHyzmV0qkEmVs+E/JfyzHiHP4fyvMl5adUy6Os74klAK0
         0tSltaKU+7WxNOmGu+cuN5MHSrUhsX+YP+OcChFdWzd1JDwT+AJFU14Tf+Uccbs1k2EA
         M2UWYUMJBpDFMqixhZOg0EddZA6n8YZPpiB5dP/jAPaoamOKb2qjm917uAwB4C1ppqNg
         adKdtK9xmLubLggEqQO6KBRjkFE8/1Fcl3uL2Ba2Z6LzXDhxFSsXbWnlIyeSl2oW/jDf
         cKYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751546691; x=1752151491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDlYEkubd96z9MwJzBRtpwFB7aA0Q1bDJcX399/Kjr8=;
        b=uGLho+5F1tlI+bv8m1gYk8BdcBj0bx5ze1Ef54q0kmRW4prPT+YMqD9ylEYJ6D80Rw
         jGjih52YLA9zfTc9WranGILMKwkhOoeNcgJvoov3ATa3+aaIBgkCWyX1yYmnzrLSwjE2
         rSGQjUkV+I1HIoHth3Vll3bl41rsW1IYGb9WeLrW9PWgOKrQRkp12QM7E3Ug7aDzv9FN
         6fT4cWUKVFB0EXp5L5wQTe32mlBg6gDeXbJk+vIxWFDDz1O4ok0PbcmwjnlLU/ZZk0Zo
         BfxFCO1p1MzeN4TWf5mkRCmy/JfOto79tssmy2gJQv/SMIqRcKBSFHPxIUgCWnvzJPte
         CwPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXghLhgenwmzsreGbNlvewrISZveRO3ObnPThHYgttY+CkmQbd5tdk/XyR+s1cb3h8aUNU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyXxxbtLG/hH5xU9Vkb2Y/afg2x2jJDB0fq7jjPycqUELVHb4V9
	iMy6AMvjDWN7mZ1slREfIOC4XT6nlIffZIwJEt2KVegDLHogr+PBFQ9WievZB10wPvcd7T461/d
	FcDPKD3DI/tU8PjohDMe2qR8RLCa+Er4=
X-Gm-Gg: ASbGncsVugm/Wc74oAOOp8PKhFvZLeEPI/YaVO9w8UU9g6hIQy5UoWfgW0QH3Oh4adN
	f3ltsGv0RR9sW2SgOnhIZs5Gh1euJw1UJR4p5+pnIlWyO0XO3rDYMWiNJQioMqe9Bi1LsyrG0Pj
	pPezNg9sSBwPyZOHxAAQvoWAEObiIl/01/y2ohxGcIchFEScCIkNWnbMdoJ6bkoFVPmnNv87c2n
	qA=
X-Google-Smtp-Source: AGHT+IFKVEiV+VQbUtpCqC9WckskybLMn53BW4tS3ehL1ZkM1xl1Mfgo8fk6N8Koy0lM0uprCJl6fTzRVH+Gd2z/05I=
X-Received: by 2002:a05:6512:39c7:b0:553:2cfe:9f1f with SMTP id
 2adb3069b0e04-5562ee21536mr1060794e87.6.1751546690574; Thu, 03 Jul 2025
 05:44:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250620213447.56392-1-aford173@gmail.com>
In-Reply-To: <20250620213447.56392-1-aford173@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 3 Jul 2025 09:44:36 -0300
X-Gm-Features: Ac12FXx8tubzpqCb7QAhaROTPHQN2B3IX372b8SYzWGNI2K_HNEsG1Iuj4faMGA
Message-ID: <CAOMZO5B-7LuYs34ACmMD7S3B0Sxihe8A+atdNi_3QfMP3VFYtg@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: imx8mm-beacon: Fix HS400 USDHC clock speed
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 6:34=E2=80=AFPM Adam Ford <aford173@gmail.com> wrot=
e:
>
> The reference manual for the i.MX8MM states the clock rate in
> MMC mode is 1/2 of the input clock, therefore to properly run
> at HS400 rates, the input clock must be 400MHz to operate at
> 200MHz.  Currently the clock is set to 200MHz which is half the
> rate it should be, so the throughput is half of what it should be
> for HS400 operation.
>
> Fixes: 593816fa2f35 ("arm64: dts: imx: Add Beacon i.MX8m-Mini development=
 kit")
> Signed-off-by: Adam Ford <aford173@gmail.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
