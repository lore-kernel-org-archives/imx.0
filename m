Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5209E82D99
	for <imx@lists.linux.dev>; Tue,  9 Apr 2024 10:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712657219; cv=none; b=Zzue3+OfwKCZ4glwf3koojF58lyZ8flFsxIuKvuWjWcE7ul18ymCChMT95W2zHnovq0QGr+rPnOsZMgn/lzL6iGy1Mu2BKWZp+nc5NBPITMsavzowkEIlLnj/X/u++LoVjfW4ptQYhLGqakDKmL8X55qD4iWw+5g281Tanv73iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712657219; c=relaxed/simple;
	bh=1od+6GPq5pbV6DS4pMNA1qWk2fASvx0vw1BVnXaMKxs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HYM90kROMcpM4kG0dzI91CHftywehGhikd+P+bULl77rutoscqUqtYD8E2QBqvZ1ZuERr2mnHz8N4ZavnchREjdSG7spd9l7+wk9U0QWPhrhx4ZlVR9Qaq9X5uPKWrsrhs5cd9rTnYTrI8pqfsb7SBDBMJISaym4bSkEZ1qL8s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mALaGmhU; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mALaGmhU"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6ed4a80c19eso260530b3a.1
        for <imx@lists.linux.dev>; Tue, 09 Apr 2024 03:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712657217; x=1713262017; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nN1BLV01IgpoQTWEsMyLEiQ/+qIuzUOwceRziV5xY0w=;
        b=mALaGmhUC/D0gCd2CvroX5thx2xgKNKOL7Z5EyNzwtOEQWPd6l3PYAhLBfoeaazvEd
         FWE2ch6oFlZ5xAiVA0YzzXLVLJaRy/JXk05yaAx4R6IiXGTlCtx1JNxZgra+ZGLTC+FE
         KTnm1sF5N9yzvMkQfqxmogltNhDRkCbBTNuM/0ta0pk7O6kgzIgf/DSsOb7MHbTuQI32
         fyDqMr4phRYi/UVEK80BYuRUslGKEYLeBfMgizfbMJ4/ov3YgQK5lIUop5CythB6C4Bf
         SXEVeQRj0a2pQTFe9CEA1kXYSMzI2DEMNwFPi9FeFtG9TBtyqpXOoVPd/SDMcFx5fQ2T
         ttsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712657217; x=1713262017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nN1BLV01IgpoQTWEsMyLEiQ/+qIuzUOwceRziV5xY0w=;
        b=KfwxFHdT8i6YGR6jCsy+kQfcwGI+fHXrr/Oky6Lcv+GeARf0UuvfkRbWCVMQjUDTo5
         z8RPVI8VS2l1BMksN4TYPp29wcPaTfil1qtuNjvXaSonRrZRsBR8Ogyh20v1O3vzRyUt
         iTZPUZ35TC/n6pW/2aVg7PkyqgZ0WBATKUw/eppwazdNCPOffeFqfu2K+y7DggnwygZK
         CNDnkfEcUrujCXmv7Uz9NE87VkvXlJdBRGrdhZ9sSVZNqM9tcz65jGNtTOZ56njeJXHN
         RgwizGlfnYz5y47vh3ifjlE6FcS6ZCKnD1217sUa7ov62jsu+3NY8MtTxEC8t1FSFKip
         50eA==
X-Forwarded-Encrypted: i=1; AJvYcCUQ7Jk2onWdBLuOmfSo7IOHehIx4QijulHi4x+s6UkjrRdghMt3yU1nO3IBbe/xQZ8EleAbh5FOcddTzzWbIbXw2RpP
X-Gm-Message-State: AOJu0YzY5WgL8XYXZ+CLL9f5nFX8UOX726H7Kq0++TqXSg2HTeaA7Nun
	fr/rtzzYRwxYBiXT75B1W5cMWofHVgIGMLX5U4hfbiwZ/xrzIxX+Qp1v7b1TBJQbedUa6lRmTnJ
	yKzMCzm1eu75ePKG9T44VOnw9das=
X-Google-Smtp-Source: AGHT+IHQoCVGiINYUvQfKxTrsUtBLAkQj+AXwq2x9u/Og21z/Gjz5hL7wTzbKPixjBrhy3BiUueA2htTaWWB2sOdK00=
X-Received: by 2002:a05:6a21:3383:b0:1a8:2d22:2025 with SMTP id
 yy3-20020a056a21338300b001a82d222025mr575979pzb.0.1712657217545; Tue, 09 Apr
 2024 03:06:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1712652644-28887-1-git-send-email-shengjiu.wang@nxp.com>
 <1712652644-28887-3-git-send-email-shengjiu.wang@nxp.com> <CAOMZO5Cku1kifsnWJOr0Zd-5+49j-KB67iHZDcvUsKwrhVPtLA@mail.gmail.com>
In-Reply-To: <CAOMZO5Cku1kifsnWJOr0Zd-5+49j-KB67iHZDcvUsKwrhVPtLA@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 9 Apr 2024 07:06:45 -0300
Message-ID: <CAOMZO5BfJBkyw2q3wi4q3yjEmQowg7Zsw8yEFyANMYYez3ai+w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] ARM: dts: imx6: exchange fallback and specific
 compatible string
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	shengjiu.wang@gmail.com, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 9, 2024 at 7:02=E2=80=AFAM Fabio Estevam <festevam@gmail.com> w=
rote:
>
> On Tue, Apr 9, 2024 at 6:08=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.c=
om> wrote:
> >
> > exchange fallback and specific compatible string for spdif sound card.
>
> Ok, but please explain the reason.

I mean, why can't these two .dts files be changed to

compatible =3D  "fsl,imx-audio-spdif";

, like all the others?
