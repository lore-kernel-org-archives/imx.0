Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E634D28C2A6
	for <imx@lists.linux.dev>; Wed,  4 Jun 2025 11:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749036910; cv=none; b=GCCtM3OtE7meid3sc3zmFdH93FfALZMC4OnH99/tyljwytyRLcqXOKvgtflJuvtNT3VfaDhnkJUrVnhlTFbqGl0TkcViw5ev5Fhb5dxlmJIOEuRUnLPFxjfnlAfhMcxv4IkIyXez59nG7qPwGf3V+RxVp0J+VsEZsWrfHSONKA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749036910; c=relaxed/simple;
	bh=eC4zQahnbIG0zimMI3qqobsDEY2WS5TdQDTeDCRi8Wg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=REzUZ3p4Z1I+TJ6U//25S21s0Wi08z2xX3AhZZ01Bh9jv9ExSGJP7aFN2WDcefIq1bc0+CvjE7mn16KU+HsQ5nYjtr7DVp5ZuscpLTKHxk1Hj6gix34ryhaJfanJvbr/NOgS7FDG/oPl3b/X1VUG2wsmAdA6t41a44Zf7Uk9LIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QevQtk82; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QevQtk82"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b07d607dc83so4870539a12.1
        for <imx@lists.linux.dev>; Wed, 04 Jun 2025 04:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749036908; x=1749641708; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eC4zQahnbIG0zimMI3qqobsDEY2WS5TdQDTeDCRi8Wg=;
        b=QevQtk823MPYBhV1zjX3yrpMb4Up2JyTdDuTO34BujAqhshK0nAvzDIVocrtQk2h6c
         MVYXh8oz4ZhgCKGzz9Pnu0+1NAM4wZJ5FTz18wJvsp9RSXkvnkduTVetMGc6Fv4cSaZz
         L8QdpgTc6E0Oz8/r+JI61XXNwdf0QSgfyAD/l84zNMN+kXT7GB4oWzcMvFz+0rEHUu7d
         WAYkVc+c+u49jz+1IBQPYJxUllyohqJl3Yqv03RE9XLxdG+grBPDOOa8IKGo/dxyrlDy
         2Ybl2zFBncWBXiqKI8IBrtHvQ0fEX8IR2GfUQU6/PKVlcauYv/JLIjWaAyqzgdIrvV/f
         doDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749036908; x=1749641708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eC4zQahnbIG0zimMI3qqobsDEY2WS5TdQDTeDCRi8Wg=;
        b=S+EbrYpXb/n0Nz4UVBCGbdftiE96nDm4yHC6k9/y8m12kZTadQKkEjjQ7iGwgkisof
         nu2mWgsVUabKQ1WOs8XcjUXNcTMmRi0xec3VF4DniutZ3YiFujTbh5ji4crZyhm9ONT/
         43E0vFmPnnNNTzvKhve816VRNFNGIR8MjMB6S9zUzk9fUwsUYtavKDg/DcQCKIDDFXMH
         KM5fK0AgAIS4GpbMX+UL+/7BkSbUr/bJgjwUjKK73fHOyR1XA1CtAmLQM8+6SCtCEjPr
         UiZysajeUsdbTk8XEKdmDxBCDxEg948t+YmaCBkmVacskOyaGsM/g/A8Ec4tJE+UAjbM
         Qwyw==
X-Forwarded-Encrypted: i=1; AJvYcCUdu1ZBcNwc7HHSgq3PQkCniPRPjSBtFXlHHLefmHVgdsRBBYENnt6SdZXQLcLesrZbq+E=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6JUHH0wSIW7XlT/fm+pLorE2Z4qp65ovtp9zmFo6aWxnQhX1K
	KkNXrraRhfLa7yibdMD4QVY/MxrKHMxWh0vnNma8vrE0YqXsG7VOkfZNBFBiE4RtTz9s8kFwjvf
	3rPF9IYnkcUjT1Wj/3QMUY25ABlm8cAI=
X-Gm-Gg: ASbGncv4pQc67bvRDo5V7C+gYrQhDK0iebnqc1OvHCIjYDlVhNYJgLcLS7N9LWo+bey
	MjdUXjuemHzk3pdGv3CftEdUkR6zm4Be5bXfA3Kel0wFHnLQcwn1obSHaen0E9V+hSdZ6c+AKwj
	QUIch+ussqHBskG7KpMejxjj/4ZK4G0g==
X-Google-Smtp-Source: AGHT+IGwIGTmxieNXznAoBW8LEiVl/ryKLqB13xhYIunkErEyJpECY1o6OzL5PMiS9fUTOhNK6TrQ2RtqRozCxKlADg=
X-Received: by 2002:a17:90b:390c:b0:311:a561:86f3 with SMTP id
 98e67ed59e1d1-3130ccf65dcmr3679787a91.6.1749036908156; Wed, 04 Jun 2025
 04:35:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250604-imx95-rproc-1-v1-0-a6e5f512731c@nxp.com> <20250604-imx95-rproc-1-v1-3-a6e5f512731c@nxp.com>
In-Reply-To: <20250604-imx95-rproc-1-v1-3-a6e5f512731c@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 4 Jun 2025 14:37:04 +0300
X-Gm-Features: AX0GCFuTyob7yQ_CjnB1akDwMMdIK7thx9Xx1AgvnXPVg4AWe6fnJ67XkMM0Idc
Message-ID: <CAEnQRZAm_-zr6W4KffXCjzWqBZ2G8TYmMvgF_ABPWhTZNNZGbQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] remoteproc: imx_rproc: Add support for i.MX95
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Iuliana Prodan <iuliana.prodan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 5:37=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Add imx_rproc_cfg_imx95_m7 and address(TCM and DDR) mapping
> Add i.MX95 of_device_id entry
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
