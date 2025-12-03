Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3216A299AB3
	for <imx@lists.linux.dev>; Wed,  3 Dec 2025 09:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764755640; cv=none; b=IzPeapc40TOGJbrCofXXSaBIbUjFw8zndL8bEUHVlSU/OkEcxuHVAnCfW9xoD4IxwFToEC6EBshgvf7FB8y+I0j8g8OHXr/os6tmrmSUfwNvZRFLv7PbXtDOIKSExqr8XviQWabFDXqWdGOv3g/O0CKQD87X0aGv1udtW3zkSXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764755640; c=relaxed/simple;
	bh=8nEqLHF+CqyXKlF1XNZ7kaW3yqu7m2xLMRFyungjcvA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UhJJOpBkAIwkN962NtIPWcz/eOvOmGLDkn22u9VnX0zvyGfeLofVAVgQKFdoLuniuVhWsjE2EYVvWxXytvgmSYvwIgSUbY/+9wRkiuAxDiof5xVhNLqYCNK8nm6IHHOgpF/emWwfrQwthiyd8PPfjhVcC8AhGP0grxKKkJScsrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eb8Ybxgv; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eb8Ybxgv"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7ad1cd0db3bso5217808b3a.1
        for <imx@lists.linux.dev>; Wed, 03 Dec 2025 01:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764755638; x=1765360438; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8nEqLHF+CqyXKlF1XNZ7kaW3yqu7m2xLMRFyungjcvA=;
        b=Eb8YbxgvT52Fbo6ldj/d71dcBhDmB2GB1vLrH35BMUST3LGSrOPAzBX1iTNNQVKci2
         gGYTn27JrLJxi1x3IcqJ+/wi7DG9L3sp6tOPhugDm4kkDu5Gi42s036iZyVeIFxGL02x
         X1PyI3H4Eq3qvgoz4TpwPyoWXqmhnGy+mNv85JA0BDn9M4UKQTGeOF4QRMcaL2/RRW6b
         PyAghvNkU2ewvUSTTfWJLyOzPCpJPJ/W6fC+N8lg1w//zAVYNYLzM83m8+ckd8iI16WV
         76VpbGOxyW8lShUCTxAVG3ToGNt6BGN7sD4XoggNOQmdCceZmeQ4wlLtML0FXDKnnNbJ
         B8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764755638; x=1765360438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8nEqLHF+CqyXKlF1XNZ7kaW3yqu7m2xLMRFyungjcvA=;
        b=RjDneM5pQM7rmcT/YJ4esxalwq6Vnps8U9U1ppmVizbde7oVF0Dwh3cQqUwVwYL16r
         /fsD4CZ2Q1BhiYihdekqolnW6IU60WqEz0GaDwOiNyl9p5/Qwk7N6BJ5FwvAPwAMeAHB
         2DC/AQw3NHCs1C8Xop0bOKqEFu3GB0IB8haKqb2nYflJiFA2lMRjWpS/D+LE9aYTabp9
         fnIlLk2BAPKTHChb/8zz6duSmD8iKwgqhSX6jtAZgVCQEGwP4sUgtPF0JNVOz+3CxlgB
         1jieqklcfBqz1Xh3ouqgmwp1jrF4N3T23Yuoq+mZHUz0mnP2LO4msDKiKSzzEGYPaKdX
         PO/g==
X-Forwarded-Encrypted: i=1; AJvYcCWLd1ZJjyhkL96tKETXMOdTRXF6MxaUEJic8O124ZWkJmaJSSBj1DIiDAFe6MeEtH64/yY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzz+Ldi5D3a2EQfy8ZO8OUd05M7znDhVRVADkWOkE9sw/QMat6h
	hi1R6F93+mVWAwuCZCMpZb9DF2WgoIIXUqgc3/t21mwp7pRzbpxcxFkWyVLimbHmRB+J3Mf63s5
	FekK30aLdV5l+zq5FpKlNrQSUDsA3otI=
X-Gm-Gg: ASbGnctbcyq4lUpVjA+M8W35nc2GBoql768tUoXPePB49gLKsMcI9OhYJ45eFEtAL8D
	LZNiWMwjZjsFkHdnQ+xHgBR6+HkR+Iq9397h6YzmD01naGbspisxhcWuGaFE2MBy/O8aGgshww+
	mcLAHRqM9m0AF9v+7pw1qX+53/QFUQDxhpEYXXASdBfXRKw8DyaZbpZ+pu5R5mtq4VSLB/GfIM1
	tY9plqhBDf++6m7tTB5v6fXih58AjGX/VBKBpcMEbYWCO2JS0WHed9H+XVIflhygTfETk7KXl+V
	OcqN1Ranv2OHvQuJsbJsnCm0BB11i6ktj1wXn8GgJssaz0sMFpBPEyIEiQyW3D7wyf8hGkJPcrb
	5vSR8c3uhHQ==
X-Google-Smtp-Source: AGHT+IFzArW34PLOuMOqsY2Mf51Xf3abtZlLQpsJqEX+QB1I/ZifDd61nnFzkTDL6Eb9u2KQsY33FhUiPJNwz3uxy8E=
X-Received: by 2002:a05:7022:f204:b0:11d:f037:891c with SMTP id
 a92af1059eb24-11df0cedae7mr1266205c88.44.1764755638420; Wed, 03 Dec 2025
 01:53:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251203070605.1868821-1-chancel.liu@nxp.com> <20251203070605.1868821-4-chancel.liu@nxp.com>
In-Reply-To: <20251203070605.1868821-4-chancel.liu@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 3 Dec 2025 11:56:31 +0200
X-Gm-Features: AWmQ_bnfHQXGg8duSmQZFhswRPptS5H3VYBS3CWyQw8E7GoI6MsPER_sOfjPYMI
Message-ID: <CAEnQRZAJuVq_HnNE7pZkJ6O04QgE0K=AzmmyiREaVxzzL4QNEg@mail.gmail.com>
Subject: Re: [PATCH 3/5] arm64: dts: imx91-11x11-evk: Add WM8962 sound card support
To: Chancel Liu <chancel.liu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 3, 2025 at 9:07=E2=80=AFAM Chancel Liu <chancel.liu@nxp.com> wr=
ote:
>
> Add WM8962 sound card support which connects to SAI3.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
