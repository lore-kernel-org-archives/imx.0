Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95804A20
	for <imx@lists.linux.dev>; Thu, 18 Apr 2024 23:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713481447; cv=none; b=h35QAsOOHWaGvUSvfb0pjqIxx6BvflZB0pTl0wEsOYVwdQ9QgJt5uvUFamuupEcqo1LMHOGWhUadvtaDVsIgdyYplcbHOXq5qv/plj4l7DJlym+2jAG35VDuMsddnM5jsL4Xp6vXgp7wh/uUZmQf5k5Llp1xK4g4rQotqCi+scc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713481447; c=relaxed/simple;
	bh=RfeAuSUpmfu0WRBe7DT6Sv0gtgqSBIVaALtYeKQvVJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UtG/xMYuI4O+Q5GTMiAia9cV2qg8bhW2/HFmazBXzzI2uDRbtL68KUn2LVHBNCROmc+U0S/IDZ1q9XUBMVkHTcmN6Sieb6CrPoEdByPzHBDdyaZYXOnPbhZvm3VLb/X1jv7HCMlHgXeS1Kaoi9IwdjT9XwQghhd9ZpKt1Y0xlv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bmzSTxIt; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bmzSTxIt"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2a58d2e5be8so332351a91.0
        for <imx@lists.linux.dev>; Thu, 18 Apr 2024 16:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713481445; x=1714086245; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VOoy0hO8+lD9h8lCjd5Iw9f3kWZjnuEqmyoLJv0b/Bc=;
        b=bmzSTxItu+vC4TFu/Z++5qFEIbxgLiGLtLbCzvRGWzhjriTCljF44qkTwVPJThmABF
         3VpRhOsPugH2M2+i+KDjIBHimp5g7Xof8+W9d7TD4RxLuygGRUslVpYgxISSU3CCHN70
         hdAW0EJ+si+ehx4a1cRvWJ79f5RPXGvp6xxjEqVd4Yh1RWAWu5UQd9mdtkR9OUybRNcM
         Hlm+BZa10dB81Gd9mT4/u7AxSWUid0dcTAHo9TNA242uyrLD1Fh/ZOrft3ktBQ8v7v+u
         0WugPFsDhkMJMV2uTfEUDdzr2Hh7rNvEtWwtGRDzmlgjRJZ/MKel9qMAi6N4lcwrdMY4
         J4+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713481445; x=1714086245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VOoy0hO8+lD9h8lCjd5Iw9f3kWZjnuEqmyoLJv0b/Bc=;
        b=j/qErzAbTpLyVhdTss0Tt2e0QoAC0qBmTrWioR3RWH15h+rme2pG49pbhnfa8YEy9V
         cFWTIvXoZ87y5bvv6iC8SVlrugK5p5dvs8oJaV/3H+/U4qov4MlWhUAHsaZNCTUn6geO
         Wuomy/uQ8nwCRthgJr0c4Hm1gheHu9M6vbZdymDu9pkfmlyG5gGNbQMioqTp0AJ/lmDO
         W607YLR+OB39SF0s3tVKuoT/fHvx0Gs8qUz4CXo1DpbMbk9erGV0vaaiFZsfnE1tefu1
         up4UH09Md3W9xmZbaGAgUXiX8CRbKdx3xQlwhisUCwoQUo0PxgIUGtEKFoOamv8rs2Zk
         Dusg==
X-Forwarded-Encrypted: i=1; AJvYcCXcFEjQvXonkerTEogf5nIFdjRKKXJCBKM8szdRZTRqE7y3dRxBC6b5iXqRxJ2mPwfgaYaFgBAdFpzaw5z3//zlfYJG
X-Gm-Message-State: AOJu0Yx3JwmoliTkPCxhrm3rc/QpXydVlTTjmvdr8XmxymXnkG6BjTgx
	gcRI0RVjeVZ8CGTbPEfEjd/Arff5DeyPQLksEG0nvII7yB0nT9H0IrkofqbPKLoi4oNYpvRL2E5
	Bepwr3WE+Tea4WqrrFCTvgLNEaXA=
X-Google-Smtp-Source: AGHT+IEZWuZcNHGIAt7bjEfLeZJO7FNyPair0s9RD9/fgTlHp3tR67gTi8MgSWkn+QnB8hxBAOgHyPOHsoBJEnVwKVQ=
X-Received: by 2002:a17:90a:b292:b0:29c:7487:43b8 with SMTP id
 c18-20020a17090ab29200b0029c748743b8mr590686pjr.1.1713481445035; Thu, 18 Apr
 2024 16:04:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240418-dts_8qm_audio-v2-0-e40fe76b60a6@nxp.com> <20240418-dts_8qm_audio-v2-5-e40fe76b60a6@nxp.com>
In-Reply-To: <20240418-dts_8qm_audio-v2-5-e40fe76b60a6@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 18 Apr 2024 20:03:52 -0300
Message-ID: <CAOMZO5B97mYVfh_JsWUOY7GE+Ag7x83mV167T3xEOY1o9YMmJQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] arm64: dts: imx8qm-mek: add i2c0 and children devices
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 1:37=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> +       lsm303arg@19 {
> +               compatible =3D "st,lsm303agr-accel";
> +               reg =3D <0x19>;
> +       };
> +
> +       fxas21002c@20 {
> +               compatible =3D "nxp,fxas21002c";
> +               reg =3D <0x20>;
> +       };
> +
> +       isl29023@44 {
> +               compatible =3D "isil,isl29023";
> +               reg =3D <0x44>;
> +               interrupt-parent =3D <&lsio_gpio4>;
> +               interrupts =3D <11 2>;
> +       };
> +
> +       mpl3115@60 {
> +               compatible =3D "fsl,mpl3115";
> +               reg =3D <0x60>;
> +       };
> +
> +       max7322: gpio@68 {
> +               compatible =3D "maxim,max7322";
> +               reg =3D <0x68>;
> +               gpio-controller;
> +               #gpio-cells =3D <2>;
> +       };
> +
> +       l3g4250@69 {
> +               compatible =3D "st,l3g4200d-gyro";
> +               reg =3D <0x69>;
> +       };

Same comment I did yesterday on another patch from you: none of these
node names are generic.
