Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE382D12F3
	for <imx@lists.linux.dev>; Sat, 21 Feb 2026 17:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771696339; cv=pass; b=trdd/SDwsQh9BH4gV7sJQPVIbscQfj/KW4YiIq0IkDDjz6VZW8om/dVajJf5RiyKvsyrbe8veswa9/ZO14UginYHFrpTSy6AysnRTUqt0IBtoLYsiz1Tkxz6mwKy3+AWs+cRvtyF461ri8XbjK0hXa9IBTEpzPiWR0xOpAe9yi4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771696339; c=relaxed/simple;
	bh=Tzo7ZNJfQBxoJt9cZySJTmR9nXcZNiJ3cBcDGsr6CBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S3GgXU8sxB+bObbB6nIbWXFrGjSdMkw32UnzAHa0P3/UbQ77n+yK2ZR4c5SnKRuyo68Q1yTr0AaLAW/Ic180gUL4KvevAW8C5XZ1NOkufYusHsQ70bUv0OY06blV8MpEG7ST4m08ce6WaZ3WfPTUHayW6mY/OZT3wfpfZQ4hLDk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PTutzg7E; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PTutzg7E"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59dd4bec4ecso3217585e87.0
        for <imx@lists.linux.dev>; Sat, 21 Feb 2026 09:52:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771696336; cv=none;
        d=google.com; s=arc-20240605;
        b=Rw98rh3HuMlWromyfWzeOjQ6EEymsseEyVqf6Nq219f/n38bEXiZd4cexYQlnQEtR2
         +73gI3H9ctNJFp1FaGSRxPKGwi+uKq33tlM+JwRdc/qGU3pXnf9r+ffImYG+7SVVDzL2
         QerrCt0CD9H400jPTCSmtpjjcDIj4DElirEpjgRq1O+gGZj5EFTaVV+yUpEL4Ob9OjGo
         7k894GTWjJ87YzGql8vNU/Quq7lZkh65lKLkYCmqelWdFVgEYFpm5CQo9NUd0bz6DINv
         jhCdfPy5yWWsTGcWhwFAxclTsteC3lGqiREB8JTSLWvRBQ6OzqWrv4cTYUEiTFLzM6OC
         M+Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FMn9qAuINZnFS0In/pDpgcVE4Hl46cXlZoF6dfqeEsY=;
        fh=vMnNqVCvoxW6B+PTJ8AcZ5NQ83e5SWhU3yKwbAy4fus=;
        b=ia10BauMHK+o3166VTFnHL2DJlrfueQ3NnrqJuvBA/tkQCbPRZuxP5P5mfn1a2QN2U
         O3x3y87zgBjuiwy/LMy9oQCsOKV+cFfaUw7vlInQs8UUhC8ZkexT1/zY8gZ5RtZrYExH
         CYE/AaUkfwJbdpCK9LhfGif0bh5IndYSfwvtkc9NKuhbWx1IZbs9kPihbis4fE1aLZ+e
         3dckV067+r7iK4FQQpZtJPKGxVpDdNcBE8bXvyz4ZtMMhMDgMLHBVV7z/w+qENO7LsTK
         jJ9iwIFKqV4BFPjbxDM4S73fB8YfMQjZQDNVHgoP1qT/JTkRID05KQ1wKQLZqZ3qf/LR
         b93Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771696336; x=1772301136; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FMn9qAuINZnFS0In/pDpgcVE4Hl46cXlZoF6dfqeEsY=;
        b=PTutzg7E7I0+AIuXBNnXrlDw2IHQYCO09XwIeCo5B+0a66jfHu0mzq7FZDFO/Hxkk4
         l7pN1t4HUTdGYg7ZCbfNkG1svZKz888bZPMMM+faKIdHLTp+5oUa1phenylBmBjjZxhS
         7RmlgNkpY2zOZO7UC7lW5oMX4OYssEMhGMhGXZ8rrcPYyKxG0Y/HqYsyOYBnFgxgln48
         ycCdIXom2Pi128oUsypIefCsDIdmkQ4VmZ/EuEDl3fJcwlbRYXJspeuR+amwElkHcyp+
         PXH2K0+/gMcgRtV6hItcvXfFAcjkubP7aE2Hz9GCRaLBgmQizp/OjMfHlNdU2eEex6Bt
         0cCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771696336; x=1772301136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FMn9qAuINZnFS0In/pDpgcVE4Hl46cXlZoF6dfqeEsY=;
        b=gaAWro5xSjVpNv4P4blc8ozg4aRorKKnvLrnMA7pbCnNxWG9TAC5EYfTBpB1++SsvE
         Acoyb9o8bcKIdHGOwKqJpd6odaItXt1xBV8FO/k9HVybZqbP7oZyFXMsp3Kv4Q6SyJ+t
         /QBounKOomk4R3LWGsrMN2Z8D5jiGayHhQODn3dMgLtgljs8dtH2yBhABtbhfgwqF0be
         ISs2xUGoA3LG/ioI1kM+VKDfl8f4osSSe99w1krlXwAGrPgqCYYaIY+JLrNZBpUixgGs
         /UbLfnk8PQAG3X8V6abbEZlY5eWCSU649ZSx0Ju+OXH6D6F79wFG1lgoh03mbgCnfwH2
         wEPg==
X-Forwarded-Encrypted: i=1; AJvYcCUxlphjvRf5WB0Yvo6TZtJ9EZJ4R9rI7kuHP0+FG4OuQNi6DIN5i35pyCRss8rMweuoQrc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzblyA2JhT/kG7yJOSAZpQP5BE8NycXyW0Sw5JSA1Du72pAgsE2
	IV/8uWmPH1uo40nXQsYcjcL41FfTwEyOoUwS+BQscommcGuRO1+wXuXmJ46jaTbN50fia882xqu
	U3LOSrabgnXSo8P0MBiV7nZ7CT5JLSNs=
X-Gm-Gg: AZuq6aIxCKynMJYaJOfXjL1kELzzLQf/tezO63gE5H+pSLUUiG/hrWYi1ZTcLp7Qkae
	YYYrvgfek1LoUefXgxB5ssy8Z8mr3EkMjWL+wNUzXPREcukoxqrC/meLWBe3hB/R+agnTjWsDjG
	VV0v5E3sSH+3O0MkVOou8UNIa3Zi7niJTuxFcnprmW4vX3Dlv/xZ7UvRpSed85F+uQX+bA/t/4g
	T8y+aj+YfdYM5Z0MhcyYjIm5eAjeVXDRl6ypMYW08vOqb/Tr15e8DCjj3JCDviRiaWAj6MATpwG
	vdnQFiDv9Z1UOhvHGuiJzW8kGDFYZYMO8QTxNPUymDBxSGJt1YXl1PMClw5M+Tiw8cHplJg=
X-Received: by 2002:a05:6512:32d6:b0:5a0:4cb7:d53d with SMTP id
 2adb3069b0e04-5a0ed9b3c62mr1119236e87.38.1771696336186; Sat, 21 Feb 2026
 09:52:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260221-l5-voltages-v1-0-daa8aeedc86c@puri.sm>
In-Reply-To: <20260221-l5-voltages-v1-0-daa8aeedc86c@puri.sm>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 21 Feb 2026 14:52:05 -0300
X-Gm-Features: AaiRm535UxyOOW-KZMHW3TwP7IFUnVHAX3jFIxy0RPK6vWVRSydsJOFop73bf4c
Message-ID: <CAOMZO5A_Uvq4nTWwR2fXpcT7b6bAHmqf+qS-8FCSJqhkwwKdvQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: dts: imx8mq-librem5: PMIC voltage changes
To: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, kernel@puri.sm, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 21, 2026 at 9:02=E2=80=AFAM Sebastian Krzyszkowiak
<sebastian.krzyszkowiak@puri.sm> wrote:
>
> Simple changes to bump the voltages up to their nominal values to ensure
> stable operation across all units.
>
> Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
> ---
> Sebastian Krzyszkowiak (2):
>       Revert "arm64: dts: imx8mq-librem5: Set the DVS voltages lower"
>       arm64: dts: imx8mq-librem5: Bump BUCK1 suspend voltage up to 0.85V

Both patches should have a Fixes tag and Cc stable.
