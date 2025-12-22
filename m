Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6722FDC53
	for <imx@lists.linux.dev>; Mon, 22 Dec 2025 07:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766389718; cv=none; b=oVvaBI46ZhT87fT42VDHypRE+KpsD3vYJqJtSNJ5a3P7wmfzE1ZMIn+js5Bl9KJPB7xbEQIUNB3MM/F+06dMLhChWzpY4mLpc725nm0UFZh4bB5mYbHF1jeAoQFbfNvMOtaPYmRplwGCUaUWoma7qsPV+g5Ef9UT9h/LEoiQkWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766389718; c=relaxed/simple;
	bh=O9OCWFingE0nz2wPBjE6WWnDNJpfpwzPNb54tcsJZ9Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ec4KUSm+0Nz9rBOo3YjOBphrzD0L5b66UyXfoqrPzPigyA3Qqq+Y8tsYxChJnQx8HD/GRzW6g38aanAFLjGdXjqKLMOwxgX1RHCSUsny6BQ/OUW8sXmacFiBd24nIaEu9yEfx4xtNVfjZsZtD9iXyc+tj/8OL4/Yuf9Mbw+9aZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EEENeuRZ; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EEENeuRZ"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a0fe77d141so39490105ad.1
        for <imx@lists.linux.dev>; Sun, 21 Dec 2025 23:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766389716; x=1766994516; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9OCWFingE0nz2wPBjE6WWnDNJpfpwzPNb54tcsJZ9Y=;
        b=EEENeuRZMIxL5M4nIBk9pZYpPf9csN4JP/hjBY9jcxiLaExoYFjoGX5ugVQjVJuN1a
         XgEjUTNYWOVmqHmVPBSvecejGeXtgXjUTqn+mVFRclHogjIA3sLMeeIxifaRXpYZ7xAh
         6gycbCDwFX961G20kjWc1N1Gzud2niikV1oMMF+Gt2mHN4CvqAP36LpapC2bq1qZI5ho
         xMX4c1RQnbFQeFQ0iKYE6dtdNOokNSxmquG2t34gEV/Vb7V0SbFoN+J4zdojpvU1JMRC
         OHnqro8SDqxVR5j6eGw4eYbuSMl4gU7S5kpCar1cFwNXk4ANp07C3lSkbiwViNZ+4ORz
         RYMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766389716; x=1766994516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O9OCWFingE0nz2wPBjE6WWnDNJpfpwzPNb54tcsJZ9Y=;
        b=hY55Jshk2Vz99sM8QIAjR0qDk+WEqc/SmpXfWTvtxAMWVkPxpE5RBdsOKetBftyzFN
         VuJfs9U9Pl2NdHh9EiYqYlhlWju3C7vddLHpVRD3xVP2YGYElJcFi2xyQ958EtYdtgE0
         SyuoZ9Ts8ygFEt9WnHYNCExYolHKKyXFitKkQqskkVKboa4gf/yPRs3mYePz8HO9d8D0
         iyE6//8juW4C9oFs0T6iF5VntGTklbNAtZYRtO6OMn8u4VQH9lNWJpPNOVcr92NMERUT
         u8c06IoMMEyDkYCp2cIvhoEhRjeUFQJ/koNJHpDQxJnAMKGXX8nGNx9jCZbHmyzlZjo8
         F2FQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvgHRrUyhR9MWoKz5ieOendznq3xGRWK17nYbjO1+iH2aWA+YJCkmRoMzZFLgbIMxa3XA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzTsjfxuNQQq7GxfqfVxf06MWzWPPSjzbrQlf1MAuXDF+hSHGTp
	eYRizMf5L3hUNhNeviu/MQKJGy3E6D7L91/iF0gIAsC/YqW5/rCdk89vFZMk6MpEXqwTz2xL7wN
	VjR3a2gZL5rnHIUNGgfrtML7CqXg8eLo=
X-Gm-Gg: AY/fxX6eG/e6cwGrM4rd7X8u5lFR2i96MeuEfnKP6h6+/XfkMrvcSwckFO+zBg3lEcm
	9LW8nE6oDQN0RQURUoo7Nc6SMiXNHg2VNTufXISK2FAyFjgpb32gfbtdd3h4ygX2hRr5b0L+xjc
	hd8C0dzvh6fxWdOMlv0Ee8dlD/NAobGk5QyikDB7Zz5LQOvjXcJ54r13boEk1gHlpO9S8SZqjUW
	tSB7eB2xkiI0UW6iMsQN/5KSA+w7bWoCYnF1jI4sy2MoGH6A7TvcwsBIxqU572d2TVGPylehyFr
	eiiRrija02ArixNINbCFp0AfcsD53fIZ4k8bB9H9bT7EWgDXrSIZ3g8SlDi7IGuoU1K8wb1miLb
	3EIfjplkx0825nlj1YtXTJLTo6qECB43kmaz8iV7qXWvmZtB/UoDGG13jmg==
X-Google-Smtp-Source: AGHT+IGC5H9pk2WaAHD8EAkwNOOrTOxaDyXMdLCEf3TKyiNUxIOmfbIBS3iQduGYUv2H/hy//X3ygqs5vwpMpN5DTqY=
X-Received: by 2002:a05:7022:6709:b0:11a:29e5:12e5 with SMTP id
 a92af1059eb24-121722ebc26mr12189814c88.30.1766389716505; Sun, 21 Dec 2025
 23:48:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251222-imx952-v1-v2-0-8793ec8bad6e@nxp.com> <20251222-imx952-v1-v2-1-8793ec8bad6e@nxp.com>
In-Reply-To: <20251222-imx952-v1-v2-1-8793ec8bad6e@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 22 Dec 2025 09:48:22 +0200
X-Gm-Features: AQt7F2qoIk1PNyyX4eWETsNou92XZKeudB4OtSdua0GthSZdmgmSnIjsrscm7Fg
Message-ID: <CAEnQRZC44ftit9y3hj3x9tLn7G+o_PFnJUOy6cGkD9iGSJGHXw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: fsl: add i.MX952 EVK board
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 22, 2025 at 3:44=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Add DT compatible string for NXP i.MX952 EVK board.
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
