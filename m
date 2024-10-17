Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971D41DD864
	for <imx@lists.linux.dev>; Thu, 17 Oct 2024 12:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729168181; cv=none; b=T8mQL/vtlU5y3vBf2LPJEjV6L6t1eN6vGaOF8GuWMaBaclCxqd3FqTYcLXBBTejbBgmxjrqLbUDOT3M/Claw2ZRV1yEVB3/dKH4AyZcc3cRbWfYnl5IZjL0RZ0POtj/bOzQiVenN3s3mBfUuzVLTgFWPrcrIsBPYxOePgrsT778=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729168181; c=relaxed/simple;
	bh=uBNdVo/uyyko8HmVrmGuRG2dupFW+2pKj1lgYwhttK8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sURqZ2vRBQ2dk4lPEtW+rGKZ/zpZfoP70uxMiG5FIbywS8JTjRiXeBxQuylbZJX39CYyd8mWOgND0igMOzZw3yHn+ZfZAOkWuA6wZc7wXCebudpnSuDvR4yeOkqmd+nAJ9YQALdh2Bu9tolms7A4wT9Byv6FcRhDbdieTBodxfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E5N0902l; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E5N0902l"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fb4fa17044so9982851fa.3
        for <imx@lists.linux.dev>; Thu, 17 Oct 2024 05:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729168177; x=1729772977; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uBNdVo/uyyko8HmVrmGuRG2dupFW+2pKj1lgYwhttK8=;
        b=E5N0902lIiO6oKKOw/uHrr89tq0KmpcHSytxHWDwa82rV4PotSI3wixXM3DdpbwiQ7
         FsH2t+A+GwZvRBeQ8Yy4qoy7mvPnZL/S3W3Xd5V0v7BXXM0Qt4jQVk1EhoFioSR2D4A8
         PE9I9v3QXx1tr8RuBvM5VMPy1lB23oVbhVE7nhVHGQ9rIXZfflPhKXYjs7Yb2AcMw4C3
         hUcWdxtuYOLUfu/nLlwbVkw3cLgsDXIwwHAKJvn3I2W6VH33mYpAnIaY9KD/cig3lxEu
         XNmDngX4D27Mprl848F/87IciZsQsN99JlgMwvvoutZNJS1eI8p3fu8p/1qjMhQXkAm8
         Q/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729168177; x=1729772977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uBNdVo/uyyko8HmVrmGuRG2dupFW+2pKj1lgYwhttK8=;
        b=kTrrb8DmOI+IOEZa5+b8bifRHNJ94Vz8w5gCfvofa9VY74Qfg1E0tV/gy3AdKKc7nL
         bE2pIGRNTSm0bNltBH5em4FUI2Dy7osLeqKeK1jSBiSURCVT/y+ECc+GbO3fU1vgFqWf
         3fWubqdbjOyaZKgHD81Jy3S+DxeO8i+X6h8zAQGpEPFwQH7UPRXwdc301p+BeNji17uP
         7W/sDeSZG1I70nsknoVtZ7GH8Z/dM/R2eqrrO645N8EsJS6f8ReiL5QxEPRg/EMaqAcY
         1gbYlXPs6eygGt6hJYqY04dHv6UKEExwMhTaTEMXupqbiZobCEC2T7+q0lLNeDUl/BIc
         nwew==
X-Forwarded-Encrypted: i=1; AJvYcCWybRMidZm1eRUmpLQppwfhTI3sJgiD/pKCFmHrrAR1r9W+VbVtPwHxEjvdEe7cfTMehkw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzJ/MNwEzqWUo5YyoiZkS0A3vfY6kDyecbYaKEMwHZT9JeMgy94
	MvQeoMZcJE0KAtDw1V+ah8gc4MIEswbn+Q9zSVqVRcga4G11SbJdfg+pEfmHN/4wAqAjetr2bfN
	nT/fkArcIeXxcd16ckbxlTcPw9Ac=
X-Google-Smtp-Source: AGHT+IH+wIkNQQJwv49AlH/Jot7v0LyPIXnBGMQnVxq1LQbrD5aQivp1GxINI83KObx+Xsyqa1ZfQiYHil/PVU8jViU=
X-Received: by 2002:a05:651c:546:b0:2fa:fc98:8235 with SMTP id
 38308e7fff4ca-2fb3f30d3aemr91995251fa.42.1729168176388; Thu, 17 Oct 2024
 05:29:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241010081719.2993296-1-lukma@denx.de> <20241010081719.2993296-2-lukma@denx.de>
 <20241017103534.259584f6@wsk> <CAOMZO5DkmU4C0YQoVwCbHTBo=DTRGcz+9K1qHY=3V29eWAfEKQ@mail.gmail.com>
 <20241017141818.2cf462ce@wsk>
In-Reply-To: <20241017141818.2cf462ce@wsk>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 17 Oct 2024 09:29:25 -0300
Message-ID: <CAOMZO5AdrZTNpkSWn28Lc2yp8vgCGgE-Yq_Q7z0OfmwY=CjdZA@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] ARM: dts: mxs: Add descriptions for imx287 based
 btt3-[012] devices
To: Lukasz Majewski <lukma@denx.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Stefan Wahren <wahrenst@gmx.net>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lukasz,

On Thu, Oct 17, 2024 at 9:18=E2=80=AFAM Lukasz Majewski <lukma@denx.de> wro=
te:

> Another option is to adjust the
> Documentation/devicetree/bindings/display/panel/panel-dpi.yaml to allow
> only single entry.

IMHO that would be good.

Please submit a patch doing so to get feedback from the DT folks.

Thanks
